From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Rutland <mark.rutland@arm.com>, "bcousson@baylibre.com"
 <bcousson@baylibre.com>, "Tony Lindgren (tony@atomide.com)"
 <tony@atomide.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v7 5/6] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Date: Mon, 7 Oct 2013 12:14:02 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA1F483@DBDE04.ent.ti.com>
References: <1380916188-24206-1-git-send-email-pekon@ti.com>
 <1380916188-24206-6-git-send-email-pekon@ti.com>
 <20131007114029.GC15365@e106331-lin.cambridge.arm.com>
In-Reply-To: <20131007114029.GC15365@e106331-lin.cambridge.arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "robherring2@gmail.com" <robherring2@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "olof@lixom.net" <olof@lixom.net>,
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

> From: Mark Rutland [mailto:mark.rutland@arm.com]
> > On Fri, Oct 04, 2013 at 08:49:47PM +0100, Pekon Gupta wrote:
> > DT property values for OMAP based gpmc-nand have been updated
> > to match changes in commit:
> > 	6faf096 ARM: OMAP2+: cleaned-up DT support of various ECC
> schemes
> > Refer: Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>=20
Sorry that's an old commit. I probably missed out updating the commit log.
So please ignore it here, I should remove that from commit log.


> Doesn't this mean these dts were broken between the changes to the
> driver and the changes to the dts?
>=20
But the DTS updates are kept separate from driver updates because
- DTS updates go into "Benoit's tree" or "Tony's tree"
- whereas driver updates go into MTD tree.
So, it was suggested in earlier patch revisions that I keep the driver
and the DTS patches separate, so that there is no merge conflict
between the trees when they are finally accepted.


> I think the existing properties need to continue to be supoprted for
> backwards compatibility. The dts can be fixed up to have the preferred
> binding style, but they shouldn't _have_ to be modified to continue to
> function...
>=20
However, there should be a way to remove legacy code which can
no longer be maintained. Here following ecc-schemes are such
legacy code, which are neither supported nor encouraged
to use since long time.
- OMAP_ECC_CODE_HAMMING_HW,
- OMAP_ECC_CODE_HAMMING_DEFAULT,
- OMAP_ECC_CODE_HAMMING_HW_ROMCODE

Also backward compatibility is maintained by keeping a common
symbol for all 3 above implementations OMAP_ECC_CODE_HAM1_HW
I don't think there is a point to continue keeping these  symbols
in kernel driver if they are unused, and make driver bulky and unreadable.

In actual it shouldn't matter to user what symbols I use inside
the driver, what matters is backward compatibility right ?


with regards, pekon
