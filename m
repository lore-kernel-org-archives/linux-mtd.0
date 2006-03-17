Received: from mxs1.siemens.at ([194.138.12.131])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FKAIa-0004pf-Ka
	for linux-mtd@lists.infradead.org; Fri, 17 Mar 2006 03:27:14 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Mar 2006 09:23:55 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4A7@budgw09a.ww300.siemens.net>
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net>
	<6d6a94c50603170012l62ee51dfxe0b33166398ad88d@mail.gmail.com>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: "Aubrey" <aubreylee@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: why can't kernel read from NAND/SMC device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


[can't mount root fs (cramfs) from SMC, complaining about ECC read =
errors]

Aubrey wrote:

> Did you erase the whole root file system partition before you write
> the filesystem image to it?

No - actually there's no such option in Vivi bootloader. It simply =
copies root fs image to the card, and I think, it performs the needed =
erase operations.

I think the problem isn't this, because using 2.4.18-rmk7 kernel, =
everything works. I think I'll have to examine that code for SMC =
functions...

Bye
