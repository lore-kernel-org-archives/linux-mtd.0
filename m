Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5CDCCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qAWNqwpIQoRklNzcYkH3jUVd1VVZzdL1NGMUvfaHso=; b=Txbu2txzHV/bfn
	c4cEDUP81RkVNBI9gpo7aGOdsJNwdPKiPoDH/sF6JWMmqTYYomnhVLmPSseUw8pwNNGO/NERhoO5G
	e1SKKSnElugroX/Y9ya8K5Q0o3JskI8ht5t4IezP90NpLAaPUtMdJS05bJckNj/X2l4pz0qaNV817
	yOVZparhN8zTU01DvXQ1Iy8AQYraI9Igxdz+nc2IQE/Azp8iuA9OfgFLbqt1hCxiJD+BalMD4Ifk3
	uh9qWHFo8B13X8N5B42vUkb2aIdUZCiQYBtgy+hGA73gpoWDxIpN+MvMJK2STN+8F41tPZP7w3MxT
	Vmk9l7q8NgvNwDGq6yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6W-0000000GG9g-3hDR;
	Tue, 28 Oct 2025 15:59:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6T-0000000GG75-3PUZ
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:59:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E91E64E413A0;
	Tue, 28 Oct 2025 15:59:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF148606AB;
	Tue, 28 Oct 2025 15:59:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BFF6117A99F8;
	Tue, 28 Oct 2025 16:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761667159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hAFtFEMN41KVDleG5UTxtREAtjcFkU9gQ7IFFJPq7GY=;
	b=TY8rRApu9XyAlv1PMITVi0UFV6D74qU7dbiVcL5W82XtKibRtJ9Xijy2h6JcekgfZ6c/Qi
	rBCk45x9CtUheThYRc4WT3Gwodu2Z0dyvmaM0zPY5q2kW8KnAQuk8KcgyQ89aFFxeyMJkF
	3fVDlq4d9s6izO+HRJOql6wXeS+yBBspzLAcA8lSvFDMxU0Ks345UxPKETiMDYgf5zF4N9
	9+E6boojg2sRQo6cxDxEEEz2vCH37b6R/Jsi7F92Zvov4TEkHUSS0ilF8b82DmM1+WwQ3h
	UhocztOewUVZ1ZrtDWThAT22bP1xixJL0abOeOKeudEqjWZrmZWg/SItBSgFDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, niravkumarlaxmidas.rabara@altera.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251027102304.658490-1-niravkumarlaxmidas.rabara@altera.com>
References: <20251027102304.658490-1-niravkumarlaxmidas.rabara@altera.com>
Subject: Re: [PATCH v3] mtd: rawnand: cadence: Add support for NV-DDR
 interface mode
Message-Id: <176166715382.365556.10326674698031952686.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 16:59:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085922_017911_E3AEE24F 
X-CRM114-Status: UNSURE (   5.78  )
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

T24gTW9uLCAyNyBPY3QgMjAyNSAxODoyMzowNCArMDgwMCwgbmlyYXZrdW1hcmxheG1pZGFzLnJh
YmFyYUBhbHRlcmEuY29tIHdyb3RlOgo+IEFkZCBzdXBwb3J0IGZvciBOVi1ERFIgbW9kZSBpbiB0
aGUgQ2FkZW5jZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyLgo+IAo+IAoKQXBwbGllZCB0byBuYW5k
L25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogY2FkZW5jZTogQWRkIHN1cHBvcnQg
Zm9yIE5WLUREUiBpbnRlcmZhY2UgbW9kZQogICAgICBjb21taXQ6IDU3M2RmODU5YWEwODdjZmEz
OGIxYTA4NWU0ZDQ4NmRlOGZiY2U5ODkKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
