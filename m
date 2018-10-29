Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHH1l-0005hC-Oj
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 23:33:00 +0000
From: Richard Weinberger <richard@nod.at>
To: Colin King <colin.king@canonical.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ubifs: authentication: fix memory leak on error
 exit path
Date: Tue, 30 Oct 2018 00:32:36 +0100
Message-ID: <2101590.OYyDjomelk@blindfold>
In-Reply-To: <20181029232146.21262-1-colin.king@canonical.com>
References: <20181029232146.21262-1-colin.king@canonical.com>
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

Am Dienstag, 30. Oktober 2018, 00:21:46 CET schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failure when calling ubifs_read_nnode results in a leak
> of desc and buf because of a direct return. Fix this by exiting via
> label 'out' that performs the necessary free'ing of the resources.
> 
> Fixes: a1dc58140f7e ("ubifs: authentication: Authenticate LPT")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
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

IMHO a better fix would be reading the root node before allocating these buffers.

Thanks,
//richard
