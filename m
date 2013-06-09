Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulmgz-0003f7-AY
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 20:58:25 +0000
Date: Sun, 9 Jun 2013 23:57:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in
 orion_nand_probe
Message-ID: <20130609205747.GX23987@mwanda>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
 <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
 <20130609191732.GK28112@mwanda>
 <CAHp75VcOMUVtfgXOQ+cyVpJN-XS7=yO1H8+8Nnw+LCgYWp7RPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcOMUVtfgXOQ+cyVpJN-XS7=yO1H8+8Nnw+LCgYWp7RPw@mail.gmail.com>
Cc: andrew@lunn.ch, Bill Pemberton <wfp5p@virginia.edu>,
 artem.bityutskiy@linux.intel.com, Jingoo Han <jg1.han@samsung.com>,
 kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Emil Goode <emilgoode@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 09, 2013 at 10:27:03PM +0300, Andy Shevchenko wrote:
> On Sun, Jun 9, 2013 at 10:17 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Sun, Jun 09, 2013 at 08:15:20PM +0300, Andy Shevchenko wrote:
> 
> []
> 
> >> What about another patch (that I guess should go first)  that converts
> >> printk to dev_* or pr_*?
> 
> > Huh, what?  Those are two totally unrelated things.  Emil's patch is
> > a bug fix.
> 
> To be precise his patch is bugfix and cleanup at once.
> My proposal is to add a clean up patch.

The printk idea isn't a bad one, it's just totally unrelated to what
the patch is doing.  You can't just randomly tell people to do a
bunch of work for no reason.  "Good bugfix, but before we apply it
you have to mow my lawn."

regards,
dan carpenter
