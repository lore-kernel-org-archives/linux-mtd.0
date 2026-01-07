Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934BECFD626
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cfL9GeuIlcJY3UO/PIFMMhi9tVqnS0MrxmFvP2wn3Mk=; b=1OVgq7XBINT6H+
	lLtLzXd+wte6ji845RHx9+eW1EJzKsUlrRM8RYTQAP+sku0UW7gdSB4+wkVk+Y9rKf8XWx6jLkfsC
	6LtVo2m/vPDX8pUixP8AHMM5wXd6Yh3hcr33DiFK9t8SFEJuiBjZDN1Ki/K0BzbpRHVmSLZlBHPru
	ZPJMW8lkviiJve3cBqPY8iSWeYf/0FHP7rGQnVtkJPnbFw72QUAlV3BTtoEw58GAk0gnzb4wUZgPO
	r9xWfdStJU6Hf9SaaGxKcU41XPBhOAOcrK4cvLBDp+OBkoHppowuq77FTEXV4g6NkAp6vMaYTlEFw
	fJ12NVy8Kb9KOkeH/h/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE6-0000000Ex3M-3wvG;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTDz-0000000Ex12-2rqd;
	Wed, 07 Jan 2026 13:05:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42AC64E41EAA;
	Wed,  7 Jan 2026 13:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1559F606F8;
	Wed,  7 Jan 2026 13:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F302103C821A;
	Wed,  7 Jan 2026 14:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1ga9hgoLz/9NRUhVBfHrCw/F/qtxibREvdnxc5/TAuU=;
	b=dJa/3HBT2YYvgkLM+gr+n0s+1sPAl5nAgRbJfk3suFGpcKg/ezPW02AwahlEfdNPkG6KcV
	BrFwkDye8tRMNiMV7V6t2fWhuf9AmsRwMmqXOkli46Y/ru1+xx2PnmwHnniAtNWG4fPRGj
	itFHyltR0rL3lE/c/1Yakndj7XXbwYfy5rmOP3lwN/Wset1UhinZd8ZQZWUxCEq3DrXNZO
	X9GFkvjBTATGLhgoQwey7G7PTa012c6IwHyr8QjLYtOvAhvSBE26AIlj9C+5uL3zgO0CrN
	1UoBg1dWM7X6j39iz+IzMhpvgcGBBO7ePBqBLcDNjPWRrKhooiuLIN7EMDkp+w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/4] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Wed, 07 Jan 2026 14:04:51 +0100
Message-Id: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPNZXmkC/3WMwQ7CIBAFf8XsWQwLUqon/8N4aGHbkkgx0BBN0
 3+X9qQmHuflzcyQKDpKcN7NECm75MJYQO53YIZm7Ik5WxgEFwoRNfOTZZ58pL48WV1LbtBazQ1
 BcR6ROvfcetdb4cGlKcTXls+4rv9KGRlnupWqQjT61FSXNoTp7saDCR7WVhYfvsBfXxTfKCVVZ
 w21dPz2l2V5Aw0XtN/sAAAA
