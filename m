From: kjell@cablescan.com (Kjell Uddeborg)
Date: Tue, 4 Mar 2003 10:15:03 -0800
Subject: Problems mounting a JFFS2 file system
Message-ID: <GGEOICAJEIILOOCMGNKMAEAPDGAA.kjell@cablescan.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I'm having some problems mounting a JFFS2 file system. I'm using uClinux =
kernel 2.4 on a Motorola M5249C3 board.

I think that I have all MTD stuff configured correctly and I can erase =
the device /dev/mtd1 with no problem, see screen dump:

-----------------------------
/> eraseall /dev/mtd1
MTD_open
MTD_ioctl
 0raTsiDng_ 6i4 oKicbyttel @
 1raTsiDng_ 6i4 oKicbyttel @
 2raTsiDng_ 6i4 oKicbyttel @
 3raTsiDng_ 6i4 oKicbyttel @
 4raTsiDng_ 6i4 oKicbyttel @
 5raTsiDng_ 6i4 oKicbyttel @
 6raTsiDng_ 6i4 oKicbyttel @
 7raTsiDng_ 6i4 oKicbyttel @
 8raTsiDng_ 6i4 oKicbyttel @
 9raTsiDng_ 6i4 oKicbyttel @
 araTsiDng_ 6i4 oKicbyttel @
 braTsiDng_ 6i4 oKicbyttel @
 craTsiDng_ 6i4 oKicbyttel @
 draTsiDng_ 6i4 oKicbyttel @
 eraTsiDng_ 6i4 oKicbyttel @
 fraTsiDng_ 6i4 oKicbyttel @
@ raTseDd _10c24l Koibsytee=20
  0 -- 100% complete.      =20
-----------------------------

As you can see I have all the debug outputs turned on. Looks to me that =
the command completed successfully.

The problem occurs when I try to mount the JFFS2 file system, see screen =
dump:

-----------------------------
/> mount -t jffs2 /dev/mtdblock1 /mnt/jffs2
arena open of 1 failed!
mount: Mounting /dev/mtdblock1 on /mnt/jffs2 failed: No such device=20
pid 28: failed 256
-----------------------------

The /dev/mtdblock1 is exists, see this partial listing on /dev:

-----------------------------
/> ls -l /dev
.
.
crw-------  1 0        0         90,   0  Jan 01 1970  mtd0
crw-------  1 0        0         90,   2  Jan 01 1970  mtd1
crw-------  1 0        0         90,   4  Jan 01 1970  mtd2
crw-------  1 0        0         90,   6  Jan 01 1970  mtd3
brw-------  1 0        0         31,   0  Jan 01 1970  mtdblock0
brw-------  1 0        0         31,   1  Jan 01 1970  mtdblock1
brw-------  1 0        0         31,   2  Jan 01 1970  mtdblock2
brw-------  1 0        0         31,   3  Jan 01 1970  mtdblock3
crw-------  1 0        0         90,   1  Jan 01 1970  mtdr0
crw-------  1 0        0         90,   3  Jan 01 1970  mtdr1
crw-------  1 0        0         90,   5  Jan 01 1970  mtdr2
crw-------  1 0        0         90,   7  Jan 01 1970  mtdr3
.
.
-----------------------------

If you have any thoughts of what could be causing this problem please =
send me a note.

Thanks for your help,
Kjell Uddeborg
Cablescan
