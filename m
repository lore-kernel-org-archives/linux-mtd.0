Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5592C021A2
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3D1Idi4EdGmzScaiaV82iTf/W25EYOoykYi8ec0bpw=; b=WiBlRLUtNYu/v2
	mxrhiq305EC+YqgUbVnqgFkAIaVyFldoQGDiuIZF6VhLpslnzBUIGJAevA3lIeo6Jf5YpLDeUmIXc
	TkThPY1QFdCfs9A+vS4ea+PllCUKYOxistHUP/l2b9glKlLyZCU3aFbxo6kiVz9W0j3qJwrlCk0TB
	hu9l7MmGSFgEo9EDM24kGsIbwWrNoqN9/4eR00O8rcjiPM9B0+ZGfZvvsn5+b2hK4H1h9ZXAfD1cW
	ezyp28LSYSyST4F56TVHPsExp8dUeHUpsNu2lxd/rqLc1IXOEsZP0tx5RRLP/CCuUl5bRWL3IFsVF
	7T96F0hS3D5KLIqlk5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnvk-00000003R90-1KKg;
	Tue, 11 Feb 2025 10:55:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnhG-00000003O1R-0B1B
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E6E3432BE;
	Tue, 11 Feb 2025 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739270450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMQ0jzTZxhuaiCez4BJlsuXZfBmNiwzAvhjtjvOeNuI=;
	b=GtU/QNNxzr8HbgdV4Y9TcN/xZNIsZtMulnYTOwBwfXMUSdeYmGAO2XASTY5V4wxx1ZLebE
	uSI4ZTRnMueHos54xnKrFgQKkV9I7JTFVo9iyUGg2m1Rp/I16PoCKefQQUFBTFXiahiYnR
	8G+/oYPHL9LmzlCmJ8juiznZ3E/UEywQ7cZZRz5TVgJ8hnEXjBf/C5xKqccMeU0uh1qaC9
	e1sNfxTT3d0KxSrMrJkmw4E1DKEwzANNpiEx0uxsDbk/LBuo/ik3hMRC2zLfyh2rYCny+C
	HVoMePq2wXW2vCSGnd7/B/NOhYxtuvXTR10gH/2GWDby/wkuDPTDkf3PiSJImA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
	(Cheng Ming Lin's message of "Tue, 11 Feb 2025 16:13:32 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
	<878qqj3sju.fsf@bootlin.com>
	<CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
	<87frkmt8nu.fsf@bootlin.com>
	<CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 11:40:49 +0100
Message-ID: <87msessr0u.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024054_651529_1AB4341E 
X-CRM114-Status: GOOD (  15.67  )
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

T24gMTEvMDIvMjAyNSBhdCAxNjoxMzozMiArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4gTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjXlubQy5pyIMTDml6Ug6YCx5LiAIOS4
i+WNiDY6MDflr6vpgZPvvJoKPj4KPj4gSGVsbG8sCj4+Cj4+ID4+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gc3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkoc3BpbmFuZCwgcmV0
cnlfbW9kZSk7Cj4+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8
IDApIHsKPj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVjY19m
YWlsZWQgPSB0cnVlOwo+PiA+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPj4gPj4KPj4gPj4gU2hhbGwgd2UgdHJ5IHRvIHNldCB0aGUgcmVhZF9y
ZXRyeSBsZXZlbCB0byAwIHVwb246Cj4+ID4+Cj4+ID4+ICAgICAgIGlmIChyZXQgPCAwICYmIHJl
dHJ5X21vZGUgPiAxKQo+PiA+Pgo+PiA+PiA/Cj4+ID4KPj4gPiBJZiB3ZSBzZXQgdGhlIHJlYWRf
cmV0cnkgbGV2ZWwgdG8gMCB1cG9uLCBhbmQgc2V0X3JlYWRfcmV0cnkgZmFpbHMKPj4gPiB3aGVu
IHJldHJ5X21vZGUgZXF1YWxzIHRvIDEsIGl0IHdvbid0IHJldHVybiBhbiBlcnJvci4gVGhpcyBj
b3VsZAo+PiA+IHBvdGVudGlhbGx5IG1hc2sgYW4gdW5kZXJseWluZyBpc3N1ZS4KPj4KPj4gRG9u
J3Qgc2F2ZSB0aGUgcmV0dXJuIHZhbHVlIGluIHRoaXMgY2FzZT8gQnV0IG90aGVyd2lzZSB5b3Ug
d291bGQgbGVhdmUKPj4gdGhlIGNoaXAgaW4gYSByZXRyeSBzdGF0ZSwgbm8/Cj4KPiBIb3dldmVy
LCBpZiB3ZSBzZXQgdGhlIHJlYWRfcmV0cnkgbGV2ZWwgdG8gMCB1cG9uLCB0aGUgY2hpcCB3b3Vs
ZCBzdGlsbAo+IHJlbWFpbiBpbiB0aGUgcmV0cnkgc3RhdGUgaWYgc2V0X3JlYWRfcmV0cnkgZmFp
bHMuCgpXZWxsLCBpZiBldmVuIHRoaXMgZmFpbHMsIHlvdSBoYXZlIGJpZ2dlciB0cm91YmxlcyB0
aGFuIHJlYWRfcmV0cnkgYmVpbmcKZW5hYmxlZC4KCj4KPiBJIGNvbWUgdXAgd2l0aCBhIHNvbHV0
aW9uOiBzZXR0aW5nIHRoZSByZWFkX3JldHJ5IGxldmVsIHRvIDAgcmlnaHQgYmVmb3JlCj4gdGhl
IHJlYWRfcmV0cnkgbGFiZWwuIFRoaXMgZW5zdXJlcyB0aGF0IHN1YnNlcXVlbnQgcmVhZHMgYWx3
YXlzIHN0YXJ0Cj4gZnJvbSBsZXZlbCAwLCBhbmQgaXQgZWxpbWluYXRlcyB0aGUgbmVlZCB0byBy
ZXNldCB0aGUgcmVhZF9yZXRyeSBsZXZlbCBhdAo+IHRoZSBlbmQuCgpJIGRvbid0IHNlZSB0aGUg
ZGlmZmVyZW5jZSB3aXRoIHRoZSBwcmV2aW91cyBzb2x1dGlvbi4gSWYgaXQgZmFpbHMsIGl0J3MK
ZXhhY3RseSB0aGUgc2FtZS4KClBsZWFzZSBkbyBub3QgYWRkIGEgZnVuY3Rpb24gY2FsbCB0byAq
ZXZlcnkqIHJlYWQgcmVnYXJkbGVzcyBvZiB0aGUgZmFjdAp0aGF0IHdlIGVuYWJsZWQgcmVhZF9y
ZXRyeSAod2hpY2ggSSB0aGluayBpcyB3aGF0IHlvdSBhcmUgc3VnZ2VzdGluZykuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
