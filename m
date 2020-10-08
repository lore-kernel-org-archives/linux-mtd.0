Return-Path: <SRS0=8c9b=DP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CE7C4363A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F3221789
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AgjOnd4U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="RXay2NXh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F3221789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:References:In-Reply-To:Message-ID:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7Hl7YsndaYbhuIr8sqaP+pRRff6x/96al5pdubo1uU=; b=AgjOnd4Ul0hsDoWHG3RdfcY4gz
	pK+ggzADpWYJ7va+vkYgJfGMUxXNP3ZYlsmdwuD9zJRDK7cdgCs11kY6WKEbf1pDYgP6fzFUDUNe4
	VUwzhyIbQ2bqYLTTAAz1dYjgeq+DAmEwHW6rQdlYWmHmX3j+alZ8OkGWxichf+Jz5/+pJBkeQZWfh
	513hJ6tVazIrECV++Z3Y2Q4H5FBvqrYmTq/8FR+ZjfX4qPmAqVPUaY2kBZ8Oib3IHyPXdqgQ7h8ny
	fJ4YbZdCJ0QXE5Gup7p4A/wBgSZTpDONFNLAV38PZuJzKpI/En1LyeW5KdSGTW171UKCjsjwegk6d
	7xwDzWFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQWxX-0007YM-H4; Thu, 08 Oct 2020 14:31:55 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQWxU-0007WE-P2
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2020 14:31:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id AF96A1C0DDE
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:31:48 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GPRCMoW19Qp2 for <linux-mtd@lists.infradead.org>;
 Thu,  8 Oct 2020 16:31:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 853751C0DE0
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 853751C0DE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602167508;
 bh=wRuyQ2wMu5etPXfVm4wDGUOM5XenALM4vQ7n99M/2Xw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=RXay2NXhfHCfOosNC+2bb8Dzc6lGPTNjTDUBOp6mjWsLAXGQR1of/AusNPzFA3l/L
 V80EKYrfDtGltmdXOyKib7SkzBNrws02XVUmpTaLVV9HyzSeSFJJnf8FVAbQEYJQtt
 U2h/kCV+7iJEW+RU4e8i1UQgsMrIomRxbVFV9hN7TM+vwDxJJbraQCQ3o3vUt2fy6X
 qkzyHM90VcMFKf/5ks4s0NkbDBYDe5VB9cGR1EQv58qPx1ZpZJ/Ii1lj9Dy5OmiEdI
 Snm0YNB840QUhSKeW9tHpML3cCRzMWqLZYKV/r5hEkJ9xt3+aXaOJvfheljk4NYJcI
 /yOxxUoTZW7tg==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lFbWtuC5kiaD for <linux-mtd@lists.infradead.org>;
 Thu,  8 Oct 2020 16:31:48 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 671B01C0DDE
 for <linux-mtd@lists.infradead.org>; Thu,  8 Oct 2020 16:31:48 +0200 (CEST)
Date: Thu, 8 Oct 2020 16:31:48 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1354853483.980513.1602167508326.JavaMail.zimbra@robart.cc>
In-Reply-To: <362437696.773271.1602080471860.JavaMail.zimbra@robart.cc>
References: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
 <20201005150912.65619ca2@collabora.com>
 <1690133500.668948.1602004808077.JavaMail.zimbra@robart.cc>
 <20201007150258.00baf8c7@collabora.com>
 <362437696.773271.1602080471860.JavaMail.zimbra@robart.cc>
Subject: Fwd: [PATCH v3] mtd: sunxi-nand: add dma support for allwinner h3 -
 review changes
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: sunxi-nand: add dma support for allwinner h3 - review changes
Thread-Index: FXmkaB5aOM21V9kVcuCtWWs/+qKARMWPxLt3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_103153_044519_1A7056C5 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Will post it again as V4 where V1-V3 are together

----- Original Message -----
From: "Boris Brezillon" <boris.brezillon@collabora.com>
To: "Manuel Dipolt" <mdipolt@robart.cc>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>, "Roland Ruckerbauer" <rruckerbauer@robart.cc>, "miquel raynal" <miquel.raynal@bootlin.com>, "maxime" <maxime@cerno.tech>, "bbrezillon" <bbrezillon@kernel.org>
Sent: Wednesday, October 7, 2020 3:02:58 PM
Subject: Re: [PATCH v3] mtd: sunxi-nand: add dma support for allwinner h3 - review changes

On Tue, 6 Oct 2020 19:20:08 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> hi Boris,
> 
> thanks for the fast review,
> applied the suggested changes and answered your question,
> please take a look if its okay

Please submit a new patch with a proper commit message instead of
replying to the existing thread and pasting the new version at the end.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
