Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106D9C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 05:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F6F20855
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 05:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+0YvRdn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F6F20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFbxVhgqSWoQxklHlFqoLgSFd/l8F8Qll/qoTOVrkVU=; b=k+0YvRdnzkyweZ
	LXlEelCpk0r+VluC+GyrpopFaI1tGn1Kh9NqMM0YUWYcW5gRBpIQTGJaX2z8ud/W79Ql8Ne9/iQrn
	TzLPU2IFBSEVgpajvraOJqXj/esHxoNK8m+P7Q6wYIvlOqZcTsCI7k9h2VRXebpWnRjnyRqAFCtOA
	uTUaa4cabxt4q+Wlc0WarNrb1fuodTcG+J7F+CNQ5Psivuua5wri034TDXc+GR+yISp6GP3oA7GmV
	srA4sOesLx+HVw3SpMWBRu1PwVwEBFrlHsI19MNOctFMhM4t0kXfQYCp9UomUO4ebBaEB3e0D9WXD
	clVBl6ZgUQOVFdlkjnEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt42F-0006vu-Hs; Mon, 11 Feb 2019 05:21:39 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt42C-0006vV-47
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 05:21:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 5A0DC18014221;
 Mon, 11 Feb 2019 06:21:32 +0100 (CET)
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 by lilium.sigma-star.at (Postfix) with ESMTP id 6E0C118014221;
 Mon, 11 Feb 2019 06:21:31 +0100 (CET)
Date: Mon, 11 Feb 2019 06:21:31 +0100 (CET)
From: David Oberhollenzer <goliath@sigma-star.at>
To: Yufen Yu <yuyufen@huawei.com>
Message-ID: <1753850361.106367.1549862491244.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <20190124090629.134985-1-yuyufen@huawei.com>
References: <20190124090629.134985-1-yuyufen@huawei.com>
Subject: Re: [PATCH] mtd-utils: fixes double free in mkfs.ubifs
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF65 (Linux)/8.8.8_GA_1703)
Thread-Topic: mtd-utils: fixes double free in mkfs.ubifs
Thread-Index: /rxgY6dMjaZoSMbwwJGEEVxsIG7vZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_212136_304663_F4365107 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master

Sorry for the delay, I was looking into this in a bit more detail and also waiting for
some feedback on a related bug report.

Unfortunately some of the newer code (encryption support) assumes the current behaviour
and allocates the attribute name, so this patch will cause it to leak memory, which is
IMO still less of a problem than mkfs.ubifs failing entirely with a double free error
message, so I applied it for now.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
