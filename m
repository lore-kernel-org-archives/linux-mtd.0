Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6ACC54EBC
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3zTNnkFOjvnDy5pvxp0+f2NL+HPW3cKU10ia5eA7jk=; b=2MFYxL4v1h4804
	Por0W1VHShLlsxTFGEmyumBMkG2EnHJVuL7Q1eDnpxXuilI5szNArdngUX1gkPeKjV619dbsuWjuW
	Wi4T3vbjoYKWGhTr7EUx93uzo0EILEkAgCOoXXtV6jz2dLYj863kflCvhjE5EUJvwiTyrvLQaeBXj
	rVw3yHzglrsyDYH0MUMuE3j8RbZbj/1ZzJhn+5eejnqErsF/maEhweyNOBGO9A/ZlJ8TzTxoTDZ+Z
	72B7CujG81RhbH5eNXGtB5O3PCnjypkTAKn/MNbiWtVB4fVRGw4SUX05iUPfZNh57fd2vY4G2vLBh
	SPG4PSDoUpCsMWBoalJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu0w-00EOi1-HT; Thu, 12 Jan 2023 09:36:50 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu0s-00EOdq-8C
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2023 09:36:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D691FE0008;
	Thu, 12 Jan 2023 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673516199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DuYtr69SBhmzbOxuzhrLCu1pyTu672nDJD/jCPYDl74=;
	b=RSqeD3+UCF5YgSeurQBN/2t6pi9E/JXXjOc5SJely2tl91ZbVCb+i4m5d65Nb5dMi6oxjd
	DHVqzmeDTxhiDNLaezgpb1G08fGuXLefb6tnlYPKSYUpiBJCgQoj1IeHNMnBEPcmsL0BHu
	kVxUm39Q55cLjs5Lt5ngg8/K22tV3suJioxybQmcUg8ia1vAZmHbFUprdeYGE6mEuaQjys
	2eH1xvDeMfE2dMQU77NyIjMmps9I+ax+an1dFB5JKO0JpB9EOLaMy1ACg9As/U9cfy06+O
	rfHCwlFUEexxTaxlCdl6WAzfwVxowqo7SwatKZuimtn7uqYymZ10v3OBC1zCpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] mtd: rawnand: Sequential page reads
Date: Thu, 12 Jan 2023 10:36:34 +0100
Message-Id: <20230112093637.987838-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_013646_643996_C05454EE 
X-CRM114-Status: GOOD (  10.89  )
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

SGVsbG8sIHRoaXMgc2VyaWVzIGlzIGEgdGFrZW92ZXIgb2YgSmFpbWUncyBvcmlnaW5hbCBzdXBw
b3J0IGZvcgpzZXF1ZW50aWFsIGNhY2hlIHJlYWRzLgoKV2hlbiByZWFkaW5nIHNlcXVlbnRpYWwg
cGFnZXMsIHRoZSBuZXh0IHBhZ2UgY2FuIGJlIGxvYWRlZCBpbiBjYWNoZQp3aXRob3V0IHRoZSBu
ZWVkIGZvciBhIGZ1bGwgbmV3IFJFQUQgb3BlcmF0aW9uIGN5Y2xlLiBXZSBjYW4gdGhlbgppbXBy
b3ZlIHRocm91Z2hwdXQgYSBsaXR0bGUgYml0IGluIHRoaXMgY2FzZS4KCkluIG9yZGVyIHRvIHN1
cHBvcnQgdGhlIGZlYXR1cmUgd2UgY2FuIHNwbGl0IHRoZSBzZXJpZXMgaW50byB0d28gc3RlcHM6
CiogbWFrZSBpdCBwb3NzaWJsZSB0byBjaGVjayBpZiBhbiBvcGVyYXRpb24gaXMgcG9zc2libGUg
aW4gYWR2YW5jZQoqIGNoZWNrIGlmIHNlcXVlbnRpYWwgcGFnZSByZWFkcyAoY2FjaGUgcmVhZHMp
IGFyZSBzdXBwb3J0ZWQgYW5kIGlmIHllcywKICB1c2UgdGhlbSBvbiByZWxldmFudCBvcGVyYXRp
b25zIHJhdGhlciB0aGFuIHJlZ3VsYXIgcmVhZHMuCgpDb250cm9sbGVycyBub3QgbGV2ZXJhZ2lu
ZyB0aGUgY29yZSdzIGhlbHBlcnMgbWlnaHQgbm90IGJlbmVmaXQgZnJvbQp0aGlzIGFkZGl0aW9u
LgoKVGhhbmtzLApNaXF1w6hsCgpDaGFuZ2VzIGluIHYyOgoqIEZpeCBhIGNvbW1lbnQgYWRkZWQg
aW4gcGF0Y2ggMiBhbmQgbW9kaWZpZWQgZm9yIG5vIHJlYXNvbiBpbiBwYXRjaCAzLgoKQ2hhbmdl
cyBpbiB2MToKKiBUd28gbmV3IHBhdGNoZXMgdG8gc3BlZWQgdXAgdGhlIGNoZWNrcyBhbmQgYXZv
aWQgZG9pbmcgdGhlbSBldmVyeSB0aW1lCiAgd2UgbmVlZCB0byBtYWtlIGEgY29udGludW91cyBy
ZWFkLgoqIFJld29yayBvZiBKYWltZSdzIHBhdGNoLCBidXQgdGhlIHNhbWUgbG9naWMgYXBwbGll
cywgd2l0aCBkaWZmZXJlbnQKICBoZWxwZXJzIGFuZCB2YXJpYWJsZSBuYW1lcy4KCkphaW1lTGlh
byAoMSk6CiAgbXRkOiByYXduYW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsIGNhY2hlIHJlYWRz
CgpNaXF1ZWwgUmF5bmFsICgyKToKICBtdGQ6IHJhd25hbmQ6IENoZWNrIHRoZSBkYXRhIG9ubHkg
cmVhZCBwYXR0ZXJuIG9ubHkgb25jZQogIG10ZDogcmF3bmFuZDogUHJlcGFyZSB0aGUgbGF0ZSBh
ZGRpdGlvbiBvZiBzdXBwb3J0ZWQgb3BlcmF0aW9uIGNoZWNrcwoKIGRyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jICB8IDE0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfamVkZWMuYyB8ICAgMyArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9vbmZpLmMgIHwgICAzICstCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgg
ICAgICAgfCAgMTcgKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNjQgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
