Received: from mx0.aculab.com ([213.249.233.131])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RQKU3-0003YD-1A
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 14:59:35 +0000
Received: from mx0.aculab.com ([127.0.0.1])
 by localhost (mx0.aculab.com [127.0.0.1]) (amavisd-new, port 10024) with SMTP
 id 03588-04 for <linux-mtd@lists.infradead.org>;
 Tue, 15 Nov 2011 14:52:50 +0000 (GMT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/3] mtd/nand: fix coding style issue in
 drivers/mtd/nand/fsl_elbc.c
Date: Tue, 15 Nov 2011 14:51:09 -0000
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6D8AEC4@saturn3.aculab.com>
In-Reply-To: <1321362603.1932.67.camel@shinybook.infradead.org>
From: "David Laight" <David.Laight@ACULAB.COM>
To: "David Woodhouse" <dwmw2@infradead.org>,
 "Jenkins, Clive" <Clive.Jenkins@xerox.com>
Cc: Artem.Bityutskiy@nokia.com, b35362@freescale.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
> On Tue, 2011-11-15 at 11:26 +0000, Jenkins, Clive wrote:
> > > fix whitespaces,tabs coding style issue and ...
> >=20
> > In my opinion this code was already correct, and would display
correctly
> > at any TAB setting. This patch changes it so that it displays
> > incorrectly at all TAB settings other than 8.
>=20
> Any tab setting other than 8 is incorrect and should not be used for
> Linux code. If I view it in a proportionally-spaced font,=20
> it's not going to line up right either. Fix your editor, if that's an
issue for you.

Personally I don't even attempt to line up argumants on
continuation lines - it just wastes vertical space.
I just indent them as any other continuation line, so
double-indent if using 4-char indents and 1/2 indent for
8-char indents.

Tabs have to be assumed to be 8 columns, otherwise all sorts
of tools just get it wrong.
(Or you ban tabs from source files.)

	David
