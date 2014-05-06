Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhWss-0007A8-KM
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 04:21:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3 0/4]  mtd: nand: omap: add support for BCH16_ECC
Date: Tue, 6 May 2014 04:21:01 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACAB8C@DBDE04.ent.ti.com>
References: <1395660006-27560-1-git-send-email-pekon@ti.com> 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

 [...]

>>With increase in NAND flash densities and shrinking of technology
>>NAND flash has become more suspectible to multiple bit-flips.
>>Thus stronger ECC schemes are required for detecting and correcting multi=
ple
>>simultaneous bit-flips in same NAND page. But stronger ECC schemes have l=
arge
>>ECC syndrome which require more space in OOB/Spare.
>>
>>This patch add support for BCH16 ecc-scheme on OMAP NAND driver:
>>(a) BCH16 ecc-scheme can correct 16 bit-flips per 512Bytes of data.
>>(b) BCH16 ecc-scheme generates 26-bytes of ECC syndrome / 512B.
>>
>>Due to (b) this scheme can only be used with NAND devices which have enou=
gh
>>OOB to satisfy following equation:
>>OOBsize per page >=3D 26 * (page-size / 512)
>>
>>
>>Pekon Gupta (4):
>>  mtd: nand: omap: add support for BCH16_ECC - GPMC driver updates
>>  mtd: nand: omap: add support for BCH16_ECC - ELM driver updates
>>  mtd: nand: omap: add support for BCH16_ECC - NAND driver updates
>>  mtd: nand: omap: Documentation: How to select correct ECC scheme for
>>    your device ?
>>
>> .../devicetree/bindings/mtd/gpmc-nand.txt          | 39 +++++++++
>> arch/arm/mach-omap2/gpmc.c                         | 15 ++++
>> drivers/mtd/devices/elm.c                          | 42 ++++++++++
>> drivers/mtd/nand/omap2.c                           | 94 ++++++++++++++++=
++++++
>> include/linux/platform_data/elm.h                  |  3 +-
>> include/linux/platform_data/mtd-nand-omap2.h       |  5 ++
>> 6 files changed, 197 insertions(+), 1 deletion(-)
>>
>>--
>>1.8.5.1.163.gd7aced9
>
>If this patch series looks good, them please accept it. This one is needed
>for supporting NAND boot with 4K page-sized NAND devices, on TI platforms.
>
>Following patch also needs your attention, it fixes a long term issue.
>"mtd: nand: omap: fix BCHx ecc.correct to return detected bit-flips in era=
sed-page"
>

Please see that this series does not miss the 3.16 window.
It has been there from quite long time and all its dependent patches
have been already merged in last cycle.


with regards, pekon
