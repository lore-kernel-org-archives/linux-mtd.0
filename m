Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BC1C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1fdHPgQrId+m+D3VBiUFARBz5qjfVPlk9IZ8GKKj2Y=; b=r1SmeYmSlTTT4n
	9KpO1H9kkjTNY0GET8cEGpxvMIK1Yj65tvxM+lt8I5Mk494vBus1ZUvKWKNLxLPP5eeYuWQswJonr
	FWJdwJKxS/WSLtCnTy0UwUoqqilaeiDGvZPjIRZ8S/D088XuRpNqk4UY/CXvHscBx2RX36pEy0UQD
	Y9NSbk1lMDWF6WWBFDCa4czR9nGRLwPwY35Vf1JdHb9I/zDh6HnXHFdNYEzpmS+O1Cgvv2T3GrxH4
	fnGiCOA7JQxJD+OrzSbAu4ADJ3OAR26qUeJ7xyNTzQrX1pxFTAEMRuvkkiwB3chVSrZNJNzRn65vL
	hfhyxQWWMQoY5zG3ntfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfcQ-00Eihv-4G; Thu, 17 Nov 2022 14:11:54 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfcM-00Eiey-Sc
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 14:11:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86561240011;
	Thu, 17 Nov 2022 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668694303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HtRPY6fq+dX8t6QertspUgnv+Cd2tXarfsv8zbhiSUs=;
	b=gLmkBBS0oCR4V6BFWEAgSbigFARFS6bgljJArdTAvQIz4JQyLvR5HMfsyss1iXTu4ed5xe
	KVmXeTlKi3iQpPm7dyytYdivSdzASlAyMx4TutDSNTzjkbyf1V3Qge96/kKp0tVQP9J5PG
	Jr71vdxnvcYtXJ58Lrsq8xrHyGp6ZeQyzhBxw3nMl6wtfC2KAsi/QsiQhfphbhltYeU4jK
	4ES6YOXG13Ui1ojsCMfeP3iwI4NCUsH9wj+ARt+yNPWLkZqdj20nE7ogQia+RLmjAn/2LB
	PiCN5NbI9WAkogbiKckVYgvkDHY6w5QQTkptraCmnR3+wi1BNuUmUftLaXbByg==
Date: Thu, 17 Nov 2022 15:11:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Denis Arefev <arefev@swemel.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 trufanov@swemel.ru, vfh@swemel.ru
Subject: Re: [PATCH] mtd: lpddr: Added literal suffix
Message-ID: <20221117151141.20cfc362@xps-13>
In-Reply-To: <20221117123625.117161-1-arefev@swemel.ru>
References: <20221117123625.117161-1-arefev@swemel.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_061151_262640_5A774123 
X-CRM114-Status: GOOD (  15.36  )
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

SGkgRGVuaXMsCgphcmVmZXZAc3dlbWVsLnJ1IHdyb3RlIG9uIFRodSwgMTcgTm92IDIwMjIgMTU6
MzY6MjUgKzAzMDA6Cgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Npb24KPiAx
IDw8IGxwZGRyLT5xaW5mby0+RGV2U2l6ZVNoaWZ0IGlzIHN1YmplY3QgdG8gb3ZlcmZsb3cKPiBk
dWUgdG8gYSBmYWlsdXJlIHRvIGNhc3Qgb3BlcmFuZHMgdG8gYSBsYXJnZXIgZGF0YQo+IHR5cGUg
YmVmb3JlIHBlcmZvbWluZyBhcml0aG1ldGljCj4gCj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgQXJl
ZmV2IDxhcmVmZXZAc3dlbWVsLnJ1Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9scGRkci9scGRkcl9j
bWRzLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMgYi9k
cml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMKPiBpbmRleCBlZTA2M2JhZWQxMzYuLjM2MGIy
YWY4MzQwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMKPiBAQCAtNjEsNyArNjEsNyBAQCBz
dHJ1Y3QgbXRkX2luZm8gKmxwZGRyX2NtZHNldChzdHJ1Y3QgbWFwX2luZm8gKm1hcCkKPiAgCQlt
dGQtPl9wb2ludCA9IGxwZGRyX3BvaW50Owo+ICAJCW10ZC0+X3VucG9pbnQgPSBscGRkcl91bnBv
aW50Owo+ICAJfQo+IC0JbXRkLT5zaXplID0gMSA8PCBscGRkci0+cWluZm8tPkRldlNpemVTaGlm
dDsKPiArCW10ZC0+c2l6ZSA9IDFVTCA8PCBscGRkci0+cWluZm8tPkRldlNpemVTaGlmdDsKCkFy
ZSB5b3Ugc3VyZSBpdCBzaG91bGQgbm90IGJlIDFVTEwgaW5zdGVhZD8gb3RoZXJ3aXNlIEkgZG9u
J3Qgc2VlIGhvdwp0aGUgb3ZlcmZsb3cgY2FuIGhhcHBlbj8KCj4gIAltdGQtPmVyYXNlc2l6ZSA9
IDEgPDwgbHBkZHItPnFpbmZvLT5Vbmlmb3JtQmxvY2tTaXplU2hpZnQ7Cj4gIAltdGQtPndyaXRl
c2l6ZSA9IDEgPDwgbHBkZHItPnFpbmZvLT5CdWZTaXplU2hpZnQ7Cj4gIAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
