Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FCEC83007
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF74721744
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="msRjSdhg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF74721744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pcyI9kmA1D2/FSN/NyT0HTw32a3lruAZhI/S0ZQtko=; b=msRjSdhgE1zEF3
	32vdovEEpat7oB/M53T8a8krx373Yal4VmK3t9sU7BAMZv5wtTNTSNx00sPyRyXIdUTUUmZd5IFZt
	VMQQLz+n3jE7WemdaRiAKJLxltC/dJ8Lfy0CPU1FxteYEhi+i17GnnmgXrtSbR1DY0tRbjKow3cEI
	gpQuzsAK1qHbmY7EM52ASBDhBK1Ys+kRo2MyBVz5g9KXgQuR5Hjp1EVZYfXIJT00jL2pC37KpGVMD
	NQRtBoCxY2WAjDOsWC7FdjI301yYdtPFQuHT+jIaIkqV0vO5aPzO9LWjs2wJQxpIuVAANbZxaZIR3
	Kri3PPDeFozI1bQn6Jdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTjc4-0004z0-Md; Wed, 29 Apr 2020 10:06:44 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTjc1-0004xZ-Hg
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 10:06:43 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2ABF4200004;
 Wed, 29 Apr 2020 10:06:33 +0000 (UTC)
Date: Wed, 29 Apr 2020 12:06:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
Message-ID: <20200429120632.7bce63e6@xps13>
In-Reply-To: <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13>
 <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
 <20200429113529.5ddc3ad9@xps13>
 <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_030641_856962_071B4B1E 
