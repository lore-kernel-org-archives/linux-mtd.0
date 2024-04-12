Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D1C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8baddwGWExzg7sjvOBdVl7DzpKJ/WUyyLtDvI2EUCxc=; b=bOyDjqLF7yeWM8
	fkF0Cy2vHkVhNtZhz7yFsbbQASbsvT4hWVRdDmh7XyweiBTzhl4yl1Z/CG0uqYZewgxnP7+2oMMWp
	VdI5iYgnS4PNYZwXmrq01Y1AVg1G3Z9DoH2MvSzG2eAVLJFJ9gOqmFQ1ixpuidS4hTw7Vfschvh/Q
	t12yFcEsfLMB+oiTRddnDEM0lsuyqomKEdgvpN5wUhOgBN+fYCGOxMiscok2JNDJms6tXnd1WcdzL
	Z8f/taTGR8AYxhPS5IlYPyV0ciBnaVbYfZ3JL12qlSlS0NV4pjsvo+ychNscKDQs23lmr6LPUkIaH
	VzcXYPDnq3VMWtStaymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBG5-0000000Fp8c-1XgY;
	Fri, 12 Apr 2024 07:23:37 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBG1-0000000Fp5f-40W2
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 07:23:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF7840006;
	Fri, 12 Apr 2024 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712906606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fc5upaR2iFu8NVfwysFTXyLTjx4c8uQC6JiE1ZPOKw=;
	b=HzWs55EvfTYHhIFrcIzo60HEKpMapdpKXMJI7FZG8U3WsFPXc5H6erNObA1mKvRlwfMnn5
	WZ6yZIEfanPNP519QB3J5xHWB+PdnWrjEgN9QiYsK7baEhGzHNh3rk3ZGzRHwFcIJ38R71
	tmv7gnRvi1W8GxMBJlPFqwaxTqvMU2+xWohDJtS6IXIrbA6lzzaNf3OgMJliNhuCaulF3k
	HAVgi8lP7HkKoA6yOYS7nAnCgNXZijFoKiPnM+YtH/QKBkI86WeZZ5630V2ogu03GG19Vv
	hEz3afEaWLOGE8iS/8/0CO3oWl3vJ6SyjDFAae8b/s04Qn/Fo1PIjYOFZc7X2Q==
Date: Fri, 12 Apr 2024 09:23:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "Christian Marangi" <ansuelsmth@gmail.com>, =?UTF-8?B?UmFmYcWCICBNacWC?=
 =?UTF-8?B?ZWNraQ==?= <rafal@milecki.pl>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v4] mtd: limit OTP NVMEM Cell parse to non Nand devices
Message-ID: <20240412092323.07b8de3d@xps-13>
In-Reply-To: <D0FHRJG05LJN.1GU1N7J0BH6S4@walle.cc>
References: <20240402212331.27328-1-ansuelsmth@gmail.com>
	<D0FHRJG05LJN.1GU1N7J0BH6S4@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_002334_189923_9D96B597 
X-CRM114-Status: UNSURE (   7.75  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gVHVlLCAwOSBBcHIgMjAyNCAx
MTo0MTowNiArMDIwMDoKCj4gSGksCj4gCj4ganVzdCBhIHF1aWNrIChub24tdGVjaG5pY2FsKSBu
aXRwaWNrIGlmIHlvdSBkbyBhIG5ldyB2ZXJzaW9uIG9yCj4gbWF5YmUgTWlxdWVsIHdpbGwgZml4
IGl0IGR1cmluZyBhcHBseWluZzoKPiAKPiA+IFN1YmplY3Q6IFtQQVRDSCB2NF0gbXRkOiBsaW1p
dCBPVFAgTlZNRU0gQ2VsbCBwYXJzZSB0byBub24gTmFuZCBkZXZpY2VzICAKPiAKPiBzdWJqZWN0
IHNob3VsZCBiZSAibm9uLU5BTkQiLCBhbHNvIGNlbGwgY291bGQgYmUgbG93ZXIgY2FzZSA6KQoK
WWVzIEkgY2FuLiBJIHdhcyB3YWl0aW5nIGZvciBzb21lIGZlZWRiYWNrIGZyb20gUmFmYcWCIGJ1
dCBoZSBtdXN0IGJlCmJ1c3kuIEknbGwgZml4IHRoaXMuIFdlIG5lZWQgdG8gbW92ZSBmb3J3YXJk
IGFuZCBzZW5kIHRoZSBmaXhlcyBQUiBub3cuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
