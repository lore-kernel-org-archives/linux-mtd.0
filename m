Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bhu0E-0001ls-SH
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:45:11 -0400
Message-ID: <0f3b01c46382$327d3060$0100a8c0@superfortress>
From: "Dan Brown" <dan_brown@ieee.org>
To: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>,
	<linux-mtd@lists.infradead.org>
References: <40DFE77C.1526.14100E42@localhost>
Date: Tue, 6 Jul 2004 13:53:51 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: definition of CONFIG_MTD_DOCECC missing
	indrivers/mtd/devices/Config.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
Sent: Monday, June 28, 2004 3:40 AM
Subject: definition of CONFIG_MTD_DOCECC missing
indrivers/mtd/devices/Config.in


> I've noticed that CONFIG_MTD_DOCECC is missing
> in $KERNEL_SRC_DIR/drivers/mtd/devices/Config.in,
> which results in linker errors - unresolved
> calls to doc_decode_ecc(), that is defined in docecc.c.
>
> Attached is a suggested patch (I hope).

Good catch; I forgot to add proper 2.4 support for this.  Sorry!  Fix
commited to CVS, should be in the next snapshot.

    -Dan Brown
