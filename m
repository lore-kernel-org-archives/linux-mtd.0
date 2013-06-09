Received: from mail-oa0-x230.google.com ([2607:f8b0:4003:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UljDR-0000Bq-QM
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 17:15:42 +0000
Received: by mail-oa0-f48.google.com with SMTP id f4so1129601oah.7
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 10:15:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
References: <1370768902-20239-1-git-send-email-emilgoode@gmail.com>
Date: Sun, 9 Jun 2013 20:15:20 +0300
Message-ID: <CAHp75VftwuS4ZTFP5D90PhyzrAMoHVxDiSCg0jrMGp+r0eRfzA@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: Improve error handling in
 orion_nand_probe
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Goode <emilgoode@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: andrew@lunn.ch, artem.bityutskiy@linux.intel.com,
 Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 9, 2013 at 12:08 PM, Emil Goode <emilgoode@gmail.com> wrote:
> This patch fixes some issues in the error handling and simplifies
> the code by converting to devm* functions.
>
> If the kzalloc call fails it is unnecessary to use the label no_res
> and pass a NULL pointer to kfree. If the devm_kzalloc call fails on
> line 110 we forgett to call iounmap for the previous ioremap call.

"forget" (typo here)

> The following changes are introduced:
> - Convert to devm_kzalloc and remove calls to kfree.
> - Convert to devm_ioremap_resource that adds a missing call to
>   *request_mem_region and remove calls to iounmap.
> - The devm_ioremap_resource function checks the passed resource so
>   we can remove the NULL check after the platform_get_resource call.

What about another patch (that I guess should go first)  that converts
printk to dev_* or pr_*?

--
With Best Regards,
Andy Shevchenko
