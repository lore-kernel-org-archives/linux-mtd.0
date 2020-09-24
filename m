Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C48C4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 13:46:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8D6206B2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 13:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y2Ybi/US"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8D6206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HR3YYwuIwNrA+n8pSo8yqf38jzTcgDWRI7PICfq7zSI=; b=Y2Ybi/US8kqitH48gzZMMRZhS
	g1rqUGjJBC70HT85vTHkEl1kUZUfjY3s1Gr6uFhLTHLDS1LizHL7884iaGtUBoT43STki6AZ6MLmV
	MGBW6EGJXNuAKVQQIL7rcWjOxWqQXznkAcctbhazMycXa4JHS/CdK4nRRbM2b9wtbscnesiEfa26D
	K7vXCRP9JxjtyqBKQN5soTClfKudtrzbCNyvFh+PlLq9Ukozw7y8dgp/vllTTPnN53IufJWrgLlUB
	vK+cOyoDLNIR36vAOb89iPH9CEGtglfvP/1uhYAp/DwLswz1iZPrchqJcU/BcjuYP3+Sk2++2hFtm
	5s6FFFW7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLRZD-0007lI-Fj; Thu, 24 Sep 2020 13:45:47 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRZ7-0007iy-6c; Thu, 24 Sep 2020 13:45:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 856DEACF5;
 Thu, 24 Sep 2020 13:45:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id EEFC11E12F7; Thu, 24 Sep 2020 11:00:21 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:00:21 +0200
From: Jan Kara <jack@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 12/13] udf: Tell the VFS that readpage was synchronous
Message-ID: <20200924090021.GE27019@quack2.suse.cz>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-13-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917151050.5363-13-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_094541_358685_A6A36F3C 
X-CRM114-Status: GOOD (  18.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 17-09-20 16:10:49, Matthew Wilcox (Oracle) wrote:
> The udf inline data readpage implementation was already synchronous,
> so use AOP_UPDATED_PAGE to avoid cycling the page lock.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
> ---
>  fs/udf/file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/udf/file.c b/fs/udf/file.c
> index 628941a6b79a..52bbe92d7c43 100644
> --- a/fs/udf/file.c
> +++ b/fs/udf/file.c
> @@ -61,9 +61,8 @@ static int udf_adinicb_readpage(struct file *file, struct page *page)
>  {
>  	BUG_ON(!PageLocked(page));
>  	__udf_adinicb_readpage(page);
> -	unlock_page(page);
>  
> -	return 0;
> +	return AOP_UPDATED_PAGE;
>  }
>  
>  static int udf_adinicb_writepage(struct page *page,
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
