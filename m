Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDmcx-0002Er-34
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 16:48:39 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Dmitry Konyshev <dmitry.konyshev@auriga.ru>,
 linux-mtd@lists.infradead.org
Date: Wed, 14 Apr 2004 17:44:15 +0200
References: <407D59A6.7030102@auriga.ru>
In-Reply-To: <407D59A6.7030102@auriga.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404141744.15766.tglx@linutronix.de>
Subject: Re: nand driver bug?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 14 April 2004 17:32, Dmitry Konyshev wrote:
> Hi everybody,
>
>     The driver happens to fall in BUG in nand_select_chip when writing
> the last page of a device. It's trying to select_chip in nand_write_ecc
> even in case there's nothing left to write.

Yep, you're right. I noticed this already and fixed it, but did not yet commit 
it, as I changed a lot of other things.
Should be fixed until tomorrow morning

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
