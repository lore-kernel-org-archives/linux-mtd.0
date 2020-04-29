Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8215C83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98FBF2073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttTUgvIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98FBF2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI4yJPulXCEfrkh6pMolp4zFnO8PC40PsP28fbY+XVc=; b=ttTUgvIe7BI+FG
	LH+ie+B8jOOCnFzKoqc+dpnG1tvUqIiITrBobPgXS3A4+qlE0jrGz4w5Pep29oiwL3rffo+ZmBTNv
	zSpE/cThVEXMvGM1ctIyRWH8+6IpVxj7vUNoBXszr0i+eBNnHzg54NTgC4H/cmzBHV/jnmUv4g21O
	VQlmoZGkQ+jzTeiIq/N6GYy1BFDjwR64x+MOP4BEK79PKNJmgtA3Nn0S7ivkqjbS6nGIi+qT/JM+a
	AFZDxd5OFILUCbcD6SanigDZ1/Jfyormnyc8xwkUeJC0PS5oh1uFUDi+gGdbXOrF6dqTvYa9aXQgi
	ovnJ/1OSzZm3lLpW67Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTjwg-0004wU-Cn; Wed, 29 Apr 2020 10:28:02 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTjvv-0004Na-Tt
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 10:27:19 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 91395C0002;
 Wed, 29 Apr 2020 10:27:11 +0000 (UTC)
Date: Wed, 29 Apr 2020 12:27:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
Message-ID: <20200429122710.291d54ff@xps13>
In-Reply-To: <cf4f4d00-7cfd-d0df-3004-9fd534e62bd0@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13>
 <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
 <20200429113529.5ddc3ad9@xps13>
 <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
 <20200429120632.7bce63e6@xps13>
 <cf4f4d00-7cfd-d0df-3004-9fd534e62bd0@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_032716_255542_6DAE533C 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAyOSBBcHIKMjAyMCAxMjoxMzoxOCArMDIwMDoKCj4gT24gNC8y
