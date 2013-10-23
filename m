From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v10 00/10] mtd:nand:omap2: clean-up of supported ECC
 schemes
Date: Wed, 23 Oct 2013 05:10:21 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA29DCC@DBDE04.ent.ti.com>
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <20131022203009.GM23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131022203009.GM23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> > [PATCH 4/10]
> >   dropped [PATCH v9 4/9] introducing NAND_BUSWIDTH_AUTO, instead
> >   using DT 'nand-bus-width' for device bus-width
>=20
> As mentioned in reply to the patch, I don't think this patch belongs in
> this series now, and it is still not adequate (the original code there
> is wrong in some ways, but your changes are not clearly better).
>=20
Probably there was some confusion in review this patch..=20
I have added my comments and replies to you.
Request you to please re-review..

And as I suppose this is the only remaining piece in this series, so
If that's ok, request you to please pull-in this series..
So, I can re-work on next pending series..=20


with regards, pekon
