Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAC2CFC28B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Nov 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/I+dkYVNlwYf5XG6UgxpCoftsO9DQ+qKRWg76WjMles=; b=AHLBlrlzDAoKgA
	GykGd3N+HqhmyMk3c56PvmgwNpHppRKLzHEeP/AWdUbGkMxnDhSE3aLlT/ReCkw/0pwV/DEWpYdXf
	YAx289A4QEURm6Awv8BWn/boFOxJO0F3jxASg1UbMWdWiYaemPulibVGonGwv8j+sQKeFdeAdx42Q
	XG5RsQMHm7tPxYBYl2uXDqxrsSuX9703mBbeUQTdOekYz3WipgkXHfPCPY2gAE/d1zFgGu9S7tB2V
	9mbGnX8wkTDNMJn5QjK+WY5TDc7g4SI/964Vkw1FyDX0EEjwHci7MLm3KjltV+8lPibOmqViAIdMI
	IN/BYrzlPzbkHi/Kejlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHd-00000008dB8-2Bkc;
	Fri, 21 Nov 2025 15:42:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHY-00000008d9Q-2zE6;
	Fri, 21 Nov 2025 15:42:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C84B3C1019F;
	Fri, 21 Nov 2025 15:42:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19DEE60719;
	Fri, 21 Nov 2025 15:42:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DFBD10372188;
	Fri, 21 Nov 2025 16:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763739760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yTl8T9kOPsRlZLi/qxLvoBg6wGqTVmaXfk9LwQI9gG0=;
	b=Ao77SuV1edzIejLmr9NePiyIi6sDLyET5aHhLyRUZYC3OmM3c5LiAnuKMdqHGrow6OWaCg
	54OyYzdJpRo81tUPqvjP0zv6xlkRPt85CCRGCRiOYHiBIP2y5cn2YoUj2DjiLR7PJIN3dY
	71M+9AbGuTSCcGXHjwMlGbxF4E2wt+yNyODv0jKqaOs3pBZq0qJSQxoOZ1i90/MsymcfIS
	azL8tDVsuXpqOIY9ZmIrQ8/HUB1WlepKdtSH6886eq3/qZQTc3fMjKhPxmNbXsNVoIIXTN
	Pq0EvQQzy8Nl4Qbs44rAVOTSCz4g+r0LyuACqKWf3f/typfuD+/7/Iu9hTbnjA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/3] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Fri, 21 Nov 2025 16:42:34 +0100
Message-Id: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGqIIGkC/3WMQQ7CIBBFr9LMWgxD01JdeQ/TRQtjO4kUA4RoG
 u4udu/y/fz3dogUmCJcmx0CZY7stwrq1IBZp20hwbYyKKk6RNTCJSscuUBLfYphaKVBa7U0BNV
 5BXrw++jdx8orx+TD58hn/K3/ShmFFHpuux7R6MvU32bv05O3s/EOxlLKF7EcAKusAAAA
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
X-CRM114-CacheID: sfid-20251121_074245_256104_D51EB879 
X-CRM114-Status: GOOD (  10.48  )
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
Y2xlbWVudEBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6CgotIFByb3Blcmx5IG1hbmFn
ZWQgY2FzZXMgd2hlcmUgcmVnaXN0ZXIgZW50cmllcyB1c2VkIGJ5IHRoZSBtZW1vcnkKICByZWdp
b24gYXJlIG91dCBvZiBvcmRlciwgcGFydGljdWxhcmx5IHdoZW4gb25lIG9yIG1vcmUgcmVnaXN0
ZXIKICBlbnRyaWVzIGFyZSBtaXhlZCB3aXRoIG1lbW9yeSByZWdpb24gZW50cmllcyBpbiBhbiBv
dGhlciBub2RlLgotIFVzZWQgIm1lbWxvZyIgYXMgdGhlIG5vZGUgbmFtZSBpbnN0ZWFkIG9mICJz
cmFtLCIgd2hpY2ggd2FzIG1pc2xlYWRpbmcuCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MTExNy1tdGQtbWVtcmVnaW9uLXYxLTAtN2IzNTYxMWM3OWE2QGJvb3Rs
aW4uY29tCgotLS0KR3JlZ29yeSBDTEVNRU5UICgzKToKICAgICAgb2Y6IHJlc2VydmVkX21lbTog
U3VwcG9ydCBtdWx0aXBsZSAncmVnJyBlbnRyaWVzIGZvciBtZW1vcnktcmVnaW9uCiAgICAgIGR0
LWJpbmRpbmdzOiBtdGQ6IHBoeXNtYXA6IEFsbG93IHVzaW5nIG1lbW9yeS1yZWdpb24gdG8gYWNj
ZXNzIG1lbW9yeSByZXNvdXJjZXMKICAgICAgbXRkOiBwaHlzbWFwOiBBZGQgc3VwcG9ydCBmb3Ig
UkFNIHJlc2VydmVkIG1lbW9yeSByZWdpb25zCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L210ZC1waHlzbWFwLnlhbWwgICAgICAgfCAgNTkgKysrKysrLS0tCiBkcml2ZXJzL210ZC9tYXBz
L3BoeXNtYXAtY29yZS5jICAgICAgICAgICAgICAgICAgICB8ICA1NiArKysrKysrLS0KIGRyaXZl
cnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTM5ICsrKysr
KysrKysrKysrKysrKystLQogaW5jbHVkZS9saW51eC9vZl9yZXNlcnZlZF9tZW0uaCAgICAgICAg
ICAgICAgICAgICAgfCAgIDQgKwogNCBmaWxlcyBjaGFuZ2VkLCAyMTggaW5zZXJ0aW9ucygrKSwg
NDAgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogYjU1ZDQyNmMzOTBmMmE0NzYyYjJhODhi
MTEzY2M0NGMzN2UwOGU0NgpjaGFuZ2UtaWQ6IDIwMjUxMTE3LW10ZC1tZW1yZWdpb24tODgzMGMx
ZGQ3MGNlCgpCZXN0IHJlZ2FyZHMsCi0tIApHcsOpZ29yeSBDTEVNRU5ULCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
