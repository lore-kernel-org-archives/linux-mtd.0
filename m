Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41EEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b0OKpZpXjGpxByG3JJckAWvxl/IfoPfGPvWpL3dgne4=; b=2z9CAnE4rELzw3
	3JnbJebzO/sec8mRitAZSjswr0lCrKjiRQqJABJ1Nw1xefgn95gTkPbMtMDaqdwSNooYu8zER9rGo
	xuPViVOvsaz6DhGp7qOwJ11dhKYMJur25jmVZ4yjafMIHwzqB9QYuL3JuXU0gov9gyz6Qf5BuA2ZL
	7DC3/XOCpwbnCLzbv8r6h0LViVtUE5XSlP4vKXYg+2GQIuYtDWMM5SNzwwLvEdLxPl5ARqRh+e7OC
	YmxzEqeDKwc46o3JfdHT2fWb53hvrQG+ZPkvhvFS/KqjlkLA3t+MWfdLQ8BWpUyKjvCTLSqNDgtkQ
	PzodD/BGw+4DTiQhtCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30z-00BypD-2H;
	Sun, 16 Jul 2023 14:46:25 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30u-00Byh6-0O;
	Sun, 16 Jul 2023 14:46:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3AEAC0003;
	Sun, 16 Jul 2023 14:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TVvKRq2YiRqUGlQJsb2Ft0ynIWUbO3rzUiTz+OtwrWk=;
	b=S5qGKK//cRUV6FT78iRBJNvUmlHLznDkohz9i6CmYnYOW561Jfid1GmWY1XvbjSvgDurN2
	mZ10GcbewvqLxtrmqIXgHJXaO05w7vZzGWiQkmYT+NYLMSGg7wEPTnMHWxAK3peNQp7fIe
	e95ie0FmffmcTg2Nr/aWNXCUwYFTuNZGqg16Yh7D58BDq6R2EIsmbwU14Gg1dAZm5EueMx
	EQkYE4M6SzQWikk7RZcYZr0i09XFPakITwiXOHtietATUjHZXgFcAakhqACbwOOOaaKPEV
	QV4VkKMGy9+EUxrupLHZ+gupE81JvcTjUpFSpAHExaGJJw1PKIHGudta+i8L+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/8] mtd: rawnand: qcom: Misc fixes
Date: Sun, 16 Jul 2023 16:46:04 +0200
Message-Id: <20230716144612.32132-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074620_412432_040A2A26 
X-CRM114-Status: UNSURE (   6.89  )
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

SGVsbG8sCgpBIHJlY2VudCBrZXJuZWwgdGVzdCByb2JvdCByZXBvcnQgbWFkZSBtZSBsb29rIGF0
IGEgc3BlY2lmaWMgYXJlYSBvZgp0aGlzIGRyaXZlciBhZnRlciBpdCBoYXMgYmVlbiBkZWVwbHkg
cmV3b3JrZWQgdG8gaW1wbGVtZW50CmV4ZWNfb3AoKS4gV2hpbGUgYXQgaXQsIEkgcHJvZ3Jlc3Np
dmVseSBmaXhlZCBvdGhlciB0aGluZ3Mgd2hpY2ggc3RvdWQKb3V0IHRvIG1lLCBhbmQgZmluaXNo
ZWQgYnkgYWRkcmVzc2luZyBhZGRpdGlvbmFsIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QKd2Fybmlu
Z3MuCgpUaGlzIGlzIHVudGVzdGVkLCBlc3BlY2lhbGx5IHRoZSBsYXN0IHBhdGNoIHdoaWNoIG5l
ZWRzIHZhbGlkYXRpb24gZnJvbQp0aGUgbWFpbnRhaW5lcnMgb2YgdGhlIGRyaXZlci4KClRoYW5r
cywKTWlxdcOobAoKTWlxdWVsIFJheW5hbCAoOCk6CiAgbXRkOiByYXduYW5kOiBxY29tOiBVc2Ug
dGhlIEJJVCgpIG1hY3JvCiAgbXRkOiByYXduYW5kOiBxY29tOiBVc2UgdTggaW5zdGVhZCBvZiB1
aW50OF90CiAgbXRkOiByYXduYW5kOiBxY29tOiBGaXggYWxpZ25tZW50IHdpdGggb3BlbiBwYXJl
bnRoZXNpcwogIG10ZDogcmF3bmFuZDogcWNvbTogRml4IHRoZSBzcGFjaW5nCiAgbXRkOiByYXdu
YW5kOiBxY29tOiBGaXggd3JvbmcgaW5kZW50YXRpb24KICBtdGQ6IHJhd25hbmQ6IHFjb206IEZp
eCBhIHR5cG8KICBtdGQ6IHJhd25hbmQ6IHFjb206IEVhcmx5IHN0cnVjdHVyZSBpbml0aWFsaXph
dGlvbgogIG10ZDogcmF3bmFuZDogcWNvbTogRml4IGFkZHJlc3MgcGFyc2luZyB3aXRoaW4gLT5l
eGVjX29wKCkKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA2OSArKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygr
KSwgMzYgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
