Received: from [210.77.143.228] (helo=tsinghua.org.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mB69-0007Oq-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 11:39:55 +0100
From: "" <yanhy@tsinghua.org.cn>
To: davidm@snapgear.com  
Date: Tue, 03 Sep 2002 18:40:36 +0800
CC: linux-mtd@lists.infradead.org  
Reply-To: "" <yanhy@tsinghua.org.cn>
Subject: problem of mounting jffs
Content-Type: text/plain
Message-Id: <E17mB69-0007Oq-00@pentafluge.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi david!

I'v managed to compile my kernel with mtd and jffs support successfully,but 
I can't delete or edit files or build directories on jffs partitions,why?

i created a jffs image including some directories(/dev,/bin,/etc,etc) and tried to
mount jffs in following steps:

# mkfs.jffs -d /jffstuff -a big -o jffs.img (on the host)
/> eraseall /dev/mtd3 (on the target)
/> cat /proc/mtd      (on the target)

   dev:    size   erasesize  name
mtd0: 00020000 00038000 "bootloader"
mtd1: 00020000 00038000 "user"
mtd2: 000c0000 00040000 "kernel"
mtd3: 00100000 00040000 "jffs"

/> cp jffs.img /dev/mtd3 (or dd if=jffs.img /dev/mtd3 bs=256k
 ........
 MTD_write
 MTD_write
 .........
 MTD_write
 39+1 records in
 M9+1 records out
 
/> modprobe jffs
  Waiting for child 26
  Using /lib/modules/2.4.17-uc0/kernel/fs/jffs/jffs.o
  JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
  kmem_create: Forcing size word alignment - jffs_node  
  
/> mount -t jffs /dev/mtdblock3 /mnt/jffs
JFFS: Failed to build tree.
JFFS: Failed to mount device 1f:03.
mount: Mounting /dev/mtdblock3 on /mnt/jffs failed: Invalid argument
pid 28: failed 256

Then i created another jffs.img which only contained two files:init and inetd,then
tried
above steps again.
/> mount -t jffs /dev/mtdblock3 /mnt/jffs
/> mount
/dev/root on / type romfs (ro)
/proc on /proc type proc (rw)
/dev/ram0 on /var type ext2 (rw)
/dev/mtdblock3 on /var/jffs type jffs (rw)

/> ls -l /mnt/jffs
-rwxrwxrwx    1 0        0           11336 init
-rwxrwxrwx    1 0        0           21448 inetd

/> /proc/fs/jffs/1f:03> cat info
partition size:     00100000 (1048576)
sector size:        00040000 (262144)
used size:          000080D0 (32976)
dirty size:         00000000 (0)
free size:          000F7F30 (1015600)

/> /proc/fs/jffs/1f:03> cat layout
00000000 0000003C ino=00000001, ver=00000001
0000003C 00002C88 ino=00000002, ver=00000001
00002CC4 0000540C ino=00000003, ver=00000001
000080D0 000F7F30 free 

it seems that  jffs have been successfully mounted. 

but when i tried to delete a file:
/> /mnt/jffs/rm init
   rm: unable to remove `init': I/O error

if i tried to edit the file(vi init) ,error was showed as" init is a readonly
file".
then i tried to change the mode by "chmod 0777 init",however, an error came as"
" init: No space left on device"

What's problem?Any help is appreciated!

Thanks!
Best Wishes
Yean


ps:
basic information:
     Platform:M5272C3
     Host:redhat 7.1
     romfs with mtd support was selected, and jffs was selected as modules.
