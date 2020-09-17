Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B33C2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3BA206CA
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNFjS3YP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y+iGlgpC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3BA206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mpOg9lM0kjVegSPHx2kKv4jI43v9lEOs/cmKWwprLxE=; b=UNFjS3YPpmL/wtwyWSLTtjNgQ
	BlHyh8amNbMR7ynh4Bcs8Zse/feonSgeTIvk2vB1YCT0POg3ozCv2f33HjxYfRZP0swhDO4BPAmbF
	86pgiD03RRLqZXXgaUKDnSQtBPN2ueh3xBfI6p7PHRgXHTsgBEhLKz0avZT0SAQCYlrs5f83cJsIR
	dkK3CD4FxrCv1Y0y8hdS8ndmvkO7I/nO2beUs0/x1zW5hR4NS61nhEX8bBjpN6ZJN68wqP3POgadP
	dG0Q/twLx35cL6pTSYbEZQ2j3aOogKUKvNT2WT6nDKOFNmYhOGRbLJuOhHAPHhXzA4ey9D7ZvrlXj
	Q9gZPq47A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIx6P-0006JA-Dv; Thu, 17 Sep 2020 16:49:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIx6N-0006HY-AD; Thu, 17 Sep 2020 16:49:43 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 650562220E;
 Thu, 17 Sep 2020 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361382;
 bh=sF5GNWOZkQ3nf3+Th5gnQt2xcpsdwKBCS7zrVGfmbVw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=y+iGlgpCeM9xb9d27IMJV7+wkEMiK0mQoV9W7l5UCg8sFTmZkgM99uNvIc2+GWqlH
 0ZPlY/toTe9JazTgGCZZDIpYPmlLHd2V1m/PsaZcDqBuvctHhOeuwFRx8Pao5bfxG/
 9CS6yNA1rBp1Aud48qlKW00CelvRgOeuZ6WNzkHg=
Message-ID: <57d35fdb5ea646f96b70fd8b8a29434761c3f1d3.camel@kernel.org>
Subject: Re: [PATCH 04/13] ceph: Tell the VFS that readpage was synchronous
From: Jeff Layton <jlayton@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 linux-fsdevel@vger.kernel.org
Date: Thu, 17 Sep 2020 12:49:40 -0400
In-Reply-To: <20200917151050.5363-5-willy@infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-5-willy@infradead.org>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_124943_421770_59D5BC4F 
X-CRM114-Status: GOOD (  16.04  )
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
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-17 at 16:10 +0100, Matthew Wilcox (Oracle) wrote:
> The ceph readpage implementation was already synchronous, so use
> AOP_UPDATED_PAGE to avoid cycling the page lock.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/ceph/addr.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 6ea761c84494..b2bf8bf7a312 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -291,10 +291,11 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
>  static int ceph_readpage(struct file *filp, struct page *page)
>  {
>  	int r = ceph_do_readpage(filp, page);
> -	if (r != -EINPROGRESS)
> -		unlock_page(page);
> -	else
> -		r = 0;
> +	if (r == -EINPROGRESS)
> +		return 0;
> +	if (r == 0)
> +		return AOP_UPDATED_PAGE;
> +	unlock_page(page);
>  	return r;
>  }
>  

Looks good to me. I assume you'll merge all of these as a set since the
early ones are a prerequisite?

Reviewed-by: Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
