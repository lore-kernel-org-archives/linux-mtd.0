Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17raUz-0003AF-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 09:47:53 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H2M001UPLQYDI@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 18 Sep 2002 10:47:22 +0200 (MEST)
Date: Wed, 18 Sep 2002 10:46:41 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jffs2 filesystem
In-reply-to: <001d01c25eea$0a65b0f0$b200a8c0@paulhome>
To: paul@maypaul.com, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200209181046.41944.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <005601c25ec7$0b5f8f30$9000010a@paulwong>
 <200209180805.33027.tglx@linutronix.de>
 <001d01c25eea$0a65b0f0$b200a8c0@paulhome>
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

On Wednesday 18 September 2002 10:04, paul@maypaul.com wrote:
> should "mount -t jffs2 /dev/mtdblock1 /mnt/bla" ?
Sure, sorry.
> > and copy your data to the filesystem.
> > 2. Use a bootloader utility, which skips the bad block.
> any bootloader utility recommend? is LILO or GRUB?
Neither LILO nor GRUB support this AFAIK
> > 3. Write a small utility, which can handle bad blocks
> is the utility compile with the nand driver?
No it has to be a user space application. I'm not sure, if it is possible to 
do it right now with the existing library functions. I will check this today 
in the afternoon

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
