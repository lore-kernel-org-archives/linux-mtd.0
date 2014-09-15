Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTSM3-0006T4-Ec
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 09:13:54 +0000
Message-ID: <5416ADB8.80301@nod.at>
Date: Mon, 15 Sep 2014 11:13:28 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: xfstests on UBIFS - first findings
Content-Type: multipart/mixed; boundary="------------060303090804000703080100"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060303090804000703080100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi!

Running xfstests on UBIFS exposed some issues.
Out of 76 tests 20 failed, hopefully most of them are false positives.
Please see the attached test log.
I'm sharing my findings very early to work together on it.

xfstests manages also to trigger an UBIFS assert:

---cut---
[  141.072471] UBIFS assert failed in ubifs_jnl_update at 558 (pid 2622)
[  141.074984] CPU: 2 PID: 2622 Comm: setfattr Not tainted 3.17.0-rc4+ #62
[  141.077540] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.7.5-0-ge51488c-20140816_022509-build35 04/01/2014
[  141.081974]  ffff88003ae8bd00 ffff88003ae8bc40 ffffffff818b4563 0000000000000000
[  141.083765]  ffff88003ae8bcd0 ffffffff81299da4 ffff880000000004 0000000000000246
[  141.085564]  ffffffff812c4964 ffff88003aed0560 ffffffff00000000 ffff88003bd604a0
[  141.087373] Call Trace:
[  141.087941]  [<ffffffff818b4563>] dump_stack+0x4d/0x66
[  141.089131]  [<ffffffff81299da4>] ubifs_jnl_update+0x5e4/0x690
[  141.090464]  [<ffffffff812c4964>] ? ubifs_setxattr+0x294/0x680
[  141.091804]  [<ffffffff812c49d1>] ubifs_setxattr+0x301/0x680
[  141.093101]  [<ffffffff81194ac3>] __vfs_setxattr_noperm+0x63/0x1b0
[  141.094522]  [<ffffffff81194cbd>] vfs_setxattr+0xad/0xb0
[  141.095735]  [<ffffffff81194dd6>] setxattr+0x116/0x1a0
[  141.096920]  [<ffffffff8118f87f>] ? mnt_want_write+0x1f/0x50
[  141.098211]  [<ffffffff811714ad>] ? __sb_start_write+0xed/0x1a0
[  141.099489]  [<ffffffff8118f87f>] ? mnt_want_write+0x1f/0x50
[  141.100704]  [<ffffffff8118f87f>] ? mnt_want_write+0x1f/0x50
[  141.101937]  [<ffffffff81195127>] SyS_lsetxattr+0x87/0xd0
[  141.103098]  [<ffffffff818c1dd2>] system_call_fastpath+0x16/0x1b
---cut---

One can simple trigger it by doing:
# mknod foo c 0 0
# setfattr -h -n trusted.name foo

dir_ui->data_len is 4 instead of 0.

Thanks,
//richard

--------------060303090804000703080100
Content-Type: text/x-log;
 name="test.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="test.log"

FSTYP         -- ubifs
PLATFORM      -- Linux/x86_64 changeme 3.17.0-rc4+
MKFS_OPTIONS  -- /dev/ubi0_1
MOUNT_OPTIONS -- /dev/ubi0_1 /mnt2

generic/001 5s ... 5s
generic/002 0s ... 0s
generic/003      - output mismatch (see /root/xfstests/results//generic/0=
03.out.bad)
    --- tests/generic/003.out   2014-09-14 10:42:50.840429858 +0000
    +++ /root/xfstests/results//generic/003.out.bad     2014-09-14 21:16:=
09.702409464 +0000
    @@ -1,2 +1,6 @@
     QA output created by 003
    +ERROR: access time has not been updated after accessing file1 first =
time
    +ERROR: access time has not been updated after accessing file2
    +ERROR: access time has not been updated after accessing file3 second=
 time
    +ERROR: access time has not been updated after accessing file3 third =
