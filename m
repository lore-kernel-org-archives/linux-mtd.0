Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192Qcz-0004m2-O0
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 08:01:13 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HCY00A37OT90E@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 07 Apr 2003 09:00:45 +0200 (MEST)
Date: Mon, 07 Apr 2003 10:01:03 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <005001c2fcb6$553cf1a0$2a00a8c0@zhengjun>
To: Jim Zeus <jimzeus@vip.sina.com>
Message-id: <200304071001.03442.tglx@linutronix.de>
MIME-version: 1.0
References: <20030404062136.7806.qmail@vip.sina.com>
 <200304041248.57751.tglx@linutronix.de>
 <005001c2fcb6$553cf1a0$2a00a8c0@zhengjun>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: MTD mail list <linux-mtd@lists.infradead.org>
Subject: Re: [SPAM] FAT on NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 April 2003 05:32, Jim Zeus wrote:
> > For what ? Why don't you use JFFS2 or YAFFS, which handle NAND out of the
> > box ?
> Because I've got to build a FS which can be accessed by Windows and Linux
> at the same time.I think JFFS2/YAFFS can't be recognized by Windows
> nowadays. And , it seems like I have to support some device layer between
> the FS and Flash so the Linux can access it, isn't it?
> Is there anyway else I can choose?
No, but AFAIK is there a Windows driver for YAFFS. 
 
> Are all the functions supported by JFFS2/YAFFS? Somebody told me the wear
> levelling is supported by MTD
Crap, MTD just provides the low level interface. Bad block management, wear 
levelling and journalling must be done in the fs driver.

> Does the SMART-Media-FAT build directly on a _bare_ NAND Flash ? 
> If it is, That's nothing useful to me 'cause Linux cant access it.
You can build it on bare FLASH: But that's not the correct way for LINUX. Your 
have to build a filesystem driver, which acts on top of MTD.

1. fs-driver 
2. MTD-block-device-driver
3. MTD-partition-driver
4. Generic NAND-driver
5. yourHardwareInterface-driver

2, 3 and 4 exist.
5 is easy to build (copy an existing one and modify it to fit your hardware)

1 has to be written from scratch. 
The specifications of SmartMedia-FAT are available from
http://www.ssfdc.or.jp/english/index.htm


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
