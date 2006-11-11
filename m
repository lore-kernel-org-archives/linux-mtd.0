Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiiCa-0004oU-Nz
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 21:02:39 -0500
Received: from archite by server37.tchmachines.com with local (Exim 4.52)
	id 1GiiCD-0002Ig-Sf
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 21:02:13 -0500
Message-ID: <30537.69.30.123.186.1163210533.squirrel@www.architechnical.net>
Date: Fri, 10 Nov 2006 21:02:13 -0500 (EST)
Subject: Reference: OneNAND on PXA-270?
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> you can find pxa support here.
>
> http://source.mvista.com/git/gitweb.cgi?p=xloader.git;a=log
>
> refer to i580 board which is based on pxa270.
>
> Thank you,
> Kyungmin Park

Thanks *tremendously* for your help Kyungmin!

We've also had problems finding JTAG support for initial programming of
the bootmon.  Does anyone know who supplies cables/software supporting
this?  Is there maybe a solution similar to the parallel cable and jflash
utility for Intel Strata NOR?

Also, does anyone have U-boot code to support the OneNAND that they're
willing to share?  Our idea is to use a daughter card with U-boot on a NOR
that can be switched into chip select 0 to program the OneNAND on chip
select 1.  When the daughter card is removed the OneNAND will be switched
back to chip select 0.  It's not elegant, but we don't seem to be getting
much help from our sales channels otherwise.

Much Mahalo,
Pete MacKay
