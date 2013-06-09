Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UllGv-0001pq-2k
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 19:27:25 +0000
Received: by mail-ob0-f179.google.com with SMTP id xk17so8997677obc.38
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 12:27:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130609191732.GK28112@mwanda>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
 <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
 <20130609191732.GK28112@mwanda>
Date: Sun, 9 Jun 2013 22:27:03 +0300
Message-ID: <CAHp75VcOMUVtfgXOQ+cyVpJN-XS7=yO1H8+8Nnw+LCgYWp7RPw@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in
 orion_nand_probe
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset=UTF-8
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

On Sun, Jun 9, 2013 at 10:17 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Sun, Jun 09, 2013 at 08:15:20PM +0300, Andy Shevchenko wrote:

[]

>> What about another patch (that I guess should go first)  that converts
>> printk to dev_* or pr_*?

> Huh, what?  Those are two totally unrelated things.  Emil's patch is
> a bug fix.

To be precise his patch is bugfix and cleanup at once.
My proposal is to add a clean up patch.

--
With Best Regards,
Andy Shevchenko
