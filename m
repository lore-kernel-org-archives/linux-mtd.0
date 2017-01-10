Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQwYk-0001Yo-Kv
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 13:34:00 +0000
Received: by mail-oi0-x244.google.com with SMTP id 3so69622203oih.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 05:33:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 10 Jan 2017 14:33:32 +0100
Message-ID: <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andy,

On Tue, Jan 10, 2017 at 1:56 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Fix permissions to allow read mtd parameter back (only for owner).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please CC all maintainers in future. Otherwise the chance is high that
I'll miss a patch.

> ---
>  drivers/mtd/ubi/build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 54312431750b..7bac790d4298 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1470,7 +1470,7 @@ static int ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
>         return 0;
>  }
>
> -module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
> +module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 0400);
>  MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: mtd=<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024[,ubi_num]]].\n"
>                       "Multiple \"mtd\" parameters may be specified.\n"
>                       "MTD devices may be specified by their number, name, or path to the MTD character device node.\n"

What is the use case?
AFAIKT the permissions are 000 because a parser is involved and to
"understand" the parameter,
a reader needs the ubi_mtd_param_parse() function.

-- 
Thanks,
//richard
