Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889C0C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA7920862
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KPC5Wn+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA7920862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKJW5I1AfUJIaV5GHBGf7IUDzEpxmqKN4xrBZ9xAcSo=; b=KPC5Wn+8aRwjCI
	O1JYxsu8qaXLfetLTJCLZA1Srrl9L55aMimfe4aDM2kW64bxzXlkdfS5Ni5tvaRpkvDmp8VVHW4vX
	G7oS6j8kAaEut02Odedy+3e+nLZiLOiCXwlRWUv49PudolY/j6diNiC+W1v9s9v6RSyHk4jb/DFHb
	JkFupqPUyNpX/Lfp5lLj7ZAV/mg9tl2BBH9Np2vDqZuS5N/2j45SCMTlsUTAyYA9iMXMjz3fQDjoY
	dLKgy8Jwohyk3ItBdUoTNdQhfi7cypdpIStuC1oZ7uFdeJmmMtBCD5VeNqlYycmeJ7zhKtvohZ56j
	qclGCNqMbPSijd+qOMCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMFq-00060Z-80; Fri, 04 Oct 2019 12:00:14 +0000
Received: from 12.mo5.mail-out.ovh.net ([46.105.39.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMFc-0004kL-NX
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:00:02 +0000
Received: from player792.ha.ovh.net (unknown [10.109.159.154])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3208124BFBC
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 13:59:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id DB408AA655F6;
 Fri,  4 Oct 2019 11:59:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Date: Fri,  4 Oct 2019 13:59:03 +0200
Message-Id: <20191004115919.20788-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3761068641438567347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050000_934926_0C97F5B6 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIHNlcmllcyBmaXJzdCBleHRlbmRzIHRoZSBzdXBwb3J0IGZvciB0aGUgQXNw
ZWVkIEFTVDI1MDAgYW5kCkFTVDI0MDAgU01DIGRyaXZlci4gSXQgYWRkcyBEdWFsIERhdGEgc3Vw
cG9ydCBhbmQgcmVhZCB0cmFpbmluZyBnaXZpbmcKdGhlIGJlc3QgcmVhZCBzZXR0aW5ncyBmb3Ig
YSBnaXZlbiBjaGlwLiBTdXBwb3J0IGZvciB0aGUgbmV3IEFTVDI2MDAKU29DIGlzIGFkZGVkIGF0
IHRoZSBlbmQuCgpJIHVuZGVyc3RhbmQgdGhhdCBhIG5ldyBzcGlfbWVtIGZyYW1ld29yayBleGlz
dHMgYW5kIEkgZG8gaGF2ZSBhbgpleHBlcmltZW50YWwgZHJpdmVyIHVzaW5nIGl0LiBCdXQgdW5m
b3J0dW5hdGVseSwgaXQgaXMgZGlmZmljdWx0IHRvCmludGVncmF0ZSB0aGUgcmVhZCB0cmFpbmlu
Zy4gVGhlIEFzcGVlZCBjb25zdHJhaW50cyBhcmUgbm90IGNvbXBhdGlibGUKYW5kIGkgaGF2ZW4n
dCBoYWQgdGhlIHRpbWUgdG8gZXh0ZW5kIHRoZSBjdXJyZW50IGZyYW1ld29yay4KClRoaXMgcGF0
Y2hzZXQgaGFzIGJlZW4gaW4gdXNlIGZvciBzb21lIHRpbWUgaW4gdGhlIE9wZW5CTUMga2VybmVs
IG9uCnRoZXNlIHN5c3RlbXMgOgoKICogT3BlblBPV0VSIFBhbG1ldHRvIChBU1QyNDAwKQogKiBF
dmFsdWF0aW9uIGJvYXJkIChBU1QyNTAwKSAKICogT3BlblBPV0VSIFdpdGhlcnNwb29uIChBU1Qy
NTAwKQogKiBPcGVuUE9XRVIgUm9tdWx1cyAoQVNUMjUwMCkKICogT3BlblBPV0VSIFphaXVzIChB
U1QyNTAwKQogICBhbmQgbWFueSBvdGhlcnMKIAphbmQgaXQgaXMgbm93IGluIHVzZSBvbiB0aGVz
ZSBib2FyZHMgd2l0aCB0aGUgbmV3IFNvQyA6CgogKiBFdmFsdWF0aW9uIGJvYXJkIChBU1QyNjAw
KSAKICogVGFjb21hIGJvYXJkIChBU1QyNjAwKSAKClRoYW5rcywKCkMuCgpBbGV4YW5kZXIgU29s
ZGF0b3YgKDEpOgogIG10ZDogc3BpLW5vcjogZml4IG9wdGlvbnMgZm9yIG14NjZsNTEyMzVmCgpD
w6lkcmljIExlIEdvYXRlciAoMTUpOgogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBVc2UgY29tbWFu
ZCBtb2RlIGZvciByZWFkcwogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBBZGQgc3VwcG9ydCBmb3Ig
U1BJIGR1YWwgSU8gcmVhZCBtb2RlCiAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IExpbmsgY29udHJv
bGxlciB3aXRoIHRoZSBhaGIgY2xvY2sKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogQWRkIHJlYWQg
dHJhaW5pbmcKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogTGltaXQgdGhlIG1heGltdW0gU1BJIGZy
ZXF1ZW5jeQogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBBZGQgc3VwcG9ydCBmb3IgdGhlIDRCIG9w
Y29kZXMKICBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IGZvciB3MjVxNTEyanYKICBtdGQ6IHNw
aS1ub3I6IGFzcGVlZDogSW50cm9kdWNlIGEgZmllbGQgZm9yIHRoZSBBSEIgcGh5c2ljYWwgYWRk
cmVzcwogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBJbnRyb2R1Y2Ugc2VnbWVudCBvcGVyYXRpb25z
CiAgZHQtYmluZGluZ3M6IG10ZDogYXNwZWVkLXNtYzogQWRkIG5ldyBjb21wdGF0aWJsZSBmb3Ig
QVNUMjYwMAogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0
aGUgQVNUMjYwMAogIG10ZDogc3BpLW5vcjogYXNwZWVkOiBDaGVjayBmb3IgZGlzYWJsZWQgc2Vn
bWVudHMgb24gdGhlIEFTVDI2MDAKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogSW50cm9kdWNlIHRy
YWluaW5nIG9wZXJhdGlvbnMgcGVyIHBsYXRmb3JtCiAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IElu
dHJvZHVjZSBhIEhDTEsgbWFzayBmb3IgdHJhaW5pbmcKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDog
QWRkIHJlYWQgdHJhaW5pbmcgc3VwcG9ydCBmb3IgdGhlIEFTVDI2MDAKCiBkcml2ZXJzL210ZC9z
cGktbm9yL2FzcGVlZC1zbWMuYyAgICAgICAgICAgICAgfCA1OTMgKysrKysrKysrKysrKysrKy0t
CiBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyAgICAgICAgICAgICAgICAgfCAgIDUgKy0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dCAgICB8ICAgMiArCiAz
IGZpbGVzIGNoYW5nZWQsIDU1MSBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCi0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
