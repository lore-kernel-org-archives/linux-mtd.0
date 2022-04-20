Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A9DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1OBEfo626mGNu3jpYzCIc6tDzLWNcD2ufMoW8fgzcg=; b=dhLvPoJ6zYfCS6
	oHWDxEho7VKaGHG48hltuTumPC89YRYpwcX39YxsSkOLU2HqQECqeBm9D9f/bZGZIm5CHaLaenzNb
	C1zna55+1ICMxmvShcXEJBVcbeo3iFY8MLXvJP3ZpZRLrud3gSqImQC9XumVXhCnVlDJmsA4QWFiq
	1RHyAZ+JXBkuThU0efcph2wUYMGK80PPUz6UECt9hH0d/+Algs4KJ37+nb63KBzA7IC9U4qDZIaQ0
	feAFameBOg86r6hcWkzzYz3tMTiM6/2VnpHjycRWWg1gfCHTBWI2nJDudLm2gfubqQl5B71D3GowT
	xu5eSGCUVwgioKyUYmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5Ym-0082du-So; Wed, 20 Apr 2022 08:19:36 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5YX-0082Yg-Tk; Wed, 20 Apr 2022 08:19:23 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 20 Apr
 2022 16:19:17 +0800
Message-ID: <fb76d82d-d4df-9b0a-506c-83771f000b97@amlogic.com>
Date: Wed, 20 Apr 2022 16:19:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-2-liang.yang@amlogic.com>
 <20220404103034.48ec16b1@xps13>
 <50105d6b-8ced-1b72-30cb-a709c4a4dd26@amlogic.com>
 <d5a33645-fac1-9c69-afe6-654bfe93ca48@amlogic.com>
 <20220419102629.1c77aa2a@xps13>
 <2e382e3e-c231-c9e4-73a1-0637288fcd4f@amlogic.com>
 <20220419172528.2dd75e7b@xps13>
 <126691f4-bc6b-10cd-ee2c-ff4006bc6518@amlogic.com>
 <20220420092912.10ce66ec@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220420092912.10ce66ec@xps13>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_011921_984392_834A5D36 
X-CRM114-Status: GOOD (  29.32  )
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

