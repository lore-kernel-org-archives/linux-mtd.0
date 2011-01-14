Received: from nm7-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.192])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PdsE9-0006Ou-H4
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2011 22:34:39 +0000
Message-ID: <605049.78283.qm@web180310.mail.gq1.yahoo.com>
Date: Fri, 14 Jan 2011 14:34:33 -0800 (PST)
From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] mtd: sst25l: fix reads with broken spi-masters
To: H Hartley Sweeten <hartleys@visionengravers.com>,
	Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <20110114222401.GA10504@angua.secretlab.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "spi-devel-general@lists.sourceforge.net"
	<spi-devel-general@lists.sourceforge.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=0A--- On Fri, 1/14/11, Grant Likely <grant.likely@secretlab.ca> wrote:=
=0A=0A> > The bug _is_ in the spi peripheral on the ep93xx.=0A> > =0A=0A> =
=0A> No, David is correct.=A0 The fault is in the master=0A> driver.=A0 It =
is perfectly valid (and common) for spi=0A> peripherals to required the SS =
line to remain asserted over=0A> the entire transfer.=A0=0A=0AAnd that's wh=
at the Linux SPI stack requires,=0Aso any master driver that doesn't keep t=
he=0Aslave selected during the entiretransfer is buggy.
