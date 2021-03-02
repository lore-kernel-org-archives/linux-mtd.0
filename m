Return-Path: <SRS0=6g4x=IA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E66C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Mar 2021 05:50:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581416146B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Mar 2021 05:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581416146B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sGQl8zXEH6HlNLk3VTdxB7gz7xXH0xwKjnBgAzfAKY=; b=0IeHoKc7rH22bBYOiBpS2EHFM
	JqxgSusTDQu/ALmvKhQTs/OcxhV1zv3xEk5fW+AGVuD+Xr5SqQ4oCeKmTX6SiGBzLNrYYXZv4L2ct
	9Q5j6fCdX5gb1JjlWSH+fgqa21DTsMI/CcP7G0/jYRYl/cGN1XcCRxsvrb/L0TB9XiTyKxNN2CDKo
	jmbCRH2mv9bhNw+LWsmlABWs8a7RxeI+vmJX1FSCyLh54Dz1Z1EGZfVxyy82W151Ur2W/5QxMwigP
	t4UWciH5VsITNhYyqz7GrZU5Vv3S3A+KM2Cj3WC8kIAAKz8CGumgv9OasbaIQVkx32ItEE/Wi6Hih
	9p1Bto4Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGxuU-00087B-Qg; Tue, 02 Mar 2021 05:49:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGxuM-00086o-8v
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 05:49:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1225nIwK032065;
 Mon, 1 Mar 2021 23:49:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614664158;
 bh=YQZfyxuA/GUI0Qb0aFej0n36zkEHRpKUaGCn+7ywX0E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RpGQNzRevDaqqnMwwblqGk7SQEWRxGJwyTP5mcKN9OEFpqFAfp49/S/rnw/P+Mr+X
 hAh1OZi692lrnVz5Ayg7TmIYGmoWrfyaTKxoexGYz731uAlzrWFtYyPrxhVyicaNrZ
 +jAoiAW95jveQ7LyEBNpveRwFLpatmQB0Ej1cqfg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1225nIhj075839
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Mar 2021 23:49:18 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 23:49:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 23:49:18 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1225nFBv105881;
 Mon, 1 Mar 2021 23:49:16 -0600
Subject: Re: spi-nor: maxronix MX25L12835F support
To: <Tudor.Ambarus@microchip.com>, <michael@walle.cc>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
 <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