time
     Silence is golden
    ...
    (Run 'diff -u tests/generic/003.out /root/xfstests/results//generic/0=
03.out.bad'  to see the entire diff)
generic/004      [not run] xfs_io flink support is missing
generic/005 0s ... 0s
generic/006 15s ... 14s
generic/007 32s ... 34s
generic/008      [not run] xfs_io fzero support is missing
generic/009      [not run] xfs_io fzero support is missing
generic/010      [not run] dbtest was not built for this platform
generic/011 10s ... 15s
generic/012      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/013 14s ... 16s
generic/014 1s ... 0s
generic/015      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/016      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/017      [not run] xfs_io fiemap support is missing
generic/018      [not run] defragmentation not supported for fstype "ubif=
s"
generic/020 1s ... 1s
generic/021      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/022      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/023 1s ... 1s
generic/024      [not run] fs doesn't support RENAME_NOREPLACE
generic/025      [not run] fs doesn't support RENAME_EXCHANGE
generic/026      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/027      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/028 5s ... 5s
generic/053      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/062      - output mismatch (see /root/xfstests/results//generic/0=
62.out.bad)
    --- tests/generic/062.out   2014-09-14 10:42:50.844429858 +0000
    +++ /root/xfstests/results//generic/062.out.bad     2014-09-14 21:17:=
41.194418451 +0000
    @@ -124,9 +124,12 @@
     setfattr: SCRATCH_MNT/lnk: Operation not permitted
     SCRATCH_MNT/lnk: user.name2: No such attribute or operation not perm=
itted
     *** remove attribute
    -setfattr: SCRATCH_MNT/lnk: Operation not permitted
    +setfattr: SCRATCH_MNT/lnk: Operation not supported
     SCRATCH_MNT/lnk: user.name2: No such attribute or operation not perm=
itted
     *** final list (strings, type=3Dlnk, nsp=3Duser)
    ...
    (Run 'diff -u tests/generic/062.out /root/xfstests/results//generic/0=
62.out.bad'  to see the entire diff)
generic/068      [not run] ubifs does not support freezing
generic/069 7s ... 7s
generic/070 7s ... 7s
generic/074 52s ... 52s
generic/075 2s ... 2s
generic/076 0s ... 0s
generic/077      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/079 1s ... 1s
generic/083      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/088 0s ... 0s
generic/089 10s ... 142s
generic/091      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/091.out.bad)
    --- tests/generic/091.out   2014-09-14 10:42:50.845429858 +0000
    +++ /root/xfstests/results//generic/091.out.bad     2014-09-14 21:21:=
12.320439190 +0000
    @@ -1,7 +1,5 @@
     QA output created by 091
     fsx -N 10000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -W
    ...
    (Run 'diff -u tests/generic/091.out /root/xfstests/results//generic/0=
91.out.bad'  to see the entire diff)
generic/093      [not run] not suitable for this OS: Linux
generic/097      [not run] not suitable for this OS: Linux
generic/099      [not run] not suitable for this OS: Linux
generic/100 11s ... 14s
generic/105      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/112 1s ... 1s
generic/113      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/113.out.bad)
    --- tests/generic/113.out   2014-09-14 10:42:50.846429858 +0000
    +++ /root/xfstests/results//generic/113.out.bad     2014-09-14 21:21:=
30.646440990 +0000
    @@ -12,11 +12,121 @@
     -----------------------------------------------
     aio-stress.3 : -t 20 -s 10m -O
     -----------------------------------------------
    -
    ------------------------------------------------
    -aio-stress.4 : -t 20 -s 10m -O -S
    ------------------------------------------------
    ...
    (Run 'diff -u tests/generic/113.out /root/xfstests/results//generic/1=
13.out.bad'  to see the entire diff)
generic/117 2s ... 8s
generic/120 15s ... 15s
generic/123 0s ... 1s
generic/124 2s ... 2s
generic/125      - output mismatch (see /root/xfstests/results//generic/1=
25.out.bad)
    --- tests/generic/125.out   2014-09-14 10:42:50.847429858 +0000
    +++ /root/xfstests/results//generic/125.out.bad     2014-09-14 21:22:=
57.585449530 +0000
    @@ -1,4 +1,129 @@
     QA output created by 125
    +direct open failed: Invalid argument
    +direct write failed: Bad file descriptor
    +direct open failed: Invalid argument
    +lseek failed: Bad file descriptor
    +read failed: Bad file descriptor
    +lseek failed: Bad file descriptor
    ...
    (Run 'diff -u tests/generic/125.out /root/xfstests/results//generic/1=
25.out.bad'  to see the entire diff)
generic/126 0s ... 1s
generic/127 26s ... 25s
generic/128 0s ... 1s
generic/129      - output mismatch (see /root/xfstests/results//generic/1=
29.out.bad)
    --- tests/generic/129.out   2014-09-14 10:42:50.847429858 +0000
    +++ /root/xfstests/results//generic/129.out.bad     2014-09-14 21:23:=
30.999452812 +0000
    @@ -1 +1,220005 @@
     QA output created by 129
    +WRITE: No space left on device
    +Read past EOF
    +OPEN: Bad file descriptor
    +WRITE: Bad file descriptor
    +SEEK: Bad file descriptor
    +READ: Bad file descriptor
    ...
    (Run 'diff -u tests/generic/129.out /root/xfstests/results//generic/1=
29.out.bad'  to see the entire diff)
generic/130      - output mismatch (see /root/xfstests/results//generic/1=
30.out.bad)
    --- tests/generic/130.out   2014-09-14 10:42:50.848429858 +0000
    +++ /root/xfstests/results//generic/130.out.bad     2014-09-14 21:23:=
31.718452883 +0000
    @@ -1,16 +1,6 @@
     QA output created by 130
     End-of-file zeroing with direct I/O
    -wrote 65536/65536 bytes at offset 0
    -XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
    -wrote 65536/65536 bytes at offset 65536
    -XXX Bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
    -00000000:  63 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  c.......=
=2E.......
    ...
    (Run 'diff -u tests/generic/130.out /root/xfstests/results//generic/1=
30.out.bad'  to see the entire diff)
generic/131 1s ... 1s
generic/132 13s ... 14s
generic/133      - output mismatch (see /root/xfstests/results//generic/1=
33.out.bad)
    --- tests/generic/133.out   2014-09-14 10:42:50.848429858 +0000
    +++ /root/xfstests/results//generic/133.out.bad     2014-09-14 21:23:=
50.852454762 +0000
    @@ -1,5 +1,13 @@
     QA output created by 133
     Buffered writer, buffered reader
    +/mnt/io_test: Invalid argument
     Direct writer, buffered reader
    +/mnt/io_test: Invalid argument
    +/mnt/io_test: Invalid argument
     Buffered writer, direct reader
    ...
    (Run 'diff -u tests/generic/133.out /root/xfstests/results//generic/1=
33.out.bad'  to see the entire diff)
generic/135      - output mismatch (see /root/xfstests/results//generic/1=
35.out.bad)
    --- tests/generic/135.out   2014-09-14 10:42:50.848429858 +0000
    +++ /root/xfstests/results//generic/135.out.bad     2014-09-14 21:23:=
51.130454790 +0000
    @@ -1,13 +1,12 @@
     QA output created by 135
    +direct_file: Invalid argument
     0000000 1212 1212 1212 1212 1212 1212 1212 1212
     *
     0004096
     0000000 3434 3434 3434 3434 3434 3434 3434 3434
     *
    ...
    (Run 'diff -u tests/generic/135.out /root/xfstests/results//generic/1=
35.out.bad'  to see the entire diff)
generic/141 0s ... 0s
generic/169 1s ... 0s
generic/184 0s ... 1s
generic/192      - output mismatch (see /root/xfstests/results//generic/1=
92.out.bad)
    --- tests/generic/192.out   2014-09-14 10:42:50.849429858 +0000
    +++ /root/xfstests/results//generic/192.out.bad     2014-09-14 21:24:=
32.394458843 +0000
    @@ -1,5 +1,5 @@
     QA output created by 192
     sleep for 40
     test
    -delta1 - access time after sleep in-core: 40
    -delta2 - access time after sleep on-disk: 40
    +delta1 - access time after sleep in-core: 0
    +delta2 - access time after sleep on-disk: 0
    ...
    (Run 'diff -u tests/generic/192.out /root/xfstests/results//generic/1=
92.out.bad'  to see the entire diff)
generic/193 1s ... 0s
generic/198      - output mismatch (see /root/xfstests/results//generic/1=
98.out.bad)
    --- tests/generic/198.out   2014-09-14 10:42:50.849429858 +0000
    +++ /root/xfstests/results//generic/198.out.bad     2014-09-14 21:24:=
33.497458951 +0000
    @@ -1,2 +1,3 @@
     QA output created by 198
     Silence is golden.
    +cannot create file: Invalid argument
    ...
    (Run 'diff -u tests/generic/198.out /root/xfstests/results//generic/1=
98.out.bad'  to see the entire diff)
generic/204      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/207      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/207.out.bad)
    --- tests/generic/207.out   2014-09-14 10:42:50.849429858 +0000
    +++ /root/xfstests/results//generic/207.out.bad     2014-09-14 21:24:=
46.072460186 +0000
    @@ -1,2 +1,2 @@
     QA output created by 207
    -4000 iterations of racing extensions and collection passed
    +failed to open test file /mnt/aio-testfile, errno: 22
    ...
    (Run 'diff -u tests/generic/207.out /root/xfstests/results//generic/2=
07.out.bad'  to see the entire diff)
generic/208      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/208.out.bad)
    --- tests/generic/208.out   2014-09-14 10:42:50.850429857 +0000
    +++ /root/xfstests/results//generic/208.out.bad     2014-09-14 21:24:=
46.235460203 +0000
    @@ -1,2 +1,2 @@
     QA output created by 208
    -ran for 200 seconds without error, passing
    +open dio failed: 22
    ...
    (Run 'diff -u tests/generic/208.out /root/xfstests/results//generic/2=
08.out.bad'  to see the entire diff)
generic/209      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/209.out.bad)
    --- tests/generic/209.out   2014-09-14 10:42:50.850429857 +0000
    +++ /root/xfstests/results//generic/209.out.bad     2014-09-14 21:24:=
46.400460219 +0000
    @@ -1,2 +1,2 @@
     QA output created by 209
    -test ran for 30 seconds without error
    +dio open failed: 22
    ...
    (Run 'diff -u tests/generic/209.out /root/xfstests/results//generic/2=
09.out.bad'  to see the entire diff)
generic/210      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/210.out.bad)
    --- tests/generic/210.out   2014-09-14 10:42:50.850429857 +0000
    +++ /root/xfstests/results//generic/210.out.bad     2014-09-14 21:24:=
46.562460235 +0000
    @@ -1,2 +1,2 @@
     QA output created by 210
    -AIO read of last block in file succeeded.
    +open returned error 22
    ...
    (Run 'diff -u tests/generic/210.out /root/xfstests/results//generic/2=
10.out.bad'  to see the entire diff)
generic/211 0s ... 0s
generic/212 0s ... 0s
generic/213      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/214      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/215 2s ... 2s
generic/219      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/221 1s ... 1s
generic/223      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/224      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/225      [not run] xfs_io fiemap support is missing
generic/226      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/228      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/230      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/231      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/232      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/233      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/234      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/235      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/236 1s ... 1s
generic/237      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/239      - output mismatch (see /root/xfstests/results//generic/2=
39.out.bad)
    --- tests/generic/239.out   2014-09-14 10:42:50.853429857 +0000
    +++ /root/xfstests/results//generic/239.out.bad     2014-09-14 21:24:=
54.944461058 +0000
    @@ -1,2 +1,3 @@
     QA output created by 239
     Silence is golden
    +open: Invalid argument
    ...
    (Run 'diff -u tests/generic/239.out /root/xfstests/results//generic/2=
39.out.bad'  to see the entire diff)
generic/240      [not run] fs block size must be larger than the device b=
lock size.  fs block size: 4096, device block size: 4096
generic/241 73s ... 74s
generic/245 0s ... 1s
generic/246 0s ... 0s
generic/247 8s ... [failed, exit status 1] - output mismatch (see /root/x=
fstests/results//generic/247.out.bad)
    --- tests/generic/247.out   2014-09-14 10:42:50.853429857 +0000
    +++ /root/xfstests/results//generic/247.out.bad     2014-09-14 21:26:=
11.957468623 +0000
    @@ -1,2 +1 @@
     QA output created by 247
    -Silence is golden.
    ...
    (Run 'diff -u tests/generic/247.out /root/xfstests/results//generic/2=
47.out.bad'  to see the entire diff)
generic/248 0s ... 1s
generic/249 1s ... 0s
generic/255      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/256      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/257 1s ... 1s
generic/258 0s ... 0s
generic/260      [not run] FITRIM not supported on /dev/ubi0_1
generic/263      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/263.out.bad)
    --- tests/generic/263.out   2014-09-14 10:42:50.854429857 +0000
    +++ /root/xfstests/results//generic/263.out.bad     2014-09-14 21:26:=
14.121468835 +0000
    @@ -1,3 +1,4 @@
     QA output created by 263
     fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
    -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
    +fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
    +/mnt/junk: Invalid argument
    ...
    (Run 'diff -u tests/generic/263.out /root/xfstests/results//generic/2=
63.out.bad'  to see the entire diff)
generic/269      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/270      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/273      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/274      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/275      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/277 1s ... 1s
generic/280      [not run] disk quotas not supported by this filesystem t=
ype: ubifs
generic/285 0s ... 0s
generic/286 7s ... 4s
generic/288      [not run] FITRIM not supported on /dev/ubi0_1
generic/294 0s ... 0s
generic/299      [not run]  utility required, skipped this test
generic/300      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/306 0s ... 0s
generic/307 1s ... 1s
generic/308 1s ... 1s
generic/309 1s ... 1s
generic/310 67s ... 69s
generic/311      [not run]  utility required, skipped this test
generic/312      [not run] xfs_io falloc failed (old kernel/wrong fs?)
generic/313 2s ... 2s
generic/314      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/315      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/315.out.bad)
    --- tests/generic/315.out   2014-09-13 17:58:17.761429486 +0000
    +++ /root/xfstests/results//generic/315.out.bad     2014-09-14 21:27:=
36.532476931 +0000
    @@ -1,2 +1,4 @@
     QA output created by 315
     Slience is golden
    +Available disk space (30908 KiB) wanted (30076 KiB)
    +(see /root/xfstests/results//generic/315.full for details)
    ...
    (Run 'diff -u tests/generic/315.out /root/xfstests/results//generic/3=
15.out.bad'  to see the entire diff)
generic/316      [not run] xfs_io fpunch failed (old kernel/wrong fs?)
generic/317      [not run] This test requires procfs uid_map support.
generic/318      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/319      [not run] ACLs not supported by this filesystem type: ub=
ifs
generic/320      [not run] Filesystem ubifs not supported in _scratch_mkf=
s_sized
generic/321      [not run]  utility required, skipped this test
generic/322      [not run]  utility required, skipped this test
generic/323      [failed, exit status 1] - output mismatch (see /root/xfs=
tests/results//generic/323.out.bad)
    --- tests/generic/323.out   2014-09-13 17:58:17.762429486 +0000
    +++ /root/xfstests/results//generic/323.out.bad     2014-09-14 21:27:=
38.054477080 +0000
    @@ -4,8 +4,4 @@
     wait_for_events: 0
     num_threads: 100
     filename: 'aio-testfile'
    -All threads spawned
    -wait_for_events: 1
    -num_threads: 100
    -filename: 'aio-testfile'
    ...
    (Run 'diff -u tests/generic/323.out /root/xfstests/results//generic/3=
23.out.bad'  to see the entire diff)
generic/324      [not run] defragmentation not supported for fstype "ubif=
s"
generic/325      [not run]  utility required, skipped this test
shared/006       [not run] not suitable for this filesystem type: ubifs
shared/032       [not run] not suitable for this filesystem type: ubifs
shared/051       [not run] not suitable for this filesystem type: ubifs
shared/272       [not run] not suitable for this filesystem type: ubifs
shared/289       [not run] not suitable for this filesystem type: ubifs
shared/298       [not run] not suitable for this filesystem type: ubifs
Ran: generic/001 generic/002 generic/003 generic/005 generic/006 generic/=
007 generic/011 generic/013 generic/014 generic/020 generic/023 generic/0=
28 generic/062 generic/069 generic/070 generic/074 generic/075 generic/07=
6 generic/079 generic/088 generic/089 generic/091 generic/100 generic/112=
 generic/113 generic/117 generic/120 generic/123 generic/124 generic/125 =
generic/126 generic/127 generic/128 generic/129 generic/130 generic/131 g=
eneric/132 generic/133 generic/135 generic/141 generic/169 generic/184 ge=
neric/192 generic/193 generic/198 generic/207 generic/208 generic/209 gen=
eric/210 generic/211 generic/212 generic/215 generic/221 generic/236 gene=
ric/239 generic/241 generic/245 generic/246 generic/247 generic/248 gener=
ic/249 generic/257 generic/258 generic/263 generic/277 generic/285 generi=
c/286 generic/294 generic/306 generic/307 generic/308 generic/309 generic=
/310 generic/313 generic/315 generic/323
Not run: generic/004 generic/008 generic/009 generic/010 generic/012 gene=
ric/015 generic/016 generic/017 generic/018 generic/021 generic/022 gener=
ic/024 generic/025 generic/026 generic/027 generic/053 generic/068 generi=
c/077 generic/083 generic/093 generic/097 generic/099 generic/105 generic=
/204 generic/213 generic/214 generic/219 generic/223 generic/224 generic/=
225 generic/226 generic/228 generic/230 generic/231 generic/232 generic/2=
33 generic/234 generic/235 generic/237 generic/240 generic/255 generic/25=
6 generic/260 generic/269 generic/270 generic/273 generic/274 generic/275=
 generic/280 generic/288 generic/299 generic/300 generic/311 generic/312 =
generic/314 generic/316 generic/317 generic/318 generic/319 generic/320 g=
eneric/321 generic/322 generic/324 generic/325 shared/006 shared/032 shar=
ed/051 shared/272 shared/289 shared/298
Failures: generic/003 generic/062 generic/091 generic/113 generic/125 gen=
eric/129 generic/130 generic/133 generic/135 generic/192 generic/198 gene=
ric/207 generic/208 generic/209 generic/210 generic/239 generic/247 gener=
ic/263 generic/315 generic/323
Failed 20 of 76 tests

--------------060303090804000703080100--
