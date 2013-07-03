Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuMwJ-0002Ea-7c
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 13:17:44 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 3 Jul 2013 13:16:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E46CA@DBDE04.ent.ti.com>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
 <201307031503.50033.arnd@arndb.de>
In-Reply-To: <201307031503.50033.arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> On Tuesday 02 July 2013, Pekon Gupta wrote:
> > (+ CC: devicetree-discuss@lists.ozlabs.org)
> >
> > Changes v3 -> v4
> > - [Patch 1/3] removed MTD_NAND_OMAP_BCH8 &
> MTD_NAND_OMAP_BCH4 from nand/Kconfig
> > 	ECC scheme selectable via nand DT (nand-ecc-opt).
> > - [*] rebased for l2-mtd.git
>=20
> Do you also fix these build error?
>=20
> /git/arm-soc/drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
> /git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: error:
> 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW' undeclared (first use in this
> function)
>   case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
>        ^
> /git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: note: each undeclared
> identifier is reported only once for each function it appears in
> /git/arm-soc/drivers/mtd/nand/omap2.c:1991:7: error:
> 'OMAP_ECC_BCH4_CODE_HW_DETECTION_SW' undeclared (first use in this
> function)
>   case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
>        ^
>=20
>=20
> 	Arnd

[Pekon]: Yes, I'm not seeing these build issues, as I'm cleanly
returning from probe with pr_err(), if the required libraries (/lib/bch.c)=
=20
are not build-in the system.
-------------------
[Patch v4 1/4]: mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC..
@@static int omap_nand_probe(struct platform_device *pdev)
+	default:
+		pr_err("selected ECC scheme not supported or not enabled\n");
+		err =3D -EINVAL;
+		goto out_release_mem_region;
+	}
-------------------
However, if you are still seeing this, could you please send me your config=
?


with regards, pekon
