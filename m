Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A5C38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:01:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E9D2083B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHDv/mCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E9D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ymawIIvPIFdl1oM7ELgKnJNuKdAWuBUbaACZ13ELdBg=; b=PHDv/mCauucSG6
	A/E5C8zOAwVNg+feCd908/rFJsbcEI3jjvD9imj+JuwZ7gkVvka7qCTTMVEJMc+cyKia4Z0Zje36O
	THeuGRT7RyCD4iuymeUkpIdm65jepTUrazaELzm+zphilW19VpewFp84ADLr8WAGCucJkqGuLeB1Q
	WbfyscD2bTc34RjlGOhrzLhlu5gYv12XiaRgBkyDt7UR4cv5/nnTUkpLvolhR4oiBhS6wpiybRvo1
	etX6LtiGUg4KnWzspY88H5tKFyWObki6wiJsqAix6HNjQljM6zAyubGC2pe9d5OlGHCYwr69gRGaB
	mpjEfoIIRhot9NCtUU9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWeGq-0004qd-JJ; Thu, 07 May 2020 11:00:52 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWeGo-0004pd-0m
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 11:00:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 935CF20004;
 Thu,  7 May 2020 11:00:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/8] New Arasan NAND controller driver
Date: Thu,  7 May 2020 13:00:26 +0200
Message-Id: <20200507110034.14736-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_040050_202299_8DD9BABC 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TmV3IEFyYXNhbiBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyCgpIZWxsbywKClRoaXMgaXMgYSBkZWVw
IHJld29yayBvZiBOYWdhJ3MgQXJhc2FuIE5BTkQgY29udHJvbGxlciBkcml2ZXIuIFRoaXMKdmVy
c2lvbiBpcyB0aGUgZmluYWwgdmVyc2lvbiBhbmQgd29ya3Mgd2l0aCBzb2Z0d2FyZSBFQ0MuIEl0
IHJlbGllcyBvbgphIHByZXZpb3VzIHNlcmllcyBjYWxsZWQgIlN1cHBvcnRpbmcgcmVzdHJpY3Rl
ZCBOQU5EIGNvbnRyb2xsZXJzIiB0aGF0CmJyaW5ncyBtb3JlIGZsZXhpYmlsaXR5IHRvIHRoZSBO
QU5EIHdpdGggdGhlIGdvYWwgdG8gc3VwcG9ydApyZXN0cmljdGVkIGNvbnRyb2xsZXJzIGxpa2Ug
dGhpcyBvbmUuCgpDaGVlcnMsCk1pcXXDqGwKCkNoYW5nZXMgaW4gdjM6CiogUHJlZml4IHNwZWNp
ZmljIGNsb2NrIGRlZmluaXRpb25zIHdpdGggWExOWCBhcyB0aGV5IGRvIG5vdCBhcHBseSBmb3IK
ICBhbnkgb3RoZXIgU29DIGFuZCBhcmUgYXR0YWNoZWQgdG8gYSBzaW5nbGUgY29tcGF0aWJsZS4K
KiBVc2VkIGZpZWxkIGdldHRlcnMvc2V0dGVycyBhcyBkZWZpbmVkIGluIGJpdGZpZWxkLmguCiog
Rm9yY2UgY2FzdGluZyB0byB1MzIgYmVmb3JlIHNoaWZ0aW5nIHU4IHZhbHVlcyBieSA4IDE2IG9y
IDI0IGJpdHMuCiogQ29tcGx5IHdpdGggdGhlIHJlY2VudCBjb3JlIGNoYW5nZXMgYW5kIHNlbGVj
dCBtYW51YWxseQogIG5hbmRfbW9ub2xpdGhpY19yZWFkL3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVy
cy4KKiBBZGQgTUFJTlRBSU5FUiBwYXRjaC4KKiBBZGQgYSBiaXQgZXh0cmFjdGlvbiBoZWxwZXIg
aW4gdGhlIGNvcmUuCiogUmVuYW1lIEJDSCBmdW5jdGlvbnMuCiogQWRkIGEgc3dhcHBpbmcgYml0
IG1lY2hhbmlzbSB0byBCQ0guCiogU3VwcG9ydCB0aGUgaGFyZHdhcmUgRUNDIGVuZ2luZS4KCkNo
YW5nZXMgaW4gdjI6CiogV29ya2luZyAtPmV4ZWNfb3AoKSBpbXBsZW1lbnRhdGlvbiByZWx5aW5n
IG9uIGNvcmUgY2hhbmdlcy4KKiBEcm9wcGVkIHRoZSBFQ0Mgc3VwcG9ydCBmb3Igbm93LCB3aWxs
IGJlIHBhcnQgb2YgYW5vdGhlciBzZXJpZXMgaWYKICB0aGlzIHBhdGNoIGlzIGFjY2VwdGVkLgoK
Qm9yaXMgQnJlemlsbG9uICgxKToKICBsaWIvYmNoOiBBbGxvdyBlYXN5IGJpdCBzd2FwcGluZwoK
TWlxdWVsIFJheW5hbCAoNyk6CiAgbGliL2JjaDogUmV3b3JrIGEgbGl0dGxlIGJpdCB0aGUgZXhw
b3J0ZWQgZnVuY3Rpb24gbmFtZXMKICBtdGQ6IHJhd25hbmQ6IEVuc3VyZSB0aGUgbnVtYmVyIG9m
IGJpdGZsaXBzIGlzIGNvbnNpc3RlbnQKICBtdGQ6IHJhd25hbmQ6IEFkZCBuYW5kX2V4dHJhY3Rf
Yml0cygpCiAgTUFJTlRBSU5FUlM6IEFkZCBBcmFzYW4gTkFORCBjb250cm9sbGVyIGFuZCBiaW5k
aW5ncwogIGR0LWJpbmRpbmdzOiBtdGQ6IERvY3VtZW50IEFSQVNBTiBOQU5EIGJpbmRpbmdzCiAg
bXRkOiByYXduYW5kOiBhcmFzYW46IEFkZCBuZXcgQXJhc2FuIE5BTkQgY29udHJvbGxlcgogIG10
ZDogcmF3bmFuZDogYXJhc2FuOiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBCQ0ggRUNDIGVuZ2luZQoK
IC4uLi9iaW5kaW5ncy9tdGQvYXJhc2FuLG5hbmQtY29udHJvbGxlci55YW1sICB8ICAgNjMgKwog
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArCiBk
cml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmMgICAgICAgICAgICAgICAgICAgfCAgIDEwICstCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRy
aXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJp
dmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMTIwNyArKysrKysr
KysrKysrKysrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgICAg
IHwgICA0MSArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iY2guYyAgICAgICAgICAgICAg
IHwgICAxMCArLQogaW5jbHVkZS9saW51eC9iY2guaCAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgOSArLQogaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgICAgICAgICAgICAg
IHwgICAgNCArCiBsaWIvYmNoLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTQ4ICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNDQzIGluc2VydGlvbnMoKyksIDY0IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYXJhc2FuLG5hbmQtY29udHJvbGxlci55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCgotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
