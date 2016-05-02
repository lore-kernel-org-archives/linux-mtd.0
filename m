Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axCBs-0003Fx-TI
 for linux-mtd@lists.infradead.org; Mon, 02 May 2016 11:39:05 +0000
Received: by mail-qk0-x22d.google.com with SMTP id v128so3947959qkb.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2016 04:38:43 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: John Crispin <blogic@openwrt.org>, xiaolei li <xiaolei.li@mediatek.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <f887fa30-2205-c102-bade-0071b3ee6b1f@openwrt.org>
 <1462165406.8414.196.camel@mhfsdcap03>
 <676c2485-e176-4182-2400-201074b36ca3@openwrt.org>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 robh@kernel.org, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <57273C40.6000407@linaro.org>
Date: Mon, 2 May 2016 07:38:40 -0400
MIME-Version: 1.0
In-Reply-To: <676c2485-e176-4182-2400-201074b36ca3@openwrt.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/02/2016 02:13 AM, John Crispin wrote:
> Hi,
>
>> Your ecc-strength setting is wrong, because your nand device's OOB size
>> is not enough to store 24 bit ecc parity data.
>> For this nand, its ecc-strength is max 12 bit per 1024B for our
>> controller.
>> You can get the setting as mtk-nand DT Documentation description.
> i tried 12 aswell and it also gives an error. the problem with the
> documentation is that FDM is unknown to me.
>
>
>> Because the ecc-size and ecc-strength settings are optional, so if you
>> are not sure how to set them, you can remove the setting from DT file.
> tried that just now, the driver defaults to 12 and problem remains

can you send the boot log letting the driver use its own calculated values?
ie, just don't specify any of the controller optional values in the 
device tree and let the driver calculate them for you.

Also instead of a read operation, can you try the oobtest?
you will have to insmod or modprobe "mtd_oobtest dev="

I don't have the spec for the MT7623 but maybe also worth checking the 
configuration for the NFI_ACCON settings (timing control register).
