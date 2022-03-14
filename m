Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA173C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBl8qxg0osDKNZP1pMgnp626+5gizXVxyoBAzWlIYak=; b=4uzN608vPuh23z
	t/bmEFjydv8pKJ5ztKIuFmXJvGwXltIYNv7s2Pr4+xY7Ny1A0orVcllxk3bOR3jqOwVNu2c6Z0quj
	MfWI6UXzEcDk0zalj/mH6S4iHQPO4IVzA8a1gE7l9juEzua7pRqr1NYhIl1TqyvOH87KfYFM29uwe
	Ylt90d+YVAqyl8NeSsGKfdoG6vNBvrf1naP2+KV45xbBqvWY6QkD6PBr44JCJEETs0Zokl5sECJhw
	riyp7dg6TnE0iSygDeXZgATR/b2jh7fqjOLLUy67kucO2W5tF4LXgPj5l02GN7EcwcD4Auk656j6S
	nO8r6ypMZQHUeGF2K8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjBN-005Eb5-DG; Mon, 14 Mar 2022 11:48:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjBD-005EVo-Ux
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 11:48:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22EBlGTZ124224;
 Mon, 14 Mar 2022 06:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647258436;
 bh=A+p09ykpYT6VHc3fsURK5eWzEGL+2zDBzN5kHFSBz8c=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=E1jemJllSfQqx5Izpc3mGcNV1DwGMELTSSOwpBuYCP43xPhZii6hINMNW1Hj81dOO
 rmJylF2qoYC4E2OkfUcK/wRQJReI4n4IyL8ReF+qVz+I0/0JGaOuFj/TkrC8x1dgCf
 ZB5zSHcvK4jMP0XJpmz/LBSoJYPpnByi1Yjz+3ks=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22EBlGeJ040925
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Mar 2022 06:47:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 06:47:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 06:47:16 -0500
Received: from [10.250.235.173] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22EBlBgu022886;
 Mon, 14 Mar 2022 06:47:12 -0500
Message-ID: <1dfd6a3d-452a-1e71-ca26-1fffe6db1636@ti.com>
Date: Mon, 14 Mar 2022 17:17:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-6-a-nandan@ti.com>
 <20220103110107.45594e78@collabora.com>
 <bf3ea909-e0a5-eeac-12e9-c8a809685f48@ti.com>
 <20220215183705.574df0c1@collabora.com>
 <12c7a6a6-8b49-1c3e-087f-79c77388b091@ti.com>
 <20220310094053.1d86d13a@collabora.com>
