Received: from mail-ie0-f172.google.com ([209.85.223.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJzgE-0004tO-Ul
 for linux-mtd@lists.infradead.org; Wed, 20 Aug 2014 06:47:36 +0000
Received: by mail-ie0-f172.google.com with SMTP id lx4so2365525iec.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 23:47:13 -0700 (PDT)
Date: Wed, 20 Aug 2014 07:47:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/8] mtd: nand: Support for new DT NAND driver
Message-ID: <20140820064708.GC4266@lee--X1>
References: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
 <20140814224013.GE18411@ld-irv-0074>
 <20140818083953.GA4266@lee--X1>
 <20140819013110.GO18411@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140819013110.GO18411@ld-irv-0074>
Cc: pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Aug 2014, Brian Norris wrote:

> On Mon, Aug 18, 2014 at 09:39:53AM +0100, Lee Jones wrote:
> > On Thu, 14 Aug 2014, Brian Norris wrote:
> > > Particularly, take a hard look at rewriting
> > > include/linux/mtd/stm_nand_bbt.h.
> > 
> > I don't think there is any need - although this change is required:
> > 
> > -#if defined(MTD_NAND_STM_BBT)
> > +#if defined(MTD_NAND_STM_BCH_BBT)
> 
> You're still missing a GPL header and #include guards.
> 
> Your whole patch series (both v1 and v2) also has a few legit
> checkpatch.pl warnings. Please fix these.

Will fix all of the above.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
