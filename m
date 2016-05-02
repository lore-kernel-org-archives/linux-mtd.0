Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: xiaolei li <xiaolei.li@mediatek.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <f887fa30-2205-c102-bade-0071b3ee6b1f@openwrt.org>
 <1462165406.8414.196.camel@mhfsdcap03>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
From: John Crispin <blogic@openwrt.org>
Message-ID: <676c2485-e176-4182-2400-201074b36ca3@openwrt.org>
Date: Mon, 2 May 2016 08:13:40 +0200
MIME-Version: 1.0
In-Reply-To: <1462165406.8414.196.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Your ecc-strength setting is wrong, because your nand device's OOB size
> is not enough to store 24 bit ecc parity data.
> For this nand, its ecc-strength is max 12 bit per 1024B for our
> controller.
> You can get the setting as mtk-nand DT Documentation description.

i tried 12 aswell and it also gives an error. the problem with the
documentation is that FDM is unknown to me.


> Because the ecc-size and ecc-strength settings are optional, so if you
> are not sure how to set them, you can remove the setting from DT file.

tried that just now, the driver defaults to 12 and problem remains


> In addition, can I have a check whether you have run valid nand driver
> on your platform before? Can you do a full device erase operation at
> first, then use this V4 for your test?

the SDK kernel works fine on the board using nand as a primary boot
source. i am confident that this is not a board level issue.

how would i go about doing a full device reset operation ?

	John
