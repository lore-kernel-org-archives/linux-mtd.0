Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGBNA-0002T7-Cq
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 17:55:53 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: =?iso-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, Daniel Mack <zonque@gmail.com>
Subject: RE: Question about AM335x SoC supported NAND flash
Date: Wed, 19 Feb 2014 17:55:21 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA83D17@DBDE04.ent.ti.com>
References: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
In-Reply-To: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Ezequiel,

>From: Ezequiel Garc=EDa [mailto:ezequiel@vanguardiasur.com.ar]
>
>Hi guys,
>
>We're developing a custom AM335x-based board, which is meant to boot from =
NAND.
>
>The flash device is a Micron MT29F8G08ABABA NAND. This device is ONFI-comp=
liant
>and has 4 KiB page size, 512 KiB block size.
>
>Accessing it from U-Boot and Linux works just fine, apparently in ECC BCH8=
 mode.
>
>However, we cannot get the SoC to boot from NAND. We've double-checked
>the hardware
>and the SYSBOOT, but still no luck with it.
>
It's a 4K pagesize device with OOBsize=3D128, so ROM code expects BCH16 ECC=
 scheme
to boot SPL. Though I have locally tested BCH16 support for both u-boot and=
 kernel,
And even booted end-to-end using BCH16 on beaglebone with 4K page NAND cape=
,
But that's all locally..=20
Many prior dependent patches are still awaiting acceptance in mainline list=
.

For BCH16 u-boot configs (but driver support is still lacking in mainline u=
-boot):
[1] https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide=
#ECC_schemes_support


with regards, pekon
