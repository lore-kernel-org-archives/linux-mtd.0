Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYyKC-00055W-SF
 for linux-mtd@lists.infradead.org; Sat, 12 Apr 2014 13:50:29 +0000
Received: by mail-pa0-f54.google.com with SMTP id lf10so6562566pab.27
 for <linux-mtd@lists.infradead.org>; Sat, 12 Apr 2014 06:50:05 -0700 (PDT)
Date: Sat, 12 Apr 2014 21:49:43 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 11/11] mtd: fsl-quadspi: fix __iomem annotations,
 accessors
Message-ID: <20140412134939.GA2952@localhost.localdomain>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
 <1397242806-7575-12-git-send-email-computersforpeace@gmail.com>
 <20140412045700.GA1545@localhost.localdomain>
 <20140412061333.GI3131@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140412061333.GI3131@norris-Latitude-E6410>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 11, 2014 at 11:13:33PM -0700, Brian Norris wrote:
> On Sat, Apr 12, 2014 at 12:57:03PM +0800, Huang Shijie wrote:
> > On Fri, Apr 11, 2014 at 12:00:06PM -0700, Brian Norris wrote:
> > > @@ -730,7 +730,7 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
> > >  		return ret;
> > >  
> > >  	/* Read out the data directly from the AHB buffer.*/
> > > -	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
> > > +	memcpy_fromio(buf, q->ahb_base + q->chip_base_addr + from, len);
> > ARM does some optimazation to the memcpy, please see arch/arm/lib/memcpy.S.
> > 
> > But the memcpy_fromio does not do optimazation, please see _memcpy_fromio.
> 
> Ah, yes. I noticed this actually, but didn't think much about it.
> 
> > Someone ever sent a patch to fix the issue, but Russell did not merge it.
> 
> That's unfortunate.
> 
> > please see:
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2009-November/003860.html
> > 
> > So we'd better do not change to use memcpy_fromio.
> 
> How about the last recommendation of that thread, readsl()?
> 
[1] firstly, I think it is not an IO read actually.
   We read the data from the AHB memory address in fact, a miss will make the
   controller to trigger a QUAD read to the NOR flash.
   
[2] secondly, the memcpy can work by the unit of 8 bytes (or more?),
	while the readsl can work by the unit of 4 bytes at most.
    

So use memcpy here is better then using the readsl.


>   http://lists.infradead.org/pipermail/linux-arm-kernel/2009-November/003984.html
> 
> It has your optimization, and it has the type-checking we'd like.
> 
> > BTW: i am okay with other patches about the spi-nor.
> 
> Thanks. I'll probably merge the first 10 soon and see about respinning
> this one eventually.
Please merge the first 10 patches as soon as possible. :)

thanks
Huang Shijie
