From: "Gupta, Pekon" <pekon@ti.com>
To: Tony Lindgren <tony@atomide.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: RE: [v2, 3/3] ARM: dts: AM33XX: Add NAND flash device tree data to
 am335x-evm
Date: Thu, 9 May 2013 04:12:10 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C320D@DBDE04.ent.ti.com>
References: <ebfab3e9123b3e50b9a9678c1480191addd86d59.1359007746.git.avinashphilip@ti.com>
 <517F5126.5000509@ti.com> <20130508235404.GX32546@atomide.com>
In-Reply-To: <20130508235404.GX32546@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "Cousson,
 Benoit" <b-cousson@ti.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hiremath,
 Vaibhav" <hvaibhav@ti.com>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>,
 "zonque@gmail.com" <zonque@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > >
> > >  	am33xx_pinmux: pinmux@44e10800 {
> > >  		pinctrl-names =3D "default";
> > > -		pinctrl-0 =3D <&matrix_keypad_s0 &volume_keys_s0>;
> > > +		pinctrl-0 =3D <&matrix_keypad_s0 &volume_keys_s0
> > > +			&nandflash_pins_s0>;
> >
> > Why add this to the board level fallback (called pinctrl hogs, I think)=
?
> > This can be part of nand node you added below so that the pinctrl will
> > take effect when nand gets probed instead of all the time.
>=20
> Yes we should have all the pinctrl entries under the related drivers.
> This makes it easy remux pins during runtime if needed, and also
> allows unloading pinctrl-single.ko for development.
>=20
Yes, accepted. This has been already fixed in v3 of this patch set.
If all fine, then please pull this for next merge..

http://lists.infradead.org/pipermail/linux-mtd/2013-May/046712.html

http://lists.infradead.org/pipermail/linux-mtd/2013-May/046814.html (alread=
y pulled)

http://lists.infradead.org/pipermail/linux-mtd/2013-May/046710.html


with regards, pekon