OS8yMCAxMjowNiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdG9waGUsCj4g
PiAKPiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3Jv
dGUgb24gV2VkLCAyOSBBcHIKPiA+IDIwMjAgMTE6NDE6NDQgKzAyMDA6Cj4gPiAgIAo+ID4+IE9u
IDQvMjkvMjAgMTE6MzUgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgQ2hyaXN0
b3BoZSwKPiA+Pj4KPiA+Pj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9A
c3QuY29tPiB3cm90ZSBvbiBXZWQsIDI5IEFwcgo+ID4+PiAyMDIwIDExOjI3OjQzICswMjAwOiAg
Cj4gPj4+ICAgID4+Pj4gSGkgTWlxdcOobCwgIAo+ID4+Pj4KPiA+Pj4+IE9uIDQvMjcvMjAgODoy
MiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+Pj4+IEhpIENocmlzdG9waGUsCj4gPj4+
Pj4KPiA+Pj4+PiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+
IHdyb3RlIG9uIFdlZCwgMTUgQXByCj4gPj4+Pj4gMjAyMCAxNzo1NzozMCArMDIwMDogIAo+ID4+
Pj4+ICAgICA+Pj4+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgY29uc3RhbnQgRk1DMl9USU1FT1VU
X1VTLiAgCj4gPj4+Pj4+IEZNQzJfVElNRU9VVF9NUyBpcyBzZXQgdG8gNSBzZWNvbmRzIGFuZCB0
aGlzIGNvbnN0YW50IGlzIHVzZWQKPiA+Pj4+Pj4gZWFjaCB0aW1lIHRoYXQgd2UgbmVlZCB0byB3
YWl0IChleGNlcHQgd2hlbiB0aGUgdGltZW91dCB2YWx1ZQo+ID4+Pj4+PiBpcyBzZXQgYnkgdGhl
IGZyYW1ld29yaykKPiA+Pj4+Pj4KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBL
ZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+ID4+Pj4+PiAtLS0KPiA+Pj4+Pj4g
ICAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTEgKysrKystLS0t
LS0KPiA+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gPj4+Pj4+Cj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFu
ZC5jCj4gPj4+Pj4+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4gPj4+Pj4+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+Pj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+Pj4+IEBAIC0zNyw4ICsz
Nyw3IEBACj4gPj4+Pj4+ICAgICAvKiBNYXggRUNDIGJ1ZmZlciBsZW5ndGggKi8KPiA+Pj4+Pj4g
ICAgICNkZWZpbmUgRk1DMl9NQVhfRUNDX0JVRl9MRU4JCShGTUMyX0JDSERTUlNfTEVOICogRk1D
Ml9NQVhfU0cpICAKPiA+Pj4+Pj4gICAgID4+IC0jZGVmaW5lIEZNQzJfVElNRU9VVF9VUwkJCTEw
MDAgIAo+ID4+Pj4+PiAtI2RlZmluZSBGTUMyX1RJTUVPVVRfTVMJCQkxMDAwCj4gPj4+Pj4+ICsj
ZGVmaW5lIEZNQzJfVElNRU9VVF9NUwkJCTUwMDAgIAo+ID4+Pj4+PiAgICAgPj4gICAvKiBUaW1p
bmdzICovICAKPiA+Pj4+Pj4gICAgICNkZWZpbmUgRk1DMl9USElaCQkJMQo+ID4+Pj4+PiBAQCAt
NTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9oYW1fY2FsY3VsYXRlKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+ID4+Pj4+PiAgICAgCXUzMiBzciwg
aGVjY3I7Cj4gPj4+Pj4+ICAgICAJaW50IHJldDsgIAo+ID4+Pj4+PiAgICAgPj4gLQlyZXQgPSBy
ZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dChmbWMyLT5pb19iYXNlICsgRk1DMl9TUiwgIAo+ID4+
Pj4+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxMCwKPiA+Pj4+Pj4gLQkJCQkJIEZN
QzJfVElNRU9VVF9NUyk7Cj4gPj4+Pj4+ICsJcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVv
dXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+ID4+Pj4+PiArCQkJCQkJc3IsIHNy
ICYgRk1DMl9TUl9OV1JGLCAxLAo+ID4+Pj4+PiArCQkJCQkJMTAwMCAqIEZNQzJfVElNRU9VVF9N
Uyk7ICAKPiA+Pj4+Pgo+ID4+Pj4+IElzIHRoZSBfYXRvbWljIHN1ZmZpeCBuZWVkZWQgaGVyZT8g
SWYgeWVzIGl0IHdvdWxkIGRlc2VydmUgYSBzZXBhcmF0ZQo+ID4+Pj4+IHBhdGNoIHdpdGggRml4
ZXMvU3RhYmxlIHRhZ3MuICAKPiA+Pj4+PiAgICAgPj4gIAo+ID4+Pj4gSSBoYXZlIGN1cnJlbnRs
eSBub3Qgc2VlbiBhbnkgaXNzdWVzLiBTbywgSSB3aWxsIHJlbW92ZSB0aGlzIG1vZGlmaWNhdGlv
biBhcyB3ZSB3aWxsIG1vdmUgdG8gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0IGluIHBhdGNoIDEw
LiAgCj4gPj4+PiAgID4+Pj4+PiAgICAgCWlmIChyZXQpIHsgIAo+ID4+Pj4+PiAgICAgCQlkZXZf
ZXJyKGZtYzItPmRldiwgImhhbSB0aW1lb3V0XG4iKTsKPiA+Pj4+Pj4gICAgIAkJcmV0dXJuIHJl
dDsKPiA+Pj4+Pj4gQEAgLTEzMTUsNyArMTMxNCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl93
YWl0cmR5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgdGltZW91dF9tcykK
PiA+Pj4+Pj4gICAgIAkvKiBDaGVjayBpZiB0aGVyZSBpcyBubyBwZW5kaW5nIHJlcXVlc3RzIHRv
IHRoZSBOQU5EIGZsYXNoICovCj4gPj4+Pj4+ICAgICAJaWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90
aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsgRk1DMl9TUiwgc3IsCj4gPj4+Pj4+ICAgICAJ
CQkJCSAgICAgIHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+ID4+Pj4+PiAtCQkJCQkgICAgICBGTUMy
X1RJTUVPVVRfVVMpKQo+ID4+Pj4+PiArCQkJCQkgICAgICAxMDAwICogRk1DMl9USU1FT1VUX01T
KSkKPiA+Pj4+Pj4gICAgIAkJZGV2X3dhcm4oZm1jMi0+ZGV2LCAiV2FpdHJkeSB0aW1lb3V0XG4i
KTsgIAo+ID4+Pj4+PiAgICAgPj4gICAJLyogV2FpdCB0V0IgYmVmb3JlIFIvQiMgc2lnbmFsIGlz
IGxvdyAqLyAgCj4gPj4+Pj4KPiA+Pj4+PiBZb3UgY2hhbmdlIHRoZSB0aW1lb3V0cyBmcm9tIDFt
cyB0byA1cy4KPiA+Pj4+Pgo+ID4+Pj4+IE1heWJlIDVzIGlzIGEgbGl0dGxlIGJpdCB0b28gbXVj
aCBJTUhPIGJ1dCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhcyB0aGlzCj4gPj4+Pj4gaXMgYSB0aW1l
b3V0LiBIb3dldmVyIDFtcyBpcyB0aWdodC4gSWYgeW91IGFyZSBjaGFuZ2luZyB0aGlzIHZhbHVl
Cj4gPj4+Pj4gYmVjYXVzZSBpdCB0cmlnZ2VycyBlcnJvciAoZWcuIHdoZW4gdGhlIG1hY2hpbmUg
aXMgbG9hZGVkKSwgdGhlbiBpdCBpcwo+ID4+Pj4+IGEgZml4IGFuZCBzaG91bGQgYXBwZWFyIGxp
a2UgaXQuCj4gPj4+Pj4KPiA+Pj4+PiBUaGFua3MsCj4gPj4+Pj4gTWlxdcOobCAgCj4gPj4+Pj4g
ICAgID4+ICAKPiA+Pj4+IE5vIGVycm9ycyBjdXJyZW50bHkgaGFwcGVucy4KPiA+Pj4+IER1cmlu
ZyBvdXIgc3RyZXNzIHRlc3RzLCBpbiBhIG92ZXJsb2FkZWQgc3lzdGVtLCB3ZSBoYXZlIHNlZW4g
dGhhdCB3ZSBjb3VsZCBiZSBjbG9zZSB0byAxIHNlY29uZCwgZXZlbiBpZiB3ZSBuZXZlciBtZXQg
dGhpcyB2YWx1ZS4KPiA+Pj4+IFNvLCB0byBiZSBzYWZlLCBJIGhhdmUgc2V0IHRoaXMgdGltZW91
dCB0byA1IHNlY29uZHMuCj4gPj4+PiBBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBo
YXZlIG5vdCBzZWVuIGFueSBzaWRlIGVmZmVjdC4KPiA+Pj4+IEkgYW0gdXNpbmcgdGhlIHNhbWUg
dGltZW91dCBjb25zdGFudCB0byBhdm9pZCB0byBoYXZlIG9uZSB0aW1lb3V0IHBlciBjYXNlcy4g
IAo+ID4+Pgo+ID4+PiBTb21ldGhpbmcgaXMgd3JvbmcgaW4gbXkgbWluZDoKPiA+Pj4gWW91IHNh
eSB5b3Ugb2JzZXJ2ZSBkZWxheXMgb2YgYWxtb3N0IHVwIHRvIDEgc2Vjb25kLCBidXQgdGhlIHBv
bGxpbmcKPiA+Pj4gY3VycmVudGx5IGhhcHBlbnMgb24gMTAwMCB1cyA9IDFtcywgZWl0aGVyIHlv
dSBoYWQgdGltZW91dHMgb3IgSQo+ID4+PiBtaXNyZWFkIHNvbWV0aGluZz8KPiA+Pj4KPiA+Pj4g
VGhhbmtzLAo+ID4+PiBNaXF1w6hsICAKPiA+Pj4gICAgPj4gIAo+ID4+IEhpIE1pcXXDqGwsCj4g
Pj4KPiA+PiBNeSBmYXVsdC4gRm9yIHRoaXMgcG9sbGluZywgd2UgbmV2ZXIgbWV0IDEgbXMuCj4g
Pj4gVGhlIDEgc2Vjb25kIG9ic2VydmVkIHdhcyBvbiB0aGUgc2VxdWVuY2VyIHdoZW4gd2UgcmVh
ZC93cml0ZSBhIHBhZ2UgKGFzIGl0IHRoZSBzYW1lIHRpbWVvdXQgdmFsdWUgdGhhdCBpcyB1c2Vk
KSAgCj4gPiAKPiA+IE9LIEkgZ2V0IGl0LiBTbyBwZXJoYXBzIHlvdSBjYW4gZ2l2ZSB0aGVzZSBk
ZXRhaWxzIGluIHRoZSBjb21taXQgbG9nIHRvCj4gPiBleHBsYWluIHdoeSB5b3UgdXNlIDUgc2Vj
b25kcyBpbnN0ZWFkIG9mIG9uZS4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gICAK
PiAKPiBIaSBNaXF1w6hsLAo+IAo+IEEgcHJvcG9zYWwgY291bGQgYWxzbyBiZSB0byBzcGxpdCB0
aGlzIHBhdGNoOgo+ICAgLSBhIGZpcnN0IHBhdGNoIHRoYXQgaXMgdXNpbmcgb25seSBvbmUgdGlt
ZW91dCB2YWx1ZS4KPiAgIC0gYSBzZWNvbmQgcGF0Y2ggdGhhdCBpcyBpbmNyZWFzaW5nIHRoZSB2
YWx1ZSB0byA1IHNlY29uZHMuCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RvcGhlIEtlcmVsbG8uCgoK
R2l2ZW4gdGhlIHNpdHVhdGlvbiwgYm90aCBhcmUgZmluZSBhcyBsb25nIGFzIGV2ZXJ5dGhpbmcg
aXMgY2xlYXJseQpleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBsb2cgOikKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