X-Change-ID: 20251117-mtd-memregion-8830c1dd70ce
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20260107_050520_221915_23B58F28 
X-CRM114-Status: GOOD (  12.02  )
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
Z3MgYXJlCmV4dGVuZGVkIHRvIGFsbG93IG1lbW9yeS1yZWdpb24gZm9yIFJBTSBhY2Nlc3MsIGFu
ZCB0aGUgcGh5c21hcCBkcml2ZXIKaXMgbW9kaWZpZWQgdG8gdXNlIHRoZXNlIHJlZ2lvbnMuCgpH
cmVnb3J5CgpTaWduZWQtb2ZmLWJ5OiBHcmVnb3J5IENMRU1FTlQgPGdyZWdvcnkuY2xlbWVudEBi
b290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6CgotIEZpeCB0aGUgcGxhY2VtZW50IG9mIHRo
ZSBfX2ZyZWUoKSBhbm5vdGF0aW9uIGluIHBhdGNoIDQsIGFuZCBhbHNvCiAgYWRkcmVzcyB0aGUg
c2FtZSBpc3N1ZSBpbiB0aGUgY3VycmVudCBjb2RlYmFzZSB3aXRoIHBhdGNoIDEuCi0gQWRkIE1U
RCBwcm9wZXJ0aWVzIGRpcmVjdGx5IGludG8gL3Jlc2VydmVkLW1lbW9yeSBub2RlcywgYXMKICBz
dWdnZXN0ZWQgYnkgUm9iLgotIFJlYmFzZSBvbiB2Ni4xOS1yYzEKLSBMaW5rIHRvIHYyOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMTIxLW10ZC1tZW1yZWdpb24tdjItMC1jNTUzNWZk
Y2ViZTRAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjI6CgotIFByb3Blcmx5IG1hbmFnZWQgY2Fz
ZXMgd2hlcmUgcmVnaXN0ZXIgZW50cmllcyB1c2VkIGJ5IHRoZSBtZW1vcnkKICByZWdpb24gYXJl
IG91dCBvZiBvcmRlciwgcGFydGljdWxhcmx5IHdoZW4gb25lIG9yIG1vcmUgcmVnaXN0ZXIKICBl
bnRyaWVzIGFyZSBtaXhlZCB3aXRoIG1lbW9yeSByZWdpb24gZW50cmllcyBpbiBhbiBvdGhlciBu
b2RlLgotIFVzZWQgIm1lbWxvZyIgYXMgdGhlIG5vZGUgbmFtZSBpbnN0ZWFkIG9mICJzcmFtLCIg
d2hpY2ggd2FzIG1pc2xlYWRpbmcuCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MTExNy1tdGQtbWVtcmVnaW9uLXYxLTAtN2IzNTYxMWM3OWE2QGJvb3RsaW4uY29t
CgotLS0KR3JlZ29yeSBDTEVNRU5UICg0KToKICAgICAgb2Y6IHJlc2VydmVkX21lbTogRml4IHBs
YWNlbWVudCBvZiBfX2ZyZWUoKSBhbm5vdGF0aW9uCiAgICAgIG9mOiByZXNlcnZlZF9tZW06IFN1
cHBvcnQgbXVsdGlwbGUgJ3JlZycgZW50cmllcyBmb3IgbWVtb3J5LXJlZ2lvbgogICAgICBkdC1i
aW5kaW5nczogbXRkOiBwaHlzbWFwOiBBbGxvdyB1c2luZyBtZW1vcnktcmVnaW9uIHRvIGFjY2Vz
cyBtZW1vcnkgcmVzb3VyY2VzCiAgICAgIG10ZDogcGh5c21hcDogQWRkIHN1cHBvcnQgZm9yIFJB
TSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9t
dGQtcGh5c21hcC55YW1sICAgICAgIHwgIDY5ICsrKysrKystLS0KIGRyaXZlcnMvbXRkL21hcHMv
cGh5c21hcC1jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgIDczICsrKysrKysrLS0KIGRyaXZl
cnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTUwICsrKysr
KysrKysrKysrKysrKy0tLQogZHJpdmVycy9vZi9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS9saW51eC9vZl9yZXNlcnZlZF9tZW0uaCAgICAg
ICAgICAgICAgICAgICAgfCAgIDQgKwogNSBmaWxlcyBjaGFuZ2VkLCAyNTIgaW5zZXJ0aW9ucygr
KSwgNDYgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5
N2NjZWQ4ZDBkMDQwMjdjYjFlOApjaGFuZ2UtaWQ6IDIwMjUxMTE3LW10ZC1tZW1yZWdpb24tODgz
MGMxZGQ3MGNlCgpCZXN0IHJlZ2FyZHMsCi0tIApHcsOpZ29yeSBDTEVNRU5ULCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
