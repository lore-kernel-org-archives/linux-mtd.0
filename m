Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A980ECE582
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0+IhQE/Fp7aJI7+AldxXtLM4YfnYXbE7cqA+FKgN+I=; b=0Vwkw+yHGHHI2g
	a1+M6iX0ZEiru5ajaK3f53OVMVyw+zEue3HLLoI+em/PBIcPUFOAytDb8LVMjjqpWge01dpRIWB/e
	4Rqgl2aAr06qnK3EOfcu3+1mo9kun5hw3ORT3x1DSU8seElxddagdjBig/RDd9DXyJ2YBjK+0AAE9
	dmuUMMF3ix8L+MTdxTBHj5sAtY9uCO7fliYT7/PhBqyqf4hqkQZA6Nt2GDWI8Q66/Wf91uFM1A0ws
	mkU23Ddk8hbRFJfzqP7SqyNRE6zxwTculTQFcaOts7mV7XPf4jWOwxormXIatduufiyHYQQ/FlhQc
	aVFewCYsPLx8+W/dd19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvZ3-00000004f11-02nc;
	Tue, 10 Sep 2024 07:45:29 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvV7-00000004e8N-0Uq4
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 07:41:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E6D9FF80C;
	Tue, 10 Sep 2024 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725954083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=af5m1sT62PlbZm1pnjn+q6UsEmjHIWOgLofQJKFpyhE=;
	b=KXVpYS7ZX2ePDbG+y3lo9eckSGGfA548IHJNPUXZGhUOZb2sgUBHTeHO4+5uTbB1AuXwHY
	Xr9/3WnHY6310FIbWrgpVZ/fBUeL5rj71mvsXN08h0VGmVP5JVr09PnunH0SGwhPsLw31P
	OOiOgOLi+r1l02asILsOSoeOKMFVXmLOqrAzxBXYpsDP0Tk9AdEb8wsATx4Xd/+2FoKCDi
	zpyxa78EdvVQSG/ILI8y6m6hJnPJdxnkJQPudLjaxnlN6mlIyerOgVe7ovKpGzwC8pgfb5
	IW09mctNs2rYqw2tD/JjuFKJ8xszlIR6/ZKcKQTLt3UcO4nWm+WvCJuGisR8yg==
Date: Tue, 10 Sep 2024 09:41:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
 <esben@geanix.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Message-ID: <20240910094120.19348fea@xps-13>
In-Reply-To: <bb1397c3-2327-e211-f7eb-cac4b126424e@quicinc.com>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
	<5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
	<20240903150826.749b8560@xps-13>
	<bb1397c3-2327-e211-f7eb-cac4b126424e@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_004125_338675_05BE7D6C 
X-CRM114-Status: GOOD (  14.51  )
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

SGksCgo+ID4+PiAgICA+PiAgICAgICBJIGhhdmUgYWRkcmVzc2VkIHlvdXIgY29tbWVudHMgdG8g
djYgYW5kIGZ1cnRoZXIgcG9zdGVkIHRpbGwgdjguICAKPiA+PiAgICAgICBDb3VsZCB5b3UgcGxl
YXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgZmluZS4KPiA+PiAgICAgICBhbmQgaG93IHRvIGdl
dCB0aGlzIG1lcmdlZCA/ICAKPiA+IAo+ID4gVGhlcmUgYXJlIHN0aWxsIGtlcm5lbCB0ZXN0IHJv
Ym90IHJlcG9ydHMsIHNvIHRoaXMgbWVhbnMgdGhlcmUgYXJlCj4gPiBpc3N1ZXMgaW4geW91ciBj
b2RlIHRoYXQgSSBkb24ndCBuZWVkIHRvIHBvaW50IG91dCBleHBsaWNpdGx5LCBidXQgSSBhbQo+
ID4gYWN0aXZlbHkgd2FpdGluZyBmb3IgdGhlbSB0byBiZSBmaXhlZC4gIAo+IAo+IEkgaGF2ZSBm
aXhlZCBtb3N0IG9mIHRoZSBzcGFyc2Ugd2FybmluZ3MgYWZ0ZXIgY29udmVydGluZyBfX2xlMzIg
dG8gdTMyLgo+IEhvd2V2ZXIgYW0gbm90IGFibGUgdG8gYWRkcmVzcyB0aGUgZm9sbG93aW5nIHNw
YXJzZSB3YXJuaW5ncwo+IAo+IAlkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6MTQw
MToyOTogc3BhcnNlOiB3YXJuaW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMyCj4gCWRyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYzoxNTg3OjMwOiBzcGFyc2U6IHdhcm5pbmc6IGNh
c3QgdG8gcmVzdHJpY3RlZCBfX2xlMzIKPiAJZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jOjE1ODg6MzE6IHNwYXJzZTogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIF9fbGUzMgo+
IAlkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6MTU4OTozNDogc3BhcnNlOiB3YXJu
aW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMyCj4gCWRyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYzoyNDc5OjQ3OiBzcGFyc2U6ICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMiBbdXNl
cnR5cGVdCj4gCWRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYzoyNDgwOjQ3OiBzcGFy
c2U6ICAgIGdvdCByZXN0cmljdGVkIF9fbGUzMiBbdXNlcnR5cGVdCj4gCWRyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYzoyNjE2OjI1OiBzcGFyc2U6IHdhcm5pbmc6IGNhc3QgdG8gcmVz
dHJpY3RlZCBfX2xlMzIKPiAJZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jOjI2NzI6
MzI6IHNwYXJzZTogd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIF9fbGUzMgoKVGhlIHJ1bGUg
aXM6IHlvdSBjYW5ub3QgYWRkIG5ldyB3YXJuaW5ncy4KCkZvciBleGlzdGluZyB3YXJuaW5ncyBp
biB0aGUgZHJpdmVyLCBJJ2QgYW55d2F5IGFkdmlzZSB0byBzb2x2ZSB0aGVtLgpXaXRob3V0IHRo
ZSBhY3R1YWwgY29kZSBJIGNhbm5vdCBoZWxwLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
