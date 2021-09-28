Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1055DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C314D6109E
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C314D6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ms8nUbmsi2M16mNSuqIoiSMO1KGdDUrY6UfcMubdjio=; b=eHXbDbAkLCHe3Z
	1p0madHzcrY4OZMZr6PLYrmj4+4TBLqZXpAmT06ngCGizYhcC76FUPvejRMwLSnhy8JGYfGbwBOXl
	KDDBKJ0hELPbGyo5bP/sW/268SfMVGRBhKS5KzPJZjRqtwe3XZdoI29CJ5qScyng9wuYllllYvK+C
	JWACBarnW6CCO0Ze2A7qU1JpCgwsHm8fRniThmPZQgZLW2h98+ZipwSJV1zfhmFXecayXCUMiCUU/
	l7i5Gjk9mSqS8nRzrnT8OyhEoPtW/J48vfUwliAuNVIoVKHHJ8tQq8UCmpxz8+zXUU1cAjynTO33d
	HChhQnSLujI5b6WhC30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLOB-0090Aj-7U; Tue, 28 Sep 2021 22:15:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLNb-008zwC-Hu; Tue, 28 Sep 2021 22:15:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0E1831C0006;
 Tue, 28 Sep 2021 22:15:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/8] Cleanup series about Hamming helpers 
Date: Wed, 29 Sep 2021 00:14:59 +0200
Message-Id: <20210928221507.199198-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_151515_787462_841189AA 
X-CRM114-Status: UNSURE (   8.53  )
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

SGVsbG8sCgpUaGUgZGV0YWlsZWQgZGVzY3JpcHRpb24gaXMgYXZhaWxhYmxlIGluIGVhY2ggcGF0
Y2ggZGVzY3JpcHRpb24gYnV0CmJhc2ljYWxseToKKiBUaGUgRlNNQyBkcml2ZXIgd2FzIChJIGJl
bGlldmUpIHN0aWxsIGJyb2tlbiBzbyBoZXJlIGlzIGEgcGF0Y2ggZm9yCiAgdGhhdC4KKiBBcyBy
ZXF1ZXN0ZWQgYnkgTGludXMgd2hlbiBoZSBwdWxsZWQgYSBzZXJpZXMgb2YgZml4ZXMgZHVyaW5n
IHRoZSA1LjEzCiAgY3ljbGUsIHRoZSBuZWVkIGZvciBkZWNsYXJpbmcgaW5kaXZpZHVhbCBpbmRl
bnRpY2FsIGhlbHBlcnMgaW4gZWFjaAogIGRyaXZlciB1c2luZyB0aGUgInJhdyIgSGFtbWluZyBF
Q0MgaGVscGVycyB3YXMgdW5qdXN0aWZpZWQ6CiAgLSBIZXJlIGlzIGEgcHJvcG9zYWwgZm9yIHNp
bXBsaWZ5aW5nIHRoZSBzaXR1YXRpb24KICAtIEZvbGxvd2VkIGJ5IGEgc2VyaWVzIG9mIHJldmVy
dCAobm8gbmVlZCB0byBiYWNrcG9ydCB0aGVzZSwgaXQncyBqdXN0CiAgICBnZW5lcmFsIGNsZWFu
dXApLgoKVGhhbmtzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICg4KToKICBtdGQ6IHJhd25hbmQ6
IGZzbWM6IEZpeCB1c2Ugb2YgU00gT1JERVIKICBtdGQ6IHJhd25hbmQ6IExldCBjYWxsZXJzIHVz
ZSB0aGUgYmFyZSBIYW1taW5nIGhlbHBlcnMKICBSZXZlcnQgIm10ZDogcmF3bmFuZDogdHh4OW5k
Zm1jOiBGaXggZXh0ZXJuYWwgdXNlIG9mIFNXIEhhbW1pbmcgRUNDCiAgICBoZWxwZXIiCiAgUmV2
ZXJ0ICJtdGQ6IHJhd25hbmQ6IHRtaW86IEZpeCBleHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWluZyBF
Q0MgaGVscGVyIgogIFJldmVydCAibXRkOiByYXduYW5kOiBzaGFycHNsOiBGaXggZXh0ZXJuYWwg
dXNlIG9mIFNXIEhhbW1pbmcgRUNDCiAgICBoZWxwZXIiCiAgUmV2ZXJ0ICJtdGQ6IHJhd25hbmQ6
IG5kZmM6IEZpeCBleHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWluZyBFQ0MgaGVscGVyIgogIFJldmVy
dCAibXRkOiByYXduYW5kOiBscGMzMnh4X3NsYzogRml4IGV4dGVybmFsIHVzZSBvZiBTVyBIYW1t
aW5nIEVDQwogICAgaGVscGVyIgogIFJldmVydCAibXRkOiByYXduYW5kOiBjczU1M3g6IEZpeCBl
eHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWluZyBFQ0MKICAgIGhlbHBlciIKCiBkcml2ZXJzL210ZC9u
YW5kL2VjYy1zdy1oYW1taW5nLmMgIHwgIDcgKysrKy0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y3M1NTN4X25hbmQuYyB8IDEyICstLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNt
Y19uYW5kLmMgICB8ICA0ICsrKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMg
fCAxNSArLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25kZmMuYyAgICAgICAg
fCAxMiArLS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3NoYXJwc2wuYyAgICAgfCAx
MiArLS0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RtaW9fbmFuZC5jICAgfCAgOCAr
KystLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMgICB8ICA1ICsrLS0tCiA4
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQoKLS0gCjIu
MjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
