Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c0Jx-0005gs-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 10:08:05 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0F00LGJ00ML2@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 06 Aug 2002 11:07:35 +0200 (MEST)
Date: Tue, 06 Aug 2002 11:07:37 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: NAND Configuration
In-reply-to: <001601c23d1a$7c6a4ae0$5501a8c0@synso.com.tw>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028624857.19435.2.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <001601c23d1a$7c6a4ae0$5501a8c0@synso.com.tw>
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

On Tue, 2002-08-06 at 09:25, Steve Tsai wrote:
> Does I have to set CONFIG_MTD_NAND_ECC_JFFS2=y and
> CONFIG_JFFS2_FS_NAND=y to use NAND flash? Weh I set these settings, I
> will get the following easily. If  I did not set these settings and the
> condition is better, still has problem, but it will not halt the system.
> If I need not set CONFIG_MTD_NAND_ECC_JFFS2=y and
> CONFIG_JFFS2_FS_NAND=y, I can trace my problem easily. I use
> mtd-snapshot-20020731.tar.bz2 with uClinux.
You have to set it. Read http://linux-mtd.infradead.org/tech/nand.html
> 
> ARGH. About to write node to 0x0018de8c on flash, but there are data
> already the
> re:
> 0x0018de8c: 85 19 04 20 74 01 00 00 4d 62 52 56 ff ff ff ff
> pid 24: failed 256
> 
> jffs2_flush_wbuf(): Write failed with -5
> Write of 68 bytes at 0x004da000 failed. returned -5, retlen 0
> Not marking the space at 0x004da000 as dirty because the flash driver
> returned r
> etlen zero
We need more info from mount onwards.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

nix.de
