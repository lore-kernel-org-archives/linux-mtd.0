Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFCCC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hj470IfNNqbgp37v0japSrfsDe2bc3x3CKi8T+npvC8=; b=pVicicW9gB6EyB
	lv9f7CP7reqdgrITcTx381JbYuS/YdqtJEXT7+JTjQV5+4+MaoqYfDXUBpLg8FC7K6n9xOtjSuJBA
	CG/YDbv21K5FVvjt0L1Gbc1gfAfljiWBmm4KD5Oj3+901DdSVVi5mXylCIut14BoLvPLE7dqq5jtT
	Q9vtuM0Pn6wzZHFDsJsztN3kiNEqQK0Mwfr9Lh/hGFlf0oKAIYBsJkhEy2n17qgoCGSQ8iASTWlY6
	OxDAmtRJmcqn3m+0Ove9TxNtdAErY5hrY0/2u9UZswE+58ril0M2u0m1web0C7oGaLMZ7s/zof4R2
	bpRLiylrAdLgl/hhgMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUQ8r-00CLOh-Vt; Wed, 16 Mar 2022 09:40:30 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUQ8o-00CLNe-QT
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 09:40:28 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 9CFEA100019; Wed, 16 Mar 2022 09:40:20 +0000 (UTC)
Date: Wed, 16 Mar 2022 09:40:20 +0000
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] Allow rfddump and rfdformat to work on a test mtdram
Message-ID: <YjGwhCuH6dPHQ5iX@gofer.mess.org>
References: <20211127153550.GA23039@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211127153550.GA23039@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_024027_036785_6F1B63B1 
X-CRM114-Status: GOOD (  17.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Nov 27, 2021 at 03:35:50PM +0000, Sean Young wrote:
> rfd can be used with mtdram since commit e03a81213a9c ("mtd: rfd_ftl: allow
> use of MTD_RAM for testing purposes"), which is in kernel v5.15.

Why has this patch been marked "not applicable", also without any discussion?

https://patchwork.ozlabs.org/project/linux-mtd/patch/20211127153550.GA23039@gofer.mess.org/

So the kernel side changes are accepted and merged upstream, but the
necessary user space changes are "not applicable". Is there a plan to revert
the kernel side commits?


Sean

> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  nor-utils/rfddump.c   | 2 +-
>  nor-utils/rfdformat.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
> index 01ab4c2..c85c067 100644
> --- a/nor-utils/rfddump.c
> +++ b/nor-utils/rfddump.c
> @@ -200,7 +200,7 @@ int main(int argc, char *argv[])
>  			return 1;
>  		}
>  
> -		if (mtd_info.type != MTD_NORFLASH) {
> +		if (mtd_info.type != MTD_NORFLASH && mtd_info.type != MTD_RAM) {
>  			fprintf(stderr, "%s: wrong type\n", rfd.mtd_filename);
>  			close(fd);
>  			return 2;
> diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
> index 0a3d9fb..160c081 100644
> --- a/nor-utils/rfdformat.c
> +++ b/nor-utils/rfdformat.c
> @@ -108,7 +108,7 @@ int main(int argc, char *argv[])
>  		return 1;
>  	}
>  
> -	if (mtd_info.type != MTD_NORFLASH) {
> +	if (mtd_info.type != MTD_NORFLASH && mtd_info.type != MTD_RAM) {
>  		fprintf(stderr, "%s: not NOR flash\n", mtd_filename);
>  		close(fd);
>  		return 2;
> -- 
> 2.33.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
