Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgtoN-0000ZK-Vj
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 13:19:51 +0000
Subject: Re: [PATCH v2] ubifs: compress lines for immediate return
To: Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
References: <1473058466-10831-1-git-send-email-hs@denx.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Adrian Hunter
 <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <71387535-39e5-9cbc-71c4-d5142e409110@sigma-star.at>
Date: Mon, 5 Sep 2016 15:18:40 +0200
MIME-Version: 1.0
In-Reply-To: <1473058466-10831-1-git-send-email-hs@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/05/2016 08:54 AM, Heiko Schocher wrote:
> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index 11a11b3..48d6851 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -77,7 +77,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
>   */
>  static int run_gc(struct ubifs_info *c)
>  {
> -	int err, lnum;
> +	int lnum;
>  
>  	/* Make some free space by garbage-collecting dirty space */
>  	down_read(&c->commit_sem);
> @@ -88,10 +88,7 @@ static int run_gc(struct ubifs_info *c)
>  
>  	/* GC freed one LEB, return it to lprops */
>  	dbg_budg("GC freed LEB %d", lnum);
> -	err = ubifs_return_leb(c, lnum);
> -	if (err)
> -		return err;
> -	return 0;
> +	return = ubifs_return_leb(c, lnum);
>  }
>  

Apart from the other issues discussed below and in v1, I don't
believe that this _ever_ compiled successfully.
