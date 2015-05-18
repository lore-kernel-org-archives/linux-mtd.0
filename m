Received: from mail-vn0-x22a.google.com ([2607:f8b0:400c:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuTLo-0006h4-PU
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 22:17:33 +0000
Received: by vnbf1 with SMTP id f1so2093731vnb.6
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 15:17:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1431726240-4675-6-git-send-email-fabf@skynet.be>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
 <1431726240-4675-6-git-send-email-fabf@skynet.be>
Date: Tue, 19 May 2015 00:17:10 +0200
Message-ID: <CAFLxGvy=QWcaHbgQyk+WjH1KX__u1Ye6eZ+W4NR7RTifQy3CWQ@mail.gmail.com>
Subject: Re: [PATCH 6/6 linux-next] ubifs: remove else after return
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Content-Type: text/plain; charset=UTF-8
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 15, 2015 at 11:44 PM, Fabian Frederick <fabf@skynet.be> wrote:
> simplify code in add_to_lpt_heap()
>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  fs/ubifs/lprops.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
> index a0011aa..e1454cf 100644
> --- a/fs/ubifs/lprops.c
> +++ b/fs/ubifs/lprops.c
> @@ -208,13 +208,12 @@ static int add_to_lpt_heap(struct ubifs_info *c, struct ubifs_lprops *lprops,
>                 }
>                 dbg_check_heap(c, heap, cat, -1);
>                 return 0; /* Not added to heap */
> -       } else {
> -               lprops->hpos = heap->cnt++;
> -               heap->arr[lprops->hpos] = lprops;
> -               move_up_lpt_heap(c, heap, lprops, cat);
> -               dbg_check_heap(c, heap, cat, lprops->hpos);
> -               return 1; /* Added to heap */
>         }
> +       lprops->hpos = heap->cnt++;
> +       heap->arr[lprops->hpos] = lprops;
> +       move_up_lpt_heap(c, heap, lprops, cat);
> +       dbg_check_heap(c, heap, cat, lprops->hpos);
> +       return 1; /* Added to heap */

Just because of paranoia, did you test your changes?

-- 
Thanks,
//richard
