Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D958C87FCB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dwlLeT9eGLyDoHYCTyb5txr91uZyT+j0GDNPVKlkKg=; b=tWVjBnTFZ0etwG
	Qd/IWGQYsq4EvaBtzR1fi51mxHhOOnVhu4RB+hKjZ6KyWBqSQi9cgX4g/am0d2MQABWn0eT7eLOG+
	zqaWjTOOLVK8Qa484AAqtgzXnFRh718qExeIHaX/37odaZX6MD6SzoCwoj7/QhWxdNfRnfkgtL0Cb
	A+rW0JN0n/RbjfWr6ETXNMWgbqHTWJOlQ7KuwlrJRAvXc33kUcXCAzBxCsllELmfmCIMwh4AYIyZL
	YMmB6vKYIHmak3PkS+I1h5vWy6X/3oplX1949v3nBGolZfW6PBPbm1daY/+HziGS9TVJAOzKDUNIk
	rca2HUJSTC5XsHJ0XRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCKD-0000000C3De-2OIZ;
	Tue, 05 Aug 2025 07:43:09 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCK9-0000000C3D9-1q9M
	for linux-mtd@lists.infradead.org;
	Tue, 05 Aug 2025 07:43:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67B9E43194;
	Tue,  5 Aug 2025 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754379781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hgivh3BaaqDG4fczjDXXKEN33iKWFj7f9BUj4tGZTrk=;
	b=L4C3MbFcm+IPMdxln2d64iaOMLDruOCi8lHxnJ+Vg6n6ycqGa41DfY6Q2568RpyNpPdXwu
	g1ai3Kw2f5pv4++cXUvxabTVRE8iMBLRDRgXCCzu4+KjEkRbHSgscDR4jBj5EUlyXxVJkH
	zevkYIln4iqJfQz+wlqezZ+jtm+3PC2CAFVacmxgPLsXGwWbbSys6lJx2FuS2mFpSee0Oh
	4pUpP+TXUVjH+pA+ZVn714qQDJw7aZ4puH0l7u0WeO2w+1AjlraUnC/sJVMW/H+T329MOC
	oomSffWpRAAjwvcL8kBKIBQe+qaXf3xL6MdpisECsE2f3ac9KACujOZBoyk/VA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,  <linux-spi@vger.kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: spi-mem: Add missing kdoc argument
In-Reply-To: <mafs0ms8fcfhg.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	04 Aug 2025 16:45:47 +0200")
References: <20250804095013.409700-1-miquel.raynal@bootlin.com>
	<mafs0ms8fcfhg.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 09:43:00 +0200
Message-ID: <87tt2mi58b.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrr
 hhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004306_243080_30F06A07 
X-CRM114-Status: UNSURE (   8.98  )
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

T24gMDQvMDgvMjAyNSBhdCAxNjo0NTo0NyArMDIsIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gT24gTW9uLCBBdWcgMDQgMjAyNSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPgo+PiBUaGUgIiptZW0iIHBvaW50ZXIgaGFzIGJlZW4gYWRkZWQgd2l0aG91dCBkZXNj
cmlwdGlvbiwgZGVzY3JpYmUgaXQgaW4KPj4gdGhlIGtkb2MgY29tbWVudCBpbiBvcmRlciB0byBm
aXggdGhlIGZvbGxvd2luZyBXPTEgd2FybmluZzoKPgo+IEhtbSwgdGhpcyB3YXJuaW5nIGRvZXMg
bm90IHNob3cgdXAgZm9yIG1lIHdpdGggVz0xLCBidXQgZG9lcyB3aXRoIFc9Mi4gSQo+IGFtIHJ1
bm5pbmc6Cj4KPiAgICBtYWtlIGRyaXZlcnMvc3BpL3NwaS1tZW0ubyBMTFZNPTEgQVJDSD1hcm0g
Vz0xCgpJdCBzaG93cyB1cCBvbiBteSBzaWRlIHdpdGggVz0xLCBidXQgbm90IHdpdGggTExWTS4g
Tm8gaWRlYSBpZiBtYWtlcyBhCmRpZmZlcmVuY2U/CgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