SGkgTWlxdWVsLAoKT24gMjAyMi80LzIwIDE1OjI5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIExpYW5nLAo+IAo+IGxpYW5nLnlhbmdAYW1sb2dpYy5j
b20gd3JvdGUgb24gV2VkLCAyMCBBcHIgMjAyMiAxMzo0NDozMiArMDgwMDoKPiAKPj4gSGkgTWlx
dWVsLAo+Pgo+PiBPbiAyMDIyLzQvMTkgMjM6MjUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBb
IEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBIZWxsbywKPj4+Cj4+PiBsaWFuZy55YW5nQGFtbG9n
aWMuY29tIHdyb3RlIG9uIFR1ZSwgMTkgQXByIDIwMjIgMTc6MTc6NDggKzA4MDA6Cj4+PiAgICAK
Pj4+PiBIZWxsbyBNaXF1ZWwsCj4+Pj4KPj4+PiBPbiAyMDIyLzQvMTkgMTY6MjYsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pgo+Pj4+PiBIZWxsbywK
Pj4+Pj4KPj4+Pj4gbGlhbmcueWFuZ0BhbWxvZ2ljLmNvbSB3cm90ZSBvbiBNb24sIDE4IEFwciAy
MDIyIDExOjQwOjEwICswODAwOgo+Pj4+PiAgICAgPj4+PiBIaSBNaXF1ZWwsCj4+Pj4+Pgo+Pj4+
Pj4gaSBoYXZlIHNvbWUgY29uZnVzaW9uIHdoZW4gaSBwcmVwYXJlIHRoZSBwYXRjaGVzLiBmb3Ig
RFQgY29tcGF0aWJpbGl0eSwgaXQgZmFsbHMgYmFjayB0byB0aGUgb2xkIERUIHdoZW4gZmFpbGVk
IHRvIGdldCByZXNvdXJjZSBieSB0aGUgbmV3IERULCBidXQgdGhlcmUgaXMgc29tZSBwb2ludHM6
Cj4+Pj4+PiBhLiBvbGQgRFQgZGVwZW5kcyBvbiBNTUMgc3ViIGNsb2NrIGRyaXZlciwgYnV0IGl0
IG5ldmVyIGJlIG1lcmdlZCwgc28gaXQgY2FuJ3Qgd29yay4KPj4+Pj4KPj4+Pj4gSSBkb24ndCBn
ZXQgd2hhdCB5b3UgbWVhbiBoZXJlLCBzb3JyeS4gSSBiZWxpZXZlIHRoZXJlIGlzIGEgbmV3IHdh
eSB0bwo+Pj4+PiBkZXNjcmliZSB0aGlzIGNsb2NrIGJ1dCBncmFiYmluZyB0aGUgb25lIGZyb20g
dGhlIE1NQyBzdGlsbCB3b3JrcywgZG9lcwo+Pj4+PiBub3QgaXQ/Cj4+Pj4+ICAgICA+Pgo+Pj4+
IE5vLCBpdCBkb2Vzbid0LiBhZnRlciB0aGUgTkZDIGRyaXZlciB1c2luZyB0aGUgTU1DIHN1YiBj
bG9jayBmcmFtZXdvcmsgd2FzIG1lcmdlZCBpbnRvIHRoZSBtYWlubGluZSBvZiBrZXJuZWwsIHdl
IGRpZG4ndCBjb250aW51ZSB0byBzdWJtaXQgdGhlIHNlcmllcyBvZiBwYXRjaGVzIGFib3V0IE1N
QyBzdWIgY2xvY2sgYWZ0ZXIgdjkuIHdoZW4gaSBmb3VuZCB0aGF0LCB3ZSBtYWRlIGEgZGlzY3Vz
c2lvbiB0byBkZWNpZGUgd2hldGhlciB0byByZWNvdmVyIHRoZSBzZXJpZXMgb2YgcGF0Y2hlcyBh
Ym91dCBNTUMgc3ViIGNsb2NrIGZyYW1ld29yaywgZmluYWxseSwgc2VlIHRoZSBkZXNjcmlwdGlv
biBmcm9tIGNvdmVyIGxldHRlciwgd2UgcGxhbiB0byBhYmFuZG9uIGl0IGFuZCBhZG9wdCB0aGUg
bmV3IGNsb2NrIHNjaGVtZSBpbiB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLgo+Pj4KPj4+IEkgYW0g
bm90IHN1cmUgdG8gZm9sbG93LiBJcyB0aGUgY3VycmVudCBjb2RlIGNvbXBsZXRlbHkgYnJva2Vu
PyBJCj4+PiBiZWxpZXZlIGl0IGlzIG5vdCwgc28gSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgaXNz
dWUuCj4+Cj4+IGkgdGhpbmsgb25seSB0aGUgY29kZSBhYm91dCB0aGUgY2xvY2sgaXMgY29tcGxl
dGVseSBicm9rZW4uCj4+Cj4+Pgo+Pj4gQ2FuIHlvdSBwbGVhc2Ugc3VtbWFyaXplIHRoZSBzaXR1
YXRpb24/Cj4+Cj4+IFllcy4gdGhlIGN1cnJlbnQgTkZDIGNsb2NrIGltcGxlbWVudGF0aW9uIGRl
cGVuZHMgb24gdGhlIGZvbGxvd2luZyBzZXJpZXMgb2YgcGF0Y2hlcyBbaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjIwMTIxMDc0NTA4LjQyMTY4LTUtbGlhbmcueWFuZ0BhbWxvZ2ljLmNv
bV0sIHdoaWNoIHdlIGNhbGwgIk1lc29uIE1NQyBTdWIgQ2xvY2sgQ29udHJvbGxlciBEcml2ZXIi
Lgo+PiB3aGVuIGkgd2FzIHByZXBhcmluZyB0aGUgTkZDIHBhdGNoc2V0IGF0IHRoYXQgdGltZSwg
d2UgZGlzY3Vzc2VkIGhvdyB0aGUgY2xvY2sgc2hvdWxkIGJlIGltcGxlbWVudGVkIGJhc2Ugb24g
dGhlIHNwZWNpYWwgY2xvY2sgZnJhbWV3b3JrIGZvciBORkMgYW5kIEVNTUMgcG9ydC4gdGhlbiB3
ZSBkZWNpZGVkIHRvIGltcGxlbWVudCBhIGRyaXZlciAiTWVzb24gTU1DIFN1YiBDbG9jayBDb250
cm9sbGVyIERyaXZlciIuIHNvIGFub3RoZXIgcGVvcGxlIGJlZ2luIHRvIHByZXBhcmUgIk1lc29u
IE1NQyBTdWIgQ2xvY2sgQ29udHJvbGxlciBEcml2ZXIiLCBidXQgc3VibWl0dGVkIGl0IGJ5IGRp
ZmZlcmVudCBwYXRjaHNldC4KPj4gZmluYWxseSwgbm93IHRoZSBtZXNvbiBORkMgcGF0Y2hzZXQg
aXMgYWNjZXB0ZWQgYW5kIG1lcmdlZCwgYnV0ICJNZXNvbiBNTUMgU3ViIENsb2NrIENvbnRyb2xs
ZXIgRHJpdmVyIiBwYXRjaHNldCBpcyBub3QuIGFsc28gd2UgZGVjaWRlIHRvIGFiYW5kb24gdGhl
IHBhdHNldCAiTWVzb24gTU1DIFN1YiBDbG9jayBDb250cm9sbGVyIERyaXZlciIgYW5kIGltcGxl
bWVudCB0aGUgbmV3IGNsb2NrIGRlc2lnbiBpbiB0aGlzIHNlcmllcy4KPiAKPiBPayB0aGFua3Mg
Zm9yIHRoZSBzdW1tYXJ5IGFuZCB0aGUgbGluayB3aXRoIHRoZSBkaXNjdXNzaW9uIHdpdGggSmVy
b21lCj4gYW5kIE5laWwsIGl0J3MgaW5mb3JtYXRpdmUuCj4gCj4gU28gaW4gdGhlIGVuZCwgd2Ug
YXJlIG5vdCByZWFsbHkgYnJlYWtpbmcgYW55dGhpbmcgaGVyZSBhcyB0aGlzIE5BTkQKPiBjb250
cm9sbGVyIGRyaXZlciBuZXZlciB3b3JrZWQgaW4gdGhlIGZpcnN0IHBsYWNlPyBPciBpcyBpdCBv
bmx5IG9uZSBvZgo+IHRoZSB0d28gY29tcGF0aWJsZXMgd2hpY2ggaXMgbm90IHdvcmtpbmc/Cgpp
IHRoaW5rIG5vIG9uZSBjYW4gd29yayBub3cuIGkgYW0gcHJlcGFyaW5nIHRoZSBuZXdlciBjbG9j
ayBmcmFtZXdvcmsgaW4gCnRoaXMgc2VyaWVzLgoKPiAKPiBJZiB0aGlzIG5ldmVyIHdvcmtlZCB0
aGVuIHBsZWFzZSBkbyB0aGUgYmluZGluZyBjaGFuZ2VzIChpbiB0aGUgZmlyc3QKPiBwYXRjaCBv
ZiB5b3VyIHNlcmllcykgYW5kIHRoZW4gZG8gdGhlIG5lY2Vzc2FyeSBjaGFuZ2VzIGluIHRoZSBj
b2RlLiBJZgo+IHRoaXMgd29ya2VkIHdpdGggYXQgbGVhc3Qgb25lIG9mIHRoZSB0d28gY29tcGF0
aWJsZXMsIHRoZW4geW91IGhhdmUgdG8KPiBjcmVhdGUgZGVkaWNhdGVkIGhlbHBlcnMsIG9uZSBm
b3IgZWFjaCwgaW4gb3JkZXIgdG8gZ3JhYiB0aGUgY2xvY2tzCj4gZGlmZmVyZW50bHkgYW5kIG5v
dCBicmVhayBhbnlib2R5LgoKb2ssIGkgYW0gY2hhbmdpbmcgdGhlIGJpbmRpbmdzIGFuZCBjb2Rl
IGluIHRoaXMgc2VyaWVzLiB0aGFua3MgZm9yIHlvdXIgCmV4cGxhbmF0aW9uLgoKPiAKPj4KPj4+
ICAgIAo+Pj4+Cj4+Pj4gVGhhbmtzLgo+Pj4+ICAgCj4+Pj4+PiBiLiBpZiBpdCBmYWxscyBiYWNr
IHRvIHRoZSBvbGQgRFQsIGJlc2lkZSB0aGUgcmVnbWFwIGxvb2t1cCBiZWxvdywgaXQgc2VlbXMg
dGhhdCB3ZSBoYXZlIHRvIHByZXNlcnZlIHRoZSBjb2RlIG9mIHRoZSBvbGQgY2xvY2sgc2V0dGlu
ZyBpbiBuZmNfY2xrX2luaXQoKS4KPj4+Pj4KPj4+Pj4gWWVzLCBwcm9iYWJseS4KPj4+Pj4gICAg
ID4+Pj4gZG8gd2Ugc3RpbGwgbmVlZCB0byBhdm9pZCBicmVhayBEVCBjb21wYXRpYmlsaXR5Pwo+
Pj4+Pgo+Pj4+PiBXZSBzaG91bGQgdHJ5IG91ciBiZXN0IHRvIGF2b2lkIGJyZWFraW5nIHRoZSBE
VCwgeWVzLgo+Pj4+PiAgICAgPj4+Pgo+Pj4+Pj4gVGhhbmtzLgo+Pj4+Pj4KPj4+Pj4+IE9uIDIw
MjIvNC8xMSAxMDo0MCwgTGlhbmcgWWFuZyB3cm90ZToKPj4+Pj4+Pj4+ICAgIMKgwqDCoMKgwqAg
bmZjLT5kZXYgPSBkZXY7Cj4+Pj4+Pj4+PiAtwqDCoMKgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+Pj4+Pj4+PiAtwqDCoMKgIG5mYy0+cmVn
X2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOwo+Pj4+Pj4+Pj4gK8KgwqDC
oCBuZmMtPnJlZ19iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShw
ZGV2LCAibmZjIik7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgY2hhbmdlIHNlZW1zIHVucmVsYXRl
ZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZm9sbG93aW5nID4g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiZW1tYyIpLiBkbyB5
b3UgbWVhbiB0aGF0IHdlID4gZG9uJ3QgbmVlZCBpdD8+Cj4+Pj4+Pj4+PiAgICDCoMKgwqDCoMKg
IGlmIChJU19FUlIobmZjLT5yZWdfYmFzZSkpCj4+Pj4+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdfYmFzZSk7Cj4+Pj4+Pj4+PiAtwqDCoMKgIG5mYy0+
cmVnX2NsayA9Cj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc3lzY29uX3JlZ21hcF9sb29rdXBf
YnlfcGhhbmRsZShkZXYtPm9mX25vZGUsCj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYW1sb2dpYyxtbWMtc3lzY29uIik7Cj4+Pj4+Pj4+
PiAtwqDCoMKgIGlmIChJU19FUlIobmZjLT5yZWdfY2xrKSkgewo+Pj4+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGxvb2t1cCBjbG9jayBiYXNlXG4iKTsKPj4+
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihuZmMtPnJlZ19jbGspOwo+Pj4+
Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+Pj4+PiArwqDCoMKgIG5mYy0+c2RfZW1tY19jbG9jayA9IGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5hbWUocGRldiwgPj4+ICJlbW1jIik7Cj4+
Pj4+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIobmZjLT5zZF9lbW1jX2Nsb2NrKSkKPj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihuZmMtPnNkX2VtbWNfY2xvY2spOwo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBXaGlsZSBJIGFncmVlIHRoaXMgaXMgbXVjaCBiZXR0ZXIgdGhhbiB0aGUg
cHJldmlvdXMgc29sdXRpb24sIHdlIGNhbm5vdAo+Pj4+Pj4+PiBicmVhayBEVCBjb21wYXRpYmls
aXR5LCBzbyB5b3UgbmVlZCB0byB0cnkgZ2V0dGluZyB0aGUgZW1tYyBjbG9jaywgYnV0Cj4+Pj4+
Pj4+IGlmIGl0IGZhaWxzIHlvdSBzaG91bGQgZmFsbGJhY2sgdG8gdGhlIHJlZ21hcCBsb29rdXAu
Cj4+Pj4+Pj4KPj4+Pj4+PiBvaywgaSB3aWxsIGZpeCBpdCBuZXh0IHZlcnNpb24uIHRoYW5rcy4K
Pj4+Pj4+PiAgICAgID4+Pj4gICA+Pj4+PiAgwqDCoMKgwqDCoCBpcnEgPSBwbGF0Zm9ybV9nZXRf
aXJxKHBkZXYsIDApOwo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwKPj4+
Pj4KPj4+Pj4gLgo+Pj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNaXF1w6hsCj4+Pgo+Pj4gLgo+IAo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
