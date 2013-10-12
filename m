From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v8 0/6] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Sat, 12 Oct 2013 22:26:17 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2188A@DBDE04.ent.ti.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <20131011210924.GO23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131011210924.GO23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
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

Hi Brain,

>=20
> Hi Pekon,
>=20
> I will try to summarize the standing of your patch series.
>=20
> Patches 1 and 2 look good and have addressed all of the DT maintainers'
> comments, AFAICT. They are ready to go in, except that the following
> patches are not ready; they should probably go in together.
>=20
> You ignored most of my comments to patch 3, and it is insufficiently
> documented. Please take a look at my comments, both here (in v8) and in
> v6. It still should be split into more patches.
>=20
I tried splitting the earlier [PATCH 3/6], therefore a new patch for mergin=
g
various Hamming ECC schemes was spawned. But, I could not clean more
because I would have broken the NAND functionality in between the
patches.
My apologies, I missed some of you other comments, so I'm preparing
next version by splitting [PATCH 3/6] into more sub-patches for ease of
review.=20
Most #ifdef were put to suppress warning of un-used functions during
compile time. So those cannot be removed, otherwise this patch would
give compile warnings under randconfig.


> Patch 4 does too much without describing it. Why are you dropping the
> old omap3_correct_data_bch() code? Is this just refactoring? If so, you
> should say so. And this also suggests that you have two logical changes
> going on that should be separated into different patches; one to
> refactor the open-coded NAND/BCH library to replace it with the
> nand_bch.{c,h} support library and one for the new ECC modes.
>=20
Agreed, I update commit log to be more explicit that here nand_bch.c
actually encapsulates lib/bch.c.
Here also I cannot remove #ifdef across nand_bch_free() because
it frees some bch control data, which would not be defined for all
ecc-schemes (it is specific to xx_SW  ecc schemes). Hence removing
#ifdef here would give null-pointer exception.


> Patch 5 is good but should wait until the other DT parts are acceptable
> and merged into MTD.
>=20
> Patch 6 needs rewriting to use devm_* functions properly, but it was
> never integral to this patch series. You can improve it and resend with
> this series or just send it separately afterward.
>=20
Yes I understood this, but I think it would be still good to explicitly
free the resources in case of "module_remove()", because that would
free all resources instantaneously without waiting for devm_ to=20
iterate thru the list when it wakes-up (I guess).

I'm not knowledgeable of exact implementation of devm_ and how
often does it iterates the list and frees the resources for corresponding
un-registered devices. So trusting you I'll include your feedbacks here.


with regards, pekon
