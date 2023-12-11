Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB11FC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7StklfvTxNS3FdSDd/V72Ku2B8Zil75+uBR3S8/rb4Y=; b=03q5rDSrhc9dDT
	yZK0ZyEhYke5kpKvPOWvkEkJlRsM15Nq/EfVJIhNY4dfOHPcSq4EJSunbxXjDIXXiFD4fOym7xGTE
	4QMMBNnGqwZkjM+GkEfbsL7NVcgR9ZeoPIby730nmtp8OpLDEHo7voilAG48yv98Yb8Ss4l5mQt+d
	+cDq1qRrhxOp5LGI27KGs0h887oFGI591zuBPqF7EYLWeQyXt/ihmF/orgu+NIUme5QkHwYM/7CSK
	5tkLob4scmog5wnMGJr9rZJE43/P+AX9ezHAR1t9Pu+f0cWiqb2eF/3Ddb+A6D2EH11qs6qrHSKfE
	hMjZAZZ1joTlQE5W4prQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbmY-004MSX-0P;
	Mon, 11 Dec 2023 08:36:54 +0000
Received: from mail.venturelinkage.com ([80.211.143.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbmU-004MRQ-1Y
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 08:36:51 +0000
Received: by mail.venturelinkage.com (Postfix, from userid 1002)
	id 260DA82513; Mon, 11 Dec 2023 09:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturelinkage.com;
	s=mail; t=1702283809;
	bh=7iowqdzve/IIiUUjcEwx8j3uMrVqqiE7R9zbOCKRV9Q=;
	h=Date:From:To:Subject:From;
	b=sy3l8j/6jR7aKBcTjIhJEm6Nuiky3iYyr9G3PIZUHAFCOUgtnpuOCiVZINM9aA7eI
	 Ju6yLmIbE8lq3Sp3xoH2St44OQ5tYa9QGE6Vgu6j7/aRaYuQo3cjVx0Vp8PXpJPEGE
	 jlvfyim+GsMbo17lA0NBkVycAdPetz+Q08Of8sPXGC2xU0W3PECwB3sVg4hLGG+G1h
	 i+o9hsWD69u/jmgV1JhBPppbHz23hULCjT0TAOWQeF3K9LG8V4LJRYG6Z6B9kM/N31
	 D8mz6FTbaY9IMrI3zQg4uRcdP0tcUjDY5VHFG7yFbDMp7rQWbXNF+dvt9prGy4sxyW
	 awJV2eJIaFS0w==
Received: by mail.venturelinkage.com for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 08:36:27 GMT
Message-ID: <20231211084500-0.1.25.5dzo.0.jj7qjg7ei1@venturelinkage.com>
Date: Mon, 11 Dec 2023 08:36:27 GMT
From: "Lukas Varga" <lukas.varga@venturelinkage.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Popt=C3=A1vka?=
X-Mailer: mail.venturelinkage.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_003650_699873_129EB8E9 
X-CRM114-Status: UNSURE (   1.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RG9icsOpIHLDoW5vLAoKRG92b2xpbCBqc2VtIHNpIFbDoXMga29udGFrdG92YXQsIHByb3Rvxb5l
IG3DoW0gesOhamVtIG92xJvFmWl0IG1vxb5ub3N0IG5hdsOhesOhbsOtIHNwb2x1cHLDoWNlLgoK
UG9kcG9ydWplbWUgZmlybXkgcMWZaSB6w61za8OhdsOhbsOtIG5vdsO9Y2ggb2JjaG9kbsOtY2gg
esOha2F6bsOta8WvLgoKTcWvxb5lbWUgc2kgcHJvbWx1dml0IGEgcG9za3l0bm91dCBwb2Ryb2Ju
b3N0aT8KClYgcMWZw61wYWTEmyB6w6FqbXUgVsOhcyBidWRlIGtvbnRha3RvdmF0IG7DocWhIGFu
Z2xpY2t5IG1sdXbDrWPDrSB6w6FzdHVwY2UuCgoKUG96ZHJhdnkKTHVrYXMgVmFyZ2EKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
