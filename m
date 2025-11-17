Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3665CEBF61
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vIjh1+vunZz6L2bB+LBcPK5XTgF6cqSUwl3N/fv0i/Y=; b=eRwIKGVNPx/0VM
	SxG04i5FphRYWuGOvU1b7kzqpkDcq7ohAAF8ZJF/AL+q5H78g1R4fuYZH5WLm6viOOvhTzHXxXFtJ
	VI3oU+WKyStKQkmO9Y4LbNGfdp0FkAlXdcblCA4UEGxoZu2XO6FeWxDv+fZgqVijyXdA+UfUzJvgx
	uCCoIVGNVR1DnQNZ3I8ueoVb0CD5eqNrwePKywN8btC1WE9GV+R8bOvyl+blEavC4+pJDOinrmuBu
	iANi9RVGSiSHDvv0btt0AKSwQP30BTy/XvM2OfPMayoNmJ1o0IlvQ+Z3tvfQTXaVxlY3xTlrRU4bd
	nWL7F1jKkdEdYTnv8piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ak-0000000GRjK-2H17;
	Mon, 17 Nov 2025 17:00:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ae-0000000GRfW-0SMg
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 17:00:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 39B941A1A33;
	Mon, 17 Nov 2025 17:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F0AA606B9;
	Mon, 17 Nov 2025 17:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B7F510371894;
	Mon, 17 Nov 2025 18:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763398826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JXCaUs8U/JNspRHlN3rFEQiKScpBbxa26neT4DytoGQ=;
	b=EKFokzddJv+9jr2XFsIb2dkNyIwhhthpKzNrS/o35e2YJRysHcw4GGO1Jpy/WdQv6mMEX2
	ETgbo1oYpSas9p216gPRGy9d8jeIsclM0VObnKkPkNrXkLdYegb2EKHytN63ruot3AQ1QJ
	6P9SjSjnbJAv8XP3We42dJAWgewBKciG//LuA2+0jIXzrx95ztSqcvMBwR0Z/ejbRfmUvk
	BMxoZd/J2dcfcHnlj+lC5VlMGaNM+VQv2NU+ywsQtdufZubJUpQ6frDm8Nl8EqZl1aYqoy
	vxkqnAIvyNrCw+KfGesBrY22i+fhCxMmh1s6KMtCaZB46OMK5piAPWQDq81+/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Mon, 17 Nov 2025 18:00:13 +0100
Message-Id: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ5UG2kC/x2MQQqAIBAAvyJ7TnCNUPpKdAjdbA9aaEQg/j3pO
 DAzFQplpgKzqJDp4cJn6oCDAHdsKZBk3xm00hMiGhlvLyPFTKGb0tpROfTeKEfQmyvTzu//W9b
 WPpkOQ69fAAAA
X-Change-ID: 20251117-mtd-memregion-8830c1dd70ce
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_090032_286255_569571BB 
X-CRM114-Status: UNSURE (   9.35  )
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

SGVsbG8sCgpXaGlsZSB3b3JraW5nIG9uIGFkZGluZyByZXNlcnZlZCBSQU0gc3VwcG9ydCB0byB0
aGUgTVREIHBoeXNtYXAKZHJpdmVyLCBJIGVuY291bnRlcmVkIGEgbGltaXRhdGlvbiBpbiB0aGUg
a2VybmVsJ3MgcmVzZXJ2ZWQgbWVtb3J5CnN1cHBvcnQ6IGFsdGhvdWdoIHRoZSBEZXZpY2UgVHJl
ZSBzcGVjaWZpY2F0aW9uIGFsbG93cyBtdWx0aXBsZSByZWcKZW50cmllcyBmb3IgYSBtZW1vcnkt
cmVnaW9uIG5vZGUsIHRoZSBrZXJuZWwgb25seSBwcm9jZXNzZWQgdGhlIGZpcnN0Cm9uZS4gVGhp
cyBsaW1pdGF0aW9uIHByZXZlbnRlZCBwcm9wZXIgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQgUkFNIHJl
Z2lvbnMKaW4gTVRELgoKVGhpcyBzZXJpZXMgYWRkcmVzc2VzIGJvdGggaXNzdWVzOgoKRmlyc3Qs
IHRoZSByZXNlcnZlZCBtZW1vcnkgc3VwcG9ydCBpcyBleHRlbmRlZCB0byBmdWxseSBzdXBwb3J0
Cm11bHRpcGxlIHJlZyBlbnRyaWVzIHBlciBtZW1vcnktcmVnaW9uIG5vZGUsIGVuc3VyaW5nIGNv
bXBsaWFuY2Ugd2l0aAp0aGUgRGV2aWNlIFRyZWUgc3BlY2lmaWNhdGlvbi4KClRoZW4sIHdpdGgg
dGhpcyBmb3VuZGF0aW9uIGluIHBsYWNlLCB0aGUgc2VyaWVzIHVwZGF0ZXMgdGhlIE1URApwaHlz
bWFwIGRyaXZlciB0byBzdXBwb3J0IHJlc2VydmVkIFJBTSByZWdpb25zLiBUaGUgRFQgYmluZGlu
Z3MgYXJlCmV4dGVuZGVkIHRvIGFsbG93IG1lbW9yeS1yZWdpb24gcGhhbmRsZXMgZm9yIFJBTSBh
Y2Nlc3MsIGFuZCB0aGUKcGh5c21hcCBkcml2ZXIgaXMgbW9kaWZpZWQgdG8gdXNlIHRoZXNlIHJl
Z2lvbnMuCgpHcmVnb3J5CgpTaWduZWQtb2ZmLWJ5OiBHcmVnb3J5IENMRU1FTlQgPGdyZWdvcnku
Y2xlbWVudEBib290bGluLmNvbT4KLS0tCkdyZWdvcnkgQ0xFTUVOVCAoMyk6CiAgICAgIG9mOiBy
ZXNlcnZlZF9tZW06IFN1cHBvcnQgbXVsdGlwbGUgJ3JlZycgZW50cmllcyBmb3IgbWVtb3J5LXJl
Z2lvbgogICAgICBkdC1iaW5kaW5nczogbXRkOiBwaHlzbWFwOiBBbGxvdyB1c2luZyBtZW1vcnkt
cmVnaW9uIHRvIGFjY2VzcyBtZW1vcnkgcmVzb3VyY2VzCiAgICAgIG10ZDogcGh5c21hcDogQWRk
IHN1cHBvcnQgZm9yIFJBTSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9tdGQtcGh5c21hcC55YW1sICAgICAgIHwgIDU5ICsrKysrKy0tLQogZHJp
dmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAgNTYgKysr
KysrLS0KIGRyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgMTQxICsrKysrKysrKysrKysrKysrKystLQogaW5jbHVkZS9saW51eC9vZl9yZXNlcnZlZF9t
ZW0uaCAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogNCBmaWxlcyBjaGFuZ2VkLCAyMjAgaW5z
ZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogYjU1ZDQyNmMzOTBm
MmE0NzYyYjJhODhiMTEzY2M0NGMzN2UwOGU0NgpjaGFuZ2UtaWQ6IDIwMjUxMTE3LW10ZC1tZW1y
ZWdpb24tODgzMGMxZGQ3MGNlCgpCZXN0IHJlZ2FyZHMsCi0tIApHcsOpZ29yeSBDTEVNRU5ULCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
