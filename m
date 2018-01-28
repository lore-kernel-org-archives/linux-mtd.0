Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efayA-0006Nx-FI
 for linux-mtd@lists.infradead.org; Sun, 28 Jan 2018 00:37:16 +0000
Received: by mail-wm0-x243.google.com with SMTP id f71so7689034wmf.0
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2018 16:37:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <58232c8a9192b7fc279389099d2cd1ff7b5abcd3.1516868053.git.andrea.adami@gmail.com>
References: <cover.1516868053.git.andrea.adami@gmail.com>
 <58232c8a9192b7fc279389099d2cd1ff7b5abcd3.1516868053.git.andrea.adami@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 28 Jan 2018 01:37:00 +0100
Message-ID: <CAAQYJAsSuvFZcb_aQ4F43PeaOQS2E5Jdq_F9ae=DexNvkmY3fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd-utils: common.c: convert to integer arithmetic
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 25, 2018 at 9:52 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> We use floating point just to print out KiB, MiB, GiB.
> Avoid that to be klibc friendly.
>
> Fixes compilation for aarch64 against klibc:
>
> error: '-mgeneral-regs-only' is incompatible with floating-point argument
> |    printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
> etc.
>
> Note:
> * In the KiB case, we could apparently multiply by 100 before dividing
>   without risking overflow. This code simply avoids multiplications.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  lib/common.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/lib/common.c b/lib/common.c
> index 69b03b3..5e28853 100644
> --- a/lib/common.c
> +++ b/lib/common.c
> @@ -107,6 +107,9 @@ long long util_get_bytes(const char *str)
>  void util_print_bytes(long long bytes, int bracket)
>  {
>         const char *p;
> +       int GiB = 1024 * 1024 * 1024;
> +       int MiB = 1024 * 1024;
> +       int KiB = 1024;
>
>         if (bracket)
>                 p = " (";
> @@ -115,12 +118,12 @@ void util_print_bytes(long long bytes, int bracket)
>
>         printf("%lld bytes", bytes);
>
> -       if (bytes > 1024 * 1024 * 1024)
> -               printf("%s%.1f GiB", p, (double)bytes / (1024 * 1024 * 1024));
> -       else if (bytes > 1024 * 1024)
> -               printf("%s%.1f MiB", p, (double)bytes / (1024 * 1024));
> -       else if (bytes > 1024 && bytes != 0)
> -               printf("%s%.1f KiB", p, (double)bytes / 1024);
> +       if (bytes > GiB)
> +               printf("%s%d.%d GiB", p, bytes / GiB, bytes % GiB / (GiB / 10));
> +       else if (bytes > MiB)
> +               printf("%s%d.%d MiB", p, bytes / MiB, bytes % MiB / (MiB / 10));
> +       else if (bytes > KiB && bytes != 0)
> +               printf("%s%d.%d KiB", p, bytes / KiB, bytes % KiB / (KiB / 10));
>         else
>                 return;
>
> --
> 2.7.4
>

Missing cast to integer, the right specifier here would be %lld and not %d.
Building 1.5.2-klibc I had no warnings but now I see them with 2.0.1.
I'll send a v2.

Regards
Andrea
