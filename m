Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFzMS-0007tT-8f
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 07:47:41 +0000
Subject: Re: [PATCH] ubifs: switch_gc_head: remove redondant sync of wbuf
To: Sylvain Etienne <seti@dadboo.eu>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <20160623055344.GA5896@dadboo.eu>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576B9403.7040100@nod.at>
Date: Thu, 23 Jun 2016 09:47:15 +0200
MIME-Version: 1.0
In-Reply-To: <20160623055344.GA5896@dadboo.eu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.06.2016 um 07:53 schrieb Sylvain Etienne:
> The wbuf is already sync-ed before ubifs_leb_unmap()
> 
> Signed-off-by: Sylvain Etienne <seti@dadboo.eu>
> ---
> 
> Notes:
>     This is my first patch on this mailing list. Please let me know if I missed
>     something.
> 
>  fs/ubifs/gc.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index 9718da8..821b348 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -100,10 +100,6 @@ static int switch_gc_head(struct ubifs_info *c)
>  	if (err)
>  		return err;
>  
> -	err = ubifs_wbuf_sync_nolock(wbuf);
> -	if (err)
> -		return err;
> -
>  	err = ubifs_add_bud_to_log(c, GCHD, gc_lnum, 0);
>  	if (err)
>  		return err;

This call was introduced by:
commit cb14a18465686ea6add51b1008865b8174c28bd7
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Sun May 15 14:51:54 2011 +0300

    UBIFS: synchronize write-buffer before switching to the next bud


Which basically syncs the wbuf before each ubifs_add_bud_to_log().
In switch_gc_head() we synced already before ubifs_leb_unmap().
So either the said commit oversaw that sync call or I miss something.

But AFACT your change is correct. Artem, can you please confirm?
Boris, didn't discuss that redundancy while inspecting UBIFS wrt. MLC
support?

Thanks,
//richard
