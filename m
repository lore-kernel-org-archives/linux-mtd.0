Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c3GW-0006Aa-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 13:16:45 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0F009VS8R1XO@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 06 Aug 2002 14:16:14 +0200 (MEST)
Date: Tue, 06 Aug 2002 14:16:15 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: NAND Configuration
In-reply-to: <001c01c23d35$b0e899f0$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028636176.19435.47.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <001c01c23d35$b0e899f0$5501a8c0@synso.com.tw>
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

On Tue, 2002-08-06 at 12:40, Steve Tsai wrote:
> I read it many time, but CONFIG_JFFS2_FS_NAND use to take care buffering
> and OOB . Does I have to use it absolutely? If I do not use it, what's
> the result of the driver?
Yes, you _HAVE_ _ABSOLUTELY_ to use it !  
IF not, no buffering and OOB check, no bad block management ..--> no
JFFS2 on NAND.

> We need more info from mount onwards.
> 
> Maybe I do not provide repeatable messages and steps. The following are
> the steps I use.
> 1. eraseall /dev/mtd1            
> 2. mount -t jffs2 /dev/mtdblock1 /mnt
> 3. Make directory to /mnt
> 4. Use ftp to copy files to /mnt
> 5. Change the kernel to to mount /dev/mtdblock1 as root FS.
> 6. Copy or delete files and sometime the message display
> 	ARGH. About to write node to 0x003f9e2c on flash, but there are
> data already the re:...
>     After that, the patition will display more error messages, ECC error
> and others.

I meant, could you get full logs with CONFIG_JFFS2_FS_DEBUG=1 from
mounting the file system to the ARGH? Make sure you are logging over a
serial console so you catch _ALL_ the messages, and remember they're at
level KERN_DEBUG so echo 9 > /proc/sys/kernel/printk before mount.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

nix.de
