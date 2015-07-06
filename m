Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCEA4-00059Q-8K
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 21:42:48 +0000
Received: by pacgz10 with SMTP id gz10so27625728pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 14:42:27 -0700 (PDT)
Date: Mon, 6 Jul 2015 14:42:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd-utils: fs-tests: pass TEST_DIR to integck in
 run_all.sh
Message-ID: <20150706214217.GA22005@brian-ubuntu>
References: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 29, 2015 at 04:49:18PM +0800, Dongsheng Yang wrote:
> Test integck requires a parameter but run_all.sh did no pass any to it.
> Then:
> integck: error!: test file-system was not specified (use -h for help)
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  tests/fs-tests/run_all.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/fs-tests/run_all.sh b/tests/fs-tests/run_all.sh
> index 7c82921..cb481ab 100755
> --- a/tests/fs-tests/run_all.sh
> +++ b/tests/fs-tests/run_all.sh
> @@ -16,7 +16,7 @@ rm -rf ${TEST_DIR}/*
>  
>  rm -rf ${TEST_DIR}/*
>  
> -./integrity/integck || exit 1
> +./integrity/integck $TEST_DIR|| exit 1

Applied, with a whitespace fixup. Thanks.

>  
>  rm -rf ${TEST_DIR}/*
>  
> -- 
> 1.8.4.2
> 
