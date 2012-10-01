Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TIkSp-0003e7-He
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2012 18:11:31 +0000
Received: by vbbfo1 with SMTP id fo1so5982282vbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2012 11:11:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348567033-5418-1-git-send-email-sachin.kamat@linaro.org>
References: <1348567033-5418-1-git-send-email-sachin.kamat@linaro.org>
Date: Mon, 1 Oct 2012 23:41:30 +0530
Message-ID: <CAK9yfHyFT8Cz8J1aGhQgAUE_A-_2qjd5U5JPs17rxgd9x3erjw@mail.gmail.com>
Subject: Re: [PATCH] mtd: ofpart: Fix incorrect NULL check in
 parse_ofoldpart_partitions()
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: patches@linaro.org, sachin.kamat@linaro.org, dedekind1@gmail.com,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping...

On 25 September 2012 15:27, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> The pointer returned by kzalloc should be tested for NULL
> to avoid potential NULL pointer dereference later. Incorrect
> pointer was being tested for NULL. Bug introduced by commit fbcf62a3
> (mtd: physmap_of: move parse_obsolete_partitions to become separate
> parser).
> This patch fixes this bug.
>
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/ofpart.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 64be8f0..d9127e2 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -121,7 +121,7 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
>         nr_parts = plen / sizeof(part[0]);
>
>         *pparts = kzalloc(nr_parts * sizeof(*(*pparts)), GFP_KERNEL);
> -       if (!pparts)
> +       if (!*pparts)
>                 return -ENOMEM;
>
>         names = of_get_property(dp, "partition-names", &plen);
> --
> 1.7.4.1
>



-- 
With warm regards,
Sachin
