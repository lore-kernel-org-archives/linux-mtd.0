Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AA5C44520
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfGUffoeh4KxyjamCcrpkRCXfGDVLG1Bu/mKP4YbDnk=; b=A9UDCwfQSMTlTS
	CrcWi15lsFsyHrILSW8opKcOp/lkogjM2Qu+XHf9IpRHYJk21Bt5oCs/b9ub+rv2PXduq/S6+ymeo
	UDyzCLb2CG3CuA8ahw/yABVHz4quDvEbhjOkQcq5PxJ6/+40nbUBB90PBY6iCen23FZcWSfMOfLIM
	POvSDHxTyur4En+V6Vmiz0B3wOKYCDcRCWPY+wRr0rhPPyw34o8WK0yc4oRKPor8q8DD6HAzh+vjV
	BFo1/yrWiBmXBihHwqa/jFUfBmhwgi6ofGF7QuQQVjkJSSpM4D9CQz/AxG5XxRxOXCznGjBWr/yjP
	AQ6dyJ4u/7hUCLO7w5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhZb-00000002HMf-1DHB;
	Fri, 17 Jul 2026 12:21:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhZY-00000002HLt-2W3h
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 12:21:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07C85C2B9F7;
	Fri, 17 Jul 2026 12:22:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E24960361;
	Fri, 17 Jul 2026 12:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A41F611BD0C29;
	Fri, 17 Jul 2026 14:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784290901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XPHS+G2PK3HSSLicq3iMEc5QRy9j7GIGDRoyVEfXr+E=;
	b=dBMXY+F8CCxhqFSV2pc3cGPj3sIiqQ8eAAjFGGXzWubu7wTFvMtjRG/j65pWaRiAKu+o/l
	eFlhHDwkjydZqKeCqd5HRJlykii7zTzOU9gizijYDxCn4rsNKZKCTIK9AQzBwP/aX3WjL7
	torGWviK40d82yFqlF+Xf8nstGXLbsVZQCxbK8p+YIYCJOn52pCzkVZlxjiyckg7K8UIHG
	6u8EyH1/CHT1iGYgNYymtozQy+lWJ6pHZLf0yaTT5YEzqWGZkJvWW6egisGnFrWtok9qxz
	cUC8ZSP1vBOe3nMPC+WdEKc57hRz1iarw6RMWgJ67BVVLgZk8kChHtZlgqLfFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: vigneshr@ti.com,  richard@nod.at,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Huang Shijie <b32955@freescale.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: validate ONFI extended parameter page
 sections
In-Reply-To: <20260715084226.38336-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Wed, 15 Jul 2026 16:42:26 +0800")
References: <20260715084226.38336-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 14:21:36 +0200
Message-ID: <871pd1kdrj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_052144_810358_104580B9 
X-CRM114-Status: GOOD (  19.83  )
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

