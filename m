Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bZcG-0005At-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 04:04:57 +0000
Message-ID: <3C6CD9BD.7386D3F2@sasken.com>
Date: Fri, 15 Feb 2002 09:49:49 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>, navin.boppuri@newisys.com
Subject: RE: Weird status information on JFFS2 File System
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi Navin

Your Jffs2   file system size is 1MB

Jffs2 reserves around 5 sectors( erase sectors) for garbage collection.
So even when ur FS is empty , command df will show that 5 erase sectors
have been already occupied

Regards
ashok


Navin Boppuri wrote:

> Well, I guess I think I know what the problem is. I should not use
/dev/zero to create files to test the file system size. I decided to use
/dev/core instead and that actually creates the correct sized file.
>
> But I still dont understand why the status of my file system is so
screwed up. Even with an empty file sytem, it shows 64% used. And I am
only able to write around 375K of data into this partition, which is
actually 1MB.
>
> Navin.
>
> -----Original Message-----
> From: Navin Boppuri
> Sent: Thursday, February 14, 2002 1:29 PM
> To: linux-mtd@lists.infradead.org
> Subject: Weird status information on JFFS2 File System
>
> Hello all,
>
> I have a JFFS2 file system successfully installed on my flash device.
Here is the output of the drivers during the Linux kernel boot. I have
1MB of flash partition installed as my flash device( I have two 16bit
AMD flash devices connected on a 32 bit bus as one device).
>
>         sp flash device: 1000000 at 40000000
>         Amd/Fujitsu Extended Query Table v1.1 at 0x0040
>         number of CFI chips: 1
>         Creating 1 MTD partitions on "Service Processor flash device":

>         0x00f00000-0x01000000 : "Flash file system"
>         mtd: Giving out device 0 to Flash file system
>
> After I mount my file system using the following command,
>         mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
>
> I confirm that the file system is mounted by looking at /proc/mounts.
>
>         root@sp_06:/mnt/jffs2# cat /proc/mounts
>         /dev/root / nfs
rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=10.10.30.39 0 0
>         proc /proc proc rw 0 0
>         devpts /dev/pts devpts rw 0 0
>         /dev/mtdblock0 /mnt/jffs2 jffs2 rw 0 0
>
> I now look at the disk usage using the df command
>
>         root@sp_06:/mnt/jffs2# df
>         Filesystem           1k-blocks      Used Available Use%
Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       644       380  63%
/mnt/jffs2
>
>         root@sp_06:/mnt/jffs2# ls -al
>         total 4
>         drwxr-xr-x    1 root     root            0 Jan  1 00:00 .
>         drwxr-xr-x    3 1342     root         4096 Jan 25  2002 ..
>
> I am surprised to see 63% usage without anything in the file system.
>
> I now create the following three files doing this:
>
>                 dd if=/dev/zero of=tmp.out bs=1M count=4 conv=sync
>                 dd if=/dev/zero of=tmp2.out bs=1M count=4 conv=sync
>                 dd if=/dev/zero of=tmp3.out bs=1M count=4 conv=sync
>
> I run out of space while trying to create the tmp3.out command. But I
am able to create almost 10MB of data in my 1MB file system.
>
>         root@sp_06:~# ls -al /mnt/jffs2
>         total 10152
>         drwxr-xr-x    1 root     root            0 Jan  1 00:00 .
>         drwxr-xr-x    3 1342     root         4096 Jan 25  2002 ..
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01
tmp.out
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01
tmp2.out
>         -rw-r--r--    1 root     root      2002944 Jan  1 03:01
tmp3.out
>
>         root@sp_06:~# df
>         Filesystem           1k-blocks      Used Available Use%
Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       932        92  92%
/mnt/jffs2
>
> I doing something really wrong here. What's going on? The kernel
messages are all correct. Then how am I able to access 10MB of flash in
this file system? I am only mapping the last 1MB of flash which is 16MB
in size. And I am confused about the status of my file system each time
I create files.
>
> Can someone give me some pointers on this? Thank you.
>
> Navin.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
