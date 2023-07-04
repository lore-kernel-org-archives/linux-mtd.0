Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F2EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0wyatw0sqPbQnFzNk7aeplp3HfAu7wbX2pVYa/G+eA0=; b=42jNUgyacNf+W2
	zJZDqDd5vY9OF1BAM4AzFkDdUy3o+hXbS/ekNlPqxxsXTHE/3XIqZqPnq43Yf+eMlAA77i5Ry6Srx
	s3th5uwDf2OGobbSuJKnwqSmHCXn1jfi6voj8AeHeWeKbKppUqjjjE2s8T4nMCruBKMKSENhLcO6e
	T8lx9fgJi6Nz5H6BQhSe8u//t0ZjTOQrOptZRd0/LuezrgCUwueEInARqvfRZ1w3RlM4KdxNa7uIh
	xMWwrhXpozv4WL7f8f0uUNWQyyfvUnufEAtXP5dlKLODvJiNttQjKDr81jjSLKsp1ge1Fmh0IsdcD
	BM9/0yjYe0GzPhUm4DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdPv-00Cto4-0j;
	Tue, 04 Jul 2023 10:37:55 +0000
Received: from smtprelay07.ispgateway.de ([134.119.228.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdPr-00Ctmn-1W
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 10:37:53 +0000
Received: from [89.1.81.74] (helo=ipc1.ka-ro)
	by smtprelay07.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <LW@KARO-electronics.de>)
	id 1qGdPk-00012Z-CS; Tue, 04 Jul 2023 12:37:44 +0200
Date: Tue, 4 Jul 2023 12:37:43 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Felix Matouschek <felix@matouschek.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC] Bad ecc layout in drivers/mtd/nand/spi/xtx.c
Message-ID: <20230704123743.7f4c87af@ipc1.ka-ro>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
X-Df-Sender: bHdAa2Fyby1lbGVjdHJvbmljcy5kb21haW5mYWN0b3J5LWt1bmRlLmRl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_033751_516064_8B8C96CB 
X-CRM114-Status: GOOD (  10.50  )
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

