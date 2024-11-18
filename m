Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7457D49209
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeQbwqxxcguVHXI7rkUg/lfbWEMqhre7M7KahNy/KME=; b=M/mK3wUf+0zlo7
	R7df6SIM70kB4Lq3RVI8ANnN9w1CQkSSpzeIyHyuJ/fXGsPvDG8Id+Jhb4PsJY8L3bPCDXlyWagTv
	FBFBNW+kLzq+li+eqYtiOTc2HGIzzsI2J8SddWIejIU7r4O/vsrBBssGUR3nAB07fghyh51pSIJA+
	EZ+4WuDRe7o6rd/bGozYKTC26hkxPQ7MJvBLQASdquzhXKDy9TGe48J0HBUA4SSRqkxebZamYS7DD
	nhaAE2sKcWUbCJ9QPbCx+HHTBNKCumJwvlps7QVZe+NaCTSrQxwRqA+7U6H+bmi7skeDW0yTpCNYD
	uhgyvT2vy9FOOAhb8RUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzTw-00000009B3j-2LzG;
	Mon, 18 Nov 2024 10:59:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzSw-00000009AtY-1ZjF;
	Mon, 18 Nov 2024 10:58:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B85C0003;
	Mon, 18 Nov 2024 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXaBGWR07f8ge1xeXOPSaCwmqO/Cy55m2joFSOl39so=;
	b=L39MPsC6OBLQl/5e2f5dKe8qyENmtiOV8QJ2P0a1KGnnpJEZd1tCO2Dpp6gVQp6rt1glHD
	EZp6o0PFivl3D9sH+U6jJ/JC/3kEQ9gMDpI1FL2NqEN77B9G3uJza5UsgNnAIgrdr3ot44
	c2/gZEykQAqW90ng1vfJeoCEigS2SyDTqgCLnCGATHB40NvnJQ9Q+o4BQNGiEpMpwPs+i2
	GfSMNEX0JajxgPc3Nq0xtPB5sJfoOKmVAxN+glAyCyP9wuJOzVZBlxCbd3WuiP2mXPrMIC
	ZzAEYoYzP7rp4if1qJtD3bffKew0/9/BFapB4zIMMnaHVVrhhlRmnwwSA5TLQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Mika
 Westerberg <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 2/4] include: mtd: Add CASN page
 definition and related structs.
In-Reply-To: <20241020132722.20565-3-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:20 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<20241020132722.20565-3-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:58:39 +0100
Message-ID: <8734jozu3k.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025846_538968_FD99AF62 
X-CRM114-Status: UNSURE (   6.76  )
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

T24gMjAvMTAvMjAyNCBhdCAyMToyNzoyMCArMDgsIFNreSBIdWFuZyA8U2t5TGFrZS5IdWFuZ0Bt
ZWRpYXRlay5jb20+IHdyb3RlOgoKPiBGcm9tOiAiU2t5IEh1YW5nIiA8c2t5bGFrZS5odWFuZ0Bt
ZWRpYXRlay5jb20+Cj4KPiBUaGlzIHBhdGNoIGFkZHMgQ0FTTiBwYWdlIGRlZmluaXRpb24uIFlv
dSBjYW4gc2VlIGNvcnJlc3BvbmRpbmcKPiB0YWJsZSBpbiBDQVNOIHBhZ2UgYXBwbGljYXRpb24g
bm90ZSByZWZlcnJlZCBpbiBjb3ZlciBsZXR0ZXIuCj4gKGh0dHBzOi8vZ2l0aHViLmNvbS9tdGst
b3BlbndydC9kb2MvYmxvYi8KPiBtYWluL0NBU04lMjBQYWdlJTIwSW50cm9kdWN0aW9uLnBkZikK
ClBsZWFzZSBkb24ndCBicmVhayBVUkxzLiBUaGV5IGJlY29tZSBubyBsb25nZXIgY2xpY2thYmxl
LgoKPgo+ICsKPiArc3RydWN0IFNQSU5BTkRfRkxBR1MgewoKTm8gdXBwZXIgY2FzZSBzdHJ1Y3Qg
dHlwZSBwbGVhc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
