Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D8BC9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS4DkfvCGT3+uE+wkY8FvptZdep/eowhZMvLhjHCpOg=; b=K9/0qXTzBhm4mA
	hM5s+ieRG+QTE2rqFb8OGqvNx/ylkEJDbV6ztKx3g/LxphlD6KmWB36o8+gWLlGNe2CIKdIbo19B3
	O9OqrPLqzn8pHrQn9v+4T72FfMwXfAWSq3xrrFBZjnSPtsEsTBdMC8jXUDzbrNqheCmwQCeXGNnR9
	4jpk+GW49feCHhMoLftIT4Ct6P+9dFxmJy1En9AYtMvE91f0czRVk7if6x7m2VHhnOI0ZBuSzzWkK
	HIGXQcB6hM98LlgNYxiB/mWbsAyCcSjfKxqChQucY8enO/CzkrR7nSYm6gVzhiZG2YlHjiIaV3SPp
	b/5TlXx+AnDkiqAmiPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65Y-0000000DSAO-2jIH;
	Fri, 25 Sep 2026 13:35:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65W-0000000DS9V-3DHQ
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F73B1A1012
	for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 13:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E826073B;
	Fri, 25 Sep 2026 13:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3C0410328BBC;
	Fri, 25 Sep 2026 15:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xdFjIoG7l4wpkGsWYRN90UCH0YsB2qKFC11fDbb2Fx4=;
	b=bwXnY+VV7prsHmeIRBEEKsVQMCZL5cIjDXHMqnQB/PpPjxn0Rt+sfAyCdn/+dMfvRZQd4Q
	ZUYK+/1LWnVm1BgwP6OCIZW7reXUZ8BSuiVQasvoYHdjrSvVVkXSRglIP3EP5Uc50ulHXj
	cLOaoqjNCsOdvu5Xix3gRrgNWI3mfJZS1WHVtQPgUtcp2JF/WfH03T9BmsqYLErzBdCnFs
	oVw7bqdihhcWiqgYu4wnUbKnAwAWYyMHc+iVagM9HP+SycVq5sOCbE+lSce3z4SRSi7eWY
	1bC9Fy1jf6pNUrTWIl3tLH2G4+6bOMOb3E6MF8QjrOlLCsCVROypZ36vIxQS8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260909223813.69028-1-rosenp@gmail.com>
References: <20260909223813.69028-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: use devm_kasprintf for mtd name
Message-Id: <179034333957.1124555.3178391993877818594.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:39 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063542_979415_603B1096 
X-CRM114-Status: UNSURE (   6.36  )
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

T24gV2VkLCAwOSBTZXAgMjAyNiAxNTozODoxMyAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
UmVwbGFjZSB0aGUgbWFudWFsIGthc3ByaW50ZigpIGluIHByb2JlIHdpdGggZGV2bV9rYXNwcmlu
dGYoKSBzbyB0aGUKPiBuYW1lIGlzIGZyZWVkIGF1dG9tYXRpY2FsbHkgb24gZHJpdmVyIHJlbW92
YWwsIGFuZCBkcm9wIHRoZSBub3cKPiB1bm5lY2Vzc2FyeSBrZnJlZSgpIGluIGZzbF9pZmNfY2hp
cF9yZW1vdmUoKSBhbmQgaXRzIGxlZnRvdmVyIG10ZAo+IGxvY2FsLgo+IAo+IAoKQXBwbGllZCB0
byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogZnNsX2lmYzogdXNlIGRl
dm1fa2FzcHJpbnRmIGZvciBtdGQgbmFtZQogICAgICBjb21taXQ6IDQ0YzdiMjczZTZiMDZmYWQz
MWYyY2ExNjYzMDdhNDE3MDVlZjE1ZGQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
