Received: from mail-ig0-f175.google.com ([209.85.213.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEyR2-0004JD-8t
 for linux-mtd@lists.infradead.org; Wed, 06 Aug 2014 10:27:08 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so8457079igb.14
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 03:26:47 -0700 (PDT)
Date: Wed, 6 Aug 2014 11:26:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Message-ID: <20140806102641.GB10136@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140703002237.GM3599@ld-irv-0074>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, "Gupta, Pekon\"" <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 02 Jul 2014, Brian Norris wrote:
> On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:

[...]

> > +	if (((unsigned int)buf & (NANDI_BCH_DMA_ALIGNMENT - 1)) ||
> > +	    (!virt_addr_valid(buf))) /* vmalloc'd buffer! */
> > +		bounce = true;
> > +
> > +	p = bounce ? nandi->page_buf : buf;
> 
> It looks like you're reimplementing NAND_USE_BOUNCE_BUFFER. Can you try
> using that flag? (You may need to extend it to account for your DMA
> alignment, too.)

NAND_USE_BOUNCE_BUFFER won't work for us unless we can guarantee that
the bounce buffer will always be 64 Byte aligned, which I don't think
we can.  Another way to do it would be to assign all of our own
buffers, but I'm really not comfortable fiddling with those as there
are a lot of controller specific intricacies which a) I'm not familiar
with and b) no longer have Angus to fire questions off to and/or
review.

So if you don't mind, I'd really rather use Angus' implementation.
It's only an extra couple of lines and Angus has already tested it to
a high level.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
