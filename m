Received: from ftp.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sehwj-0003d8-4x
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 07:24:54 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Date: Wed, 13 Jun 2012 10:19:12 +0300
Subject: RE: mtd mxc_nand: mx35 kernel panic during request to read Device	ID
Message-ID: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3335@MEP-EXCH.meprolight.com>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
 <20120612115008.GT22191@pengutronix.de>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3330@MEP-EXCH.meprolight.com>,
 <20120612162004.GS30400@pengutronix.de>
In-Reply-To: <20120612162004.GS30400@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi  Sascha,

On Tue, Jun 12, 2012 at 03:13:47PM +0300, Alex Gershgorin wrote:
> Hi Alex,
>
> > On Tue, Jun 12, 2012 at 01:35:57PM +0300, Alex Gershgorin wrote:
> > In kernel 3.4, I have not encountered this problem
>
> > > Which version did you test? Does reverting
>
> I tested with v3.5-rc1 and v3.5-rc2, in two cases, I get a kernel panic
>
> >> 4b6f05e14df163e319bc85ca6e35d2720a91207d help? If so Sascha's patch se=
nd
> >> with Message-Id:
> >> 1338279369-25915-1-git-send-email-s.hauer@pengutronix.de might help yo=
u.
>
> I'm using v3.5-rc2 + that starts from commit 7452ca511c217b9d7bbadf468001=
8555c7d9a7ce,
> this includes Sasha's patch

> > You need this one:

> > http://patchwork.ozlabs.org/patch/161373/

Thanks for your help, this patch fixes the problem :-)

Regards,
Alex
