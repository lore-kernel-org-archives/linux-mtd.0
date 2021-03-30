Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734DCC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 16:18:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A5E619D0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A5E619D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YMMEOm8/ALbyL+dk6mRO2Hu7e7t5Kh69xX5GkLAqeng=; b=dPzW1S3GtKj6sI6yzmJn+e0aD
	ezDVkStsxr9DPqCkoboYC+H84e4sXHUZ+4w+UFTwXO7SUGKNjCIyXFOR3mFPs8y5HW0qxDjJDRJjn
	3xt+BQKdl0agX7EsIRpzkfzwEXaOJ2pGL0m4DFo0KBKSsrUQRv+NC1o2K4wvPcm/XhoMfnr1DgAxh
	yMF0LB8Ocm1Zp45+uTV4jjMpcY5nCfKsRrJiWWL9PM3fdcXZGHP/5dQWYHtobbhpukH0KvIDbqLrT
	0g887Av1f87FYH7/UU4jkfPUgY2+Jd2P2pyOStDq8H7+5QLyFUzkOhgKnc+WvkG7eb6wR8ZANKRae
	bp+WQxYHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRH3Z-004KDl-PW; Tue, 30 Mar 2021 16:17:30 +0000
Received: from verein.lst.de ([213.95.11.211])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRH3P-004KCV-3e
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 16:17:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4252368B05; Tue, 30 Mar 2021 18:17:15 +0200 (CEST)
Date: Tue, 30 Mar 2021 18:17:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joel Stanley <joel@jms.id.au>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 "William A . Kennington III" <wak@google.com>,
 Lei YU <mine260309@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: Hook up splice_write callback
Message-ID: <20210330161715.GA12783@lst.de>
References: <20210330134537.423447-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330134537.423447-1-joel@jms.id.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_171719_277888_3751D3AD 
X-CRM114-Status: GOOD (  15.97  )
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

On Wed, Mar 31, 2021 at 12:15:37AM +1030, Joel Stanley wrote:
> overlayfs using jffs2 as the upper filesystem would fail in some cases
> since moving to v5.10. The test case used was to run 'touch' on a file
> that exists in the lower fs, causing the modification time to be
> updated. It returns EINVAL when the bug is triggered.
> 
> A bisection showed this was introduced in v5.9-rc1, with commit
> 36e2c7421f02 ("fs: don't allow splice read/write without explicit ops").
> Reverting that commit restores the expected behaviour.
> 
> Some digging showed that this was due to jffs2 lacking an implementation
> of splice_write. (For unknown reasons the warn_unsupported that should
> trigger was not displaying any output).
> 
> Adding this patch resolved the issue and the test now passes.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
