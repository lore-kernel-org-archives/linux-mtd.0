Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGBek-0004sp-Dx
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 15:32:43 +0000
Date: Tue, 18 Oct 2011 17:32:36 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: =?utf-8?Q?Jean-S=C3=A9bastien?= Gagnon <jsgagnon@vizimax.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111018153236.GA10466@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 18, 2011 at 04:10:32PM +0100, Jean-S=C3=A9bastien Gagnon wrote:
> The situation you described should be already handled correctly by UBIFS,=
 if the nand driver is correctly reporting pages with bitflips with the -EU=
NCLEAN.  In this case, UBI will move the PEB to a new one as soon as possib=
le to avoid this problem.

This would be true, if you could assume that a page reading failure always
occurs after a previous read on the same page reports an ecc correction.
But this is not the case: we had several unstable pages going from 0 bitfli=
ps
(perfect read) to 2 bitflips (failed read). No way to detect any failure, no
way to scrub data before it's too late.
And the answer from the manufacturer was: you should not use any partially
programmed/erased pages anyway, those should be cleaned up after recovering
=66rom a power failure.

> My comment was really about the original error posted by Daniel Kuhn :

I agree on your comment about blank page; bitflips on erased space should be
corrected, or the upper layers should be robust to them...

BR,
--
Ivan
