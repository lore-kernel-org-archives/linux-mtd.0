Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VspuU-0004gf-Ak
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 08:21:47 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so6496077pdi.33
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 00:21:24 -0800 (PST)
Date: Tue, 17 Dec 2013 00:21:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] MIPS: Alchemy: add missing platform_set_drvdata() in
 au1550nd_probe()
Message-ID: <20131217082118.GI12034@norris-Latitude-E6410>
References: <CAPgLHd-qf8Zj0gWgJh3_WMZOAx5-H6aABrVFqRsAw=XkOfDdmw@mail.gmail.com>
 <20131126235026.GN9468@ld-irv-0074.broadcom.com>
 <004e01ceeb05$9d579690$d806c3b0$%han@samsung.com>
 <20131127033555.GY9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131127033555.GY9468@ld-irv-0074.broadcom.com>
Cc: 'Wei Yongjun' <weiyj.lk@gmail.com>,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>,
 'Bill Pemberton' <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 26, 2013 at 07:35:55PM -0800, Brian Norris wrote:
> On Wed, Nov 27, 2013 at 09:14:18AM +0900, Jingoo Han wrote:
> > On Wednesday, November 27, 2013 8:50 AM, Brian Norris wrote:
> > > On Mon, Nov 11, 2013 at 02:18:29PM +0800, Wei Yongjun wrote:
> > > > --- a/drivers/mtd/nand/au1550nd.c
> > > > +++ b/drivers/mtd/nand/au1550nd.c
> > > > @@ -480,6 +480,8 @@ static int au1550nd_probe(struct platform_device *pdev)
> > > >
> > > >  	mtd_device_register(&ctx->info, pd->parts, pd->num_parts);
> > > >
> > > > +	platform_set_drvdata(pdev, ctx);
> > > > +
> > > 
> > > Personally, I'd choose to call platform_set_drvdata() earlier in the
> > > probe routine (e.g., immediately after its allocation), in case we end
> > > up calling platform_get_drvdata() from some sub-routine in the future.
> > 
> > Do you mean the following?
> > But, most drivers calls platform_set_drvdata() later in the probe routine.
> 
> I wouldn't say "most." An unscientific survey seemed to show some
> variation, with no clear pattern.

I'm just pushing the original patch, since this isn't really a big
issue.

Pushed to l2-mtd.git. I reworked the $subject, since this isn't really
about MIPS at all. Thanks Wei and Jingoo.

Brian