Date: Tue, 2 Mar 2021 11:19:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_004922_514255_C462E360 
X-CRM114-Status: GOOD (  19.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org,
 heiko.thiery@gmail.com, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAzLzEvMjEgODo1NSBQTSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+
IE9uIDMvMS8yMSA0OjQyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gQW0gMjAyMS0wMy0wMSAxNTowOSwgc2NocmllYiBU
dWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206Cj4+PiBPbiAzLzEvMjEgMzo1MCBQTSwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93Cj4+Pj4gdGhlIGNvbnRlbnQgaXMgc2Fm
ZQo+Pj4+Cj4+Pj4gQW0gMjAyMS0wMy0wMSAxNDozNiwgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoK
Pj4+Pj4gSSB0aGluayBwcmludGluZyB0aGUgY29ycmVjdCBmbGFzaCBuYW1lIGlzIHNvbWV3aGF0
IGltcG9ydGFudC4gT3RoZXIKPj4+Pj4gdGhhbiB0aGUgaGFuZGZ1bCBvZiBwZW9wbGUgd2hvIGFy
ZSByZWFkaW5nIHRoaXMgdGhyZWFkLCBmZXcgd291bGQKPj4+Pj4ga25vdwo+Pj4+PiB0aGF0IFNQ
SSBOT1IgY2FsbHMgbXgyNWwxMjgzNWYgYXMgbXgyNWwxMjgwNWQgb3IgdmljZSB2ZXJzYS4gVGhp
cyBjYW4KPj4+Pj4gY2F1c2UgYSBsb3Qgb2YgY29uZnVzaW9uIGFtb25nIHBlb3BsZSB0cnlpbmcg
dG8gZGVidWcgYW55IGlzc3Vlcy4KPj4+Pgo+Pj4+IFVuZm9ydHVuYXRlbHksIHRoaXMgaXMga2lu
ZCBvZiBhIG1lc3MuIElmIG11bHRpcGxlIGZsYXNoIGRldmljZXMKPj4+PiBzaGFyZSB0aGUgc2Ft
ZSBpZCwgaXQgc2VlbXMgdG8gYmUgZmlyc3QgY29tZSBmaXJzdCBzZXJ2ZS4gVGhlIGtlcm5lbAo+
Pj4+IHdpbGwgcHJpbnQgdGhlIG5hbWUgd2hpY2ggd2FzIGludHJvZHVjZWQgZmlyc3QuCj4+Pj4K
Pj4+PiBUaGlzIGlzbid0IHRoZSBvbmx5IGZsYXNoIHdoaWNoIGlzIGFmZmVjdGVkLiBIYXZlIGEg
bG9vayBhdAo+Pj4+IMKgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+Pj4gVGhlcmUg
YXJlIGFsbCBraW5kIG9mIGZsYXNoIG5hbWVzLCBzb21lIG9mIHRoZW0gYXJlIG5vdCBldmVuIGV4
aXN0aW5nCj4+Pj4gYXMgdGhpcyBwYXJ0aWN1bGFyIHN0cmluZywgZWcuIHRha2UgdzI1cTY0andt
LCBpdHMgYWN0dWFsbHkgIldpbmJvbmQKPj4+PiBXMjVRNjRKVy1JTSBvciBXMjVRNjRKVy1KTSIu
Cj4+Pj4KPj4+PiBTbyB5ZXMsIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBzdWNoIGEgdGhpbmcs
IGJ1dCBmb3Igbm93LCBJIHdpbGwKPj4+PiB0YWtlIHRoZSBrZXJuZWwgb3V0cHV0IGFzIGEgcm91
Z2ggZXN0aW1hdGlvbiB3aGF0IG1pZ2h0IHJlYWxseSBiZQo+Pj4+IHVzZWQgb24gdGhlIGJvYXJk
Lgo+Pj4+Cj4+Pgo+Pj4gSG93IGFib3V0IG5hbWluZyB0aGVtIHNvbWV0aGluZyBsaWtlICJ1cGRh
dGVkLWZsYXNoLW5hbWUgfHwKPj4+IGZpcnN0LW5hbWUiLgo+Pj4gQW55d2F5LCB0aGVzZSBhcmUg
anVzdCB3b3JrYXJvdW5kcy4gTWFudWZhY3R1cmVycyBzaG91bGRuJ3QgdXNlIHRoZQo+Pj4gc2Ft
ZQo+Pj4gSkVERUMgSUQgZm9yIG5ldyBmbGFzaGVzLiBUaGV5IHNob3VsZCBhdCBsZWFzdCBhZGQg
YW4gZXh0ZW5kZWQgSUQuCj4+Cj4+IE1oLCB3aGF0IGFib3V0IGEgbGlzdCBvZiBuYW1lcz8gSSBt
ZWFuIHllcyBpdCBpcyBhIHdvcmthcm91bmQsIGJ1dAo+PiB0aGVyZSBpcyBhY3R1YWwgaGFyZHdh
cmUgZG9pbmcgdGhpcywgc28gSU1ITyBsaW51eCBoYXMgdG8gZGVhbCB3aXRoCj4+IGl0IGluIHNv
bWUgd2F5LiBPVE9IIHRoYXQgbGlzdCBtaWdodCBiZSBsb25nIGFuZCBkb2Vzbid0IGxvb2sgZ29v
ZAo+PiBpbiBkbWVzZyAob3Igd2hlcmV2ZXIgdGhhdCBzdHJpbmcgbWlnaHQgYmUgdXNlZCkuCj4+
Cj4+IEl0IG1pZ2h0IGNvbWUgaW4gaGFuZHkgdG8gaGF2ZSBhIG1lY2hhbmlzbSBpbiBwbGFjZSBp
ZiBzb21lb25lCj4+IHJlYWxseSBjYXJlcyBhYm91dCBpdCB0aG91Z2guCj4+Cj4gCj4gQSBsaXN0
IG9mIG5hbWVzIHdpdGggZGlmZmVyZW50aWF0aW9uIGF0IHJ1bi10aW1lLCB3aGVyZSBwb3NzaWJs
ZSwKPiBzb3VuZHMgZ29vZC4gT3RoZXJ3aXNlIHdlJ2xsIHN0aWNrIHRvIGEgZGVmYXVsdCBuYW1l
LCB3aGF0ZXZlciB0aGF0Cj4gd2lsbCBiZS4gRG8geW91IGNhcmUgdG8gc2NyYXRjaCBhIHBhdGNo
IGZvciB0aGUgbGlzdCBvZiBuYW1lcyBpZGVhPwo+IAo+IFdlJ2xsIHN0aWxsIGhhdmUgYSBzaW5n
bGUgZmxhc2ggZW50cnksIHdpdGggYSBsaXN0IG9mIG5hbWVzLCBhbmQgd2UKPiBzdGlsbCBuZWVk
IHRvIGVpdGhlciBkbyB0aGUgU0ZEUCBkZXRlY3Rpb24gZmlyc3QsIG9yIHRvIHRyaWdnZXIgdGhl
Cj4gU0ZEUCBkZXRlY3Rpb24gd2l0aCBhbiBleHBsaWNpdCBmbGFzaCBpbmZvIGZsYWcuIEknbGwg
Zm9sbG93IFByYXR5dXNoJ3MKPiBzdGVwcyBhbmQgZXZhbHVhdGUgdGhlICJkZXRlY3QgU0ZEUCBm
aXJzdCIgaWRlYS4KPiAKCklmIHdlIGRvIGdvIGRvd24gdGhlIHJvYWQgb2YgImRldGVjdCBTRkRQ
IGZpcnN0Iiwgd2Ugc2hvdWxkIGFkZApTUElfTk9SX1NLSVBfU0ZEUCB0byBmbGFzaGVzIHRoYXQg
Y3VycmVudGx5IGRvbid0IGNsYWltIERVQUwvUVVBRC9PQ1RBTApjYXBhYmlsaXR5IGN1cnJlbnRs
eSBpbiBvcmRlciB0byBhdm9pZCBhbnkgc3VycHJpc2VzIGR1ZSB0byB3cm9uZyB2YWx1ZXMKaW4g
dGhlIHRhYmxlLgoKUmVnYXJkcwpWaWduZXNoCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