SGkgUGVuZ3BlbmcsCgpPbiAxNS8wNy8yMDI2IGF0IDE2OjQyOjI2ICswOCwgUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IG5hbmRfZmxhc2hfZGV0ZWN0X2V4dF9w
YXJhbV9wYWdlKCkgYWxsb2NhdGVzIGEgbGVuZ3RoIGRlY2xhcmVkIGJ5IHRoZSBPTkZJCj4gcGFy
YW1ldGVyIHBhZ2UuICBJdCB0cmVhdHMgdGhlIHJldHVybmVkIGRhdGEgYXMgYSBmaXhlZCBoZWFk
ZXIgZm9sbG93ZWQgYnkKPiB2YXJpYWJsZS1sZW5ndGggc2VjdGlvbnMuICBJdCByZWFkcyB0aGF0
IGhlYWRlciBhbmQgYWR2YW5jZXMgb3ZlciBzZWN0aW9ucwo+IHdpdGhvdXQgZmlyc3QgcHJvdmlu
ZyB0aGF0IHRoZSBwYWdlIGFuZCBlYWNoIGN1cnJlbnQgc2VjdGlvbiBmaXQgaW4gdGhlCj4gYWxs
b2NhdGVkIGJ1ZmZlci4KPgo+IFJlamVjdCBwYWdlcyBzaG9ydGVyIHRoYW4gdGhlIGZpeGVkIGhl
YWRlci4gIFRyYWNrIHJlbWFpbmluZyBieXRlcyB3aGlsZQo+IHdhbGtpbmcgc2VjdGlvbnMuICBS
ZXF1aXJlIHRoZSBFQ0Mgc2VjdGlvbiB0byBjb3ZlciBldmVyeSBmaWVsZCByZWFkIGZyb20KPiBz
dHJ1Y3Qgb25maV9leHRfZWNjX2luZm8uCj4KPiBGaXhlczogNmRjYmUwY2RkODNmICgibXRkOiBn
ZXQgdGhlIEVDQyBpbmZvIGZyb20gdGhlIEV4dGVuZGVkIFBhcmFtZXRlciBQYWdlIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVu
Z3BlbmdAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25m
aS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX29uZmkuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25maS5jCj4g
aW5kZXggY2QzYWQzNzM4ODNlLi40MGI3ZGIxMGJkNzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X29uZmkuYwo+IEBAIC00MCwxMSArNDAsMTYgQEAgc3RhdGljIGludCBuYW5kX2ZsYXNoX2RldGVj
dF9leHRfcGFyYW1fcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAJc3RydWN0IG9uZmlf
ZXh0X3NlY3Rpb24gKnM7Cj4gIAlzdHJ1Y3Qgb25maV9leHRfZWNjX2luZm8gKmVjYzsKPiAgCXVp
bnQ4X3QgKmN1cnNvcjsKPiArCXNpemVfdCBzZWN0aW9uX2xlbjsKPiArCXNpemVfdCByZW1haW5p
bmc7Cj4gIAlpbnQgcmV0Owo+ICAJaW50IGxlbjsKPiAgCWludCBpOwo+ICAKPiAgCWxlbiA9IGxl
MTZfdG9fY3B1KHAtPmV4dF9wYXJhbV9wYWdlX2xlbmd0aCkgKiAxNjsKPiArCWlmIChsZW4gPCBz
aXplb2YoKmVwKSkKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gIAllcCA9IGttYWxsb2MobGVu
LCBHRlBfS0VSTkVMKTsKPiAgCWlmICghZXApCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gQEAgLTc3
LDExICs4MiwyNCBAQCBzdGF0aWMgaW50IG5hbmRfZmxhc2hfZGV0ZWN0X2V4dF9wYXJhbV9wYWdl
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAo+ICAJLyogZmluZCB0aGUgRUNDIHNlY3Rpb24u
ICovCj4gIAljdXJzb3IgPSAodWludDhfdCAqKShlcCArIDEpOwo+ICsJcmVtYWluaW5nID0gbGVu
IC0gc2l6ZW9mKCplcCk7Cj4gIAlmb3IgKGkgPSAwOyBpIDwgT05GSV9FWFRfU0VDVElPTl9NQVg7
IGkrKykgewo+ICAJCXMgPSBlcC0+c2VjdGlvbnMgKyBpOwo+IC0JCWlmIChzLT50eXBlID09IE9O
RklfU0VDVElPTl9UWVBFXzIpCj4gKwkJc2VjdGlvbl9sZW4gPSBzLT5sZW5ndGggKiAxNjsKPiAr
CQlpZiAoc2VjdGlvbl9sZW4gPiByZW1haW5pbmcpIHsKPiArCQkJcHJfZGVidWcoIlRoZSBzZWN0
aW9uIGlzIGludmFsaWQuXG4iKTsKClRoaXMgZGVidWcgbWVzc2FnZSBpcyBub3QgdXNlZnVsLCBp
dCBjb3VsZCBtZW50aW9uIHRoZSBzZWN0aW9uLCBhbmQgYXQKbGVhc3QgY29udGFpbiAiT05GSSIg
aW4gaXQuIEJ1dCBzaW5jZSB5b3UgaGF2ZSBhY2Nlc3MgdG8gYSBuYW5kX2NoaXAsIGl0CmlzIGFs
c28gcHJvYmFibHkgYmV0dGVyIHRvIHVzZSBkZXZfZGJnIGhlcmUuCgo+ICsJCQlnb3RvIGV4dF9v
dXQ7Cj4gKwkJfQo+ICsKPiArCQlpZiAocy0+dHlwZSA9PSBPTkZJX1NFQ1RJT05fVFlQRV8yKSB7
Cj4gKwkJCWlmIChzZWN0aW9uX2xlbiA8IHNpemVvZigqZWNjKSkgewo+ICsJCQkJcHJfZGVidWco
IlRoZSBFQ0Mgc2VjdGlvbiBpcwo+IGludmFsaWQuXG4iKTsKClNhbWUuCgo+ICsJCQkJZ290byBl
eHRfb3V0Owo+ICsJCQl9Cj4gIAkJCWJyZWFrOwo+IC0JCWN1cnNvciArPSBzLT5sZW5ndGggKiAx
NjsKPiArCQl9CgpcbgoKPiArCQljdXJzb3IgKz0gc2VjdGlvbl9sZW47Cj4gKwkJcmVtYWluaW5n
IC09IHNlY3Rpb25fbGVuOwo+ICAJfQo+ICAJaWYgKGkgPT0gT05GSV9FWFRfU0VDVElPTl9NQVgp
IHsKPiAgCQlwcl9kZWJ1ZygiV2UgY2FuIG5vdCBmaW5kIHRoZSBFQ0Mgc2VjdGlvbi5cbiIpOwoK
Q2hhbmNlcyBhcmUgdGhpcyB3aWxsIG5ldmVyIGhhcHBlbiwgYmVjYXVzZSBpdCBpcyBoYXJkd2Fy
ZSBoYXJkIHRvCnRhbXBlciB3aXRoLCBjb3ZlcmVkIGJ5IGFuIGluaXRpYWwgQ1JDLCBhbmQgaWYg
dGhlIG1hbnVmYWN0dXJlcnMgbWVzcyB1cApzbyBiYWRseSB0aGVpciB0YWJsZXMgdGhlIGNoaXBz
IHdvbid0IGJlIG1hbnVmYWN0dXJlZCBhbnl3YXkuCgpCdXQsIGhlaCwgdGhlIGNvc3Qgb2YgdGhp
cyBpcyB0b2xlcmFibGUuIE5ldmVydGhlbGVzcywgYSB2MiBpcyBleHBlY3RlZC4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
