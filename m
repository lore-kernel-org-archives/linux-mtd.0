Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA24CC021A2
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aU7KtLIZllvj6TRfpPVP5xJBI/0PgA1qfns/ucDEP+E=; b=ZUFato1wxr5n7B
	qWE6MC0yv3f3roQWHSMdka8OsIcanZLlVCsPT2TydNxmRY54KdeZZfKIYXCKRgmNZsGZXe/3fkq+K
	JlUx6u8Htn4OZwQr9van2CDcJO3U05d8l59ZHe3PO4b9uwtj1qxeopGFM/RilW3G6lrVxbG09MFBc
	1h/appicf0PA1N3EDor3Se9PJLV72+dVsjP4B6SYaVMQkUkaoyziRvp76/ZqRz7xIHV0EtvQNP7MG
	2ccQnzAvcQF5kcL9a3t6oefHADTQeUYAZxIC/F2s2SG7CV3hhF6mLGRZh91/YS47MAjEtcTlmzZG9
	ax1hAaAsHCd61Iys7mBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq5Y-00000003uGF-2vAi;
	Tue, 11 Feb 2025 13:14:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpn2-00000003qcA-3900
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 12:55:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A4EE4318D;
	Tue, 11 Feb 2025 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739278498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCp+sFwjp6X53Xy6vUp3gJOZ41+nmTUyiZmaz+Sg4LQ=;
	b=SJq348vPQLBZmcy3A5kV8BgiAobDhxS8qQOy+ZMAe2bNi74xWjryciNfDqrAHEXGjTS9dZ
	p8H9vVx/ArmWe5WiyNrqXQAwPR37GY2iYjXKxQApVBG/B5rc6GTHJSyOiFl830kk6U8Wr7
	AmnqKnpoyJ/7hOj3r/vpbfNP0DO4DCCAKEWQrIn8ZcJS3B38HkAHnZV3u3PZzQAUFzlpde
	4yIK1B836k+RUeK7+BUXkYKhtdxDy88GBylg82VbCksyyo39L0N5RPtKenw4GgLr2qT8HV
	INeFOoRYZ+C5B84vCQ13mdKFOkQNSFHaebILSCWQkiHWg1BQ2PmkvMrxh/VPag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org, Robert Marko <robimarko@gmail.com>
In-Reply-To: <20250209140941.16627-1-ansuelsmth@gmail.com>
References: <20250209140941.16627-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
Message-Id: <173927849590.126930.12542924757341380520.b4-ty@bootlin.com>
Date: Tue, 11 Feb 2025 13:54:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkohhnrhgrugdrugihsggtihhosehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_045500_923691_7E936BB5 
X-CRM114-Status: UNSURE (   8.24  )
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

T24gU3VuLCAwOSBGZWIgMjAyNSAxNTowOTozOCArMDEwMCwgQ2hyaXN0aWFuIE1hcmFuZ2kgd3Jv
dGU6Cj4gRml4IGJyb2tlbiBjb25maWcgaW4gcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhlYyBjYXVz
ZWQgYnkgY29weS1wYXN0ZSBlcnJvcgo+IGZyb20gY29tbWl0IDBjMDgwODBmZDcxYyAoIm10ZDog
cmF3bmFuZDogcWNvbTogdXNlIEZJRUxEX1BSRVAgYW5kIEdFTk1BU0siKQo+IAo+IEluIHFjb21f
cGFyYW1fcGFnZV90eXBlX2V4ZWMgdGhlIHZhbHVlIG5lZWRzIHRvIGJlIHNldCB0bwo+IG5hbmRj
LT5yZWdzLT5jZmcwIGluc3RlYWQgb2YgaG9zdC0+Y2ZnMC4gVGhpcyB3cm9uZyBjb25maWd1cmF0
aW9uIGNhdXNlZAo+IHRoZSBRY29tIE5BTkRDIGRyaXZlciB0byBtYWxmdW5jdGlvbiBvbiBhbnkg
ZGV2aWNlIHRoYXQgbWFrZXMgdXNlIG9mIGl0Cj4gKElQUTgwNngsIElQUTQweHgsIElQUTgwN3gs
IElQUTYweHgpIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKPiAKPiBbLi4uXQoKQXBwbGllZCB0
byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogcWNvbTogZml4IGJyb2tl
biBjb25maWcgaW4gcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhlYwogICAgICBjb21taXQ6IDg2ZWRl
MGE2MWY4NTc2YTg0YmIwYTkzYzVkOTg2MWQyZWMxY2RmOWEKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
