Received: from mail-ew0-f228.google.com ([209.85.219.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N152J-0001sn-Iy
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 21:17:36 +0000
Received: by ewy28 with SMTP id 28so6497347ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Oct 2009 14:17:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200910221226.07328.jbe@pengutronix.de>
References: <20091020131157.GR8818@pengutronix.de>
	<200910211330.38141.gianlucarenzi@eptar.com>
	<200910221226.07328.jbe@pengutronix.de>
Date: Thu, 22 Oct 2009 16:17:24 -0500
Message-ID: <528f13590910221417i393958b6tc0d402e9e206ff51@mail.gmail.com>
Subject: Re: About the mxc nand driver
From: alfred steele <alfred.jaquez@gmail.com>
To: Juergen Beisert <jbe@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I can currently speak only about the i.MX35 NFC. But it handles larger pages
> than 512 byte in the same way the i.MX27 NFC does. The tables in the
> datasheet suggests they define a fixed location for the bad block marker in
> the spare area and this will be repeated 4 times for a 2048 byte page. But it
> seems the NFS does not touch any other byte than the ones defined for ECC
> usage.
So does the mxc_nand driver without "Saschas" latest patches work for
NAND transactions on the mx35 nfc. This probably suggests that the for
a 4K page size NAND, it would boil down to 8 cycles. Does that still
hold true?

-Alfred
