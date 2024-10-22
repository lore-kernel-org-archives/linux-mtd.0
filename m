Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DC1D1CDBD
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q2qZfzKxGxut+R0W/hfK/v1bV87NK93JzKJQYQdSb4=; b=PKiiMv8ModQsMn
	YhkuxAVsBiGrEoesCkWqaY1a2if7p0Dad/v+Irv71eG44Gm0gQIegtwAwLYKMsRxV6l9EdG3QWZdN
	NZKcUNnRv888TtWi77FYBiFSKgL71g+EszAaBtpXro/m7DdwoPvadUZebJbDItTyke/LR1hU0vRff
	xDxf+qXFztWdwFKgNntriF4D79dewmfhf58IP/RZFfdC2kNZXeKLaf7AouR/sahf5Zrks3ZAwXEHI
	gCtx75r3pNRjZ5ZpHOG2hL7xvXMlFFoXz+sQzFCO94x7hrQvnrDBOWvqCVghRf1xG2dWZgMV0eQsH
	z/yz4D910tt+MbfSZaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3AZb-0000000AE4d-1rJX;
	Tue, 22 Oct 2024 08:49:03 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ASX-0000000ACY0-1vty
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 08:41:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779D060005;
	Tue, 22 Oct 2024 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729586501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OCG7KmTDfncVowbwji19VL+jTwX8l0cDYy63p16Gzs=;
	b=ZRknqKTs/B9LTEnvcNG5aArKzth90CJ2bat6gAOThTz00YYYIDDuXgTLfxVXQcIlPElPqi
	G5zwpjc/8vNIrgmGaVOw3bkMsgNwOyqxFZlSJpNe2T+pNhjKSgLMWzyo3MJQuY4xfP9RvW
	gOoCoph4Mb54nQaA/2w5sGsWFEQgN9tWCaxRbcJVwoEVE5QdXxTDrDyiG67TA8c7AGk1VP
	Y2mVWovgowTlUNC9MJS29sPav+b5SjIjzxzZd7DecOn68ocjfIvsg8um68JHMEMRDEFQVI
	gxHiip5qk9yIKsLO27W2ToDB3xrDBmUXh/0ciWTT874jgOuPodEufSPzzN2CxA==
Date: Tue, 22 Oct 2024 10:41:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gax-c <zichenxie0106@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, dinghao.liu@zju.edu.cn, arnd@arndb.de,
 scott.bauer@intel.com, kbusch@kernel.org, heinzm@redhat.com,
 snitzer@redhat.com, linux-mtd@lists.infradead.org, zzjas98@gmail.com,
 chenyuan0y@gmail.com
Subject: Re: [PATCH v2] mtd: diskonchip: Cast an operand to uint64_t to
 prevent potential uint32_t overflow in inftl_partscan()
Message-ID: <20241022104138.3f9de009@xps-13>
In-Reply-To: <20241021192753.8582-1-zichenxie0106@gmail.com>
References: <20241021192753.8582-1-zichenxie0106@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_014145_654829_1368F4AB 
X-CRM114-Status: UNSURE (   9.67  )
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

SGksCgp6aWNoZW54aWUwMTA2QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIxIE9jdCAyMDI0IDE0
OjI3OjU0IC0wNTAwOgoKPiBGcm9tOiBaaWNoZW4gWGllIDx6aWNoZW54aWUwMTA2QGdtYWlsLmNv
bT4KPiAKPiBUaGlzIHdhcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXplci4KClRoaXMgc2hvdWxk
IGJlIHRoZSBsYXN0IHNlbnRlbmNlLCBub3QgdGhlIGZpcnN0LCBtYXliZT8KCj4gVGhlcmUgbWF5
IGJlIGEgcG90ZW50aWFsIGludGVnZXIgb3ZlcmZsb3cgaXNzdWUgaW4KPiBpbmZ0bF9wYXJ0c2Nh
bigpLiBwYXJ0c1swXS5zaXplIGlzIGRlZmluZWQgYXMgInVpbnQ2NF90Igo+IHdoaWxlIG10ZC0+
ZXJhc2VzaXplIGFuZCBpcC0+Zmlyc3RVbml0IGFyZSBkZWZpbmVkIGFzIDMyLWJpdAo+IHVuc2ln
bmVkIGludGVnZXIuIFRoZSByZXN1bHQgb2YgdGhlIGNhbGN1bGF0aW9uIHdpbGwgYmUgbGltaXRl
ZAo+IHRvIDMyIGJpdHMgd2l0aG91dCBjb3JyZWN0IGNhc3RpbmcuCj4gU28sIHdlIHJlY29tbWVu
ZCBhZGRpbmcgYW4gZXh0cmEgY2FzdCB0byBwcmV2ZW50IHBvdGVudGlhbAo+IGludGVnZXIgb3Zl
cmZsb3cuCgpUaGUgd3JhcHBpbmcgaXMgb2RkLgoKPiAKPiBGaXhlczogMWRhMTc3ZTRjM2Y0ICgi
TGludXgtMi42LjEyLXJjMiIpCj4gU2lnbmVkLW9mZi1ieTogWmljaGVuIFhpZSA8emljaGVueGll
MDEwNkBnbWFpbC5jb20+Cj4gLS0tCj4gdjI6IGNvcnJlY3QgIkZpeGVzIiB0YWcuCgpJZiB5b3Ug
d2FudCB0byBwcm92aWRlIGEgZml4LCB5b3UgcHJvYmFibHkgd2FudCB0byBDYzogc3RhYmxlIGFz
IHdlbGwuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
