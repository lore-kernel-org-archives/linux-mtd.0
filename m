Received: from chmls05.ne.ipsvc.net ([24.147.1.143] helo=chmls05.mediaone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16baeY-0005EY-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 05:11:22 +0000
Message-Id: <4.3.2.7.2.20020215000526.00e364e0@fastmail.fm>
Date: Fri, 15 Feb 2002 00:21:11 -0500
To: "Navin Boppuri" <navin.boppuri@newisys.com>
From: Chris Vagnini <cvagnini@bigfoot.com>
Subject: Re: Weird status information on JFFS2 File System
Cc: <linux-mtd@lists.infradead.org>
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F096A6F@sekhmet.ad.newisys.
 com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Hi Navin,

You're running into two documented behaviors of jffs2

1. jffs2 needs to keep 5 erase blocks of the flash free at all times.  This 
is so that there's always room for garbage collection.  There have been 
discussions of why this is necessary and how it might be reduced in the 
past; search the email archive for details.  These five blocks appear as 
used space in the df command.  Since you're showing 640K used, your flash 
must use sectors of 64K each (x 2 chips).

2. jffs2 compresses the data to be stored the flash.  Extremely 
compressible data (like the contents of /dev/zero) occupy almost no space 
when compressed, so you can fit a *lot* of it.  Most data averages 
compression more like 2:1, unlike the 30-1 or so you were seeing with 
/dev/zero, so you can expect to store about 700KB in your flash which 
starts out with 380K free.  Of course this compression costs you processing 
time, so you might want to turn it off while building jffs2 if speed is 
more important than capacity.

--chris vagnini

At 02:29 PM 2/14/2002, Navin Boppuri wrote:

>Hello all,
>
>I have a JFFS2 file system successfully installed on my flash device. Here 
>is the output of the drivers during the Linux kernel boot. I have 1MB of 
>flash partition installed as my flash device( I have two 16bit AMD flash 
>devices connected on a 32 bit bus as one device).
>
>
>         sp flash device: 1000000 at 40000000
>         Amd/Fujitsu Extended Query Table v1.1 at 0x0040
>         number of CFI chips: 1
>         Creating 1 MTD partitions on "Service Processor flash device":
>         0x00f00000-0x01000000 : "Flash file system"
>         mtd: Giving out device 0 to Flash file system
>
>After I mount my file system using the following command,
>         mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
>
>I confirm that the file system is mounted by looking at /proc/mounts.
>
>         root@sp_06:/mnt/jffs2# cat /proc/mounts
>         /dev/root / nfs 
> rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=10.10.30.39 0 0
>         proc /proc proc rw 0 0
>         devpts /dev/pts devpts rw 0 0
>         /dev/mtdblock0 /mnt/jffs2 jffs2 rw 0 0
>
>I now look at the disk usage using the df command
>
>         root@sp_06:/mnt/jffs2# df
>         Filesystem           1k-blocks      Used Available Use% Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       644       380  63% /mnt/jffs2
>
>         root@sp_06:/mnt/jffs2# ls -al
>         total 4
>         drwxr-xr-x    1 root     root            0 Jan  1 00:00 .
>         drwxr-xr-x    3 1342     root         4096 Jan 25  2002 ..
>
>I am surprised to see 63% usage without anything in the file system.
>
>I now create the following three files doing this:
>
>                 dd if=/dev/zero of=tmp.out bs=1M count=4 conv=sync
>                 dd if=/dev/zero of=tmp2.out bs=1M count=4 conv=sync
>                 dd if=/dev/zero of=tmp3.out bs=1M count=4 conv=sync
>
>I run out of space while trying to create the tmp3.out command. But I am 
>able to create almost 10MB of data in my 1MB file system.
>
>         root@sp_06:~# ls -al /mnt/jffs2
>         total 10152
>         drwxr-xr-x    1 root     root            0 Jan  1 00:00 .
>         drwxr-xr-x    3 1342     root         4096 Jan 25  2002 ..
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01 tmp.out
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01 tmp2.out
>         -rw-r--r--    1 root     root      2002944 Jan  1 03:01 tmp3.out
>
>         root@sp_06:~# df
>         Filesystem           1k-blocks      Used Available Use% Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       932        92  92% /mnt/jffs2
>
>I doing something really wrong here. What's going on? The kernel messages 
>are all correct. Then how am I able to access 10MB of flash in this file 
>system? I am only mapping the last 1MB of flash which is 16MB in size. And 
>I am confused about the status of my file system each time I create files.
>
>Can someone give me some pointers on this? Thank you.
>
>Navin.
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
