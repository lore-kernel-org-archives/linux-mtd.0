Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E0AEE498F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1gqir1c4rpSuNfCgTVFVxeCVryDCGDTl0lFxb+xTwk=; b=L3pzPUlOof4cVl
	SzzDFdrNrRidWFFqA/oeIuCbb6BZy0xO+0Y8eBCvN/InvIo/3LzoA5ZacwI2wQ7lqFVEKGvq9DUkG
	wMNszjAg3CzSTKl6JpPRzXOcUp4v2O0eaMBFqVDMGuNXlZbbEX7XKTM9GfXYUOAtqjzrD1Gek079W
	8U5ZBuYkRW7yXQAUqagyX64w459pkU1XhMgW76mFFnToIqofY1uXG1hAtlvDd7fs/FKLtcQKk0Qaw
	Kgnflt8EQZOErITfGK+B1xOUllIiU28ORgypgSAZH40D7PLUItxLld97Mh9nKdm3IBeYUF7QrdSZx
	aMzRuB3usHOYmiESeaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5cu-009yHy-1l;
	Fri, 18 Aug 2023 19:59:20 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5cr-009yHf-0z
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 19:59:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C8FD60002;
	Fri, 18 Aug 2023 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692388752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9WQ4s+hROk+ahs4ROvh5ESGeMbt5mmR8H5xOLugL5s=;
	b=ZiAXgzeTTaj5OwCo1sItpPbJtBXQctG9Gstnj8B/OYpBy8tcmSbPkitg18sxNxqPcR3CDX
	GaGh0SUiVO1ccAEwAtBgUcjoXfyOj40NAntN7HJV+PWGNB0Ce8kSBLFBtt3GyR6slsYMqI
	oajWAa6r8Sk4837o5n3pZy1aBp62ALz2ourz89jL7J6Gqzo15SRc/G0Q0XcH/IZG8Uq76V
	dzpgJxtVpWWCWoSr1OAR7yg0zEyOc8xSH/qFOzh1vHijQJMLHOziJJYPXDqFlqDDhQ/QMI
	QuyOT4WIEw5m97H10IBSZ6HqxegL2sC4sUF7J9dVmFW7B9dGVCy0HaSp1pmGmg==
Date: Fri, 18 Aug 2023 21:59:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: mani@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: Update read_loc size to 512
Message-ID: <20230818215908.0e60b00b@xps-13>
In-Reply-To: <20230818145101.23825-2-quic_mdalam@quicinc.com>
References: <20230818145101.23825-1-quic_mdalam@quicinc.com>
	<20230818145101.23825-2-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_125917_496938_E63C21CB 
X-CRM114-Status: GOOD (  16.87  )
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

SGkgTWQsCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBGcmksIDE4IEF1ZyAyMDIz
IDIwOjIwOjU5ICswNTMwOgoKPiBGb3IgcGFyYW1ldGVyIHBhZ2UgcmVhZCB1cHBlciBsYXllciBp
cyBwYXNzaW5nIGxlbgo+IGFzIDI1NiBieXRlcyBhbmQgaWYgd2UgdHJ5IHRvIGNvbmZpZ3VyZSAy
NTYgYnl0ZXMKPiBzaXplIGluIHJlYWQgbG9hY3Rpb24gcmVnaXN0ZXIgdGhlbiBzdWJzZXF1ZW50
IGJhbQo+IHRyYW5zYWN0aW9uIGlzIGdldHRpbmcgdGltZWQgb3V0IGZvciA0SyBuYW5kIGRldmlj
ZXMuCj4gU28gdXBkYXRlIHRoaXMgbGVuZ3RoIGFzIG9uZSBzdGVwIHNpemUgaWYgaXRzCj4gbGVz
cyB0aGFuIE5BTkRDX1NURVBfU0laRS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUmFt
YWJhZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWQg
U2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+CgpJJ20gZmluZSB3aXRoIHBhdGNo
ZXMgMiBhbmQgMyBhbmQgd2lsbCB0YWtlIHRoZW0uIEJ1dCB0aGlzIG9uZSBkb2VzIG5vdApzZWVt
IGxlZ2l0aW1hdGUuIEkgZG9uJ3QgbGlrZSBpdC4gQXJlIHlvdSBzdXJlIHRoZSBFQ0MgZW5naW5l
IHdhcyBub3QKZW5hYmxlZCB3aGVuIGl0IHRpbWVkIG91dD8gRGVmYXVsdCBzaG91bGQgYmUgaGF2
aW5nIHRoZSBFQ0MgZGlzYWJsZWQKYW5kIGl0IHNob3VsZCBqdXN0IGdldCBlbmFibGVkIHdoZW4g
eW91IG5lZWQgaXQuIFRoZXJlIGlzIG5vIHJlYXNvbgp3aHksIHNwZWNpZmljYWxseSBvbiBOQU5E
IGRldmljZXMsIGl0IHdvdWxkIG5vdCBiZSBwb3NzaWJsZSB0byByZWFkIDI1NgpieXRlcy4KCj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDMgKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gaW5kZXggZDRiYTBkMDRjOTcwLi40MTNlMjE0YzhlODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gQEAgLTI4ODUsNiArMjg4NSw5IEBAIHN0YXRpYyBpbnQgcWNvbV9wYXJh
bV9wYWdlX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAgY29uc3Qgc3RydWN0IG5h
bmRfCj4gIAlvcF9pZCA9IHFfb3AuZGF0YV9pbnN0cl9pZHg7Cj4gIAlsZW4gPSBuYW5kX3N1Ym9w
X2dldF9kYXRhX2xlbihzdWJvcCwgb3BfaWQpOwo+ICAKPiArCWlmIChsZW4gPCBOQU5EQ19TVEVQ
X1NJWkUpCj4gKwkJbGVuID0gTkFORENfU1RFUF9TSVpFOwo+ICsKPiAgCW5hbmRjX3NldF9yZWFk
X2xvYyhjaGlwLCAwLCAwLCAwLCBsZW4sIDEpOwo+ICAKPiAgCWlmICghbmFuZGMtPnByb3BzLT5x
cGljX3YyKSB7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
