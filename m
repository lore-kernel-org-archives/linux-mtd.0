Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AazP-0000Be-TT
	for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2003 20:42:08 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de, Thayne Harbaugh <tharbaugh@lnxi.com>,
	=?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Date: Wed, 30 Apr 2003 07:37:25 +1200
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030429012200.160431548C@desire.actrix.co.nz>
	<200304291003.10437.tglx@linutronix.de>
In-Reply-To: <200304291003.10437.tglx@linutronix.de>
MIME-Version: 1.0
Message-Id: <20030429194216.56C10447E@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas

> > Why do you interrupt erases? It seems to me like potentially an unhealthy
> > thing to do on NAND since NAND does not support erase suspend. NAND
> > erases quite quickly (say 2mS) so do you gain anything real by doing
> > this?
<snip>
>
> I have tested this with both chiptypes. The erase is aborted and restarted
> by the erase function.

A couple of comments:
* "Both chip types" is misleading. There is not just a Toshiba and a Samsung 
chiptype. Each of these vendors provides chips with different internal 
architectures. That is one of the reason characteristics like the number of 
partial page writes etc change.
* "Aborted and restarted" is perhaps incorrect. Don't you really mean 
"aborted and re-performed"? I do not believe these parts have a way of 
remembering their internal eraseure state to restart line NOR parts do.

My other question remains: do you really gain anything by adding the erase 
interruption feature? From a Samsung datasheet:
* Block erase takes typically 2ms, max 3ms.
* If you do a reset while the part is erasing, the reset might take as long 
as 500us.
You then have to restart the erase for it to take another 2ms (unless it gets 
interrupted again).

This certainly adds some unpredictability to the behaviour. Most likely it 
does all work, but is it worth it?

>
> It would really be interresting, if those problems are in related to an
> erase abort. Can anybody insert some debugging in nand_get_chip, where the
> abort is done?

Yes, it certianly would be interesting.
