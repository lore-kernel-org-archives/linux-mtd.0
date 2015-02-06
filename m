Received: from mail-pd0-f181.google.com ([209.85.192.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJnsx-0007f4-VS
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 18:44:12 +0000
Received: by pdjg10 with SMTP id g10so10229543pdj.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2015 10:43:50 -0800 (PST)
Date: Fri, 6 Feb 2015 10:43:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: fix build on ARM64
Message-ID: <20150206184347.GM18140@ld-irv-0074>
References: <1423004776-17825-1-git-send-email-robh@kernel.org>
 <54D508BA.7000606@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54D508BA.7000606@free-electrons.com>
Cc: Rob Herring <robh@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 06, 2015 at 03:32:26PM -0300, Ezequiel Garcia wrote:
> On 02/03/2015 08:06 PM, Rob Herring wrote:
> [..]
> > @@ -1580,7 +1580,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
> >  	info->pdev = pdev;
> >  	info->variant = pxa3xx_nand_get_variant(pdev);
> >  	for (cs = 0; cs < pdata->num_cs; cs++) {
> > -		mtd = (struct mtd_info *)((unsigned int)&info[1] +
> > +		mtd = (struct mtd_info *)((void *)&info[1] +
> >  		      (sizeof(*mtd) + sizeof(*host)) * cs);
> >  		chip = (struct nand_chip *)(&mtd[1]);
> >  		host = (struct pxa3xx_nand_host *)chip;
> > 
> 
> Those casts are an eyesore to me.

I suppose the (struct mtd_info *) cast is unecessary now, since the
(void *) will be implicitly casted just fine. But I'm not sure if it's
worth dropping it.

> Is this change related to the patch?

I believe the (void *) cast is a necessary change because
sizeof(pointer) != sizeof(unsigned int) on a 64-bit arch, so the
(unsigned int) cast would (rightly) generate a warning about the unsafe
cast. You're losing the top 32 bits.

Brian
