Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED70CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0KgrmVD/IyZcpNcToD+Um0TVj7VViGMEX1nH0Ao+uM=; b=Cx22frKSpAL3M7
	fN5qX/xm4DjspBqSOFNCCrSEYMrABjOMLK6NSQMbWHv6eMTSZjYBcduoEnvo/ihZh4/U0JygBkgoL
	us/M6a8rkKchUXjXUNLOeovR9IQZy26wO8qGpCj7u0KXY4Pn1sogqobKkvdd39+OXVQs4G0lenZ6T
	avSNrXCc31bW02GPLPU8zkiymCmeYcctdUhRBYTlgCTigdDscl49x3129i3/YIIifAxpFEoqXh71p
	V76XQtCARGeTWcRzhz7crlIzgiPSnOOe0/609z2wmuWlJi3YX5L0a1rtRRUJqWroe/1G0IhHp8RTS
	XVJln/xKh7rzrgJEFTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHl2-0000000GrqI-2INo;
	Fri, 07 Nov 2025 08:23:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHky-0000000Grph-1K81
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 08:23:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FCA81A1916;
	Fri,  7 Nov 2025 08:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45E2D6070B;
	Fri,  7 Nov 2025 08:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C6301185123C;
	Fri,  7 Nov 2025 09:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762503816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tgaD8rjkXyLYWq0MjyglgznDWdH1xBP/wgwuMKwG6Pc=;
	b=hC6Ybp7CevBpMo9V2AKZi62zde0rkJ18ZNGd39fzBSskzr3UJS+9nopOLQUgupWO7r9coQ
	O4KUFo6V7ida1bgUWk+nhnABVueggPqH8ptt/2rCHXA36hqXvavQZ5M8jJuuscflWPgtXj
	s+3C3OBq/wwzGQLkNP3BCEQUB8a5OWlRZmZhMY+RQYvKF7+czxG9jJLJAE9Vle/E9nweBF
	FS5qRI12FUBkFa5w83lQvIhOUbiECdLKRsiOSGyBOcRELO4aMySv3YCFCV/QC+ctJ/9STk
	fri5sXqfNv0vvpTHtHvK2WLXrpm4c5GH820WygJl28LX7w/i0T9sXFkEkIH1Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  chengzhihao1@huawei.com,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
In-Reply-To: <CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com>
	(Cheng Ming Lin's message of "Fri, 7 Nov 2025 14:31:12 +0800")
References: <20251106054940.2728641-1-linchengming884@gmail.com>
	<20251106054940.2728641-2-linchengming884@gmail.com>
	<87o6pf8r24.fsf@bootlin.com>
	<CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 07 Nov 2025 09:23:29 +0100
Message-ID: <874ir68d4u.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002340_679266_430B4B9B 
X-CRM114-Status: GOOD (  12.13  )
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

SGVsbG8sCgo+PiA+ICsgICAgIGlmICh1YmktPnZpZF9oZHJfc2hpZnQpCj4+ID4gKyAgICAgICAg
ICAgICBtZW1zZXQoKGNoYXIgKilwLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0gVUJJX1ZJ
RF9IRFJfU0laRSk7Cj4+ID4gKyAgICAgZWxzZQo+PiA+ICsgICAgICAgICAgICAgbWVtc2V0KChj
aGFyICopcCArIFVCSV9WSURfSERSX1NJWkUsIDB4RkYsIHViaS0+dmlkX2hkcl9hbHNpemUgLSBV
QklfVklEX0hEUl9TSVpFKTsKPj4KPj4gSGVyZSBJIGFtIHJlYWNoaW5nIHRoZSBsaW1pdHMgb2Yg
bXkgVUJJIGtub3dsZWRnZSwgc28gSSB3b3VsZCBwcmVmZXIKPj4gUmljaGFyZCB0byAoaW4pdmFs
aWRhdGUgd2hhdCBJIGFtIHNheWluZywgYnV0IEFGQUlVLCB0aGUgVklEIGhlYWRlciBjYW4KPj4g
YmUgbGl0ZXJhbGx5IGFueXdoZXJlIGluIHRoZSBwYWdlLCBub3QganVzdCBhdCB0aGUgc3RhcnQg
b3IgZW5kIG9mIGEKPj4gc3VicGFnZSwgc28gaW4gdGhlIHZpZF9oZHJfc2hpZnQgSSB3b3VsZCBl
eHBlY3Qgc29tZSBleHRyYSBtYXRocyB0bwo+PiBoYXBwZW4sIG5vPwo+Cj4gSSB1bmRlcnN0YW5k
IHlvdXIgcG9pbnQgbm93LiBJZiB0aGUgVklEIGhlYWRlciBpcyBub3QgZ3VhcmFudGVlZCB0byBi
ZQo+IGF0IHRoZSBzdGFydCBvciBlbmQgb2YgYSBzdWJwYWdlLCB0aGVuIHllcywgbXkgY3VycmVu
dCBsb2dpYyBuZWVkcyB0byBiZQo+IHJld29ya2VkIHRvIGNvdmVyIHRoYXQgY2FzZS4KCkkgZG9u
J3Qga25vdyBpZiB0aGlzIGlzIGVhc3kgdG8gZG8sIGJ1dCBtYXliZSB5b3UgY2FuIG1lbXNldCB0
aGUgd2hvbGUKYnVmZmVyIGJlZm9yZSBmaWxsaW5nIGl0LiBUaGF0IHdvdWxkIGF2b2lkIHRoZSBu
ZWVkIHRvIGtub3cgd2hlcmUgdGhlClZJRCBoZWFkZXIgd2lsbCBiZS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
