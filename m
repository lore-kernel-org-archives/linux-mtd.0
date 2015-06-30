Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9q38-0005bY-3z
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 07:33:47 +0000
Message-ID: <55924642.2030902@nod.at>
Date: Tue, 30 Jun 2015 09:33:22 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, computersforpeace@gmail.com
Subject: Re: [PATCH 1/2] mtd-utils: fs-tests: pass TEST_DIR to integck in
 run_all.sh
References: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.06.2015 um 10:49 schrieb Dongsheng Yang:
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

Hmm, so, run_all.sh never worked as expected?
TBH I run integck always by hand, so at least I have never noticed.

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
