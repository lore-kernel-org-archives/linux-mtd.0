Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA392D43FE5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmjbzk6QUAADyc5OfxP7OunkqwQ4yDAUs8zqEFc4XfM=; b=dy44tfXnpJyeGf
	4lkHoXnjyBo7n8EgD99WKWBLHSvlcWoronORM3kAkTQCXQCmLM8YGsy2eR0bR3DnNSgPpLGG1FX3J
	/lkaLiDc3yxsjIVyT6cRYbNBtGjxuMU6eYjAp5kcc0jQwkOB5bRd/cGaHBLr6nseJm2nDmo0gYoek
	Q5wKiCsCH20MU5VVNTgPkn8hunfBt5z//PKQ8hQVt/LhVf1j9KzFUyxTG/OJC8sTBmHT6NYnMEDqR
	T9fa8XDPphdhvW6f1CHgxpoXcrZJcsvOsDsm0FdrTsfCcgc5uMqCktUkMRgUY05oN8uDq071FKC0T
	BEr5g7Z56sXuOJYD0Z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwQY-00000008fyX-33RA;
	Mon, 18 Nov 2024 07:44:06 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwQV-00000008fxk-47mO
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 07:44:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8B0740005;
	Mon, 18 Nov 2024 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731915839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3CMiUYu2bvv1tCd37NA4gHOkr2RtNbLkEOFHUdDTNc=;
	b=ZfzupOONtRGPTnZROD1WIjDGuDgAdDu2++Swv9aryXcoTtMho6B7ei2tplocpsR+XcWvJ8
	OoABZx4vHcdkU1h9KHAyCXAIyLLeC/YdED+4YR7EjyKc83WwKqbVJV9KN/C4Sf7Z3QJh+x
	o0xqXbXqrtEyTF0WhrXLjZa83mZ5Z0eEjDHuksHbeLPLtRGDt+hQ9c5Z91GVFvzSrmCdBH
	bufQqtJmgdOoS6CEsBWuoUDt7iX5OF1zuG4zIpjBAfuBsjqC6oIkMvW5xZ3/yF6rvii5Vz
	wxUDZayDchCyCaQfeNpxD2y6pHGtiVoHgyfpQt2TMUjifx4AQ/DGMXpijLaX+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: SkyLake Huang <SkyLake.Huang@mediatek.com>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "mmkurbanov@salutedevices.com" <mmkurbanov@salutedevices.com>,
  "kernel@sberdevices.ru" <kernel@sberdevices.ru>,  "d-gole@ti.com"
 <d-gole@ti.com>,  "dev@kicherer.org" <dev@kicherer.org>,
  "vigneshr@ti.com" <vigneshr@ti.com>,  "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2] mtd: spinand: add support for FORESEE F35SQA002G
In-Reply-To: <CAJsYDVLYE1=sAj5Pvni17xQ=4akFCA+UqtuB5RKq77HxL4ux9w@mail.gmail.com>
	(Chuanhong Guo's message of "Wed, 13 Nov 2024 18:10:20 +0800")
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
	<20241108163455.885-4-SkyLake.Huang@mediatek.com>
	<dbdb45ed1135e73b4eebd76e6f61b96d48aaedc6.camel@mediatek.com>
	<87ikssu3qq.fsf@bootlin.com>
	<12f4d28f3efb7fe319ec919df92145c4ad24da01.camel@mediatek.com>
	<87h68bsdv6.fsf@bootlin.com>
	<CAJsYDVLYE1=sAj5Pvni17xQ=4akFCA+UqtuB5RKq77HxL4ux9w@mail.gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 08:43:56 +0100
Message-ID: <87ttc5c7gj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_234404_157403_2A508970 
X-CRM114-Status: GOOD (  12.66  )
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

SGVsbG8sCgo+IFNldmVyYWwgU1BJLU1FTSBjb250cm9sbGVyIGRvbid0IGFsbG93IHNvZnR3YXJl
IGNvbnRyb2xsZWQgQ1MsIG9yIGZvciBzb21lCj4gb3RoZXIgcmVhc29ucyBhcmUgdW5hYmxlIHRv
IGV4ZWN1dGUgYSBsb25nZXIgc3BpLW1lbSBvcC4KPiBzcGlfbWVtX2Rpcm1hcF93cml0ZSByZXR1
cm5zIHRoZSBhY3R1YWwgcmVxdWVzdCBzaXplIGl0J3MgYWJsZSB0byBtYWtlLAo+IGFuZCBzcGlu
YW5kX3dyaXRlX3RvX2NhY2hlX29wIHVzZSBhIHdoaWxlIGxvb3AgdG8gc3BsaXQgb25lIHVwZGF0
ZV9jYWNoZQo+IHJlcXVlc3QgaW50byBtdWx0aXBsZSBvbmVzLgo+Cj4gVGhpcyBvbmx5IHdvcmtz
IHVzaW5nIHRoZSBSYW5kb20gUHJvZ3JhbSBMb2FkIGluc3RydWN0aW9uICg4NGgvMzRoKQo+IHdo
aWNoIHByZXNlcnZlcyB0aGUgcHJldmlvdXMgd3JpdHRlbiBkYXRhIGluIHRoZSBmbGFzaCBkYXRh
IGNhY2hlLgo+IEFsbCBjdXJyZW50IHN1cHBvcnRlZCBmbGFzaGVzIGFyZSBleGNsdXNpdmVseSB1
c2luZyA4NGgvMzRoIGFzIHRoZSBjb21tYW5kCj4gdG8gd3JpdGUgdGhlIHBhZ2UgY2FjaGUuCj4K
PiBMb2FkIFByb2dyYW0gRGF0YSgwMmgvMzJoKSB3aWxsIGNsZWFyIHRoZSBlbnRpcmUgcGFnZSBj
YWNoZS4gQXMgYQo+IHJlc3VsdCwgd2hlbiBhIHJlcXVlc3QgaXMgc3BsaXQgYXMgZGVzY3JpYmVk
IGFib3ZlLCB0aGUgcHJldmlvdXMgd3JpdHRlbgo+IGRhdGEgd2lsbCBiZSBjbGVhcmVkLCBicmVh
a2luZyB0aGUgcGFnZSBjYWNoZSB3cml0aW5nIHByb2NlZHVyZS4KPgo+IFdlIGNhbiBjaGFuZ2Ug
d3JpdGVfdG9fY2FjaGVfb3AgdG8gdXNlIExvYWQgUHJvZ3JhbSBEYXRhIG9uIHRoZQo+IGZpcnN0
IHJlcXVlc3QuIElmIHRoYXQgZG9lc24ndCBmaW5pc2ggd3JpdGluZywgdXNlIFJhbmRvbSBQcm9n
cmFtIExvYWQKPiBvbiBzdWJzZXF1ZW50IGRhdGEgbG9hZGluZy4KClNvdW5kcyByZWFzb25hYmxl
IGluZGVlZCwgZmVlbCBmcmVlIHRvIHNlbmQgYSBwYXRjaC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
