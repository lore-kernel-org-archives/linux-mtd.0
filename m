Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLduX-0007No-3Q
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 09:07:17 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Pantelis Antoniou <panto@intracom.gr>,
 Srinivasu.Vaduguri@nokia.com
Date: Thu, 6 May 2004 10:02:25 +0200
References: <AEB09EDA2548094C81ED6AA93269F63D01D09322@siebe001.apac.nokia.com>
	<4099E739.4070803@intracom.gr>
In-Reply-To: <4099E739.4070803@intracom.gr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200405061002.25973.tglx@linutronix.de>
cc: dwmw2@infradead.org
cc: linux-mtd@lists.infradead.org
cc: ddaney@avtrex.com
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 06 May 2004 09:20, Pantelis Antoniou wrote:
> Maybe you can do something when writting your filesystem image when you
> detect
> a simple bit error you can immediately mark the block bad.
>
> How many times have you written the block in order for something like
> this to occur?
>
> It seems to me that when you have a read only partition the solution is
> to be
> carefull when writting your filesystem image.
> First you avoid the bad block altogether, and secondly you always bit
> verify the block. If the verify fails you immediately mark the block as bad
> and move
> on.
>
> I don't think that nandwrite does it though.

No it doesnt. This could be fixed easily.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
