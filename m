Received: from mail-yk0-x244.google.com ([2607:f8b0:4002:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZruaS-0001RN-HA
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 21:18:21 +0000
Received: by ykdy125 with SMTP id y125so4565565ykd.1
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 14:17:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151029210355.GA7674@chopperman.am.freescale.net>
References: <1445983540-27155-1-git-send-email-b45815@freescale.com>
 <1445983540-27155-4-git-send-email-b45815@freescale.com>
 <CAHp75Vf3OddaGgwrOyk0EE46oFmjoRt+rj3su2VBJQwUnGdRAw@mail.gmail.com>
 <20151029210355.GA7674@chopperman.am.freescale.net>
Date: Thu, 29 Oct 2015 23:17:59 +0200
Message-ID: <CAHp75VdQ1HQy85CiJ-w6-CBfZE1R2n3U=-Tj=vSfXQ=RhvFK5Q@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] dmaengine: mxs: add i.MX7D APBH DMA support
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Han Xu <han.xu@freescale.com>
Cc: Han Xu <b45815@freescale.com>, shijie.huang@arm.com,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, dmaengine <dmaengine@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 11:03 PM, Han Xu <han.xu@freescale.com> wrote:
> On Thu, Oct 29, 2015 at 11:08:10PM +0200, Andy Shevchenko wrote:
>> On Wed, Oct 28, 2015 at 12:05 AM, Han Xu <b45815@freescale.com> wrote:
>> > From: Adrian Alonso <aalonso@freescale.com>
>> >
>> > supports APBH DMA on i.MX7D by add extra clock clk_io
>>
>> []
>>
>> >  MODULE_DEVICE_TABLE(of, mxs_dma_dt_ids);
>> > @@ -440,6 +448,13 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>> >         if (ret)
>> >                 goto err_clk;
>> >
>> > +       /* enable the extra clk_io clock for i.MX7D */
>> > +       if (mxs_dma->dev_id == IMX7D_DMA) {
>> > +               ret = clk_prepare_enable(mxs_dma->clk_io);
>> > +               if (ret)
>> > +                       goto err_clk_unprepare;
>>
>> Perhaps err_clk.
>>
> it is err_clk_unprepare

Ah, you are right.

>> > +       }
>> > +
>> >         mxs_dma_reset_chan(chan);
>> >
>> >         dma_async_tx_descriptor_init(&mxs_chan->desc, chan);
>> > @@ -450,6 +465,8 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
>> >
>> >         return 0;
>> >
>> > +err_clk_unprepare:
>> > +       clk_disable_unprepare(mxs_dma->clk);
>> >  err_clk:
>> >         free_irq(mxs_chan->chan_irq, mxs_dma);


-- 
With Best Regards,
Andy Shevchenko
