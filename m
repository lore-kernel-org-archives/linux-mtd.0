Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7815AC433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 11:54:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18CBA613B3
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 11:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18CBA613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+JQGgUFNZm4wRTR7o/aiUowZCBgWlyjBj0iI4+LBtXE=; b=qQo2X8KBMY3+2nFbsgiDazCrR
	Uyd1s7npoqMghrXPEkVeIFDIka+rbG/mpNsotHFi8b44ZGbBHL5GVzRsTBsiOgMdZapqnlXXyhb4D
	muWyTplt4KUHCLhiVQpqinU+HluSFVjODuIKm2F4cd5hT8GBHCnPjYav5uKUW5hDWtvgGwzoJNLjl
	4zwnf/koWSIfAGh5W4Nw/3NGjCTm4EEFivv4ZXrlkXagB7rYEDiUOT23jONbzTZ4wEPlnieR7E7/g
	GGplkkiJCYw6ShnSEwEvM988i3Gf71PelG0r0XMJTqgHJE7eyRruScPgZQqS6zRzpGhGewjNxXG+g
	KpaZawi8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTkGB-002S1v-My; Tue, 06 Apr 2021 11:52:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTk7f-002PoC-4A
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 11:44:14 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 136BhpsB056177;
 Tue, 6 Apr 2021 06:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617709431;
 bh=QSG4b7m1t5DUwLSSKalMTsywrLdqOmMYeBMn11ljLTw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=y69pvXZ2Wo9aglIaKqzt34mORRsxN+QFB7RkFdRv5uPLi7MYoV6mS+8m8OLwZfk6s
 hkPjpDBnh37TB3E9Rg7zRTbgSj8vglG4UM1ME/TyXv9iXXCPCOmofMIXBj8rPv21nI
 6cB7TPc59zgQAGfxGCuETzA8Tsi1joeZU2nSe/LY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 136Bhp8Y008077
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Apr 2021 06:43:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Apr
 2021 06:43:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Apr 2021 06:43:51 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 136Bhm5Y107532;
 Tue, 6 Apr 2021 06:43:49 -0500
Subject: Re: [PATCH 2/2] mtd: spi-nor: add initial sysfs support
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-3-michael@walle.cc>
 <658af7ad-c4ee-1c25-b51b-1f66b657aade@ti.com>
 <4f1de957288118d5a627027ec4c37973@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e14029f2-587d-0f89-98ee-c08b550bf282@ti.com>
Date: Tue, 6 Apr 2021 17:13:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f1de957288118d5a627027ec4c37973@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_124355_716046_229F2EE4 
X-CRM114-Status: GOOD (  21.67  )
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

CgpPbiA0LzYvMjEgMjoxNyBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPiBBbSAy
MDIxLTA0LTA2IDA5OjU2LCBzY2hyaWViIFZpZ25lc2ggUmFnaGF2ZW5kcmE6Cj4+IEhpLAo+Pgo+
PiBPbiAzLzE4LzIxIDI6NTQgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBBZGQgc3VwcG9y
dCB0byBzaG93IHRoZSBuYW1lIGFuZCBKRURFQyBpZGVudGlmaWVyIGFzIHdlbGwgYXMgdG8gZHVt
cCB0aGUKPj4+IFNGRFAgdGFibGUuIE5vdCBhbGwgZmxhc2hlcyBsaXN0IHRoZWlyIFNGRFAgdGFi
bGUgY29udGVudHMgaW4gdGhlaXIKPj4+IGRhdGFzaGVldC4gU28gaGF2aW5nIHRoYXQgaXMgdXNl
ZnVsLiBJdCBtaWdodCBhbHNvIGJlIGhlbHBmdWwgaW4gYnVnCj4+PiByZXBvcnRzIGZyb20gdXNl
cnMuCj4+Pgo+Pgo+PiBTb3JyeSBmb3IgdGhlIGRlbGF5Li4KPj4KPj4gVGhlcmUgaXMgYWxyZWFk
eSBkZWJ1Z2ZzIHN1cHBvcnQgZm9yIGR1bXBpbmcgSkVERUMgSUQgWzFdLiBBbnkgcmVhc29uIHRv
Cj4+IGFkZCBzeXNmcyBlbnRyeSBhcyB3ZWxsPwo+IAo+IFRoaXMgaXMgcGVyIG10ZCB3aGlsZSB0
aGUgc2ZkcCBpcyBwZXIgZmxhc2ggZGV2aWNlLiBJTUhPIGJvdGggc2hvdWxkCj4gYmUgYXQgdGhl
IHNhbWUgcGxhY2UuCj4gCj4+IFRoYXQgYnJpbmdzIHVwIGFub3RoZXIgcXVlc3Rpb24uIFNpbmNl
IFNGRFAgZHVtcHMgYXJlIG1vcmUgb2YgYSBkZWJ1Zwo+PiBhaWQsIHNob3VsZCB0aGlzIGJlIGEg
ZGVidWdmcyBlbnRyeSByYXRoZXIgdGhhbiBzeXNmcyBlbnRyeT8KPiAKPiBBbmQgeW91J3JlIG5v
dCB0aGUgZmlyc3Qgb25lIGFza2luZyB0aGF0LiBNeSBhcmd1bWVudCB3YXMgdGhhdCB0aGUKPiBk
ZWJ1Z2ZzIG1pZ2h0IG5vdCBiZSBhdmFpbGFibGUganVzdCB3aGVuIHlvdSBuZWVkIGl0LiBBIGRl
dmVsb3Blcgo+IGNvdWxkIGVhc2lseSByZWJ1aWxkIGEga2VybmVsLCBidXQgaW1hZ2luZSBzb21l
IHVzZXIgd2l0aCBhIENPVFMKPiBkaXN0cm8gYW5kIHNvbWUgcHJvYmxlbXMsIHRoZW4gaXQgaXMg
bm90IHRoYXQgZWFzeSBhbnltb3JlLiBCdXQKPiB0aGF0cyB5b3VyIGNhbGwgdG8gbWFrZS4KPiAK
Pj4gTm90ZSB0aGF0IHN5c2ZzIGVudHJpZXMgYXJlIHVzZXJzcGFjZSBBQklzIGp1c3QgbGlrZSBz
eXNjYWxscyBhbmQgdGh1cwo+PiBuZWVkIHRvIGJlIGRvY3VtZW50ZWQgaW4gRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy8gb3IKPj4gRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlLiBUaHVzIG5lZWQg
dG8gYmUgY2FyZWZ1bGx5IGRlc2lnbmVkIGNvbXBhcmVkIHRvCj4+IGRlYnVnZnMgd2hpY2ggYXJl
IG11Y2ggbW9yZSBmbGV4aWJsZS4KPiAKPiBPay4gQnV0IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSBh
ZGRpbmcgdGhlc2UgcmVhZC1vbmx5IGZpbGVzCj4gwqAvc2ZkcAo+IMKgL25hbWUKPiDCoC9qZWRl
Yy1pZAo+IAoKSG1tLCBvay4gYnV0IGRvIGFkZCBkb2N1bWVudGF0aW9uIHBsZWFzZS4KClJlZ2Fy
ZHMKVmlnbmVzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