From: Apurva Nandan <a-nandan@ti.com>
In-Reply-To: <20220310094053.1d86d13a@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_044804_112023_7BCD40C6 
X-CRM114-Status: GOOD (  25.13  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDEwLzAzLzIyIDE0OjEwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVGh1LCAxMCBN
YXIgMjAyMiAxMzoyNzowNiArMDUzMAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4g
d3JvdGU6Cj4KPj4+Pj4gVGhpcyB3YXksIHlvdSBjYW4gZWFzaWx5IHBpY2sgdGhlIHJpZ2h0IHNl
dCBvZiBvcGVyYXRpb25zIGJhc2VkCj4+Pj4+IG9uIHRoZSBwcm90b2NvbC9tb2RlIHlvdSdyZSBp
bjoKPj4+Pj4KPj4+Pj4gI2RlZmluZSBzcGluYW5kX2dldF9vcF90ZW1wbGF0ZShzcGluYW5kLCBv
cG5hbWUpIFwKPj4+Pj4gCSgoc3BpbmFuZCktPm9wX3RlbXBsYXRlc1soc3BpbmFuZCktPnByb3Rv
Y29sXS0+b3BuYW1lKQo+Pj4+Pgo+Pj4+PiBzdGF0aWMgaW50IHNwaW5hbmRfcmVhZF9yZWdfb3Ao
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1OCByZWcsIHU4ICp2YWwpCj4+Pj4+IHsK
Pj4+Pj4gCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gKnNwaW5hbmRfZ2V0X29wX3RlbXBsYXRlKHNw
aW5hbmQsIGdldF9mZWF0dXJlKTsKPj4+Pj4gCWludCByZXQ7Cj4+Pj4+Cj4+Pj4+IAkuLi4KPj4+
Pj4gfQo+Pj4+IEkgZmluZCBhIGNvdXBsZSBvZiBpc3N1ZXMgd2l0aCB0aGlzwqAgbWV0aG9kLAo+
Pj4+Cj4+Pj4gMS4gcmVhZF9jYWNoZSwgd3JpdGVfY2FjaGUsIHVwZGF0ZV9jYWNoZSBvcCB0ZW1w
bGF0ZXMgZG9uJ3QgZml0IHdlbGwKPj4+PiB3aXRoIHRoZSBvdGhlciBub24tZGF0YSBvcHMsIGFz
Cj4+Pj4gdGhlc2UgZGF0YSBvcHMgYXJlIHVzZWQgdG8gY3JlYXRlIGEgZGlybWFwLCBhbmQgdGhh
dCBjYW4gYmUgZG9uZSBvbmx5Cj4+Pj4gb25jZSBhdCBwcm9iZSB0aW1lLiBIZW5jZSwgdGhlcmUK
Pj4+PiBpcyBhIGRpZmZlcmVudCBtZWNoYW5pc20gb2Ygc2VsZWN0aW5nIG9mIGRhdGEgb3BzIGFu
ZCBub24tZGF0YSBvcHMuCj4+PiBOb3Qgc3VyZSBJIHNlZSB3aHkgdGhpcyBpcyBhIHByb2JsZW0u
IFlvdSBjYW4gcG9wdWxhdGUgZGF0YS1vcHMgZm9yIGFsbAo+Pj4gbW9kZXMsIGFuZCBwaWNrIHRo
ZSBvbmUgdGhhdCBwcm92aWRlcyB0aGUgYmVzdCBwZXJmcyB3aGVuIHlvdSBjcmVhdGUKPj4+IHRo
ZSBkaXJtYXAgKHdoaWNoIHNob3VsZCByZWFsbHkgYmUgYXQgdGhlIGVuZCBvZiB0aGUgcHJvYmUs
IGlmIGl0J3Mgbm90Cj4+PiBhbHJlYWR5KS4KPj4+ICAgCj4+Pj4gSGVuY2UsIHRoaXMgZGl2aXNp
b24gaW4gdGhlIG9wIHRlbXBsYXRlcwo+Pj4+IHN0cnVjdCBhcyBkYXRhX29wcyBhbmQgY3RybF9v
cHMgaXMgcmVxdWlyZWQuIEN1cnJlbnRseSwgdGhlIGNvcmUgb25seQo+Pj4+IHN1cHBvcnRzIHVz
aW5nIGEgc2luZ2xlIHByb3RvY29sIGZvcgo+Pj4+IGRhdGEgb3BzLCBjaG9zZW4gYXQgdGhlIHRp
bWUgb2YgcHJvYmluZy4KPj4+IEFnYWluLCBJIGRvbid0IHNlZSB3aHkgeW91IG5lZWQgdG8gZGlm
ZmVyZW50aWF0ZSB0aGUgY29udHJvbCBhbmQgZGF0YQo+Pj4gb3BzIHdoZW4gcG9wdWxhdGluZyB0
aGlzIHRhYmxlLiBUaG9zZSBhcmUganVzdCBvcGVyYXRpb25zIHRoZSBOQU5ECj4+PiBzdXBwb3J0
cywgYW5kIHRoZSBkYXRhIG9wZXJhdGlvbnMgaXMganVzdCBhIHN1YnNldC4KPj4+ICAgCj4+Pj4g
Mi4gSWYgd2UgdXNlIHRoaXMgc2luZ2xlIG9wX3RlbXBsYXRlcyBzdHJ1Y3QsIEkgY2FuJ3QgdGhp
bmsgb2YgYW55IGdvb2QKPj4+PiB3YXkgdG8gaW5pdGlhbGl6ZSB0aGVzZSBpbiB0aGUKPj4+PiBt
YW51ZmFjdHVyZXJzIGRyaXZlciAod2luYm9uZC5jKSwgcmVmZXIgdG8gMTd0aCBwYXRjaCBpbiB0
aGlzIHNlcmllcy4KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYSBtYWNybwo+Pj4+IGlt
cGxlbWVudGF0aW9uIGFsc28gZm9yIHdpbmJvbmQuYyB3aXRoIHRoZSBzdWdnZXN0ZWQgb3BfdGVt
cGxhdGVzIHN0cnVjdC4KPj4+IEZpcnN0IHJlcGxhY2UgdGhlIG9wX3ZhcmlhbnRzIGZpZWxkIGJ5
IHNvbWV0aGluZyBtb3JlIGdlbmVyaWM6Cj4+Pgo+Pj4gc3RydWN0IHNwaW5hbmRfaW5mbyB7Cj4+
PiAuLi4KPj4+IAljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9vcF92YXJpYW50cyAqKm9wc192YXJpYW50
czsKPj4+IC4uLgo+Pj4gfTsKPj4+Cj4+PiAjZGVmaW5lIFNQSU5BTkRfT1BfVkFSSUFOVFMoX2lk
LCAuLi4pIFwKPj4+IAlbU1BJX05BTkRfT1BfICMjIF9pZF0gPSB7IF9fVkFfQVJHU19fIH0KPj4+
Cj4+PiAjZGVmaW5lIFNQSU5BTkRfT1BTX1ZBUklBTlRTKG5hbWUsIC4uLikKPj4+IAljb25zdCBz
dHJ1Y3Qgc3BpbmFuZF9vcF92YXJpYW50cyBuYW1lW117Cj4+PiAJCV9fVkFfQVJHU19fLAo+Pj4g
CX07Cj4+Pgo+Pj4gI2RlZmluZSBTUElOQU5EX0lORk9fT1BTX1ZBUklBTlRTKGRlZnMpCj4+PiAJ
Lm9wc192YXJpYW50cyA9IGRlZnMKPj4gSWYgd2UgbW9kaWZ5IHRoZXNlIG1hY3JvcywgaXQgd291
bGQgcmVxdWlyZSBvdGhlciBzcGluYW5kIHZlbmRvciBkcml2ZXJzCj4+IHRvIGNoYW5nZSAodG9z
aGliYSwgbWljcm9uLCBldGMpLgo+PiBUaGUgb2xkZXIgbWFjcm9zIHN1aXQgdGhlbSB3ZWxsLCBz
aG91bGQgd2UgZ28gYWJvdXQgY2hhbmdpbmcgdGhlbSB0bwo+PiB0aGlzIG5ldyBtYWNybyAod2ls
bCByZXF1aXJlIHJlLXRlc3RpbmcgYWxsIG9mIHRoZW0pLAo+PiBvciBjYW4gd2Uga2VlcCB0aGVt
IHVuY2hhbmdlZCBhbmQgaGF2ZSBuZXcgc2V0IG9mIG1hY3JvcyB3aXRoIGRpZmZlcmVudAo+PiBu
YW1lIChwbGVhc2UgZ2l2ZSBzdWdnZXN0aW9uIGZvciBpdCkgZm9yIG9wIHZhcmlhbnRzLgo+IEkn
ZCByYXRoZXIgaGF2ZSBldmVyeXRoaW5nIGNvbnZlcnRlZCB0byB0aGUgbmV3IGFwcHJvYWNoICh3
ZSBkb24ndCB3YW50Cj4gMiB3YXlzIG9mIGRlc2NyaWJpbmcgdGhlIHNhbWUgdGhpbmcpLCBhbmQg
SSdtIG5vdCBzdXJlIHlvdSBjYW4gbWFrZSB0aGUKPiBvbGQgbWFjcm9zIG1hcCB0byB0aGUgbmV3
IHNvbHV0aW9uLCBzbyBJIGZlYXIgeW91J2xsIGhhdmUgdG8gcGF0Y2ggYWxsCj4gdmVuZG9ycy4g
VGhpcyBiZWluZyBzYWlkLCBJJ20gZmluZSBwcm92aWRpbmcgc2ltcGxlIHdyYXBwZXJzIGlmIHRo
YXQKPiBoZWxwcywgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGV5J2QgbWFrZSB0aGUgZGVzY3JpcHRp
b24gc2ltcGxlci9tb3JlCj4gY29tcGFjdCB0byBiZSBob25lc3QuCk9rYXksIEkgd2lsbCBjb252
ZXJ0IGFsbCBvZiB0aGUgdmVuZG9yIGRyaXZlcnMsIGJ1dCBwbGVhc2Ugbm90ZSBJIGRvbid0IApo
YXZlIGFueSB3YXkgdG8gdGVzdCB0aGUgY2hhbmdlcyBvbiBhbGwgdGhlIGZsYXNoZXMuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
