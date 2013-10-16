From: "Gupta, Pekon" <pekon@ti.com>
To: "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 0/9] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 16 Oct 2013 18:48:36 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA277C8@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
In-Reply-To: <1381816197-20477-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

>=20
> *changes v8 -> v9*
> [PATCH 1/9] <no update from [PATCH v8 1/6]>
> [PATCH 2/9] <only commit log updated from [PATCH v8 2/6]>
>  As per feedbacks from Brian Norris <computersforpeace@gmail.com>
> previous
>  revision [PATCH v8 3/6] and [PATCH 4/6] are split into following sub-pat=
ches:
> - [PATCH 3/9] <new> replaces local reference with generic names (mtd,
> nand_chip)
> - [PATCH 4/9] <new> enables auto-detection of bus-width
> - [PATCH 5/9] <new> removes omap3_init_bch: populates ecc-scheme data
> - [PATCH 6/9] <new> removes omap3_init_bch_tail: populates ecc-layout
> - [PATCH 7/9] <new> replaces lib/bch.c with nand_bch.c wrapper
> [PATCH 8/9] <no update same as [PATCH v8 5/6]
> [PATCH 9/9] removed devm_free_xx functions
>=20

Request you to have a look at v9.
If this is acceptable, then I would work to rebase the other pending
series on top of this one.


with regards, pekon
