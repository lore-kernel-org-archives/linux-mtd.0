Received: from dialpool-210-214-120-123.maa.sify.net ([210.214.120.123] helo=nikunj)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GzO6-0006U1-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 09:49:00 +0100
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Permission problem on mtd block device
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
References: <86r8w0yqhz.fsf@bindaas.org> <23926.994060396@redhat.com>
From: nikunj@bindaas.org (Nikunj A. Dadhania)
Date: 02 Jul 2001 14:21:14 +0530
In-Reply-To: David Woodhouse's message of "Mon, 02 Jul 2001 08:53:16 +0100"
Message-ID: <8666dbww71.fsf@bindaas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> nikunj@bindaas.org said:
> > mount /dev/mtdblock0 /mnt 
> >
> > this command works. it gives some directory listing such as..
> >
> > / # ls -al /mnt
> > dr-xr-xr-x   1 0        0               0 Jan  1 00:03 .
> > drwxr-xr-x  12 0        0            1024 Jul  2  2001 ..
> > dr-xr-xr-x   1 0        0               0 Jan  1 00:03 001
> > -r--r--r--   1 0        0               0 Jan  1 00:03 devices
> > -r--r--r--   1 0        0               0 Jan  1 00:03 drivers
> 
> That looks like usbdevfs.
Ooppps ... you are right...  

> cat /proc/mounts /proc/filesystems

/mnt # cat /proc/mounts 
/dev/root / ext2 rw 0 0
/proc /proc proc rw 0 0
/dev/mtdblock0 /mnt usbdevfs rw 0 0

/mnt # cat /proc/filesystems 
nodev   sockfs
nodev   shm
nodev   pipefs
nodev   proc
        ext2
nodev   usbdevfs
nodev   devpts
        jffs

but where is the flash ?
Is the major and minor number are correct which I have specified in 
previous mail? (for the reference mtd0 90 0, mtdr 90 1, mtdblock0 31 0)
In the /proc/mtd it shows the mtd0, mtd1 and mtd2 entries.
And when i give the command

mount -t jffs /dev/mtdblock0 /mnt/
mount: Mounting /dev/mtdblock0 on /mnt failed: Permission denied

how do I mount the jffs??

>
> --
> dwmw2

regards
nikunj
