Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF677C3601A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vr9F3JaB8g/wBTYMPIAEH/ZXXuRQ9TFrwmgJJuVIvc4=; b=bKcah2YUt4sfeA
	Jk3gOWMPAJBt88Ail/OsWfSFKk3MpXie5lXmiUv782tVkt2NuaGbvLfL8RXArH0ag7S3KIW4sbMkJ
	RVug41pD+iLlr11kHxSrIuEy2SSu1R1ddOGf2l6obkhzjd5VrAhOvoaqs/cswnscFLWnd6+jWSjwd
	yOAjpaeiHfnX3Hd8NGKmxiJ70n6RoKwmuB7UmdyNnWGINYqh1y5Dhe1qwpLP1Zi+En+lNYXuWAz8P
	9tBPBZxYCbPVBAP5r1RBGp5LU2xeGwSoQbXeat0f+3FffC43oXqsSaooO1uM0aGzSdkuJuOJDSjNg
	bfNg4DD+R+cFZCgFNG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gmC-0000000GixU-1tlc;
	Mon, 07 Apr 2025 07:20:12 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ghh-0000000GhzL-0fjX
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:15:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 958A544341;
	Mon,  7 Apr 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744010129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9JaBGMTvb/hYdR9v/xSYDOC5vbqVFIgbLcpRT30azE=;
	b=XR1zCoObjM/6L9ZAQT5P66rnf8wNnoiQWu7VeLQKYAyekbF1ApgeQ6BWIzmdGa2RVyTH49
	v7Zw1qYD749WcPLoSklgxIq9hZ6LAS0GSFFVYQ5LO0UCLs9lY7LkM5vNPDMHJQczLsKXVA
	6+3v6JehYuGhsJyDEaM+tVirhOBv/KkNWUjBw/8yW92jR5SwLLHU+2wqzpWMt6OJVJ9l/K
	5chll1oDEaqpiM0jmKz+m3bHopg1RNy9ayHCeEndR6D/OWjCK8hbdnH9zaKWMYtiRiK3wH
	wUGJcdnLiRgo5OlkecwVlLFxkfVyHitMyR6647jBQyTLjmx9iXfsg7+hdjaaLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Mark Brown <broonie@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <99eef91c334f3f2314c2f5671e1eb55211a5ff19.1743150196.git.geert+renesas@glider.be>
References: <99eef91c334f3f2314c2f5671e1eb55211a5ff19.1743150196.git.geert+renesas@glider.be>
Subject: Re: [PATCH] mtd: nand: Drop explicit test for built-in
 CONFIG_SPI_QPIC_SNAND
Message-Id: <174401012746.998658.11206994348683987630.b4-ty@bootlin.com>
Date: Mon, 07 Apr 2025 09:15:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrdefpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtr
 dgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001533_358146_43C44F25 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gRnJpLCAyOCBNYXIgMjAyNSAwOToyNDowMSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IElmIENPTkZJR19TUElfUVBJQ19TTkFORD1tLCBidXQgQ09ORklHX01URF9OQU5EX1FD
T009bjoKPiAKPiAgICAgRVJST1I6IG1vZHBvc3Q6ICJxY29tX25hbmRjX3VuYWxsb2MiIFtkcml2
ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5rb10gdW5kZWZpbmVkIQo+ICAgICAuLi4KPiAKPiBGaXgg
dGhpcyBieSBkcm9wcGluZyB0aGUgZXhwbGljaXQgdGVzdCBmb3IgYSBidWlsdC1pbgo+IENPTkZJ
R19TUElfUVBJQ19TTkFORCBjb21wbGV0ZWx5LiAgS2J1aWxkIGhhbmRsZXMgbXVsdGlwbGUgYW5k
IG1peGVkCj4gb2JqLXkvb2JqLW0gcnVsZXMgZm9yIHRoZSBzYW1lIG9iamVjdCBmaWxlIGZpbmUu
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5h
bmQ6IERyb3AgZXhwbGljaXQgdGVzdCBmb3IgYnVpbHQtaW4gQ09ORklHX1NQSV9RUElDX1NOQU5E
CiAgICAgIGNvbW1pdDogMzZjNjQ2ODcyNGFhOThkMzNmZWE5YTFkN2UwN2RkZGE2MzAyZjVkNAoK
UGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBi
ZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBi
eSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
