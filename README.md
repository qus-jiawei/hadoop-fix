hadoop-fix
==========
an project for manage the hadoop patch for cdh4.2.1 used by company

hadoop man:

1. cd hadoop
2. rm build/* -rf
3. edit the apply-patch.sh and make sure the TAR is point to the real hadoop cdh4.2.1 's tar
4. sh apply-patch.sh

then you would get an cdh4.2.1 with all the patch in hadoop/patch

if you want to make a new patch, do as fellow:
1. cd build/hadoop-xxx/src
2. git init-db
3. git add *
4. git diff > patch

then, you could move the patch to hadoop/patch directory and rename it.
(Then you could delete the build directory and run apply-patch.sh again to test weather your patch could apply correctly)

After all the patch is apply, you could do as fellow to get the jar
1. edit build_pick.sh to pick the wanted jar
2. sh build_pick.sh
3. then the wanted jar is locate in build/

At last, you could put the new jar to uhp's jar role directory.Once the uhp setup the role, it woule send the patched jar to the target machine.

for hbase and hive, you could do as the same
