Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BF4C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:31:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09DC2084B
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 08:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KP0Q6wCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09DC2084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fKoV54Pa0e3c3LHp4BgJXHReBbsAG3TO3+d4cPO9kM=; b=KP0Q6wCIY6QHvF
	jp1IXTTQA+RRepe92Vs1GrWXplAmSuM97dJAJhYBjDLPlFbqpDlPAOI2GRHlFgMhmmvIH2fCuliyb
	/fnd1q5CwnTCUGu0SGe6hh5LidvBdngT13D0gDcG9Gl7Cmw6GJCpAijFVNMRxXW9hhC7V6/grUTuX
	ohNlO+3kbsKDScrpAzjqYejN/XTb8ibDCq3o32GxDq/yCNHq+RwTvsM1GmeB7jgHejIorUEEIp/AY
	ScBV3hKpQ93TQTv+HobRYzdUSboKS6TRkZPGfxMr2fjPFdU1yoAJllx0m6jEIr8d4118uniXfGLrp
	DBmrQmaIJux6+AzQOLIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBbId-0005DD-Bl; Wed, 03 Apr 2019 08:31:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBbIZ-0005Co-OG
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 08:31:09 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DB51720011;
 Wed,  3 Apr 2019 08:31:01 +0000 (UTC)
Date: Wed, 3 Apr 2019 10:31:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash
 name and id
Message-ID: <20190403103101.5c7b7641@xps13>
In-Reply-To: <CABD5ybnB1JK2_zg0Lsi_1Ny5wGBP9dE4FbP6NCHAPbXpgJqkTg@mail.gmail.com>
References: <20190328045910.98250-1-zhuohao@chromium.org>
 <20190401112748.4a3d5539@collabora.com>
 <CABD5ybm_1BjKSsMFGy=LuM0bsCcBnnY7Eid_Ni3OQ5e+aFZ7pg@mail.gmail.com>
 <20190402095628.5d376263@collabora.com>
 <7077290a-8acc-465b-6ed0-fddd35ab8fd6@ti.com>
 <CABD5yb=JnwY_rMYwTOHjU3izoA8wxfRVgfAGK9zWh=7NZ7H23Q@mail.gmail.com>
 <20190402140141.385a79d8@collabora.com>
 <CABD5ybnB1JK2_zg0Lsi_1Ny5wGBP9dE4FbP6NCHAPbXpgJqkTg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_013108_089020_6A79A701 
