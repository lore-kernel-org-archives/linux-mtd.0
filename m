Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cSz3-00025Y-3c
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2003 17:48:57 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HI2007ECS0Y8V@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 15 Jul 2003 18:48:35 +0200 (MEST)
Date: Tue, 15 Jul 2003 19:45:33 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
To: llandre <r&d@wawnet.biz>, linux-mtd@lists.infradead.org
Message-id: <200307151945.33907.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Help to understand error messages (MTD on Samsung NAND chips)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 15 July 2003 18:39, llandre wrote:
> Hi all,
>
>- bash-2.05# eraseall /dev/mtd0
> Erasing 16 Kibyte @ 0 --  0 % complete.
> eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 4000 --  0 % complete.
> eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 8000 --  0 % complete.

This message comes either, if you try to erase a bad block, which is not 
likely, as all your blocks would be bad or the erasefunction is not 
successful

Do you use the latest CVS code ?
If yes, there were a lot of changes in NAND the last few days. 

Can you switch on the debugging in MTD and provide more detailed information. 
Please do a 
echo 9 >/proc/sys/kernel/printk 
before you start the erase .

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
