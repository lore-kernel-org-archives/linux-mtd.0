Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bkiN-0005mt-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 15:55:59 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Weird status information on JFFS2 File System
Date: Fri, 15 Feb 2002 10:06:53 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F0EAFC8@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: "Chris Vagnini" <cvagnini@bigfoot.com>
Cc: <linux-mtd@lists.infradead.org>
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

Well, I should have read more about the JFFS2 file system. But your =
answers explain everything.

Is there some way I can change the 5 erase blocks default to a smaller =
size? What are the implications of doing that?

Navin.



-----Original Message-----
From: Chris Vagnini [mailto:cvagnini@bigfoot.com]
Sent: Thursday, February 14, 2002 11:21 PM
To: Navin Boppuri
Cc: linux-mtd@lists.infradead.org
Subject: Re: Weird status information on JFFS2 File System


Hi Navin,

You're running into two documented behaviors of jffs2

1. jffs2 needs to keep 5 erase blocks of the flash free at all times.  =
This=20
is so that there's always room for garbage collection.  There have been=20
discussions of why this is necessary and how it might be reduced in the=20
past; search the email archive for details.  These five blocks appear as =

used space in the df command.  Since you're showing 640K used, your =
flash=20
must use sectors of 64K each (x 2 chips).

2. jffs2 compresses the data to be stored the flash.  Extremely=20
compressible data (like the contents of /dev/zero) occupy almost no =
space=20
when compressed, so you can fit a *lot* of it.  Most data averages=20
compression more like 2:1, unlike the 30-1 or so you were seeing with=20
/dev/zero, so you can expect to store about 700KB in your flash which=20
starts out with 380K free.  Of course this compression costs you =
processing=20
time, so you might want to turn it off while building jffs2 if speed is=20
more important than capacity.

--chris vagnini

At 02:29 PM 2/14/2002, Navin Boppuri wrote:

>Hello all,
>
>I have a JFFS2 file system successfully installed on my flash device. =
Here=20
>is the output of the drivers during the Linux kernel boot. I have 1MB =
of=20
>flash partition installed as my flash device( I have two 16bit AMD =
flash=20
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
>         /dev/root / nfs=20
> rw,v2,rsize=3D4096,wsize=3D4096,hard,udp,nolock,addr=3D10.10.30.39 0 0
>         proc /proc proc rw 0 0
>         devpts /dev/pts devpts rw 0 0
>         /dev/mtdblock0 /mnt/jffs2 jffs2 rw 0 0
>
>I now look at the disk usage using the df command
>
>         root@sp_06:/mnt/jffs2# df
>         Filesystem           1k-blocks      Used Available Use% =
Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       644       380  63% =
/mnt/jffs2
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
>                 dd if=3D/dev/zero of=3Dtmp.out bs=3D1M count=3D4 =
conv=3Dsync
>                 dd if=3D/dev/zero of=3Dtmp2.out bs=3D1M count=3D4 =
conv=3Dsync
>                 dd if=3D/dev/zero of=3Dtmp3.out bs=3D1M count=3D4 =
conv=3Dsync
>
>I run out of space while trying to create the tmp3.out command. But I =
am=20
>able to create almost 10MB of data in my 1MB file system.
>
>         root@sp_06:~# ls -al /mnt/jffs2
>         total 10152
>         drwxr-xr-x    1 root     root            0 Jan  1 00:00 .
>         drwxr-xr-x    3 1342     root         4096 Jan 25  2002 ..
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01 =
tmp.out
>         -rw-r--r--    1 root     root      4194304 Jan  1 03:01 =
tmp2.out
>         -rw-r--r--    1 root     root      2002944 Jan  1 03:01 =
tmp3.out
>
>         root@sp_06:~# df
>         Filesystem           1k-blocks      Used Available Use% =
Mounted on
>         /dev/root             30237928  12751536  15950380  45% /
>         /dev/mtdblock0            1024       932        92  92% =
/mnt/jffs2
>
>I doing something really wrong here. What's going on? The kernel =
messages=20
>are all correct. Then how am I able to access 10MB of flash in this =
file=20
>system? I am only mapping the last 1MB of flash which is 16MB in size. =
And=20
>I am confused about the status of my file system each time I create =
files.
>
>Can someone give me some pointers on this? Thank you.
>
>Navin.
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
