Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76210ECE58E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 14:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAE42089C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 14:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5PGh2Ph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAE42089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00zdZ4nV/18zOUyevVKVfo80y8obtgDx9/sH7Z/ZlEA=; b=c5PGh2PhQW8EWa
	tqUJ1z7ahfywQdg8Pj9eJ+FBvllG/H956sJLyHksx2Os45jOy6IpbI89ZITcWhEeBtB0Gpsxn1z1Y
	wusOYPAe/R6V2kdaeAjg8F6GtfvM2Y8BZjjrbGG8MLs6cPXtVZIRkjzSX8LwPaZg9Xn7C1kQtRUa8
	XWbtl0faDXkeI/rfz3re01BR9/lzsQKIcYrsOe9sDMyK6khyKKfumERIzP+De87e733yb3ikO5p0J
	1pbBUKN3l4/dvU58Jx5sd5gP5+FAfZUphqnWkbAccZrgFLwHsZ9kJ0EnyGi5FClwYCTj1BQzL9izq
	/dtQLpI2Z08cJtPkYn+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL6g4-0005Lg-MW; Thu, 17 Oct 2019 14:22:56 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL6fm-0004zC-S1
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 14:22:41 +0000
Received: from xps13.stephanxp.local (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E5035200009;
 Thu, 17 Oct 2019 14:22:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: mtd/ubi/ubifs: Remove inactive maintainers
Date: Thu, 17 Oct 2019 16:22:29 +0200
Message-Id: <20191017142229.3853-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_072239_057840_DD9CAAA1 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RGVzcGl0ZSB0aGVpciBzdWJzdGFudGlhbCBwZXJzb25hbCBpbnZlc3RtZW50IGluIHRoZSBNVEQv
VUJJL1VCSUZTIGEKZmV3IHllYXJzIGJhY2ssIERhdmlkLCBCcmlhbiwgQXJ0ZW0gYW5kIEFkcmlh
biBhcmUgbm90IGFjdGl2ZWx5Cm1haW50YWluaW5nIHRoZSBzdWJzeXN0ZW0gYW55bW9yZS4gV2Ug
d2FybWx5IHNhbHV0ZSB0aGVtIGZvciBhbGwgdGhlCndvcmsgdGhleSBoYXZlIGFjaGlldmVkIGFu
ZCB3aWxsIG9mIGNvdXJzZSBzdGlsbCB3ZWxjb21lIHRoZWlyCnBhcnRpY2lwYXRpb24gYW5kIHJl
dmlld3MuCgpUaGF0IHNhaWQsIE1hcmVrIHJldGlyZWQgaGltc2VsZiBhIGZldyB3ZWVrcyBhZ28g
cXVvdGluZyBIYXJhbGQgWzFdOgoKICAgICAgICBJdCBtYXR0ZXJzIHdobyBoYXMgd2hpY2ggdGl0
bGUgYW5kIHdoZW4uIFNob3VsZCBzb21lYm9keSBub3QKICAgICAgICBiZSBhbiBhY3RpdmUgbWFp
bnRhaW5lciwgbWFrZSBzdXJlIGhlJ3Mgbm90IGxpc3RlZCBhcyBzdWNoLgoKRm9yIHRoaXMgc2Ft
ZSByZWFzb24sIGxldOKAmXMgdHJpbSB0aGUgbWFpbnRhaW5lcnMgbGlzdCB3aXRoIHRoZQphY3R1
YWxseSBhY3RpdmUgb25lcyBvdmVyIHRoZSBwYXN0IHR3byB5ZWFycy4KClsxXSBodHRwOi8vbGFm
b3JnZS5nbnVtb25rcy5vcmcvYmxvZy8yMDE4MDMwNy1tY2hhcmR5LWdwbC8KCkNjOiBEYXZpZCBX
b29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+CkNjOiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVy
c2ZvcnBlYWNlQGdtYWlsLmNvbT4KQ2M6IEFydGVtIEJpdHl1dHNraXkgPGRlZGVraW5kMUBnbWFp
bC5jb20+CkNjOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KQ2M6IE1h
cmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+CkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFR1ZG9y
IEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8
IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMDYzMjQyMmNlOWQ0Li4wZTVlMDczNmVlNTUg
MTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMDUyOCw4ICsx
MDUyOCw2IEBAIEY6CWluY2x1ZGUvbGludXgvdm1hbGxvYy5oCiBGOgltbS8KIAogTUVNT1JZIFRF
Q0hOT0xPR1kgREVWSUNFUyAoTVREKQotTToJRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRl
YWQub3JnPgotTToJQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+CiBN
OglNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgogTToJUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KIE06CVZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25l
c2hyQHRpLmNvbT4KQEAgLTE2NTc5LDggKzE2NTc3LDYgQEAgRjoJZHJpdmVycy9tZWRpYS9wY2kv
dHc2ODZ4LwogCiBVQkkgRklMRSBTWVNURU0gKFVCSUZTKQogTToJUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KLU06CUFydGVtIEJpdHl1dHNraXkgPGRlZGVraW5kMUBnbWFpbC5j
b20+Ci1NOglBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KIEw6CWxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCiBUOglnaXQgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcv
dWJpZnMtMi42LmdpdAogVzoJaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2Mv
dWJpZnMuaHRtbApAQCAtMTY2OTcsNyArMTY2OTMsNiBAQCBTOglNYWludGFpbmVkCiBGOglkcml2
ZXJzL3Njc2kvdWZzL3Vmcy1tZWRpYXRlayoKIAogVU5TT1JURUQgQkxPQ0sgSU1BR0VTIChVQkkp
Ci1NOglBcnRlbSBCaXR5dXRza2l5IDxkZWRla2luZDFAZ21haWwuY29tPgogTToJUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KIFc6CWh0dHA6Ly93d3cubGludXgtbXRkLmluZnJh
ZGVhZC5vcmcvCiBMOglsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
