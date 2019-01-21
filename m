Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE90EC7113B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 11:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEC720663
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 11:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVxfZfYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BEC720663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bchDGE77FhZt6HkN+Nv/PR8/jFtTZqi8B+Lw9vxzKP4=; b=NVxfZfYDlCiE1I
	uK+psOFxD/B+ASeh9UGZIqijUcRJr+LOLx+zKB/8hTYyqbY7JuE4d/N1cNOWiY4HCF/TR03aqPYvV
	3TzNst6OkGi98zkDCKK7ECLxMVsPvdtRcPyezjwbFf2qNcn1QHieC26MQv3aFLZ2UW9xzIqONn5WM
	H5dlQmY/f80OXTsmGIu9Ng9feKamSAYTEyVYk5R6gAYLpDJee26+0M5YYNekfYXE7W0B25hagQ9du
	mHq+bc8qr112+/G59WMHGZ/RUPC98JvmjKAUzoIsNiRok5nMMWRqp2dZKsA8y6z6CTQW2kAI+nE2W
	lCSyWsXp63Emo1jSqXXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glXrf-000189-KT; Mon, 21 Jan 2019 11:35:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glXrc-00017j-EJ
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 11:35:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B9950611C98F;
 Mon, 21 Jan 2019 12:35:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id U6xOsyJSP6cU; Mon, 21 Jan 2019 12:35:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 60D6A611C999;
 Mon, 21 Jan 2019 12:35:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yd9eQdsat66J; Mon, 21 Jan 2019 12:35:25 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id F0757611C98F;
 Mon, 21 Jan 2019 12:35:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: yang.yang29@zte.com.cn
Subject: Re: [PATCH] jffs2: check dstlen for jffs2_zlib_compress()
Date: Mon, 21 Jan 2019 12:35:24 +0100
Message-ID: <3151900.SLYxvDXFDr@blindfold>
In-Reply-To: <201901211659107381808@zte.com.cn>
References: <201901211659107381808@zte.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_033536_632133_9C9602E1 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: wang.yi59@zte.com.cn, richard.weinberger@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 xue.zhihong@zte.com.cn, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Montag, 21. Januar 2019, 09:59:10 CET schrieb yang.yang29@zte.com.cn:
> Thanks for reply.
> But I think if (*dstlen < 2) is not good enough.

Not enough in terms of what?
My patch does what the commit message says, it fixes the out of bound access.
What do I miss?

> Because if  the length of data_in is equals to 2, the length of output compressed data is also 2.
> So there's no meaning to do all the compress calculates.
> 
> And I had do an experiment:
> If dstlen equals to 3, and data_in has 3 same bytes, the length of output compressed data will be 2. 
> Which means compress is effective.

This is a different issue and a possible further optimization.

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
