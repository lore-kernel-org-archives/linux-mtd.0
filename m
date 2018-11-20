Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8C7-0001Xv-MB
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 15:44:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <lkp@intel.com>
CC: <kbuild-all@01.org>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <Cyrille.Pitchen@microchip.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Date: Tue, 20 Nov 2018 15:43:49 +0000
Message-ID: <d2b4845b-8066-18a1-1b88-1f0e8fe634b9@microchip.com>
References: <20181120115512.15958-1-tudor.ambarus@microchip.com>
 <201811202348.n7lHxFem%fengguang.wu@intel.com>
In-Reply-To: <201811202348.n7lHxFem%fengguang.wu@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <58A6CE53FE02864A9C8378930281A1CF@namprd11.prod.outlook.com>
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



On 11/20/2018 05:35 PM, kbuild test robot wrote:
> Hi Cyrille,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on mtd/spi-nor/next]
> [also build test ERROR on v4.20-rc3 next-20181120]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Tudor-Ambarus-microchip-=
com/mtd-spi-nor-parse-SFDP-4-byte-Address-Instruction-Table/20181120-223821
> base:   git://git.infradead.org/linux-mtd.git spi-nor/next
> config: i386-randconfig-x005-201846 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386=20
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/mtd//spi-nor/spi-nor.c: In function 'spi_nor_parse_4bait':
>>> drivers/mtd//spi-nor/spi-nor.c:3165:15: error: implicit declaration of =
function 'spi_nor_sort_erase_mask'; did you mean 'spi_nor_set_erase_type'? =
[-Werror=3Dimplicit-function-declaration]
>      erase_mask =3D spi_nor_sort_erase_mask(map, erase_mask);
>                   ^~~~~~~~~~~~~~~~~~~~~~~

That's fine. I already specified that this patch depends on the
spi_nor_sort_erase_mask() function introduced in
https://patchwork.ozlabs.org/patch/999105/

Thanks!
ta
