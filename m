Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF9DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujxjLOrEQ/nhg6XXhpaBkPbNjTT6yDkunVtrFvIKkZM=; b=kfQ477J1Fi/gw+
	ALY9BhVE3gFzkGnyc8dZBBMUZHHmEX3IkfNr566XbywblZ4ht7nh2RyUEAJ0EfoYqGlVUhFdi3lnk
	zpdBf+qVvnyUtFAckIC6dYotxNy+PYUsdCr2iqz+3w6p+bz6DqtmIWjE1rebLarVDnrfeyYvnfvIE
	4jZESexuR8VEZEoYOjoCLB8tmck4694BrKJbPVbGd+pCLNirlRfqPv4hgT7Thkc+Gd0fgG/QttUHB
	/HgdjG6i0OyX8ZM8M8pAq8+Q0yjCjk7oNe4lsbuL/3I+dQCP+FDB3FsD6zeg/2Q1oLKJvwqasYe79
	xdBbwFJ8fOrRh91nJL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU1G1-0083UT-Qm; Tue, 15 Mar 2022 07:06:13 +0000
Received: from smtprelay08.ispgateway.de ([134.119.228.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU1Fy-0083Td-Ge
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 07:06:12 +0000
Received: from [89.1.81.74] (helo=ipc1.ka-ro)
 by smtprelay08.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <LW@KARO-electronics.de>)
 id 1nU1Fn-0003X7-SU; Tue, 15 Mar 2022 08:05:59 +0100
Date: Tue, 15 Mar 2022 08:06:02 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel =?UTF-8?B?R2zDtmNrbmVy?= <dg@emlix.com>, Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <20220315080602.7a2e250d@ipc1.ka-ro>
In-Reply-To: <20220314164505.3affb1c8@xps13>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
 <20220224162958.184079e4@xps13>
 <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
 <20220224170357.1f99a77a@xps13>
 <6ba60b49-1e12-01a3-842f-4f6c96998a04@emlix.com>
 <20220314164505.3affb1c8@xps13>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
X-Df-Sender: bHdAa2Fyby1lbGVjdHJvbmljcy5kb21haW5mYWN0b3J5LWt1bmRlLmRl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_000610_580698_6E81F92C 
X-CRM114-Status: GOOD (  30.87  )
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

TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhpIERh
bmllbCwKPiAKPiBTb3JyeSBmb3IgdGhlIGRlbGF5Lgo+IAo+IGRnQGVtbGl4LmNvbSB3cm90ZSBv
biBUaHUsIDI0IEZlYiAyMDIyIDE5OjE3OjQzICswMTAwOgo+IAo+ID4gSGkgTWlxdWVsLAo+ID4g
Cj4gPiBBbSAyNC4wMi4yMiB1bSAxNzowMyBzY2hyaWViIE1pcXVlbCBSYXluYWw6ICAKPiA+ID4g
ZGdAZW1saXguY29tIHdyb3RlIG9uIFRodSwgMjQgRmViIDIwMjIgMTY6NTU6MjcgKzAxMDA6ICAg
IAo+ID4gPj4gQW0gMjQuMDIuMjIgdW0gMTY6Mjkgc2NocmllYiBNaXF1ZWwgUmF5bmFsOiAgICAK
PiA+ID4+PiBkZ0BlbWxpeC5jb20gd3JvdGUgb24gV2VkLCAyMyBGZWIgMjAyMiAxMTo1OTowMiAr
MDEwMDogICAgICAKPiA+ID4+Pj4gQW0gMjIuMDIuMjIgdW0gMjM6MDIgc2NocmllYiBIYW4gWHU6
Pj4+IENvdWxkIHlvdSBwbGVhc2UKPiA+ID4+Pj4gZGVzY3JpYmUgbW9yZSBkZXRhaWxzIGFib3V0
IHdoYXQga2luZCBvZiBlcnJvciwgaG93IHRvICAgICAgCj4gPiA+Pj4+PiByZXByb2R1Y2UgaXQg
YW5kIG9uIHdoaWNoIGtlcm5lbCB2ZXJzaW9uPyAgICAgICAgCj4gPiA+Pj4+Cj4gPiA+Pj4+IFlv
dSBuZWVkIGEgZmxhc2ggdGhhdCBoYXMgb25lIGJhZCBibG9jayB3aGVyZSBwcm9ncmFtbWluZyB0
aGUKPiA+ID4+Pj4gQkJNIHNldHMgTkFORF9TVEFUVVNfRkFJTCBpbiBpdHMgc3RhdHVzIHJlZ2lz
dGVyLiBUaGUgbGF0ZXN0Cj4gPiA+Pj4+IGtlcm5lbHMgc2hvdWxkIHN0aWxsIGhhdmUgcHJvYmxl
bXMgd2hlbiB0aGlzIGhhcHBlbnMgaW4gYQo+ID4gPj4+PiBVQkkuICAgICAgCj4gPiA+Pj4KPiA+
ID4+PiBJIGJlbGlldmUgd2Ugc2hvdWxkIHRyeSB0byB0YWNrbGUgIndoeSIgdGhpcyBoYXBwZW5z
IG1vcmUgdGhhbgo+ID4gPj4+IHRyeSB0byB3b3JrYXJvdW5kIGl0cyBjb25zZXF1ZW5jZXMuIENh
biB5b3UgZ2l2ZSBtb3JlIGRldGFpbHMKPiA+ID4+PiBhYm91dCB3aHkgd2UgZ2V0IHRoaXMgc3Rh
dHVzPyAgICAgIAo+ID4gPj4KPiA+ID4+IFVobSwgdGhlIGJsb2NrIGlzIGJhZCwgYnJva2VuLiBJ
dCBzaG93cyB0aGUgc2FtZSBiZWhhdmlvciBldmVuCj4gPiA+PiBhZnRlciBwb3dlciBjeWNsaW5n
LiBUaGUgb3RoZXIgYmxvY2tzIGFyZSBvay4gSSBkb24ndCB0aGluayBpdAo+ID4gPj4gaXMgb3Vy
IGZhdWx0IHRoYXQgaXQgZGllZCBzbyBlYXJseS4gICAgCj4gPiA+IAo+ID4gPiBCdXQgd2h5IGFm
dGVyIGEgcG93ZXIgY3ljbGUgYXJlIHdlIHRyeWluZyB0byB3cml0ZSB0aGUgQkJNPyAgICAKPiA+
IAo+ID4gSSBkaWQgbm90IHdhbnQgdG8gaW1wbHkgdGhhdCBMaW51eCB0cmllcyB0byB3cml0ZSB0
aGUgYmxvY2sgYWZ0ZXIKPiA+IGV2ZXJ5IHBvd2VyIGN5Y2xlLiBVQkkgbm90aWNlcyB0aGF0IHRo
ZSBibG9jayBpcyBicm9rZW4gb25jZSBhbmQKPiA+IG1hbmFnZXMgdG8gbWFyayBpdCBhcyBiYWQg
aW4gdGhlIEJCVCwgc28gYWZ0ZXIgcG93ZXIgY3ljbGUgaXQgd2lsbAo+ID4gbm90IHRyeSB0byB3
cml0ZSB0byB0aGF0IGJsb2NrIGFnYWluLiBXaGF0IEkgd2FudGVkIHRvIHNheSBpcyB0aGF0Cj4g
PiBtYW51YWwgdGVzdGluZyBvZiB0aGUgYmxvY2sgYWZ0ZXIgcG93ZXIgY3ljbGluZyBzaG93cyB0
aGF0IHRoZQo+ID4gYmxvY2sgcmVtYWlucyB1bnVzYWJsZS4KPiA+IAo+ID4gVGhlIHByb2JsZW0g
aXMgdGhhdCBVQkkgc3dpdGNoZXMgdG8gcmVhZC1vbmx5IG1vZGUgYWZ0ZXIgaXQgbWFya2VkCj4g
PiB0aGUgYmxvY2sgYXMgYmFkIGluIHRoZSBCQlQgYmVjYXVzZSB0aGUgcmVkdW5kYW50IEJCTSBp
biB0aGUgT09CIG9mCj4gPiB0aGUgYmxvY2sgY291bGQgbm90IGJlIHdyaXR0ZW4uICAKPiAKPiBJ
IHRoaW5rIEkgdW5kZXJzdGFuZCBiZXR0ZXIgeW91ciBzaXR1YXRpb24gbm93Lgo+IAo+IFNvIGhl
cmUgaXMgb3VyIHByb2JsZW0gOiB3aHkgY2FuJ3Qgd2Ugd3JpdGUgdGhlIE9PQj8gSWYgdGhlcmUg
aXMgYQo+IGdvb2QgcmVhc29uIHRoaXMgY2Fubm90IGhhcHBlbiwgdGhlbiB3ZSBjYW4gcHJvdmlk
ZSB0aGUKPiBOQU5EX0JCVF9OT19PT0JfQkJNIGZsYWcuIE90aGVyd2lzZSB3ZSBzaG91bGQgZmlu
ZCB0aGUgcm9vdCBjYXVzZS4KPiAKPiA+IEFuZCB3ZSBkb24ndCB3YW50IHRvIGdldCBpbnRvIGEg
c2l0dWF0aW9uCj4gPiB3aGVyZSB3ZSBoYXZlIHRvIHJlYm9vdCB0aGUgc3lzdGVtLCBlc3BlY2lh
bGx5IGlmIGl0IGlzIGJlY2F1c2Ugb2YKPiA+IHNvbWV0aGluZyB3ZSBkb24ndCBuZWVkLgo+ID4g
Cj4gPiBXZSBjb3VsZCBjaGFuZ2UgbmFuZF9ibG9ja19tYXJrYmFkX2xvd2xldmVsIHRvIHJldHVy
biBzdWNjZXNzIGFzCj4gPiBsb25nIGFzIHVwZGF0aW5nIHRoZSBCQlQgc3VjY2VlZHMsIGlmIHlv
dSB0aGluayB0aGF0IHRoaXMgaXMgdGhlCj4gPiBjb3JyZWN0IGFwcHJvYWNoLiAgCj4gCj4gVGhh
dCBpcyBub3QgYSBjb3JyZWN0IGFwcHJvYWNoIGlmIHdlIGRpZCBub3QgYXNrZWQgdG8gYnlwYXNz
IHdyaXRpbmcKPiBCQk1zIGV4cGxpY2l0bHkuCj4KVGhlIEJCTSBpbiB0aGUgT09CIGFyZWEgaXMg
YSAiRmFjdG9yeSBCYWQgQmxvY2sgTWFya2VyIiB3aGVyZSB0aGUKbWFudWZhY3R1cmVyIG1hcmtz
IGluaXRpYWxseSBiYWQgYmxvY2tzLiBUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0aGUKQkJN
IGNhbiBiZSB3cml0dGVuIG9uIGEgYmxvY2sgdGhhdCB0dXJuZWQgYmFkIGxhdGVyb24uCklmIGEg
YmxvY2sgdHVybmVkIEJBRCBkdXJpbmcgdXNlIGl0IGlzIGNvbXBsZXRlbHkgdXNlbGVzcyB0byB0
cnkgd3JpdGluZwphbnl0aGluZyB0byBpdC4gRGVwZW5kaW5nIG9uIHRoZSBuYXR1cmUgb2YgdGhl
IE5BTkQgZXJyb3IgdGhhdCB0dXJuZWQKdGhlIGJsb2NrIGJhZCwgdHJ5aW5nIHRvIHdyaXRlIHRo
YXQgYmxvY2sgbWF5IGFsc28gYWZmZWN0IHJhbmRvbSBvdGhlcgpibG9ja3MuCgoKTG90aGFyIFdh
w59tYW5uCi0tIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwoKS2EtUm8gZWxlY3Ryb25pY3MgR21iSCB8IFBhc2NhbHN0cmHDn2UgMjIg
fCBEIC0gNTIwNzYgQWFjaGVuClBob25lOiArNDkgMjQwOCAxNDAyLTAgfCBGYXg6ICs0OSAyNDA4
IDE0MDItMTAKR2VzY2jDpGZ0c2bDvGhyZXI6IE1hdHRoaWFzIEthdXNzZW4KSGFuZGVsc3JlZ2lz
dGVyZWludHJhZzogQW10c2dlcmljaHQgQWFjaGVuLCBIUkIgNDk5NgoKd3d3Lmthcm8tZWxlY3Ry
b25pY3MuZGUgfCBpbmZvQGthcm8tZWxlY3Ryb25pY3MuZGUKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
