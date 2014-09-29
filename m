Received: from relay3-d.mail.gandi.net ([2001:4b98:c:538::195])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYOQx-0007cv-Q4
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 00:03:20 +0000
Date: Sun, 28 Sep 2014 17:02:44 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH V2 linux-next] jffs2: fix sparse warning: unexpected unlock
Message-ID: <20140929000243.GA1353@thin>
References: <1411932392-7751-1-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411932392-7751-1-git-send-email-fabf@skynet.be>
Cc: linux-mtd@lists.infradead.org, linux-sparse@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 28, 2014 at 09:26:32PM +0200, Fabian Frederick wrote:
> fs/jffs2/summary.c:846:5: warning: context imbalance in 'jffs2_sum_write_sumnode' - unexpected unlock
> 
> Suggested-by: Brian Norris <computersforpeace@gmail.com>
> Suggested-by: Josh Triplett <josh@joshtriplett.org>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Reviewed-by: Josh Triplett <josh@joshtriplett.org>

> V2: use __must_hold instead of __releases / __acquires
> (suggested by Brian Norris and Josh Triplett)
> 
>  fs/jffs2/summary.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
> index c522d09..bc53854 100644
> --- a/fs/jffs2/summary.c
> +++ b/fs/jffs2/summary.c
> @@ -844,6 +844,7 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
>  /* Write out summary information - called from jffs2_do_reserve_space */
>  
>  int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
> +	__must_hold(&c->erase_completion_block)
>  {
>  	int datasize, infosize, padsize;
>  	struct jffs2_eraseblock *jeb;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sparse" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
