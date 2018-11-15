Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNPPD-00080D-1Q
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 21:42:32 +0000
From: Richard Weinberger <richard@nod.at>
To: Garry McNulty <garrmcnu@gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, colin.king@canonical.com
Subject: Re: [PATCH] ubifs: fix memory leak on error condition
Date: Thu, 15 Nov 2018 22:42:11 +0100
Message-ID: <2181429.CC2M8HkSot@blindfold>
In-Reply-To: <20181115203850.5774-1-garrmcnu@gmail.com>
References: <20181115203850.5774-1-garrmcnu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 15. November 2018, 21:38:50 CET schrieb Garry McNulty:
> If the call to ubifs_read_nnode() fails in ubifs_lpt_calc_hash() an
> error is returned without freeing the memory allocated to 'buf'.
> Jump to 'out' label to free allocated memory and return the error code.
> 
> Detected by CoverityScan, CID 1441025 ("Resource leak")
> 
> Signed-off-by: Garry McNulty <garrmcnu@gmail.com>
> ---
>  fs/ubifs/lpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
> index d1d5e96350dd..c162459a1e02 100644
> --- a/fs/ubifs/lpt.c
> +++ b/fs/ubifs/lpt.c
> @@ -1688,7 +1688,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
>  	if (!c->nroot) {
>  		err = ubifs_read_nnode(c, NULL, 0);
>  		if (err)
> -			return err;
> +			goto out;
>  	}
>  
>  	cnode = (struct ubifs_cnode *)c->nroot;

Please see:
http://lists.infradead.org/pipermail/linux-mtd/2018-October/085081.html

If Colin won't send a v2, please do you so, then I'll take your v2.

Thanks,
//richard
