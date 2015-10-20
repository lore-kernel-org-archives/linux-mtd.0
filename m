Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoZDz-00012P-Px
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 15:53:20 +0000
Received: by vkex70 with SMTP id x70so1070229vke.2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 08:52:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150921170238.GP2381@localhost>
References: <1440790365-28072-1-git-send-email-b45815@freescale.com>
 <1440790365-28072-3-git-send-email-b45815@freescale.com>
 <20150921170238.GP2381@localhost>
Date: Tue, 20 Oct 2015 10:52:58 -0500
Message-ID: <CA+EcR23u-fBwqaK+VYtTe03KEvPpjF1ZEUjZ2xQMLS2QGLSOtg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dmaengine: mxs: support i.MX7D and deep sleep mode
From: Han Xu <xhnjupt@gmail.com>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Han Xu <b45815@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Huang Shijie <shijie.huang@arm.com>, dan.j.williams@intel.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 21, 2015 at 12:02 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Fri, Aug 28, 2015 at 02:32:41PM -0500, Han Xu wrote:
>> @@ -28,7 +28,6 @@
>>  #include <linux/of_device.h>
>>  #include <linux/of_dma.h>
>>  #include <linux/list.h>
>> -
>
> Pl dont change at random places

It's not a random place, i.MX7D need an extra clock clk_io for APBH
DMA, I will add more
comments here

>
>> +     if (mxs_dma->dev_id == IMX7D_DMA) {
>> +             ret = clk_prepare_enable(mxs_dma->clk_io);
>> +             if (ret)
>> +                     goto err_clk_unprepare;
>> +     }
>> +
>>       mxs_dma_reset_chan(chan);
>>
>>       dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
>> @@ -450,6 +464,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>>
>>       return 0;
>>
>> +err_clk_unprepare:
>> +     clk_disable_unprepare(mxs_dma->clk);
>
> and this doesn't look right. You are calling this for failure on
> clk_prepare_enable() so if clock prepare failed you are still going to
> disable and unprepare??

This is also for i.MX7D, if enable mxs_dma->clk_io failed, disable
mxs_dma->clk as well.

>
>> -static int __init mxs_dma_init(struct mxs_dma_engine *mxs_dma)
>> +static int mxs_dma_init(struct mxs_dma_engine *mxs_dma)
>
> this should be separate change explaining why

I will separate the clock change and PM change to two patches.

>
>> +static int mxs_dma_pm_resume(struct device *dev)
>> +{
>> +     struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     ret = mxs_dma_init(mxs_dma);
>> +     if (ret)
>> +             return ret;
>> +     return 0;
>
> Aren't you supposed to prepare and unprepare clock in PM handlers too?

APBH DMA was dedicate for GPMI NAND driver, NAND driver will release
all DMA resources
when suspend and acquire DMA resources when resume. All clock
enable/disable were handled
in these functions. Please refer to the patch serial [PATCH v3 1/6]
mtd: nand: gpmi: add gpmi
dsm supend/resume support

>
> --
> ~Vinod
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
