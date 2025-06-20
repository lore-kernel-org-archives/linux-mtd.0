Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5445EC71155
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jun 2025 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ZF7eOuch6B+UZk9XeEu5EP74H5sAEGsyody1KSkmOY=; b=E7R+wnd6onAm4c
	nDDlN280HoYCW7eAW0oSIfGMGF6kxJuFw/kucoAA/5XwdxYxGmxPr+rUSWet5sRvHokpXk+qYJlB1
	9S0jyEsgAp+k23xC6iY8NcOhPFghlgNR/17LUokyP/PAfY1kA2KxOq1ZETBaBCWSfa0psuPR/mmyD
	LcTCqDvfHovdaGJGuUUBx3WDWSU6c5bp0gCPaI/FLdDfWMGfVhmMl0tDRwYxIKEYvwuo+JZ17k9W/
	4XcFdcGmeItUCVYCaHM/bdXDE6kYWb8XmoHMrRnG7BV7eL925T+iQ2c9/8z2nJeveOsqU24kadTD+
	ZcPsDf3oh0lPNrV4ntmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdoL-0000000G0CQ-1hkR;
	Fri, 20 Jun 2025 15:37:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdhD-0000000Fyqe-3Wh5
	for linux-mtd@lists.infradead.org;
	Fri, 20 Jun 2025 15:30:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 183C542D83;
	Fri, 20 Jun 2025 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750433425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fp5q/GYD8IBSpDnyB7NqnWArqkIMa8tcvHhu5iahlQQ=;
	b=RvGBHV4HQP0pEno7xsHG3NUS1iIJNRbWRGpDgctxV6yQokfuaDiTV63ErPlyQtrbROmf+2
	z5lM+SdKJuOg+nibF91N0SHd0L+VjFq5TOOIuVFgBOASbdr7qnv/Ax1d81ZwRzibRSubIO
	rZ0JUkqtNEP6Hy9ghC//U1y32NGky2Os+Goa1zMzS9YluM99dM5dw4YD8SaFkABSfDZqgz
	JR/YW0Dj3c3J2v8fgXSobyY2fQyuIHf1JzxwAxQ9R3AKNNk8cJZXQJZmpW5pUX0Hfd+tbY
	iAEHMFk/qC7zL4IrNjFUG0x2VOfdiJ6w8P9XDlyq33I18bo0RKvNRI92V5ZBpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.16-rc3
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 20 Jun 2025 17:30:22 +0200
Message-ID: <871prezb01.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejheegjefhtefgtddvfeevieetjeevleeffeegvdeifedvfeelkeeugeehleekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudgrmeejfhemkeeffeeimeegfeelfhemgeguvdejmeefjegtsgemtggusgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdurgemjehfmeekfeefieemgeeflehfmeegugdvjeemfeejtggsmegtuggshedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvfhuughorhdrtehmsggrrhhusheslhhinhgrrhhor
 dhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehfrhhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggvpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_083028_007635_5AEB5320 
X-CRM114-Status: UNSURE (   8.59  )
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

SGVsbG8sCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgNi4xNi1yYzMuCgpUaGFua3MsCk1p
cXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTkyNzJiMzdhYTRmODNj
YTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5NDoKCiAgTGludXggNi4xNi1yYzEgKDIwMjUtMDYtMDgg
MTM6NDQ6NDMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51
eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuMTYtcmMzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gNjQ2M2NiZTA4YjBjYmY5YmJhODc2MzMwNjc2NGY1ZmQ2NDMwMjNlMToKCiAgbXRk
OiBzcGluYW5kOiBmaXggbWVtb3J5IGxlYWsgb2YgRUNDIGVuZ2luZSBjb25mICgyMDI1LTA2LTE5
IDE5OjEzOjIxICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpUaGUgbWFpbiBmaXggdGhhdCByZWFsbHkgbmVlZHMg
dG8gZ2V0IGluIGlzIHRoZSByZXZlcnQgb2YgdGhlIHBhdGNoCmFkZGluZyB0aGUgbmV3IG10ZF9t
YXN0ZXIgY2xhc3MsIGJlY2F1c2UgaXQgZW50aXJlbHkgZmFpbHMgdGhlCnBhcnRpdGlvbmluZyBp
ZiBhIHNwZWNpZmljIEtjb25maWcgb3B0aW9uIGlzIHNldC4gV2UgbmVlZCB0byB0aGluayBob3cK
dG8gaGFuZGxlIHRoYXQgZGlmZmVyZW50bHksIHNvIGxldCdzIHJldmVydCBpdCBhcyB3ZSBuZWVk
IHRvIGdldCBiYWNrIHRvCnRoZSBwZW4gYW5kIHBhcGVyIHNpdHVhdGlvbiBhZ2Fpbi4KCk90aGVy
d2lzZSB0aGUgZGVmaW5pdGlvbiBvZiBzb21lIFdpbmJvbmQgU1BJIE5BTkQgY2hpcHMgYXJlIHJl
Y2VpdmluZwpzb21lIGZpeGVzIChnZW9tZXRyeSBhbmQgbWF4aW11bSBmcmVxdWVuY3ksIG1vc3Rs
eSkuCgpBbmQgZmluYWxseSBhIHNtYWxsIG1lbW9yeSBsZWFrIGdldHMgYWxzbyBmaXhlZC4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KTWlxdWVsIFJheW5hbCAoNCk6CiAgICAgIFJldmVydCAibXRkOiBjb3JlOiBhbHdheXMg
Y3JlYXRlIG1hc3RlciBkZXZpY2UiCiAgICAgIG10ZDogc3BpbmFuZDogd2luYm9uZDogRml4IFcz
NU4gbnVtYmVyIG9mIHBsYW5lcy9MVU4KICAgICAgbXRkOiBzcGluYW5kOiB3aW5ib25kOiBJbmNy
ZWFzZSBtYXhpbXVtIGZyZXF1ZW5jeSBvbiBhbiBvY3RhbCBvcGVyYXRpb24KICAgICAgbXRkOiBz
cGluYW5kOiB3aW5ib25kOiBQcmV2ZW50IHVuc3VwcG9ydGVkIGZyZXF1ZW5jaWVzIG9uIGR1YWwv
cXVhZCBJL08gdmFyaWFudHMKClBhYmxvIE1hcnRpbi1Hb21leiAoMSk6CiAgICAgIG10ZDogc3Bp
bmFuZDogZml4IG1lbW9yeSBsZWFrIG9mIEVDQyBlbmdpbmUgY29uZgoKIGRyaXZlcnMvbXRkL210
ZGNoYXIuYyAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAg
IHwgMTUyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L210ZC9tdGRjb3JlLmggICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyAg
ICAgICAgICB8ICAxNiArKy0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgIHwgICAx
ICsKIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyB8ICAxMCArLS0KIGluY2x1ZGUvbGlu
dXgvbXRkL3BhcnRpdGlvbnMuaCB8ICAgMiArLQogaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5o
ICAgIHwgIDEwICstLQogOCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxMzIgZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
