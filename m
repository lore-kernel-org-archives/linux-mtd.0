Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xghrz-0002Iq-Lu
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 22:25:36 +0000
From: Marek Vasut <marex@denx.de>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for SST spi flash
Date: Wed, 22 Oct 2014 00:08:51 +0200
References: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
 <CACna6rzp1anqhLc-CfYmD4QA4ghYMWWjXmO9DnHHo824QobaMQ@mail.gmail.com>
In-Reply-To: <CACna6rzp1anqhLc-CfYmD4QA4ghYMWWjXmO9DnHHo824QobaMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201410220008.51848.marex@denx.de>
Cc: monstr@monstr.eu, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michal Simek <michal.simek@xilinx.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 21, 2014 at 06:43:50 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 21 October 2014 13:37, Michal Simek <michal.simek@xilinx.com> wrote:
> > From: Harini Katakam <harini.katakam@xilinx.com>
> >=20
> > Add sst25wf080 to the spi-nor device id table.
>=20
> I guess commit message could include some details. We already support
> plenty of SST flashes without this patch, don't we?

This change is so trivial that saying "we're adding this new flash chip ID =
to=20
the ID table", which is what Michal did, is completely sufficient in my opi=
nion.

Best regards,
Marek Vasut
