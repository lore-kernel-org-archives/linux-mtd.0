Received: from mail-ig0-f177.google.com ([209.85.213.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEyiS-0004AK-9I
 for linux-mtd@lists.infradead.org; Wed, 06 Aug 2014 10:45:08 +0000
Received: by mail-ig0-f177.google.com with SMTP id hn18so2619935igb.10
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 03:44:45 -0700 (PDT)
Date: Wed, 6 Aug 2014 11:44:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: stm_nand_bch: add new driver
Message-ID: <20140806104440.GC10136@lee--X1>
References: <1401268805-26043-1-git-send-email-lee.jones@linaro.org>
 <20140703002237.GM3599@ld-irv-0074> <20140731164709.GK9030@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140731164709.GK9030@lee--X1>
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

On Thu, 31 Jul 2014, Lee Jones wrote:
> On Wed, 02 Jul 2014, Brian Norris wrote:
> > On Wed, May 28, 2014 at 10:20:05AM +0100, Lee Jones wrote:

[...]

> > > +	if (IS_ERR(pdata))
> > > +		return PTR_ERR(pdata);
> > > +
> > > +	ppdata.of_node = stm_of_get_partitions_node(np, 0);
> > 
> > So you only support a single bank, at chip-select 0? Is this a
> > hardware limitation, or simply software? You might consider whether this
> > needs to be noted in the DT binding too -- it currently suggests that
> > this can be plural.
> 
> Yes, only one bank.  Chip select is not possible.

Sorry, not only one bank.

We can have multiple banks, but only one chip.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
