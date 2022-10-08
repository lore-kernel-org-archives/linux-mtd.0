Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEBC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Oct 2022 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8m+bjDAnVnqUgBnWDrqINFHQ3r/sFuds0bJVgF26e2o=; b=4sP+YTjhLbfmTT
	YP4ah/SuFu5ngsDZVrNVX/gKqwXRTvd+aoC51PkU6Tr3qgj/wfRtNyCuggRE5Gtl2jC1adP621jn8
	pfFDGlP69BBgJGIw/5ElQHNSEpm/iGhzS3n20o9lX8X2ECG4bkPW08tzFRWRT8en2IpDb5hK1YuNP
	fBBEzQwoDK9ziGqpJqn0ZYBVpBqXLEpVQKgMMYvZX3VBlTle/4RT2AhR4N6xWa+KcLyX2Ni1L7GLY
	uDaHgQvenvQ30KpfTxpa49pJKsGmrMT5waDhbVszqqLdJftBeNNfTPuqCwJXa6uAiaJGC0YJMk+cS
	bGXFllVrwbbR27wqgp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4D2-00CGeU-NE; Sat, 08 Oct 2022 07:25:20 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4Cz-00CGdJ-S9
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2022 07:25:19 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 05AC3160B3B;
	Sat,  8 Oct 2022 07:25:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id D2DD435;
	Sat,  8 Oct 2022 07:24:38 +0000 (UTC)
Message-ID: <0d4febb49ddbae9cd99606a89573a7c832ed0965.camel@perches.com>
Subject: Re: [PATCH v3 1/3] mtd: mtdoops: change printk() to counterpart pr_
 functions
From: Joe Perches <joe@perches.com>
To: Ray Zhang <sgzhang@google.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 08 Oct 2022 00:25:07 -0700
In-Reply-To: <20221007215027.918507-2-sgzhang@google.com>
References: <20221007215027.918507-1-sgzhang@google.com>
	 <20221007215027.918507-2-sgzhang@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Stat-Signature: rdikuhra3hm9gs98uoatqnofhgfoncdf
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: D2DD435
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19E8nTRCD3VMc7PJ9/fiVjjdDZbWqk09gY=
X-HE-Tag: 1665213878-381622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_002518_007264_F363A0CC 
X-CRM114-Status: GOOD (  11.61  )
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

On Fri, 2022-10-07 at 21:50 +0000, Ray Zhang wrote:
> To comply with latest kernel code requirement, change printk() to
> counterpart pr_ functions in mtdoops driver:
> - change printk(INFO) to pr_info()
> - change printk(DEBUG) to pr_debug()
> - change printk(WARNING) to pr_warn()
> - change printk(ERR) to pr_err()
> 
> Note that only if dynamic debugging is enabled or DEBUG is defined,
> printk(KERN_DEBUG) and pr_debug() are equivalent; Otherwise pr_debug()
> is no-op, causing different behavior.

Another thing possible is to add

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

before any #include

> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
[]
> @@ -93,9 +93,9 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
>  
>  	ret = mtd_erase(mtd, &erase);
>  	if (ret) {
> -		printk(KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
> -		       (unsigned long long)erase.addr,
> -		       (unsigned long long)erase.len, mtddev);
> +		pr_warn("mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
> +			(unsigned long long)erase.addr,
> +			(unsigned long long)erase.len, mtddev);

And remove the "mtdoops: " prefixes from all the output formats

		pr_warn("erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
			(unsigned long long)erase.addr,
			(unsigned long long)erase.len, mtddev);

> @@ -120,8 +120,8 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
>  		return;
>  	}
>  
> -	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
> -	       cxt->nextpage, cxt->nextcount);
> +	pr_debug("mtdoops: ready %d, %d (no erase)\n",
> +		 cxt->nextpage, cxt->nextcount);

	pr_debug("ready %d, %d (no erase)\n", cxt->nextpage, cxt->nextcount);

etc...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
