Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196to7-0001PK-OK
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 15:59:11 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDL00C7VIXVPT@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Sat, 19 Apr 2003 16:58:44 +0200 (MEST)
Date: Sat, 19 Apr 2003 17:58:32 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <AEB09EDA2548094C81ED6AA93269F63D01D0520A@siebe001.apac.nokia.com>
To: Srinivasu.Vaduguri@nokia.com, linux-mtd@lists.infradead.org
Message-id: <200304191758.32219.tglx@linutronix.de>
MIME-version: 1.0
References: <AEB09EDA2548094C81ED6AA93269F63D01D0520A@siebe001.apac.nokia.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: matsunaga_kazuhisa@yahoo.co.jp
Subject: Re: JFFS2 on NAND reboot problems
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 April 2003 11:46, Srinivasu.Vaduguri@nokia.com wrote:
> I see this problem often in our device.. I was not able to reproduce it
> till now.. But recently I found a way..
>
> If we have two directories 'a' and 'b' in /flash which is a JFFS2 file
> system.. and if we do an "rm -rf /flash/a" and reboot immediately or power
> cycle.. Then on reboot while mounting we get this bug in garbage
> collection.. This happens almost 95% of the times..

I tried about 25 times and had no chance to trigger the BUG().

Could you please provide a binary image of your FLASH partition, which 
triggers the BUG() ?
Reboot. Do not mount /flash and do a 
cat /dev/mtdX >flash:img
If this is NAND, you will get a bunch of "Reading without ECC is not 
recommended" warnings. Ignore them :)

Thanks.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
