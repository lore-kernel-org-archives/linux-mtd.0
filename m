Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043FFCCF2D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha0s9gfgwviGz+HBb13XgyZjlx8iY4Wz8GH7iqhLbpg=; b=hEoFsb9sftXNDV
	pOnK+w4y169suuFjQiU+GgPNnf/wPcCxXoPnT8dMnPLcVR7tBtrd296O5tsyj3Am7oKYXqKZKFel3
	9WYxQE84KlR57evYp2uToVGppxnn2IJyVwWKNIP7ZOsE5bdqAoWUjb+tOudoZbfv2jBjudJ5R3mp1
	vvD8mN6kEx4uAkpdBVNwdfLwSZdDxWF+Nrj8h3oMZJYbXIiG1hcEUDe9u+6cUdZyMbiLgqpZDjXU4
	wcBg1Eptr+nVQ3+0k+w0CAfL0OfcWMplQcplevJzMmmGAJUVeGMJKMU2hP/o96stEaKNRI/lDgNBU
	pLgfFYm+w6zN6sLqZpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM5-00000001kLj-3DNl;
	Mon, 19 Jan 2026 10:19:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM3-00000001kJp-0Rcn
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:19:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30E48C214C4;
	Mon, 19 Jan 2026 10:18:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D26B60731;
	Mon, 19 Jan 2026 10:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606FD10B6A431;
	Mon, 19 Jan 2026 11:19:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7U95hX8xhuHK50tXFZKL1361n0NMWFN43s0ja7COG1M=;
	b=hQ3YiryLfffqai8EXuIq9hwnc+7vTu+lRME5nOKSOhmPN9W2z7mzFjUHmmGkaQpXynNny0
	txufss0TopVlZFEUheEaN+937sTAcY8EEcNLNx23+0U26ApfgixCToxtlyMTVs5cWKOOS3
	7POWdg05VK2fls2msSwSMErCYMARWTFsEq0G5L3t6aSUgyAtpZMTlhzScUR4M8294Ug/G8
	Fr6umWuefSJYvOv0z3G/bNAg/hIRwRiE8TwLCIEBI7idUQoJKoZJH+vR9sN35in/ThPRzK
	HDg6/j+v0lboxauuRvqFkQM1yfLwH8gvJb1h+bJWEDlDKguzcnHRm11YEB8rQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
References: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
Subject: Re: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to
 DT schema
Message-Id: <176881796211.2442128.8985181716841573512.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:19:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021927_307277_E0AFB43A 
X-CRM114-Status: UNSURE (   7.51  )
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

T24gU3VuLCAwNCBKYW4gMjAyNiAxMToyMzowNCArMDAwMCwgQ2hhcmFuIFBlZHVtdXJ1IHdyb3Rl
Ogo+IENvbnZlcnQgTlZJRElBIFRlZ3JhIE5BTkQgRmxhc2ggQ29udHJvbGxlciBiaW5kaW5nIHRv
IFlBTUwgZm9ybWF0Lgo+IENoYW5nZXMgZHVyaW5nIENvbnZlcnNpb246Cj4gLSBEZWZpbmUgbmV3
IHByb3BlcnRpZXMgYHBvd2VyLWRvbWFpbnNgIGFuZCBgb3BlcmF0aW5nLXBvaW50cy12MmAKPiAg
IGJlY2F1c2UgdGhlIGV4aXN0aW5nIGluIHRyZWUgRFRTIHVzZXMgdGhlbS4KPiAtIE1vZGlmeSBN
QUlOVEFJTkVSUyByZWZlcmVuY2VzIHRvIHBvaW50IHRoZSBjcmVhdGVkIFlBTUwgZmlsZS4KPiAK
PiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gZHQtYmluZGlu
Z3M6IG10ZDogbnZpZGlhLHRlZ3JhMjAtbmFuZDogY29udmVydCB0byBEVCBzY2hlbWEKICAgICAg
Y29tbWl0OiA5OTg2YTcwZGIzNzYyN2NiZTkyZmJhMjg4YzJlZmNkZTI1YWQ1YzZkCgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
