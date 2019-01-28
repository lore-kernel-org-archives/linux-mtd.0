Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAEFC282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 08:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2403C20880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 08:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqCiFg6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2403C20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27yp4RlA3lznpIfLD/04pUowTKB3QWLSGaUcfvkxJyQ=; b=AqCiFg6IIIsRbd
	QnIwGUTgy6Sld0CYcUz5saFjlUUwd63xi+giIFBb0k17CIx+A8XaJDSbp+fb6EZREnyAk6xIte7cJ
	OSzeSZK0jMadhzpHNYaUWFctvdFIaxalhNi/kNV7HsZ4rJQcd7M/2SrlJCgLuydLNXv/ja5TR9R2K
	FRocwzXv8lQUHRxbjOgriwXkDKPDRvCZnD1xYEGexidNcyi1+pdrdLSe8lwB4x1QasSR+kV/ZCguM
	SmGvVf9MO9+QuxBRH9PUId4zBrMBG4XHXB5NaTmSn+5ShYJafL7u6Qj+ESjD2xenbEF5qEGp0A9rN
	AhuZNHrFVFMKGNzAZ0+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go1zC-0002Lx-WC; Mon, 28 Jan 2019 08:09:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1go1z9-0002HZ-02; Mon, 28 Jan 2019 08:09:39 +0000
Date: Mon, 28 Jan 2019 00:09:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: UBIFS quota support
Message-ID: <20190128080938.GA1076@infradead.org>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <CAFLxGvyrNaq6ya9TNr-tdEEbV=qsi8qEko6R7oJ-DtkxPJMk0g@mail.gmail.com>
 <20190123154743.GL13149@quack2.suse.cz>
 <20190125092156.ck77sdqainmmewuz@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190125092156.ck77sdqainmmewuz@pengutronix.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

FYI, the main reason (well, besides history) that XFS uses its own
quota code is so that it can have full integration with the transaction
subsystem and the on-disk data structures.

While it is going to be a lot more code you might want to look into
implementing quota accounting in ubifs itself and only use the
standard interfaces to report and adminstrate the quota values.

That way you might not even have to maintain a separate quota file and
could instead maintain usage statistics in the btree nodes, and only
summarize them in memory, possibly with a periodical full state dump.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
