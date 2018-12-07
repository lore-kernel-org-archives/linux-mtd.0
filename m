Subject: Re: [PATCH v7 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 <linux-mtd@lists.infradead.org>, Yixun Lan <yixun.lan@amlogic.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin
 Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
 <1542386439-30166-3-git-send-email-jianxin.pan@amlogic.com>
 <20181207102456.1dc67e07@xps13> <20181207104254.0ecfc1e5@xps13>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <ac486ae7-7997-6f35-f29c-267c9c6f0f8c@amlogic.com>
Date: Fri, 7 Dec 2018 18:41:39 +0800
MIME-Version: 1.0
In-Reply-To: <20181207104254.0ecfc1e5@xps13>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

Appreciate your time.
I will follow the nand/next and rework some next week as soon as possible.

On 2018/12/7 17:42, Miquel Raynal wrote:
> Hi Jianxin,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 7 Dec 2018
> 10:24:56 +0100:
> 
>> Hi Jianxin,
>>
>> Looks good to me overall, a few comments inline.
>>
>> Jianxin Pan <jianxin.pan@amlogic.com> wrote on Sat, 17 Nov 2018
>> 00:40:38 +0800:
>>
>>> From: Liang Yang <liang.yang@amlogic.com>
>>>
>>> Add initial support for the Amlogic NAND flash controller which found
>>> in the Meson-GXBB/GXL/AXG SoCs.
>>>
>>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>>> ---
>>>   drivers/mtd/nand/raw/Kconfig      |   10 +
>>>   drivers/mtd/nand/raw/Makefile     |    1 +
>>>   drivers/mtd/nand/raw/meson_nand.c | 1417 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 1428 insertions(+)
>>>   create mode 100644 drivers/mtd/nand/raw/meson_nand.c
>>>
> 
> I forgot to mention, Boris has done more cleanup which breaks your
> patches, please have a look at the following commits in the nand/next
> branch, they will force you to do some light rework to get the driver
> building (especially, you should not export the ->select_chip hook anymore):
> 
> 7a08dbaedd36 mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops
> f2abfeb2078b mtd: rawnand: Move the ->exec_op() method to nand_controller_ops
> 7d6c37e90cf9 mtd: rawnand: Deprecate the ->select_chip() hook
> 1770022ffa85 mtd: rawnand: ams-delta: Stop implementing ->select_chip()
> 653c57c7da08 mtd: rawnand: vf610: Stop implementing ->select_chip()
> 2ace451cae22 mtd: rawnand: tegra: Stop implementing ->select_chip()
> b25251414f6e mtd: rawnand: marvell: Stop implementing ->select_chip()
> 550b9fc4e3af mtd: rawnand: fsmc: Stop implementing ->select_chip()
> 02b4a52604a4 mtd: rawnand: Make ->select_chip() optional when ->exec_op() is implemented
> ae2294b10b0f mtd: rawnand: Pass the CS line to be selected in struct nand_operation
> 1d0178593d14 mtd: rawnand: Add nand_[de]select_target() helpers
> 
> Thanks,
> Miquèl
> 
> .
> 
