Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3B9C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4808A2145D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 09:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0QKG9fIF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TssziCuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4808A2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HbpMSBRGSQ3pzhgzqOfAg3ccskkdcAI2xaJcVLw5XCQ=; b=0QKG9fIFdpeDA6DzF2lB0vaXr
	SOphsHtRa5XdQXSzGWVOgb6nzxtrSY7OO2ZeuosLU5K73K7YskcCeQkQYbG7DJ1gr/1uZNSsNfDHl
	M6QzYeJmcxyha13ozAtL9c4a2P4D8x/Wwm4/YLDsbZ3/0lGWXILeL7cYpg6Cn0j/XokBWyz4tZENP
	ogxMOP7jCiBJg3K8ZY+qugdh3qP3keon3fOPZ+R0sZlOkOZcSUdrWUyPAcPAsLeeWOM4LPVVpckHh
	CjUUc61lk1Mt7j4Q1L0aeRmWahIzQ+o/pV5XgwXUYHXx2r8WMRNiVc7FCItIoe/nxlmIqmmW00uLp
	54MW5MSIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSz9s-0002gE-82; Thu, 15 Oct 2020 09:02:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSz9o-0002fD-D1; Thu, 15 Oct 2020 09:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i5I/+cL4/3BlrD1oU/6ksmOSk/qvKfKsTAdChNORLE8=; b=TssziCuKhu+1FMQTF7TdAznCvs
 3wf31mB6br60aOA10fFjnjz4zucQawjaIVi98uQAWJL9cvAPmO0RKUN0GouLWSsCKTdUPVBNDFsoV
 Mrb0xKHkx5KR4TiHECNhtTiMIpRWqOvyG37o7YZ46NC49Q0H4l2nLmxuQ1H+5sXI87bLV4g7q0iCI
 aoXAla6IHi7PZ0gXRmx/1Oq0q50C+8whZA3Xn7UtIX1RuFhVZUcoBR/xTryh3MZKY2GykxNywq8Lk
 mgsPo2UmbVGDUTfrZAykSKaR2GERVG6hhr3SXMVN11kl7JWWBl894lOhZnBVM28hUwQeEtWELGDCv
 af1DTZLQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSz9m-0003Pp-UN; Thu, 15 Oct 2020 09:02:42 +0000
Date: Thu, 15 Oct 2020 10:02:42 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 00/16] Allow readpage to return a locked page
Message-ID: <20201015090242.GA12879@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 09, 2020 at 03:30:48PM +0100, Matthew Wilcox (Oracle) wrote:
> Ideally all filesystems would return from ->readpage with the page
> Uptodate and Locked, but it's a bit painful to convert all the
> asynchronous readpage implementations to synchronous.  The first 14
> filesystems converted are already synchronous.  The last two patches
> convert iomap to synchronous readpage.

Is it really that bad?  It seems like a lot of the remainig file systems
use the generic mpage/buffer/nobh helpers.

But I guess this series is a good first step.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
