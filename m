Received: from n1.cetrtapot.si ([89.212.80.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1I8s-0000W8-U2
	for linux-mtd@lists.infradead.org; Thu, 21 Jun 2007 04:35:54 -0400
Message-ID: <467A3861.2050801@cetrtapot.si>
Date: Thu, 21 Jun 2007 10:35:45 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Midhun Agnihotram <agnimidhun@gmail.com>
Subject: Re: /proc/mtd file does not show partitions
References: <4dde4acb0706192320n7ca4157q1219adfb68e50ce1@mail.gmail.com>	<46791199.7020402@cetrtapot.si>
	<4dde4acb0706202201y7369cc33kc438f15f7091c18c@mail.gmail.com>
In-Reply-To: <4dde4acb0706202201y7369cc33kc438f15f7091c18c@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Midhun Agnihotram wrote:
> Hi,
> 
> Update: We have now moved from Ramfs to JFFS2.
> 
>>> cat /proc/mtd, it says that the file does not exist. Who is supposed
>>> to create this file?
>> /usr/src/linux/drivers/mtd/mtdcore.c iff CONFIG_PROC_FS is enabled.
>> Silly question - do you have any files in /proc? Is procfs mounted?
>>
> 
>     CONFIG_PROC_FS is enabled in the kernel configuration. I do have
> /proc/mounts file.

Is this the only file?!

> # cat /proc/mounts
> rootfs / rootfs rw 0 0
> 
>    I am sorry - I exactly do not know what you mean by whether procfs
> is mounted. I have /proc folder in the file system that I use. I do
> not exclusively mount it anywhere. So when the filesystem is mounted
> and the linux prompt comes up, the proc directory exists. Do I need to
> do  anything more?

Probably add something like this to the /etc/fstab:
proc /proc proc defaults 0 0

... or for testing on the booted system run:
mount -t proc proc /proc

> 
>   Also when I mount the JFFS2 file system (which is in my flash), I
> get the following errors.
> 
> Empty flash at 0x0000fffc ends at 0x00010000
> Empty flash at 0x0002fffc ends at 0x00030000
> Empty flash at 0x0004fffc ends at 0x00050000
> Empty flash at 0x0006fffc ends at 0x00070000
> Empty flash at 0x0008fffc ends at 0x00090000
> Empty flash at 0x000afffc ends at 0x000b0000
> Empty flash at 0x000cfffc ends at 0x000d0000
> Empty flash at 0x000efffc ends at 0x000f0000
> Empty flash at 0x0010fffc ends at 0x00110000
> Empty flash at 0x0012fffc ends at 0x00130000
> Empty flash at 0x0014fffc ends at 0x00150000
> Empty flash at 0x0016ffe8 ends at 0x00170000
> Empty flash at 0x0018fffc ends at 0x00190000
> Empty flash at 0x001afffc ends at 0x001b0000
> Empty flash at 0x001cfffc ends at 0x001d0000
> Empty flash at 0x001efffc ends at 0x001f0000
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 84K
> init: can't log to /dev/tty5
> starting pid 670, tty '/dev/ttyS0': '/bin/ash'
> 
> 
> BusyBox v1.6.0 (2007-06-15 12:34:28 IST) Built-in shell (ash)
> Enter 'help' for a list of built-in commands.
> 
> # Erase at 0x003e0000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x003c0000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x003a0000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x00380000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x00360000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x00340000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x00320000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x00300000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x002e0000 failed immediately: -EROFS. Is the sector locked?
> Erase at 0x002c0000 failed immediately: -EROFS. Is the sector locked?
> 
>   The JFFS2 file system is not writable (although we have mounted it
> in read write mode). It does not allow us to write or delete. The boot
> args are as follows:
> 
> mem=48M console=ttyS0,115200 console=tty0 root=/dev/mtdblock4 rw
> rootfstype=jffs2 init=/sbin/init ip=on
> 
>    What could be the problem??


Please search the archives of the list for similar reports. As it seems 
JFFS2 is not guilty of you not being able to write to flash - the 
problem lies at a lower level...
Maybe 
http://www.infradead.org/pipermail/linux-mtd/2003-October/008643.html 
will help.

Best regards,
hinko
-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
