Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9D8C67861
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 00:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLUqCpDtxTquC7sq7/ZfDe5VAPJv8sepPyjGRqsVf0c=; b=XFmx/t4PapeuBSU1FdzXDC/3cR
	XAt2xWARy9J7+CK/eRINvTETr4xyGVgECrHPFbuJaMT4ul0JaZ1Gm2J7VVaOCRL6rUffviOqbFIry
	1/mjYIwl28gaMu8qpbBy2DpDzchwmw+HFLKiavo0NVstlMZUfqfwW8WXtp/b6P5kIjQZ5pm4t3Vy9
	TSwsYdtjd32Gif3maNWDnSM8qH1IiepoXsSgfVnAvNZDxha/7wP4W/1sNJjMemY8qRkOg1KYejMfi
	XXQ28/aSWNEIrjC/Ji4yAJ9CmNMe0hm5Z5Y3Q8o8aLGf+KAOwKgF6PgI64jJYzJcyCHOKC2M7j8ME
	NpfHsw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLx4-00000004SAq-038y;
	Wed, 10 Apr 2024 00:36:34 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLwz-00000004S9p-35L5
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 00:36:31 +0000
Received: from [192.168.0.106] (unknown [114.249.187.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7C7CD40F3E;
	Wed, 10 Apr 2024 00:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712709385;
	bh=YP1M8DtqRvEFHJMO3l3zyq/BygpkFBNmCE9piIku7P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=eD4DbQQxA+wXeH6UkyFJrMXTgrnutc/5xjY4MrqFOvaKWy7wDNuyDNTTl4A1PBsWo
	 DHKHQA9O6h75YZNx0u3A9TmW6r9i6tr2PJH/sBG7ckW0pv7oll53g05BoHQ0Y/iEyh
	 I0BLSoZklGFvRutHD6GJ6OA9I0f6KYC81Zd47m9IzK2q9iI989BuFJkavri+tpkX6h
	 AjeAu2TdXOPZrlrs8maaSN78FLAp3LdLqI7exsYwBlErdSYDhvGpiShDaYxY+rNWjC
	 updLNO6KF6YaAoeI1+5/rVU+nzU0/UNLD+AP6FfDU7Z4VddaVnu5AeFOoRmMH7eqku
	 lA2vC2ex7ID2Q==
Message-ID: <54e55933-8125-43b3-9c89-be5a83debf59@canonical.com>
Date: Wed, 10 Apr 2024 08:36:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
To: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org
References: <20240408124328.777375-1-hui.wang@canonical.com>
 <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
 <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
 <D0FGHMY4V864.118ONNO1DWQ7G@kernel.org>
 <a82f7811-e9f4-4d1f-91f4-56b87d35eb9a@canonical.com>
 <D0FMJAZ3ZR1W.13DMUSVMDMJ7H@kernel.org>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <D0FMJAZ3ZR1W.13DMUSVMDMJ7H@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_173630_148848_2466E0F1 
X-CRM114-Status: GOOD (  15.65  )
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

Ck9uIDQvOS8yNCAyMToyNSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPgo+Pj4+Pj4gSXQg
aXMgMk1iaXQgRi1SQU0gd2hpY2ggaXMgbG9naWNhbGx5IG9yZ2FuaXplZCBhcyAyNTZLIHggOC4K
Pj4+Pj4gUGxlYXNlIGhhdmUgYSBsb29rIGF0IGRyaXZlcnMvbWlzYy9hdDI1LmMuIEknbSB0cnlp
bmcgdG8gZ2V0IHJpZCBvZgo+Pj4+PiB0aGUgTk9fRVJBU0UgZmxhZy4gVGhpcyBpcyBtb3JlIG9m
IGFuIEVFUFJPTSBsaWtlIGRldmljZS4gVGhlIGF0MjUKPj4+Pj4gZHJpdmVyIGFscmVhZHkgaGF2
ZSBzb21lIGtpbmQgb2YgRlJBTSB0eXBlIHN1cHBvcnQuCj4+Pj4gQWZ0ZXIgcmVhZGluZyB5b3Vy
IGNvbW1lbnQsIEkgY2hlY2tlZCB0aGUgZHJpdmVycy9taXNjL2F0MjUuYywgSSBmb3VuZAo+Pj4+
IEl0IGNvdWxkbid0IHdvcmsgb24gbXkgaGFyZHdhcmUuIEluIG15IGNhc2UsIHRoZSBGLVJBTSBp
cyB1bmRlciBhIHNwaQo+Pj4+IGJ1cyAoc3BpLW54cC1mc3BpLmMpIHdoaWNoIG9ubHkgc3VwcG9y
dHMgc3BpX21lbSB0cmFuc2ZlciBtb2RlLiBTbwo+Pj4+IGN1cnJlbnRseSwgdGhlIG10ZC9zcGkt
bm9yIGlzIHRoZSBvbmx5IGNob2ljZS4KPj4+IFRoZW4gaXQgd2lsbCBiZSBhIGdyZWF0IG9wcG9y
dHVuaXR5IHRvIG1ha2UgdGhlIGF0MjUgZHJpdmVyIHNwaS1tZW0KPj4+IHJlYWR5IDopCj4+IE9L
LiA6LSkKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwu
Y29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5j
IHwgNiArKysrKysKPj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+
Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+Pj4+Pj4gaW5kZXggNmNjMjM3YzI0ZTA3
Li41ZGM5NDkyNmIyY2IgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3Nw
YW5zaW9uLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+Pj4+
Pj4gQEAgLTk4MSw2ICs5ODEsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNw
YW5zaW9uX25vcl9wYXJ0c1tdID0gewo+Pj4+Pj4gICAgIAkJLm5hbWUgPSAiczI4aHMwMmd0IiwK
Pj4+Pj4+ICAgICAJCS5tZnJfZmxhZ3MgPSBVU0VfQ0xQRUYsCj4+Pj4+PiAgICAgCQkuZml4dXBz
ID0gJnMyOGh4X3RfZml4dXBzLAo+Pj4+Pj4gKwl9LCB7Cj4+Pj4+PiArCQkuaWQgPSBTTk9SX0lE
KDB4NDgsIDB4NTEsIDB4ODAsIDB4MDYsIDB4MDAsIDB4MDApLAo+Pj4+PiBUaGlzIGRvZXNuJ3Qg
bG9vayBsaWtlIGEgSkVERUMgaWQuIFRoZSBkYXRhc2hlZXQgc2F5cyBpdCBpcyBhIDExYml0Cj4+
Pj4+IG1hbnVmYWN0dXJlciBpZD8KPj4+Pj4KPj4+Pj4gLW1pY2hhZWwKPj4+PiAgICBGcm9tIHRo
ZSBwYWdlIDgyIG9mIGRhdGFzaGVldCwgdGhlIERldmljZSBJRCBpcyAwMDAwMDAwMDA2ODA1MTQ4
LCBhbmQKPj4+PiB0aGUgSUQgcmVhZCBieSBzcGlfbm9yX3JlYWRfaWQoKSBtYXRjaGVzIGl0IChp
ZFswXSBpcyAweDQ4LCBpZFsxXSBpcwo+Pj4+IDB4NTEsIC4uLikuCj4+PiBKRURFQyBtYW51ZmFj
dHVyZXIgSURzIGFyZSBub3QgMTFiaXQgd2lkZS4KPj4gSGF2ZSBubyBpZGVhIGhlcmUuIEkgdGhv
dWdodCBpdCBpcyBzYW1lIGFzIHRoZSBjeTE1eDEwNHEgYW5kIHRoZQo+PiBzcGFuc2lvbi5jIGhh
cyB0aGUgc3VwcG9ydCBmb3IgY3kxNXgxMDRxLgo+IFRoYXQgb25lIHdhcyBhbHJlYWR5IGJyb2tl
biAoYW5kIEknZCBsaWtlIHRvIG1vdmUgdGhhdCBvbmUgdG8gdGhlCj4gYXQyNSB0b28pOyBpdCBo
YWQgdGhlIElEIGJpdHMgcmV2ZXJzZWQgYW5kIHRoaXMgb25lIGlzIGV2ZW4gbW9yZQo+IGJyb2tl
biA6KApPSywgZ290IGl0LiA6LSnCoCB3aWxsIGZvY3VzIG9uIGF0MjUgdGhlbi4KPiAtbWljaGFl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
