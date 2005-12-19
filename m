Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EoFp1-0007QA-0K
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2005 02:52:42 -0500
Message-ID: <43A666D7.5040107@mw-itcon.de>
Date: Mon, 19 Dec 2005 08:52:55 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <43A1418F.3060701@imc-berlin.de>		<20051215102607.GA20431@angel.research.nokia.com>		<43A1609C.80705@imc-berlin.de>
	<43A166C6.5060803@mw-itcon.de>		<29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>		<43A2849E.8000907@mw-itcon.de>	<29f916510512160836q21a0b585h9894990b0fc0d7f3@mail.gmail.com>
	<43A2F15A.6070407@mw-itcon.de> <43A57B60.9090203@imc-berlin.de>
In-Reply-To: <43A57B60.9090203@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:
> Peter,
> 
>>> Didnt get this comment of ur's :
>>> 1. Single files can be still corrupted, when you write them and press
>>> reset.
>>>
>> When you press reset, when a file is written, you get a partly written
>> block. So you get a file, which is not written completely. This
>> corruption is detected by jffs2 and issues warnings. The filesystem as
>> whole stays intact, but the file as such doesn't have the contents you
>> might expect.
> 
> Since you're talking about "pressing reset" I have to ask again.
> 
> When we do a firmware update of our devices we do something like
> 
>  cp /tmp/large_file /opt/imc/application
>  reboot
> 
> where /tmp is a ramdisk and / a jffs2 rw rootfs.
> 
> So we're not pressing reset but doing a reboot. And I wanted to know if
> linux does only reboot _after_ all data is correctly written to flash?
> 
> Would it make sense to do
> 
>  cp /tmp/large_file /opt/imc/application
>  sync
>  reboot
> 
> ???
> 
> What's the point of having a line
> 
> ::shutdown:/bin/umount -a -r
> 
> in /etc/inittab?
> 
> I have
> 
> /dev/mtdblock0 on / type jffs2 (rw,noatime)
> /proc on /proc type proc (rw,nodiratime)
> devpts on /dev/pts type devpts (rw)
> sysfs on /sys type sysfs (rw)
> /dev/shm on /var type tmpfs (rw)
> /sys/kernel/debug on /var/tmp/debug type debugfs (rw)
> 
> So the only real fs is jffs2. Does it help to unmount it before reboot?
> 
> --
> Steven
> 
> 
Hi Steven,
I have not verified this in code, but afaik there is no automatic 
unmount of the filesystems at remount.

So you should either call sync or unmount the filesystem (which calls 
implicit a sync)

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
