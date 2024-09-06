Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B33E6FE27
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugtJJv33C/2E8OBBqtlTYsqWfdKPH1+uJrPquQxBWNQ=; b=Gl3+HIRuoBVgJR
	3VfF7mEMK9IuNfv8QAcNby0/oIYuNCZhRtoWgfCEG32Uz7UxmQzxlelDCJQ0opYkdWIN/l6N8+nX4
	XCU1j7cNItFdxt064rK1EhodiC2GBqho2WRAv27nuO3MIeXAizAEa9mvqNuxKhLsrM4QkukaSrfuG
	m0kaoOeXHvBqAuVIUrIR9cha39tmESBrHoskixzgifBgIIOB34h76nxUIU7eKjIXHg7QJIl0Q1iSZ
	ggkVocIu46ge2PP62tziDuUAFBOu1Ew9sFdPc+biLy4EzHAlw7ImyDHuhgssjWno/EJErRGJh8ORJ
	mb22ZbNHzlT3UepWxxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smal7-0000000CjjO-1lko;
	Fri, 06 Sep 2024 15:20:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVu-0000000CfLi-1k46
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:04:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE81220009;
	Fri,  6 Sep 2024 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzODiud35KXJeKU0eeHbpjUWLMquM8lxcBBxxzdvxLI=;
	b=MU9qiiEeZCB2Jv3502tf7ZMhTZ0EDlcSQC2qdXV03Y7sgYM0utXdRptBCBVAWt1JUpYBWl
	MTClIgNReTGOAjjUCQqPg9bdVRIjx8dAqDWqwi20ketlP0LonpUVKb5B/BayT1dMqgpNWJ
	0h1BZoPSe8HCIRNQXGNZybGD9/Hk1KULfl2WlEYzfMt64wdcsgO1+2hGIwVYecQ0A2TVnA
	oG7+MAMzZGSIiEhRgoq30fQ/3Zu9jbcm/AicIPXIab+iIeH2DpDghua9A1nvxqU0zIkOba
	CPk15j0Vnvl6s5LyDlyaYO6CpIDYxHa3m9fqqkkk7zhvrRETump1HwJnNZZ7FA==
Date: Fri, 6 Sep 2024 17:04:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v6 2/2] mtd: spinand: macronix: Flag parts needing
 explicit plane select
Message-ID: <20240906170439.286e6c55@xps-13>
In-Reply-To: <20240903013625.1658825-3-linchengming884@gmail.com>
References: <20240903013625.1658825-1-linchengming884@gmail.com>
	<20240903013625.1658825-3-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080442_613854_FAA9515F 
X-CRM114-Status: UNSURE (   9.43  )
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

SGkgQ2hlbmcgTWluZywKCmxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAg
MyBTZXAgMjAyNCAwOTozNjoyNSArMDgwMDoKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5n
bWluZ2xpbkBteGljLmNvbS50dz4KPiAKPiBNYWNyb25peCBzZXJpYWwgTkFORCBmbGFzaCB3aXRo
IGEgdHdvLXBsYW5lIHN0cnVjdHVyZSByZXF1aXJlcwo+IGluc2VydGlvbiBvZiB0aGUgUGxhbmUg
U2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBkdXJpbmcKPiB0aGUgd3JpdGVfdG9f
Y2FjaGUgb3BlcmF0aW9uLgo+IAo+IEFkZGl0aW9uYWxseSwgZm9yIE1YMzV7VSxGfTJHMTRBQyBh
bmQgTVgzNUxGMkdFNEFCLCBpbnNlcnRpb24gb2YKPiB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRv
IHRoZSBjb2x1bW4gYWRkcmVzcyBpcyByZXF1aXJlZCBkdXJpbmcKPiB0aGUgcmVhZF9mcm9tX2Nh
Y2hlIG9wZXJhdGlvbi4KCkkgdHJpZWQgdG8gYXBwbHkgdGhpcyBwYXRjaCBidXQgaXQgY29uZmxp
Y3RzIHdpdGggdGhlIHNwaS1uYW5kCmNvbnRpbnVvdXMgcmVhZCBzZXJpZXMgY2hhbmdlcyBpbiB0
aGUgbWFjcm9uaXggZHJpdmVyLiBXb3VsZCB5b3UgbWluZApyZWJhc2luZyBhbmQgZml4aW5nIHRo
ZSBjb25mbGljdHMgKGl0J3MganVzdCBoYW5kbGluZyBjb3JyZWN0bHkgdGhlCm5ldyBmbGFncyk/
CgpJZiB5b3UgZG8gdGhhdCBlYXJseSBuZXh0IHdlZWsgSSdsbCBtZXJnZSB0aGVtIHJpZ2h0IGF3
YXkgKHBsZWFzZQpyZXNlbmQgdGhlIHR3byBwYXRjaGVzKS4KClRoYW5rcyBhbmQgc29ycnkgZm9y
IHRoZSBpbmNvbnZlbmllbmNlIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
