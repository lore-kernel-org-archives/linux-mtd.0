Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A103EC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6134B2087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efzL4KLH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJSrH9ay"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6134B2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=NSpW8be9PDH9E4/isSlAeauO9TRj9XQrNBWKo0TO8DI=; b=efz
	L4KLHcqrCFs8OvuiTv/on9Pdi1tu7zWNV4hASniEMBJwxnTU2BnXxBGVAnI+xy5MiJMy2u3B1UMtX
	kIx3s356vuk439PHzxj4CbL0Hm8e2unM+DYJHKouksLrqki59TFBe3dnaNb3fCmRuU6PEPJkODsyK
	71MFNv77lkKOwQZDmlco7gxK60lm5wsTzEp1L5tIVTopMAsDSyvF+O7Dq97DVXLgN/zPsmTXqRLem
	MIyFBiILD9qqB9WYC3796HZILzP/qaMRI/3QFbaMgm9AEKaiII3lre+zS2b+QXzntgpaFjy9+YUtd
	96C93J8/Ka978X5+gxZkSZCqYC2g5YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkSZ6-00009R-CF; Fri, 18 Jan 2019 11:44:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkSZ3-00006S-AG
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 11:43:59 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFF3520823;
 Fri, 18 Jan 2019 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547811836;
 bh=mKEIOZxCgCX9XcZfyJ+aJMckwYR1Xf3s+e3napmXUSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GJSrH9ayQcwc2c7zry3BOCo7/pWoqTDgFBRumouVwEHn7w9wJAZ6VRQ7j/0LruQb9
 Gqrzqi/p+27vyc3e7uMUdVEMN06J6tRDxaRAo3YF83S3B66oLwvebCe2qh8bEZ3O9P
 /VGIN25uILAr1Npq7EOlC4Vi64A5/P4javYa/z9o=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: nand: jz4740: fix '__iomem *' vs. '* __iomem'
Date: Fri, 18 Jan 2019 12:43:49 +0100
Message-Id: <20190118114349.22037-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 01eeb927bbcc1952114b0aec1447699c4747c337
In-Reply-To: <20190117173907.62198-1-luc.vanoostenryck@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_034357_760330_C0C95876 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Boris Brezillon <bbrezillon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 17:39:07 UTC, Luc Van Oostenryck wrote:
> The function jz_nand_ioremap_resource() needs a pointer to an __iomem
> pointer as its last argument but this argument is declared as:
> 	void * __iomem *base
> 
> Fix this by using the correct declaration:
> 	void __iomem **base
> which then also removes the following Sparse's warnings:
>   282:15: warning: incorrect type in assignment (different address spaces)
>   282:15:    expected void *[noderef] <asn:2>
>   282:15:    got void [noderef] <asn:2> *
>   322:57: warning: incorrect type in argument 4 (different address spaces)
>   322:57:    expected void *[noderef] <asn:2> *base
>   322:57:    got void [noderef] <asn:2> **
>   402:67: warning: incorrect type in argument 4 (different address spaces)
>   402:67:    expected void *[noderef] <asn:2> *base
>   402:67:    got void [noderef] <asn:2> **
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
