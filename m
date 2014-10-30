Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjfUI-0007s0-8U
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 02:29:23 +0000
Received: by mail-pd0-f174.google.com with SMTP id p10so4157397pdj.19
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 19:29:00 -0700 (PDT)
Message-ID: <5451A249.3040909@gmail.com>
Date: Thu, 30 Oct 2014 10:28:25 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
References: <1414493629-12570-1-git-send-email-wangzhou.bry@gmail.com>
 <1414493629-12570-2-git-send-email-wangzhou.bry@gmail.com>
 <CAH6sp9MuL+AAvMi1VrmOhq5Y-ri2DKO3g0h1hw040h5=CRu6UQ@mail.gmail.com>
In-Reply-To: <CAH6sp9MuL+AAvMi1VrmOhq5Y-ri2DKO3g0h1hw040h5=CRu6UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 xuwei5@hisilicon.com, Kumar Gala <galak@codeaurora.org>, caizhiyong@huawei.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014年10月28日 22:22, Frans Klaver wrote:
> On Tue, Oct 28, 2014 at 11:53 AM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
>> +
>> +static int hisi_nfc_probe(struct platform_device *pdev)
>> +{
>> +       int ret = 0, irq, buswidth, flag, max_chips = HINFC504_MAX_CHIP;
>> +       struct device *dev = &pdev->dev;
>> +       struct hinfc_host *host;
>> +       struct nand_chip  *chip;
>> +       struct mtd_info   *mtd;
>> +       struct resource   *res;
>> +       struct device_node *np = dev->of_node;
>> +       struct mtd_part_parser_data ppdata;
>> +
>> +       host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +       if (!host)
>> +               return -ENOMEM;
>> +       host->dev = dev;
>> +
>> +       platform_set_drvdata(pdev, host);
>> +       chip = &host->chip;
>> +       mtd  = &host->mtd;
>> +
>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq < 0) {
>> +               dev_err(dev, "no IRQ resource defined\n");
>> +               ret = -ENXIO;
>> +               goto err_res;
>> +       }
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       host->iobase = devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(host->iobase)) {
>> +               ret = PTR_ERR(host->iobase);
>> +               dev_err(dev, "devm_ioremap_resource[0] fail\n");
>> +               goto err_res;
>> +       }
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +       chip->IO_ADDR_R = chip->IO_ADDR_W = devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(chip->IO_ADDR_R)) {
>> +               ret = PTR_ERR(chip->IO_ADDR_R);
>> +               dev_err(dev, "devm_ioremap_resource[1] fail\n");
>> +               goto err_res;
>> +       }
>> +
>> +       mtd->priv               = chip;
>> +       mtd->owner              = THIS_MODULE;
>> +       mtd->name               = "hisi_nand";
>
> + mtd->dev.parent = &pdev->dev;
>
> This is a bug that lives in a bunch of other nand drivers as well.
> add_mtd_device (called by mtd_device_parse_register()) expects
> dev.parent to be set for properly adding a device reference to the
> sysfs node.
>
> Frans
>
My mistake, I will add this line. Thanks a lot for your reminding.

Kind regards,
Zhou Wang
