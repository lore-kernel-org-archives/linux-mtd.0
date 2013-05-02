Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXyus-00005N-G5
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 19:11:43 +0000
Received: by mail-we0-f174.google.com with SMTP id z2so753794wey.19
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 12:11:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1367453444-12988-1-git-send-email-bapper@gmail.com>
References: <1367453444-12988-1-git-send-email-bapper@gmail.com>
Date: Thu, 2 May 2013 21:11:03 +0200
Message-ID: <CAFLxGvyt3G9gtKMvCECKUXoKA0t7JEg8-+aKywPoNrbeFW=edA@mail.gmail.com>
Subject: Re: [PATCH] UBI: fastmap break out of used PEB search
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 2, 2013 at 2:10 AM, Brian Pomerantz <bapper@gmail.com> wrote:
> While searching for PEB matches for each volume in the used PEB list,
> the search fails to stop when the PEB is found.  This patch adds
> a break in the inner loop to stop the search when it is matched.
>
> Signed-off-by: Brian Pomerantz <bapper@gmail.com>
> ---
>  drivers/mtd/ubi/fastmap.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 0648c69..1542751 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -727,8 +727,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>
>                         aeb = NULL;
>                         list_for_each_entry(tmp_aeb, &used, u.list) {
> -                               if (tmp_aeb->pnum == pnum)
> +                               if (tmp_aeb->pnum == pnum) {
>                                         aeb = tmp_aeb;
> +                                       break;
> +                               }
>                         }
>
>                         /* This can happen if a PEB is already in an EBA known
> --
> 1.7.0.1

Acked-by: Richard Weinberger <richard@nod.at>

--
Thanks,
//richard
