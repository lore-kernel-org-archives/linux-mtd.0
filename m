Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPwq2-0001Qb-6N
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 20:11:56 +0000
Received: by mail-qt0-x243.google.com with SMTP id w12so5118074qta.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 13:11:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170623230650.4669-1-harpreet@nestlabs.com>
References: <20170623230650.4669-1-harpreet@nestlabs.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Jun 2017 17:11:31 -0300
Message-ID: <CAOMZO5CPDSsG9oe5ZV-VVxp9BVB=WU_i03LYtPe8LWy+d=5uAw@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: tests: Fix nandbiterrs Failure Check
To: harpreet@nestlabs.com
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 23, 2017 at 8:06 PM,  <harpreet@nestlabs.com> wrote:
> From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>
>
> After a page read, the old failure statistics are compared against the
> new failure statistics before the new values are actually read.
>
> Signed-off-by: Harpreet "Eli" Sangha

Your email is missing in the Signed-off-by line.

Also them From and Signed-off-by lines should match.

Adding David on Cc.

Thanks

> ---
>  tests/mtd-tests/nandbiterrs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
> index 6acbfee..de9d0dd 100644
> --- a/tests/mtd-tests/nandbiterrs.c
> +++ b/tests/mtd-tests/nandbiterrs.c
> @@ -268,15 +268,15 @@ static int read_page(void)
>                 return -1;
>         }
>
> +       if (ioctl(fd, ECCGETSTATS, &new) != 0)
> +               goto failstats;
> +
>         if (new.failed > old.failed) {
>                 fprintf(stderr, "Failed to recover %d bitflips\n",
>                                 new.failed - old.failed);
>                 return -1;
>         }
>
> -       if (ioctl(fd, ECCGETSTATS, &new) != 0)
> -               goto failstats;
> -
>         return new.corrected - old.corrected;
>  failstats:
>         perror("ECCGETSTATS");
> --
> 2.13.1.611.g7e3b11ae1-goog
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
