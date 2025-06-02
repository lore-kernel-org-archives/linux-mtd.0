Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19085C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWQPqihPeQ5zKs3GZScjjqmKXVCwAKIs/r3JiOtbQOQ=; b=qXuCyImnRgvFZb
	fuP9RWfQ0d76hQZYCYT7x+4F4g2kFoF5rzhRRux+ZkToCYyGQC6Hbo+k9dExcQOZucONS6a0ikICe
	S5G8xvVuBAOo6PYK8p5WippKxAmVQRAuLNYsvnRWM7MlRHe4GEplfwsx45gVgNheIk4wVHZ4ICgN5
	pzUMstUQ5GPh6hin3sRhSfDiLgLg+HRf2TWE8hXGlCIBw598YF0P/UtZS9C9BsrUyN43J4REvoe/C
	XCsyCwRRtJk+jz2/kdRVRrS9QFQEirLprI2NCjBkoVLm3PbLyNeTntWWUOIvEjJXdIx6a5EDRYrB0
	GNAjtXz/8P4/wRaL0gkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5cF-00000007Wip-02Z9;
	Mon, 02 Jun 2025 13:54:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5cC-00000007Wi5-0u5A
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 13:54:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C652443B2B;
	Mon,  2 Jun 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748872450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GM8Iv62t/e7wzoRm7D/cIuSzUvdjCu/Nb9piOAa+4fY=;
	b=SicAoHRQay2/kdWNB+eB5vNr794qZnTGuUj6PDJFXO1afRnUw5K1nuSyVyXuMLeqbuNe6Y
	F4KdCRmE/kqPfSzsxV1BQos8zRLDT7gIHk/AKpAqal4rd0bBO6MfP3wDjO/cXibnRgjeJ7
	jV8ZyQJO63IDklIgZGyzlsGPWKdpKZbrFrsBxHPaPRGwEw4G8zuO1brEbqtqrinBmYouu1
	vUNt/axtVE/Vp8Gh8D8ApyCQlgMFlv4zG5ypWQy67AJ6JZg50Lufo16GSW4cDHt+RpQgHx
	YQiR0K31lf0l7zCH2/muip5oq1fuMBCGrFm20PC1TWDFxbeh0RUBJVFCeapf+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Mark Brown
 <broonie@kernel.org>,  Md Sadre Alam <quic_mdalam@quicinc.com>,
  Varadarajan Narayanan <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Lakshmi Sowjanya D
 <quic_laksd@quicinc.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
In-Reply-To: <28db650d-a911-4df9-9ad4-f926ea0683e6@gmail.com> (Gabor Juhos's
	message of "Fri, 30 May 2025 13:07:35 +0200")
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
	<KuueBg3qliXMt9QN9kV_5_on2xJV-BEWZAsktO_Ce-Fq1iBAPCFypbYUVZxlV4LjF0AUZG57KqiXZZ3uefQrXw==@protonmail.internalid>
	<20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
	<68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
	<28db650d-a911-4df9-9ad4-f926ea0683e6@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 15:54:09 +0200
Message-ID: <87a56qp7um.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeekgeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrhigrnhdrohguohhnohhghhhuvgeslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrs
 ehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_065412_384911_5E8BC343 
X-CRM114-Status: UNSURE (   8.77  )
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

Ck9uIDMwLzA1LzIwMjUgYXQgMTM6MDc6MzUgKzAyLCBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWls
LmNvbT4gd3JvdGU6Cgo+IDIwMjUuIDA1LiAzMC4gMTA6NTYga2VsdGV6w6lzc2VsLCBCcnlhbiBP
J0Rvbm9naHVlIMOtcnRhOgo+Cj4gLi4uCj4KPj4gVGhpcyBvbmUgZG9lc24ndCBhcHBseSB0byAt
bmV4dAo+Cj4gSXQgaXMgYmVjYXVzZSB0aGUgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBTUEkgdHJl
ZSwgYW5kIC1uZXh0IGNvbnRhaW5zIGFub3RoZXIKPiBjaGFuZ2UgZm9yICdkcml2ZXJzL210ZC9u
YW5kL3FwaWNfY29tbW9uLmMnIHdoaWNoIGNvbWVzIGZyb20gdGhlIE1URCB0cmVlLgo+Cj4gSXQg
Y2FuIGJlIGFwcGxpZWQgYnkgc3BlY2lmeWluZyB0aGUgJ00nIHN3aXRjaCBmb3IgYjQgc2hhemFt
LgoKSSBzdWdnZXN0IHlvdSByZWJhc2Ugb24gLXJjMSAod2hlbiBpdCdzIG91dCkgYW5kIHJlc2Vu
ZCB0byBzaW1wbGlmeQpNYXJrJ3MgbGlmZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