X-CRM114-Status: GOOD (  25.08  )
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
LmNvbT4gd3JvdGUgb24gV2VkLCAyOSBBcHIKMjAyMCAxMTo0MTo0NCArMDIwMDoKCj4gT24gNC8y
OS8yMCAxMTozNSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdG9waGUsCj4g
PiAKPiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3Jv
dGUgb24gV2VkLCAyOSBBcHIKPiA+IDIwMjAgMTE6Mjc6NDMgKzAyMDA6Cj4gPiAgIAo+ID4+IEhp
IE1pcXXDqGwsCj4gPj4KPiA+PiBPbiA0LzI3LzIwIDg6MjIgUE0sIE1pcXVlbCBSYXluYWwgd3Jv
dGU6ICAKPiA+Pj4gSGkgQ2hyaXN0b3BoZSwKPiA+Pj4KPiA+Pj4gQ2hyaXN0b3BoZSBLZXJlbGxv
IDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZSBvbiBXZWQsIDE1IEFwcgo+ID4+PiAy
MDIwIDE3OjU3OjMwICswMjAwOiAgCj4gPj4+ICAgID4+Pj4gVGhpcyBwYXRjaCByZW1vdmVzIHRo
ZSBjb25zdGFudCBGTUMyX1RJTUVPVVRfVVMuICAKPiA+Pj4+IEZNQzJfVElNRU9VVF9NUyBpcyBz
ZXQgdG8gNSBzZWNvbmRzIGFuZCB0aGlzIGNvbnN0YW50IGlzIHVzZWQKPiA+Pj4+IGVhY2ggdGlt
ZSB0aGF0IHdlIG5lZWQgdG8gd2FpdCAoZXhjZXB0IHdoZW4gdGhlIHRpbWVvdXQgdmFsdWUKPiA+
Pj4+IGlzIHNldCBieSB0aGUgZnJhbWV3b3JrKQo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiA+Pj4+IC0t
LQo+ID4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMSAr
KysrKy0tLS0tLQo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYwo+ID4+Pj4gaW5kZXggYWI1MzMxNC4uZjE1OWMzOSAxMDA2NDQKPiA+Pj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+PiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4+Pj4gQEAgLTM3LDggKzM3LDcgQEAK
PiA+Pj4+ICAgIC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+ID4+Pj4gICAgI2RlZmluZSBG
TUMyX01BWF9FQ0NfQlVGX0xFTgkJKEZNQzJfQkNIRFNSU19MRU4gKiBGTUMyX01BWF9TRykgIAo+
ID4+Pj4gICAgPj4gLSNkZWZpbmUgRk1DMl9USU1FT1VUX1VTCQkJMTAwMCAgCj4gPj4+PiAtI2Rl
ZmluZSBGTUMyX1RJTUVPVVRfTVMJCQkxMDAwCj4gPj4+PiArI2RlZmluZSBGTUMyX1RJTUVPVVRf
TVMJCQk1MDAwICAKPiA+Pj4+ICAgID4+ICAgLyogVGltaW5ncyAqLyAgCj4gPj4+PiAgICAjZGVm
aW5lIEZNQzJfVEhJWgkJCTEKPiA+Pj4+IEBAIC01MjUsOSArNTI0LDkgQEAgc3RhdGljIGludCBz
dG0zMl9mbWMyX2hhbV9jYWxjdWxhdGUoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTgg
KmRhdGEsCj4gPj4+PiAgICAJdTMyIHNyLCBoZWNjcjsKPiA+Pj4+ICAgIAlpbnQgcmV0OyAgCj4g
Pj4+PiAgICA+PiAtCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KGZtYzItPmlvX2Jh
c2UgKyBGTUMyX1NSLCAgCj4gPj4+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxMCwK
PiA+Pj4+IC0JCQkJCSBGTUMyX1RJTUVPVVRfTVMpOwo+ID4+Pj4gKwlyZXQgPSByZWFkbF9yZWxh
eGVkX3BvbGxfdGltZW91dF9hdG9taWMoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsCj4gPj4+PiAr
CQkJCQkJc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+ID4+Pj4gKwkJCQkJCTEwMDAgKiBGTUMy
X1RJTUVPVVRfTVMpOyAgCj4gPj4+Cj4gPj4+IElzIHRoZSBfYXRvbWljIHN1ZmZpeCBuZWVkZWQg
aGVyZT8gSWYgeWVzIGl0IHdvdWxkIGRlc2VydmUgYSBzZXBhcmF0ZQo+ID4+PiBwYXRjaCB3aXRo
IEZpeGVzL1N0YWJsZSB0YWdzLiAgCj4gPj4+ICAgID4+ICAKPiA+PiBJIGhhdmUgY3VycmVudGx5
IG5vdCBzZWVuIGFueSBpc3N1ZXMuIFNvLCBJIHdpbGwgcmVtb3ZlIHRoaXMgbW9kaWZpY2F0aW9u
IGFzIHdlIHdpbGwgbW92ZSB0byByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQgaW4gcGF0Y2ggMTAu
Cj4gPj4gIAo+ID4+Pj4gICAgCWlmIChyZXQpIHsKPiA+Pj4+ICAgIAkJZGV2X2VycihmbWMyLT5k
ZXYsICJoYW0gdGltZW91dFxuIik7Cj4gPj4+PiAgICAJCXJldHVybiByZXQ7Cj4gPj4+PiBAQCAt
MTMxNSw3ICsxMzE0LDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX3dhaXRyZHkoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyB0aW1lb3V0X21zKQo+ID4+Pj4gICAgCS8qIENo
ZWNrIGlmIHRoZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8K
PiA+Pj4+ICAgIAlpZiAocmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlv
X2Jhc2UgKyBGTUMyX1NSLCBzciwKPiA+Pj4+ICAgIAkJCQkJICAgICAgc3IgJiBGTUMyX1NSX05X
UkYsIDEsCj4gPj4+PiAtCQkJCQkgICAgICBGTUMyX1RJTUVPVVRfVVMpKQo+ID4+Pj4gKwkJCQkJ
ICAgICAgMTAwMCAqIEZNQzJfVElNRU9VVF9NUykpCj4gPj4+PiAgICAJCWRldl93YXJuKGZtYzIt
PmRldiwgIldhaXRyZHkgdGltZW91dFxuIik7ICAKPiA+Pj4+ICAgID4+ICAgCS8qIFdhaXQgdFdC
IGJlZm9yZSBSL0IjIHNpZ25hbCBpcyBsb3cgKi8gIAo+ID4+Pgo+ID4+PiBZb3UgY2hhbmdlIHRo
ZSB0aW1lb3V0cyBmcm9tIDFtcyB0byA1cy4KPiA+Pj4KPiA+Pj4gTWF5YmUgNXMgaXMgYSBsaXR0
bGUgYml0IHRvbyBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHRoaXMKPiA+
Pj4gaXMgYSB0aW1lb3V0LiBIb3dldmVyIDFtcyBpcyB0aWdodC4gSWYgeW91IGFyZSBjaGFuZ2lu
ZyB0aGlzIHZhbHVlCj4gPj4+IGJlY2F1c2UgaXQgdHJpZ2dlcnMgZXJyb3IgKGVnLiB3aGVuIHRo
ZSBtYWNoaW5lIGlzIGxvYWRlZCksIHRoZW4gaXQgaXMKPiA+Pj4gYSBmaXggYW5kIHNob3VsZCBh
cHBlYXIgbGlrZSBpdC4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBNaXF1w6hsICAKPiA+Pj4g
ICAgPj4gIAo+ID4+IE5vIGVycm9ycyBjdXJyZW50bHkgaGFwcGVucy4KPiA+PiBEdXJpbmcgb3Vy
IHN0cmVzcyB0ZXN0cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwgd2UgaGF2ZSBzZWVuIHRoYXQg
d2UgY291bGQgYmUgY2xvc2UgdG8gMSBzZWNvbmQsIGV2ZW4gaWYgd2UgbmV2ZXIgbWV0IHRoaXMg
dmFsdWUuCj4gPj4gU28sIHRvIGJlIHNhZmUsIEkgaGF2ZSBzZXQgdGhpcyB0aW1lb3V0IHRvIDUg
c2Vjb25kcy4KPiA+PiBBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBoYXZlIG5vdCBz
ZWVuIGFueSBzaWRlIGVmZmVjdC4KPiA+PiBJIGFtIHVzaW5nIHRoZSBzYW1lIHRpbWVvdXQgY29u
c3RhbnQgdG8gYXZvaWQgdG8gaGF2ZSBvbmUgdGltZW91dCBwZXIgY2FzZXMuICAKPiA+IAo+ID4g
U29tZXRoaW5nIGlzIHdyb25nIGluIG15IG1pbmQ6Cj4gPiBZb3Ugc2F5IHlvdSBvYnNlcnZlIGRl
bGF5cyBvZiBhbG1vc3QgdXAgdG8gMSBzZWNvbmQsIGJ1dCB0aGUgcG9sbGluZwo+ID4gY3VycmVu
dGx5IGhhcHBlbnMgb24gMTAwMCB1cyA9IDFtcywgZWl0aGVyIHlvdSBoYWQgdGltZW91dHMgb3Ig
SQo+ID4gbWlzcmVhZCBzb21ldGhpbmc/Cj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPiA+
ICAgCj4gCj4gSGkgTWlxdcOobCwKPiAKPiBNeSBmYXVsdC4gRm9yIHRoaXMgcG9sbGluZywgd2Ug
bmV2ZXIgbWV0IDEgbXMuCj4gVGhlIDEgc2Vjb25kIG9ic2VydmVkIHdhcyBvbiB0aGUgc2VxdWVu
Y2VyIHdoZW4gd2UgcmVhZC93cml0ZSBhIHBhZ2UgKGFzIGl0IHRoZSBzYW1lIHRpbWVvdXQgdmFs
dWUgdGhhdCBpcyB1c2VkKQoKT0sgSSBnZXQgaXQuIFNvIHBlcmhhcHMgeW91IGNhbiBnaXZlIHRo
ZXNlIGRldGFpbHMgaW4gdGhlIGNvbW1pdCBsb2cgdG8KZXhwbGFpbiB3aHkgeW91IHVzZSA1IHNl
Y29uZHMgaW5zdGVhZCBvZiBvbmUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
