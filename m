Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B6FC9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnlQONb5Pxjx6rwXVzhhwxhmvlQT/LfAh0cHPIEm7Xk=; b=ipJqen59+dMgBn
	P2GLCXOdhxlU1vsDBKPtuf2rZ1lo/R4qoS9dgmlSkJXkWX5MXIiAHbOJmev0mz6vAOpiHBHLQVFNs
	2A0y09KTmSWHhBmBRwIISdBoePpdYVkbELrvvAh/Ce8FTHaEUW8cry34CNagWhAqv9VAKO98yR1GD
	Fjqes0j1OlQCLraASnybMnrIalinwI/kCbJ5+Rz15MUOirBKzTLRArQqouZbXWjL3kePFCzeGrrfZ
	4sKNxrfEpQl2wE0LOms6+Gtwc5jHZmGIl8dHHtOqLaer+XIb6IlcMAGIMSpgGveuITGNVfD3kIy6r
	VTFq+YM7gaG7eagj22xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65z-0000000DSTu-23XW;
	Fri, 25 Sep 2026 13:36:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65h-0000000DSFb-3CF0
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51EE81A1019;
	Fri, 25 Sep 2026 13:35:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 268CA6073B;
	Fri, 25 Sep 2026 13:35:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 556B5103293B8;
	Fri, 25 Sep 2026 15:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dUQeykvRToiIwN0421XD/d8rA//rqTeV9r8Rf1AoZ/0=;
	b=CnVUNRAHyoYY9spRo9JzDyyVQtD8h0g3m3YtR7ANnYz3Zy2DPvKtnS4ImOhAOzAwl4qH0x
	rP4LTRM/DyXyX528SyYxM14BavLE24WMuvLYq4XXPOVDKaE/B9oST9vJozawMpDuvTVi8A
	cCwqBzj5Lgnp7X3bc8EqN49JbUA3W7A7CImo7F22Hc2Wics9Y3mHXpFYWRi5uAfoHyTksV
	tdwPk6AAf9KjnpRO2NYmOcDvo3QXouwanbBqxc9IWFRmX5gpBV5hUXzOST5rGlxNmLPkc2
	Z67Wv+v1Um7ybvwPTOeCe2LMlvHHmTDD32e88YNM3NTUnklfkPonlIgGcbA4HQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Peter-Simon Dieterich <peter-simon.dieterich@vaillant-group.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
References: <20260917-esmt-gd9fu2g8f3a-v1-0-577c0ab2d31a@vaillant-group.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: Handle GigaDevice chips behind the
 ESMT manufacturer ID
Message-Id: <179034335020.1124555.10591572083530016506.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063553_957112_6A9601BC 
X-CRM114-Status: GOOD (  11.53  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxNTowMDo0MSArMDIwMCwgUGV0ZXItU2ltb24gRGlldGVyaWNo
IHdyb3RlOgo+IEpFREVDIG1hbnVmYWN0dXJlciBJRCAweGM4IGlzIHNoYXJlZCBiZXR3ZWVuIEVT
TVQgYW5kIEdpZ2FEZXZpY2UsIHNvCj4gR2lnYURldmljZSByYXcgTkFORCBjaGlwcyBhcmUgZGV0
ZWN0ZWQgYXMgRVNNVCBhbmQgaGFuZGxlZCBieQo+IG5hbmRfZXNtdC5jLiBUaGlzIHNlcmllcyBk
ZWFscyB3aXRoIGEgR2lnYURldmljZSBwYXJ0IHRoYXQgZW5kcyB1cCB0aGVyZS4KPiAKPiBQYXRj
aCAxIHdvcmtzIGFyb3VuZCBhIGJyb2tlbiB0aW1pbmcgbW9kZSBmZWF0dXJlIG9uIHRoZSBHRDlG
VTJHOEYzQToKPiB0aGUgcGFyYW1ldGVyIHBhZ2UgYWR2ZXJ0aXNlcyBTRVQvR0VUX0ZFQVRVUkVT
IHN1cHBvcnQsIGJ1dAo+IEdFVF9GRUFUVVJFUyhUSU1JTkdfTU9ERSkgZG9lcyBub3QgcmVwb3J0
IHRoZSBtb2RlIHRoYXQgd2FzIHdyaXR0ZW4sIHNvCj4gdGhlIGNvcmUgZG9lcyBub3Qgc2VlIGl0
cyBzZWxlY3Rpb24gYWNrbm93bGVkZ2VkIGFuZCBmYWxscyBiYWNrIHRvIHRpbWluZwo+IG1vZGUg
MC4gR2lnYURldmljZSBjb25maXJtZWQgdGhlIGNoaXAgaXMgY29tcGF0aWJsZSB3aXRoIGV2ZXJ5
IHRpbWluZwo+IG1vZGUgaXQgYWR2ZXJ0aXNlcyBhbmQgdGhhdCBTRVRfRkVBVFVSRVMgaXMgbm90
IHJlcXVpcmVkIHRvIGVudGVyIHRoZW0sCj4gc28gdGhlIGZlYXR1cmUgaXMgdW5mbGFnZ2VkIGZv
ciB0aGlzIG1vZGVsIGFuZCBvbmx5IHRoZSBob3N0IHNpZGUgaXMKPiBjb25maWd1cmVkLiBUaGlz
IG1pcnJvcnMgdGhlIGV4aXN0aW5nIGhhbmRsaW5nIG9mIHRoZSBNYWNyb25peCBNWDMwTEYgQUMK
PiBzZXJpZXMgaW4gbmFuZF9tYWNyb25peC5jLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQv
bmV4dCwgdGhhbmtzIQoKWzEvMl0gbXRkOiByYXduYW5kOiBlc210OiBEaXNhYmxlIGJyb2tlbiB0
aW1pbmdzIGZlYXR1cmUgb24gR0Q5RlUyRzhGM0EKICAgICAgY29tbWl0OiBlOTdjNzAxYzA5ZDNk
OGYyMzM5N2Y2ODQ3OGM3ZTJjN2VhZjg3NTI4ClsyLzJdIG10ZDogcmF3bmFuZDogUmVmbGVjdCB0
aGF0IEVTTVQgYW5kIEdpZ2FEZXZpY2Ugc2hhcmUgSUQgMHhjOAogICAgICBjb21taXQ6IGM2MmI1
OThhYzdmNjUwYzk2M2NhMDBhMTlmMTYxZTk5ZTg5OTQ5OGUKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
