Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE818C54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRDS6zWoe5HoEOrwP1W7xKd8vUe2pBpmLjqluAObYy4=; b=VvHBDrrmXyfpz5
	nPeECZlhYHZSqGPQkcDmi/bK0Q6CE0vYL5hNer6XBd0DD5Ci5qH2l8TCT6WgLv2L1uUhauFdKJUgP
	CV015JeVwq3xMIPok/JQ/PW7RpnZ04JoPKERI2lUnvfz2cF5VLJXFS8kzSIGFOhMFymMfEd1OaYT/
	G80AG9vBWPvUPiCz7Lwg3t2XyVu9Vubh7Zy8uv3LOmr6ZTByl1U0881kymKbr2xc5WgYjWAwU821q
	xJRFanKXrl8t9/kK9kXy5OXZbGEGJe/7J7au2HOeDtPJHdNTV/Q9bSjeBJRptISEhW+McWK9Vph/z
	1EVBVUlWRM1upNJJinyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWiz-004ARK-Oh; Mon, 30 Jan 2023 16:09:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWgz-004A4V-P7
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 16:07:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24D786000D;
	Mon, 30 Jan 2023 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675094853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwBxvonceY4P1NbcQ0KVI8q53OO3cIpiyQCxAOt2B3c=;
	b=E/Lv8BGKmuhXTh819UVjZR4InZHKKnezUUdq9dmEaqTBKNxPXBZrcNYnapr40CoWlTAynC
	aor5lY5LDNmjE7AKRzzfI8HK/G9YoYEQNcpiSyri67orHBlhaWzOFRHblxQRYLbZo5Pkaq
	OEmZBLBiimPoZyTA9Uyvv54KDB/9o9f1EZo2VltWNoT7Z0ABOzBLi7FpLzEKRPfrbZS3Vl
	QSgZEyodjzo4q5z5gn3rBsw+aWXelYaVMiJGm7EN7TzVLBVL9E9LEV+FWid791xM+v9iGW
	A0TkT6pD0ajH+q1xYV19TvMpegxPs0OGcd9hgvEuzzVqWYcPy1+NI//jC7V5IQ==
Date: Mon, 30 Jan 2023 17:07:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: partitions: Fix partition node name
 pattern
Message-ID: <20230130170727.04286633@xps-13>
In-Reply-To: <20230120020454.3225796-1-robh@kernel.org>
References: <20230120020454.3225796-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_080737_961535_0BDAE88C 
X-CRM114-Status: UNSURE (   9.60  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFRodSwgMTkgSmFuIDIwMjMgMjA6MDQ6
NTMgLTA2MDA6Cgo+IFRoZSAncGFydGl0aW9uJyBub2RlIG5hbWUgcGF0dGVybiBpcyBtaXNzaW5n
IHN0YXJ0IGFuZCBlbmQgYW5jaG9ycywgc28KPiBhbnl0aGluZyBpcyBhbGxvd2VkIGJlZm9yZSBv
ciBhZnRlciB0aGUgcmVnZXggcGF0dGVybi4gVGhlcmUncyBubyBpbiB0cmVlCj4gdXNlcnMgbmVl
ZGluZyB0aGF0LCBzbyBhZGQgYW5jaG9ycyB0byB0aGUgcGF0dGVybi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQoKTG9va3MgbGlrZSBteSBz
Y3JpcHRzIGRpZCBub3QgcHJvcGVybHkgc2VudCB0aGUgImFwcGxpZWQiIGUtbWFpbCwgc28KaGVy
ZSBpdCBpcywgSSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gbXRkL25leHQuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
