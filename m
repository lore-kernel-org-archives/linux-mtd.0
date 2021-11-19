Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8B8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A481F60E93
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A481F60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owA+OjH/oqVGiPxNMPAOsX2ZzrL0AFBHxVg3P5jb7OQ=; b=XsIHaPeZyqSXKO
	R0YUJW/PsmrVMXeispLzz5fMN6xtupXiNgWq0wOo19WjoBGbW6Ml94cvEHpQxm164cq6QAxyPiVsB
	8RBFeeTJkHfE6d4ewCThCenUxQOjPCkP4vQ7eDjWBE+kggctsTLx/zb4XX2TERbVtEYk8tAyRuv0E
	GqRWRi/yrgBtPQsLd2kcPZk/fzeeugRescskaMnVJFNbHZEoZ6ebHkU8Qs0qmUb/QnnS5G0uO8qh2
	Wxa0c4J6a4grGVp79gf4EPWhEoM8aJ83aw8Zc4Vjsr8s+/g+onHboSAUTyaFUKn9YOT1VVtgWlEnw
	K6lUFD2gF4+q78fe3eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnz67-009ja0-5I; Fri, 19 Nov 2021 08:18:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnz64-009jYW-1E
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 08:18:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 04858FF804;
 Fri, 19 Nov 2021 08:18:07 +0000 (UTC)
Date: Fri, 19 Nov 2021 09:18:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Fix nand_erase_op delay
Message-ID: <20211119091806.76900103@xps13>
In-Reply-To: <20211119073909.1492538-2-herve.codina@bootlin.com>
References: <20211119073909.1492538-1-herve.codina@bootlin.com>
 <20211119073909.1492538-2-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_001812_252737_30EA9919 
X-CRM114-Status: GOOD (  13.80  )
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

SGkgSGVydmUsCgpoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAxOSBOb3Yg
MjAyMSAwODozOTowNiArMDEwMDoKCj4gTkFORF9PUF9DTUQoKSBleHBlY3QgYSBkZWxheSBwYXJh
bWV0ZXIgaW4gbmFub3NlY29uZHMuCgpleHBlY3RzCgo+IFRoZSBkZWxheSB2YWx1ZSBpcyB3cm9u
Z2x5IGdpdmVuIGluIG1pbGxpc2Vjb25kcy4KPiAKPiBGaXggdGhlIGNvbnZlcnNpb24gbWFjcm8g
dXNlZCBpbiBvcmRlciB0byBzZXQgdGhpcwo+IGRlbGF5IGluIG5hbm9zZWNvbmRzLgo+IAoKSSBi
ZWxpZXZlIHlvdSBzdGlsbCBtaXNzIHRoZSBGaXhlczogdGFnIGhlcmUgOikKCj4gU2lnbmVkLW9m
Zi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyB2MSAtPiB2MjoKPiAtIENvbW1pdCBsb2cgcmV3b3JkCj4gCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IDNk
NmM2ZTg4MDUyMC4uNWM2YjA2NTgzN2VmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMK
PiBAQCAtMTgzNyw3ICsxODM3LDcgQEAgaW50IG5hbmRfZXJhc2Vfb3Aoc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwgdW5zaWduZWQgaW50IGVyYXNlYmxvY2spCj4gIAkJCU5BTkRfT1BfQ01EKE5BTkRf
Q01EX0VSQVNFMSwgMCksCj4gIAkJCU5BTkRfT1BfQUREUigyLCBhZGRycywgMCksCj4gIAkJCU5B
TkRfT1BfQ01EKE5BTkRfQ01EX0VSQVNFMiwKPiAtCQkJCSAgICBOQU5EX0NPTU1PTl9USU1JTkdf
TVMoY29uZiwgdFdCX21heCkpLAo+ICsJCQkJICAgIE5BTkRfQ09NTU9OX1RJTUlOR19OUyhjb25m
LCB0V0JfbWF4KSksCj4gIAkJCU5BTkRfT1BfV0FJVF9SRFkoTkFORF9DT01NT05fVElNSU5HX01T
KGNvbmYsIHRCRVJTX21heCksCj4gIAkJCQkJIDApLAo+ICAJCX07CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
