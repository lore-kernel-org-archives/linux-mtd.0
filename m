Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0C9C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 19:17:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AF8320728
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 19:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CN8+s3vz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1UWKkNNK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AF8320728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEQXR/WuG0XbLBw18YvRBLK7IxKJ7DVdsYHI1OYwMC0=; b=CN8+s3vzCWMtyG
	0btJu0K65fHlAJe9c8vD+mojcZkLSs/PMES9yXTwclJumP5EaHaE5xyO6QiP9u54WWZ0/GcGncHc0
	ezYi8BDei8kOyOxDB5Wujwm7qYDG4b+lzBavaixeYbGW/b1ARqZru19cqzhRBYcAOP1Y8SiPs2Uq1
	hS6IQZ/xhXcSDrFkIe+ZVGcM92DmMfB8bAExF7YKq/DhKFDvfP0CqPqtFnzUxAkGRlkhkvuK1zVT4
	JBEIXeKFdpYTkj1ED6GSIN9efnL4IDgDzB+Po2b9PM0V9qMuM11ouTLOW9bS8euOScv6OfOV8zCng
	BIplZgad0hwxcdGjfcgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZfpV-0007aa-Ei; Fri, 15 May 2020 19:17:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZfpS-0007a1-QX
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 19:17:08 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9E7E20727;
 Fri, 15 May 2020 19:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589570226;
 bh=XBx66mGVJ7Tbb+phuQ5uMEEIItH+a9pVZe/h/WYga1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1UWKkNNKCuIzrl5u6+/k8AYmsz01h1u+HcEBJ/L4lKNuC3iBVSz/ZOmmaLj2uBfL7
 ccDTssausF1EHjwGCk5y0XHUwHVwYRWaSsoGGmaIz2XUhlgAYJXiRdhDUn4GSKxFP9
 4VHfJV9HpwUW4vcJPE890Gi8KFTgoAPCFWyG//Xw=
Date: Fri, 15 May 2020 12:17:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: fix wrong use of crypto_shash_descsize()
Message-ID: <20200515191704.GE1009@sol.localdomain>
References: <20200502055945.1008194-1-ebiggers@kernel.org>
 <20200504071644.GS5877@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504071644.GS5877@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_121706_881962_7237E419 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 04, 2020 at 09:16:44AM +0200, Sascha Hauer wrote:
> On Fri, May 01, 2020 at 10:59:45PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > crypto_shash_descsize() returns the size of the shash_desc context
> > needed to compute the hash, not the size of the hash itself.
> > 
> > crypto_shash_digestsize() would be correct, or alternatively using
> > c->hash_len and c->hmac_desc_len which already store the correct values.
> > But actually it's simpler to just use stack arrays, so do that instead.
> > 
> > Fixes: 49525e5eecca ("ubifs: Add helper functions for authentication support")
> > Fixes: da8ef65f9573 ("ubifs: Authenticate replayed journal")
> > Cc: <stable@vger.kernel.org> # v4.20+
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Looks better that way, thanks.
> 
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> 

Richard, could you take this through the ubifs tree for 5.8?

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