X-CRM114-Status: GOOD (  28.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, bbrezillon@kernel.org, richard@nod.at,
 Brian Norris <briannorris@chromium.org>,
 Marek =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWmh1b2hhbywKClpodW9oYW8gTGVlIDx6aHVvaGFvQGNocm9taXVtLm9yZz4gd3JvdGUgb24g
VHVlLCAyIEFwciAyMDE5IDIxOjAzOjI4CiswODAwOgoKPiBCb3JpcywgVGhhbmtzIGZvciB5b3Vy
IGNvbW1lbnQuCj4gQnV0IEkgY2FuJ3QgZmluZCB0aGUgcmVsYXRlZCBzdHVmZiAob3IgaSBnb3Qg
dGhlIHdyb25nIHdheSkuIElzIHRoYXQKPiBmZWF0dXJlIG1lcmdlZD8KPiBDb3VsZCB5b3UgcGxl
YXNlIHBvaW50IG91dCB0aGUgY29tbWl0PyBJIGNhbiBtYWtlIHRoZSBjaGFuZ2UgYmFzZSBvbiBp
dC4KCkkgdGhpbmsgQm9yaXMganVzdCB0b2xkIHlvdSB0aGF0IHRoZSBkZWJ1Z2ZzIE1URCBkaXJl
Y3RvcnkgaXMgc3VpdGFibGUKdG8gcmVjZWl2ZSBhbiBpbmZvcm1hdGlvbiBjb21pbmcgZnJvbSBk
aWZmZXJlbnQgdHlwZSBvZiBkZXZpY2VzIGxpa2UKc3BpLW5vciwgbm9yLCBuYW5kLCBldGMuCgpU
aGUgZmVhdHVyZSBvZiBoYXZpbmcgdGhlIGRldmljZSBuYW1lIHRoZXJlIGRvZXMgbm90IGV4aXN0
IHlldCwgeW91CmhhdmUgdG8gZG8gaXQuIEZvciBOQU5EIEkgYWxyZWFkeSB3cm90ZSBzb21ldGhp
bmcgbGlrZSB0aGF0IHdoaWNoIGhhcwpub3QgYmVlbiBtZXJnZWQgYnV0IGNvdWxkIGJlIGFkYXB0
ZWQgdG8gZXhwb3J0IHRoZSBkYXRhIGluIGRlYnVnZnMKaW5zdGVhZCBvZiBzeXNmcywgc2VlOgoK
UmF3IE5BTkQgaW5mcmFzdHJ1Y3R1cmUgdG8gcmV0cmlldmUgdGhlIElEOgpodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcGF0Y2gvODM3OTAxLwoKQWRkaW5nIGEgc3lzZnMgZW50cnkgKHdoaWNo
IHdhcyBhbHJlYWR5IHJlamVjdGVkIGF0IHRoaXMgdGltZSk6Cmh0dHA6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC84Mzc5MDMvCgpUaGFua3MsCk1pcXXDqGwKCj4gCj4gT24gVHVlLCBBcHIg
MiwgMjAxOSBhdCA4OjAxIFBNIEJvcmlzIEJyZXppbGxvbgo+IDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCAyIEFwciAyMDE5IDE5OjA2OjM3ICsw
ODAwCj4gPiBaaHVvaGFvIExlZSA8emh1b2hhb0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gIAo+
ID4gPiBPbiBUdWUsIEFwciAyLCAyMDE5IGF0IDQ6MjYgUE0gVmlnbmVzaCBSYWdoYXZlbmRyYSA8
dmlnbmVzaHJAdGkuY29tPiB3cm90ZTogIAo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IE9uIDAyLzA0LzE5IDE6MjYgUE0sIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4gPiA+ID4g
T24gVHVlLCAyIEFwciAyMDE5IDE1OjM5OjU0ICswODAwCj4gPiA+ID4gPiBaaHVvaGFvIExlZSA8
emh1b2hhb0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gIAo+ID4gPiA+ID4+IFRoYW5r
cyBCb3JpcyBmb3IgdGhlIGNvbW1lbnQuIFBsZWFzZSB0YWtlIGEgbG9vayB0aGUgcmVwbHkgYXQg
YmVsb3cuCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBPbiBNb24sIEFwciAxLCAyMDE5IGF0IDU6Mjcg
UE0gQm9yaXMgQnJlemlsbG9uCj4gPiA+ID4gPj4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPiB3cm90ZTogIAo+ID4gPiA+ID4+Pgo+ID4gPiA+ID4+PiBPbiBUaHUsIDI4IE1hciAyMDE5
IDEyOjU5OjEwICswODAwCj4gPiA+ID4gPj4+IFpodW9oYW8gTGVlIDx6aHVvaGFvQGNocm9taXVt
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gPj4+ICAKPiA+ID4gPiA+Pj4+IEN1cnJlbnRseSwgd2UgZG9u
J3QgaGF2ZSBzeXNmcyBub2RlcyBmb3IgcXVlcnlpbmcgdGhlIHVuZGVybHlpbmcgZmxhc2gKPiA+
ID4gPiA+Pj4+IG5hbWUgYW5kIGZsYXNoIGlkLiBUaGlzIGluZm9ybWF0aW9uIGlzIGltcG9ydGFu
dCBlc3BlY2lhbGx5IHdoZW4gd2UKPiA+ID4gPiA+Pj4+IHdhbnQgdG8ga25vdyB0aGUgZmxhc2gg
ZGV0YWlsIG9mIHRoZSBkZWZlY3RpdmUgc3lzdGVtLiBJbiBvcmRlciB0bwo+ID4gPiA+ID4+Pj4g
c3VwcG9ydCB0aGUgcXVlcnksIHdlIGFkZCB0d28gcG9pbnRlcnMgKCpmbGFzaG5hbWUsICppZCkg
aW50byB0aGUKPiA+ID4gPiA+Pj4+IG10ZF9pbmZvIHN0cnVjdHVyZSBhbmQgY3JlYXRlIHR3byBz
eXNmcyBub2RlcyAoZmxhc2huYW1lLCBpZCkuIFRoaXMKPiA+ID4gPiA+Pj4+IHBhdGNoIGlzIG1v
ZGlmaWVkIGJhc2VkIG9uIHRoZSBTUEktTk9SIGZsYXNoIHN5c3RlbSBhcyB3ZSBvbmx5IGhhdmUK
PiA+ID4gPiA+Pj4+IHRoYXQgc3lzdGVtIG5vdy4gQnV0IHRoZSBpZGVhIHNob3VsZCBiZSBhcHBs
aWVkIHRvIHRoZSBvdGhlciBmbGFzaAo+ID4gPiA+ID4+Pj4gZHJpdmVyIGxpa2UgTkFORCBmbGFz
aC4KPiA+ID4gPiA+Pj4+Cj4gPiA+ID4gPj4+PiBUaGUgb3V0cHV0IG9mIG5ldyBzeXNmcyBub2Rl
cyBvbiBteSBkZXZpY2UgYXJlOgo+ID4gPiA+ID4+Pj4gY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9y
bS9zb2MvMTEwMTAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAvZmxhc2hu
YW1lCj4gPiA+ID4gPj4+PiB3MjVxNjRkdwo+ID4gPiA+ID4+Pj4gY2F0IC9zeXMvZGV2aWNlcy9w
bGF0Zm9ybS9zb2MvMTEwMTAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAv
aWQKPiA+ID4gPiA+Pj4+IGVmNjAxNyAgCj4gPiA+ID4gPj4+Cj4gPiA+ID4gPj4+IEknbSBub3Qg
c3VyZSBJIGxpa2UgdGhlIGlkZWEgb2YgZXhwb3NpbmcgdGhpcyBraW5kIG9mIGluZm8gdGhyb3Vn
aAo+ID4gPiA+ID4+PiBzeXNmcyBhcyBpdCB0aGVuIG1ha2VzIHBhcnQgb2YgdGhlIEFCSS4gRGlk
IHlvdSBjb25zaWRlciBleHBvc2luZyB0aGF0Cj4gPiA+ID4gPj4+IHRocm91Z2ggZGVidWdmcz8g
IAo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gWWVzLCBpIGRpZCBjb25zaWRlciB0aGUgZGVidWdmcy4g
SSB0aGluayB0aGUgZGVidWdmcyBpcyBkZXBlbmRlZCBvbgo+ID4gPiA+ID4+IENPTkZJR19ERUJV
R19GUy4KPiA+ID4gPiA+PiBJZiByZW1vdmluZyB0aGF0IGNvbmZpZywgdGhlIHBhcnRuYW1lIGFu
ZCBwYXJ0aWQgd2lsbCBiZSBsb3N0LiBTbywgaQo+ID4gPiA+ID4+IHByb3Bvc2VkIHRvIHVzZQo+
ID4gPiA+ID4+IHN5c2ZzLiAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlbiBqdXN0IGVuYWJsZSBk
ZWJ1Z2ZzIGlmIHlvdSBuZWVkIHRoaXMgaW5mb3JtYXRpb24gOlAuICAKPiA+ID4gTXkgb3JpZ2lu
YWwgaW50ZW50aW9uIGlzIGFkZGluZyB0aGUgbmV3IHN5c2ZzIG5vZGVzIChpLmUgcGFydG5hbWUg
YW5kCj4gPiA+IHBhcnRpZCkgaW50byB0aGUgY29tbW9uIHBsYWNlIGxpa2UgbXRkY29yZS5jCj4g
PiA+IHNvIHRoYXQgdGhlIHVzZXJzcGFjZSBwcm9ncmFtIGNhbiBqdXN0IHJlYWQgdGhlIGNvbW1v
biBzeXNmcyBub2Rlcy4KPiA+ID4gU28gZmFyLCB3aGF0IGkgY2FuIGNvbnRyaWJ1dGUgaXMgZm9y
IHRoZSBzcGktbm9yIGJ1dCBpZiB0aGUgb3RoZXIKPiA+ID4gZmxhc2ggZHJpdmVycywgbGlrZSBu
YW5kLWZsYXNoLCBjYW4gYWxzbyBzdXBwb3J0Cj4gPiA+IHRoZSBwYXJ0bmFtZSBhbmQgcGFydGlk
IHF1ZXJ5LCB0aGVuLCB3ZSBjYW4gaGF2ZSBjb21tb24gc3lzZnMgbm9kZXMgdG8KPiA+ID4gcXVl
cnkgdGhlIHVuZGVybHlpbmcgZGV2aWNlIGluZm8uCj4gPiA+IENvbXBhcmUgdG8gdGhlIGRlYnVn
ZnMsIGkgdGhpbmsgZGlmZmVyZW50IGRyaXZlcnMgbWF5IGhhdmUgZGlmZmVyZW50Cj4gPiA+IG5h
bWUgZm9yIHRoZSBwYXJ0bmFtZSBhbmQgcGFydGlkLiAgCj4gPgo+ID4gV2UndmUgcmVjZW50bHkg
dW5pZmllZCBob3cgTVREIHJlbGF0ZWQgc3R1ZmYgYXJlIGV4cG9zZWQgdGhyb3VnaAo+ID4gZGVi
dWdmcyBhbmQgeW91IGNhbiBub3cgaGF2ZSBnZW5lcmljIE1URCBmaWVsZHMgZXhwb3NlZCB0aGVy
ZS4gIAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