SGksCgp3aGlsZSB0cnlpbmcgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSAnWFQyNkcwMUMnIHZhcmlh
bnQgb2YgdGhlIFhUWApTUEktbmFuZCBjaGlwIEkgbm90aWNlZCBhIGZsYXcgaW4gdGhlIEVDQyBs
YXlvdXQgb2YgdGhlIGV4aXN0aW5nCmRyaXZlci4KQWNjb3JkaW5nIHRvIHRoZSAgWFQyNkcwMUEg
ZGF0YXNoZWV0IHRoZSBmaXJzdCBlaWdodCBieXRlcyBvZiB0aGUgT09CCmFyZWEgYXJlIG5vdCBw
cm90ZWN0ZWQgYnkgRUNDOgpPZmZzZXQgICAgICBFQ0MgIEJ5dGVzICBBcmVhICAgICAgICAgICAg
ICAgRGVzY3JpcHRpb24KODAwSCA4MDdIICAgIE5vICAgICAgOCAgU3BhcmUgNCwgR3JvdXAgRSAg
IFRoaXMgQXJlYSBpcyBub3QgY292ZXJlZCBieSBpbnRlcm5hbCBFQ0MsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4MDBIIGlzIHJlc2VydmVkIGZvciBiYWQgYmxv
Y2sgbWFyayAgICAgICAgCjgwOEggODJGSCAgIFllcyA0MCBTcGFyZSA1ICwgR3JvdXAgRiAgICAg
ICBVc2VyIE1ldGEgRGF0YSBBcmVhIGNvdmVyZWQgYnkgaW50ZXJuYWwgRUNDLgo4MzBIIDgzRkgg
ICAgTm8gMTYgU3BhcmUgNiAsIEdyb3VwIEcgICAgICAgRUNDX0VOPTE6IHRoaXMgYXJlYSBjb250
YWlucyBJbnRlcm5hbCBFQ0MgRGF0YSwgUmVhZC1Pbmx5LAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUHJvZ3JhbW1pbmcgdG8gdGhpcyBhcmVhIHdpbGwgYmUgaWdu
b3JlZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUNDX0VOPTA6
IHRoaXMgYXJlYSBpcyB3cml0YWJsZSBmb3IgdXNlcgoKQnV0IHRoZSBkcml2ZXIgZGVmaW5lcyBi
eXRlcyAxLi40NyBhcyB1c2VyIE9PQiBhcmVhOgp8c3RhdGljIGludCB4dDI2ZzB4YV9vb2JsYXlv
dXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCnwJCQkJICAgc3RydWN0
IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCnx7CnwJaWYgKHNlY3Rpb24pCnwJCXJldHVybiAtRVJB
TkdFOwp8CnwJcmVnaW9uLT5vZmZzZXQgPSAxOwp8CXJlZ2lvbi0+bGVuZ3RoID0gNDc7CnwKfAly
ZXR1cm4gMDsKfH0KCklNTyB0aGlzIHNob3VsZCBiZToKfAlyZWdpb24tPm9mZnNldCA9IDg7CnwJ
cmVnaW9uLT5sZW5ndGggPSA0MDsKdG8gaGF2ZSB0aGUgd2hvbGUgdXNlciBvb2IgYXJlYSBwcm90
ZWN0ZWQgYnkgRUNDLgoKT2J2aW91c2x5IHRoaXMgY2Fubm90IHNpbXBseSBiZSBjaGFuZ2VkIGlu
IHRoZSBkcml2ZXIgYmVjYXVzZSBpdCB3b3VsZApicmVhayBhY2Nlc3MgdG8gZmxhc2ggdGhhdCB3
YXMgcHJvZ3JhbW1lZCB3aXRoIHRoZSBjdXJyZW50IHBhcmFtZXRlcnMuClNpbmNlIHRoZSBkYXRh
IHN0cnVjdHVyZXMgdGhhdCBwcm92aWRlIHRoZSBvb2IgbGF5b3V0IGFyZSBjb21wbGV0ZWx5CnN0
YXRpYyBhbmQgY2Fubm90IGJlIG1vZGlmaWVkIGF0IHJ1bnRpbWUgKGUuZy4gZGVwZW5kaW5nIG9u
IHNvbWUgRFRCCnByb3BlcnR5KSB0aGUgb25seSB3YXkgSSBzZWUgdG8gcHJvdmlkZSBhIGxheW91
dCB3aXRoIEVDQyBwcm90ZWN0aW9uCmZvciB0aGUgd2hvbGUgdXNlciBtZXRhZGF0YSB3b3VsZCBi
ZSBhIEtjb25maWcgb3B0aW9uIHRvIHNlbGVjdCBvbmUgb3IKdGhlIG90aGVyIGxheW91dCBhdCBj
b21waWxlIHRpbWUuCgpBbnkgY29tbWVudHMgb3IgYmV0dGVyIGlkZWFzPwoKCgpMb3RoYXIgV2HD
n21hbm4KLS0gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCgpLYS1SbyBlbGVjdHJvbmljcyBHbWJIIHwgUGFzY2Fsc3RyYcOfZSAyMiB8
IEQgLSA1MjA3NiBBYWNoZW4KUGhvbmU6ICs0OSAyNDA4IDE0MDItMCB8IEZheDogKzQ5IDI0MDgg
MTQwMi0xMApHZXNjaMOkZnRzZsO8aHJlcjogTWF0dGhpYXMgS2F1c3NlbgpIYW5kZWxzcmVnaXN0
ZXJlaW50cmFnOiBBbXRzZ2VyaWNodCBBYWNoZW4sIEhSQiA0OTk2Cgp3d3cua2Fyby1lbGVjdHJv
bmljcy5kZSB8IGluZm9Aa2Fyby1lbGVjdHJvbmljcy5kZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
