Received: from mail-bl2on0110.outbound.protection.outlook.com ([65.55.169.110]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyFsZ-0004Cd-0i
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 09:15:16 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Li Leo <LeoLi@freescale.com>, Scott Wood <scottwood@freescale.com>, Xu Han
 <han.xu@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Mon, 16 Nov 2015 09:14:51 +0000
Message-ID: <BLUPR03MB134DAF43514B4899DC03AAD831E0@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111190359.GE12143@google.com>
 <BLUPR03MB134D5B98BF8C5DA5E763B1E831E0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151116042141.GB4021@brian-ubuntu>
In-Reply-To: <20151116042141.GB4021@brian-ubuntu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for your information.

Best Regards,
Yuan Yao

On Mon, Nov 16, 2015 at 12:22:30PM +0000, Brian Norris wrote:
> On Mon, Nov 16, 2015 at 04:08:39AM +0000, Yao Yuan wrote:
> > It looks like easier to read, use and change.
> > Is it?
>=20
> It looks fine either way, IMO.
>=20
> > And David Woodhouse, Xu Han, Mark Brown is there any other comments
> > from you?
>=20
> FYI, Mark Brown doesn't really have much to do with this. Though he maint=
ains
> the SPI subsystem (and regmap, as a matter of fact), SPI *NOR* code is on=
ly a
> user of the SPI subsystem (and, potentially, regmap). I hear he's not int=
erested
> in reviewing MTD work, given the volume of email he already receives.
>=20
> Regards,
> Brian
