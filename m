Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX9Nb-0006NO-8F
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 13:14:28 +0000
Received: by mail-vc0-f180.google.com with SMTP id lf12so5144771vcb.39
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 06:14:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1396339273-15904-1-git-send-email-tlinder@codeaurora.org>
References: <1396339273-15904-1-git-send-email-tlinder@codeaurora.org>
Date: Mon, 7 Apr 2014 15:14:05 +0200
Message-ID: <CAFLxGvwXXx2q=yRW6agt5pjJkfnYB40j_u7udLP7yOSHP8eLmw@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Test return value of __wl_get_peb
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 1, 2014 at 10:01 AM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> In case of an error (if there are not free PEB's for example),
> __wl_get_peb will return a negative value. In order to prevent access
> violation we need to test the returned value prior to using it later on.
>
> Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 02317c1..457ead3 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -684,6 +684,9 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
>         peb = __wl_get_peb(ubi);
>         spin_unlock(&ubi->wl_lock);
>
> +       if (peb < 0)
> +               return peb;
> +
>         err = ubi_self_check_all_ff(ubi, peb, ubi->vid_hdr_aloffset,
>                                     ubi->peb_size - ubi->vid_hdr_aloffset);
>         if (err) {

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
