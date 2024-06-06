Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF3C27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oTM7pAywvD9BNSHGzDqRqjyh2Cd+zTYhoZBzKduDZI=; b=aXxmbkY78hPUqT
	SJxDolS5eki7dpxsEJRTvnWoBzcUX40iVbAEW2pBRoVswkm3t6cFUdz0ACMr1kzbuf9TJYAEzB5Zo
	UsFYWdlr+pXhIl8Wy7YUsiXsVmgJhpdNAvkmDnzcvV7Gw2KSKTLsoWanD5krgRPUhFa9NNjNidDRC
	y6O3J8x4VbntJrSpc0L+iPOiXiLSQ61Y0dm+79dvFWFfcuJ+edaJKJHdZbhS/JBckcdjEx7Kd+bc9
	pfOskPJhd+H60hGSIvPFi2bae2jw7eS3jkZzopNB3Yw3OiJDb+XAkYhdg4NVlqGNrBrz+j+UqeTjw
	rbU+dK0kQ+ubZuvJu6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKk8-0000000BRQw-0Yt1;
	Thu, 06 Jun 2024 21:33:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKk4-0000000BRQ5-2l4M
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 21:33:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9151E240002;
	Thu,  6 Jun 2024 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717709626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEe67kVi/zYEwJ949gLFt+c1vqpmrvxAyYHa4a+7LAA=;
	b=IxtQjifzTaaXunLyy6L7jVE8sN9djdHYHsjmEicWNx5Nq3dloei3ROWn9XPo63TO2/KR2U
	g/IiGLEwqUfI6iuGrUnGfKkZ2YNO1xaqfuuvNVNPDOPKAOHasengOhflZ6c6JjKK3a7S+w
	gUKd94vQMeWOWpBueVlyHHdyFzXhCoohX6vtRCT4/gSCy7a4DVY1zdl/tAuJOYGNzzJOiv
	pwTEq725uYcoRSF5FxMQktJ5SELAELSaimUoHrDpwVUI45obcjHtSNGiH3bYFAqhno6k56
	r1G6Y1QbivoqI/u6KfMbHgWSwoKvxoBXbBRKU/rqAKhVi01VXeN5rns8T6zxpg==
Date: Thu, 6 Jun 2024 23:33:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240606233344.4e268c04@xps-13>
In-Reply-To: <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
	<20240506091444.59228fa9@xps-13>
	<CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
	<20240518124732.584f441d@xps-13>
	<CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_143352_939479_7B465C27 
X-CRM114-Status: GOOD (  17.98  )
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

SGksCgo+ID4gPiA+ID4gK3Byb3BlcnRpZXM6Cj4gPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4g
PiA+ID4gKyAgICBvbmVPZjoKPiA+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBsb29uZ3NvbixsczFi
LW5mYyAgCj4gPiA+ID4KPiA+ID4gPiBXaGF0IGlzIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoaXMg
Y2hvaWNlPyBTZWVtcyBsaWtlIHRoZSBiIHZhcmlhbnQgaGFzCj4gPiA+ID4gdHdvIHBvc3NpYmxl
IGltcGxlbWVudGF0aW9ucyBhbmQgc2hvdWxkIGFsd2F5cyBiZSBwcmVjZWRlZCBieSBhIG1vcmUK
PiA+ID4gPiBzcGVjaWZpYyBjb21wYXRpYmxlLgo+ID4gPiA+Cj4gPiA+ID4gQXMgdGhlcmUgaXMg
Y3VycmVudGx5IG5vIGRlc2NyaXB0aW9uIG9mIHRoaXMgY29udHJvbGxlciB1cHN0cmVhbSwgSQo+
ID4gPiA+IHdvdWxkIG5vdCBjYXJlIHRvbyBtdWNoIGFib3V0IGFueSBvdXQtb2YtdHJlZSBkZXNj
cmlwdGlvbiBhbmQgZGlyZWN0bHkKPiA+ID4gPiBnbyBmb3IgYSBjbGVhbiBkZXNjcmlwdGlvbi4K
PiA+ID4gPiAgCj4gPiA+IEV4Y3VzZSBtZSwgc2hvdWxkIEkgYWRkIGEgZGVzY3JpcHRpb24gZm9y
IHRoaXMgcHJvcGVydHk/ICAKPiA+Cj4gPiBObywgZGVzY3JpcHRpb24gaXMgbm90IG5lZWRlZC4g
QnV0IHlvdSBhcmUgYWxsb3dpbmcgdGhlCj4gPiAibG9vbmdzb24sbHMxYi1uZmMiIGNvbXBhdGli
bGUgYWxvbmUsIHdoaWNoIEkgdGhpbmsgaXMgbm90IHJlbGV2YW50LAo+ID4gdW5sZXNzIHlvdSBj
b252aW5jZSBtZSBpdCBpcyA6LSkKPiA+ICAKPiAibG9vbmdzb24sbHMxYi1uZmMiIGl0c2VsZiBp
cyBhIHNwZWNpZmljIGltcGxlbWVudGF0aW9uLgo+IEkgd2FzIHN1Z2dlc3RlZCB0byBzZXQgdXAg
YSBmYWxsYmFjayBiZWZvcmUuCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDA3
LXVudGFwcGVkLW1hc3Nlcy0wMWY4MGI3YzEzYzdAc3B1ZC8KPiBUaGVuICJsb29uZ3NvbixsczFi
LW5mYyIgYmVjYW1lIHRoZSBmYWxsYmFjay4KCllvdSBjYW5ub3QgYWxsb3cgJ3RoZSBmYWxsYmFj
aycsIGFsb25lLiBCdXQgdGhpcyBpcyB3aGF0IHlvdSBkbyBhYm92ZS4KQmVsb3cgZGVzY3JpcHRp
b24gaXMgZmluZS4gSnVzdCBkb24ndCBhbGxvdyB0aGUgbHMxYi1uZmMgY29tcGF0aWJsZQphbG9u
ZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
