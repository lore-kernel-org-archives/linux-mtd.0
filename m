Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B63C197A0
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3m8OXEUSz6/XaKsjGCnDbWwFr0iCKqmYkIW5MF61wM=; b=ecoNZDjgERyAcT
	OyhsGSBpsymzFBalijjt0l/sGDiORYuwPAm3wC/e7QdGstJps2F4xw+Lh6KgGgPGzTTMTrrYw+aKD
	n4IpVlDDEGXvFK6lA354tvhrz576IxuyXYCYYLJ/g5CH10nVYlSPsGgdyZ+UEE6KwurW7jH/q2BGu
	KsjwirvCMAUk7zPapd8+8y8natqcvwoI9P9MGuHjpUldUASC8+ntJ5j/1cN2uH4odMzk640KHwoMg
	ijTfh/CLx8sPhWvNSLQQixuYvH2Sy7eUo5Ow3zSxZE8+teaudzDdjK9MYLriIBSj1nh7jojm+1vus
	2KNDD0cerdEfW1K06+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eZv-003qup-0y;
	Thu, 16 Nov 2023 15:46:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eZr-003qsa-1s
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 15:46:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0055AFF811;
	Thu, 16 Nov 2023 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700149602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NzP6omckKO6pXhBexT1X2n8wT+/cFEgMRBiyd2eBaWg=;
	b=KZYfnwvsovuEUdw9BicMVkdt6L8HYUJwBzlp4wQSmeQJcF8m365OG77RAHx7AECWuTCv40
	Z96sByOGHIc4KsRGzXpiv5ZUIUW98tnV8TvhoK2b3ypY1OEkcfKoQtaPp9ZpUKdbJyCExK
	qvCVtY9OdYB9llRGycCqSzPlD4chR6NLyl/dIAJD+eRG5XHgPQWmK1Ulr49Ykx/Fc5g5Op
	mZxRFTRZBxhf4ipE0ij3wMkI15RKcnKV18fFs2CRYGCaTijj5gkwlueWWgk1Et7AN+hglj
	6F0FBeHsTul7CMixl9DZqA5946isEjLOGuH8biYeV/Y5mrbS0SbzN2YmOgkTiw==
Date: Thu, 16 Nov 2023 16:46:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND
 flash
Message-ID: <20231116164640.7eedec50@xps-13>
In-Reply-To: <20231114123008.185071-1-amadeus@jmu.edu.cn>
References: <20231029144840.484facee@xps-13>
	<20231114123008.185071-1-amadeus@jmu.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_074647_927913_17B3E9FC 
X-CRM114-Status: GOOD (  12.79  )
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

SGkgQ2h1a3VuLAoKYW1hZGV1c0BqbXUuZWR1LmNuIHdyb3RlIG9uIFR1ZSwgMTQgTm92IDIwMjMg
MjA6MzA6MDggKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiA+IEl0J3MgbW9yZSBsaWtlIGEgcmVx
dWVzdCB0aGFuIGEgcXVlc3Rpb24uIFBsZWFzZSBmaXggdGhlIHBhcmFtZXRlciBwYWdlCj4gPiBh
dCBydW4gdGltZSBieSByZWdpc3RlcmluZyBhIC0+LmZpeHVwX29uZmlfcGFyYW1fcGFnZSgpIGhv
b2sgaW4KPiA+IFRvc2hpYmEncyBuYW5kX21hbnVmYWN0dXJlcl9vcHMgc3RydWN0dXJlLiAgCj4g
Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBUaGlzIGZsYXNoIGlzIG5vdCBPTkZJIGNvbXBs
aWFudCBOQU5ELAo+IHNvIG9uZmkgZml4dXAgY2FuJ3Qgd29yay4gRGF0YXNoZWV0IGF2YWlsYWJs
ZSBhdDoKPiBodHRwczovL2V1cm9wZS5raW94aWEuY29tL2NvbnRlbnQvZGFtL2tpb3hpYS9uZXdp
ZHIvcHJvZHVjdGluZm8vZGF0YXNoZWV0LzIwMTkxMC9EU1RfVEg1OE5ZRzNTMEhCQUk0LVRERV9F
Tl8zMTU2NS5wZGYKCllvdSBzYWlkIGluIHlvdXIgY29tbWl0IGxvZyB0aGF0IHRoaXMgZmxhc2gg
d2FzIGRldGVjdGVkIHdpdGggYSBzbWFsbGVyCihvciBiaWdnZXIsIEkgZG9uJ3QgcmVtZW1iZXIp
IE9PQiBzaXplIHRoYW4gaXQgcmVhbGx5IGhhcy4gVGhpcyBudW1iZXIKY29tZXMgZnJvbSBzb21l
d2hlcmU/IElzIGl0IGFuIGV4aXN0aW5nIElEPyBJcyBpdCBhbiBhdXRvLWRpc2NvdmVyeQptZWNo
YW5pc20/CgpJZiBpdCdzIGFuIElEIHRoZW4gd2h5IG5vdCBhZGRpbmcgYSBuZXcgZW50cnkuIE90
aGVyd2lzZSB5b3UgY2FuIEkKZ3Vlc3MgbWFrZSBzb21lIGNoYW5nZXMgaW4gdGhlIGRldmljZSBn
ZW9tZXRyeSBpbiB0aGUgbWFudWZhY3R1cmVyIGluaXQKb3BlcmF0aW9uIGFzIHdlbGwgaWYgdGhl
IGZpeHVwLW9uZmkgaG9vayBkb2VzIG5vIGFwcGx5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
