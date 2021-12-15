Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FECC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xN+1e1LaHn2S1rsdZ/tlS6iHsZsEN1V6KNhRWbwq8oU=; b=UI6H4f7mA1lwXS
	Tj8MJrvux7WfaObRp0M5TXbJSwgVuv3DCedghQBQayAcgdKkB+CdDXM+OqUYFZo1Bnj54z3bg2T/e
	4FoKtdhM9PHB2AphjQESffkI2z2RNjxlBLMhH1Q5bSahNAwxtX+vYu4NZVxCTI8IRlrJPlVFR5PSU
	WCTP+hZFDAabDakgdvtuvWeFoTrdvkS058JctP62Gqt43HN0durT3gXsI1lRT+kDGz1kaGvsqF++Y
	Q0EX+pkFRqa/cMlvTfQPziPBhgMhJk5xy3thEL7UsyLgTAVr1/vExddy/zNhNI6uMTKlPOaNbYgLX
	FgMCbR+tLV7RHISTj1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZbF-002Kwy-Oc; Wed, 15 Dec 2021 19:06:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZbC-002Kvs-H6
 for linux-mtd@lists.infradead.org; Wed, 15 Dec 2021 19:06:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 036001F4590B;
 Wed, 15 Dec 2021 19:05:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639595152; bh=iA7OQ+fJOo1Y9PYA/3Aou6d5nHYCszMH0xYRIBOzySg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dp5TtinkvFxKB5vsUsfN0sDr9GWN0CT+GpltRQPmX4TUs2VLwtpabI9prpdElC0Px
 aFv/uGlcFsjievKFxRrlrJvCP3ho3g68rzcf1bBWdGb8ghygN6ZJOZGkrFODss8GAq
 lVtg8IL+ao52KbdteNJoOOxjuRecENT70nO/AHC6Z+0ax4563NUDsHitx/q3obZ41u
 HyQiP16FPSzyZqDP+fb7f/W8BDuHIYb+EqobKg6/Rt+HXclYhaSWKa2XCrCKVILYeG
 Opm26p9cT3AwYj7kfJCTJphndiqKRA1Ait5k7ith35oPdFbT5gb/3YQemdDISapY5n
 4ZRHhb2qC17Ag==
Date: Wed, 15 Dec 2021 20:05:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211215200548.75630b61@collabora.com>
In-Reply-To: <20211215184426.67fd3912@xps13>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_110558_859734_675E63EE 
X-CRM114-Status: GOOD (  37.02  )
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

T24gV2VkLCAxNSBEZWMgMjAyMSAxODo0NDoyNiArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgQm9yaXMsCj4gCj4gYm9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20gd3JvdGUgb24gVHVlLCAxNCBEZWMgMjAyMSAxNzoyNDoxMCArMDEw
MDoKPiAKPiA+IE9uIFR1ZSwgMTQgRGVjIDIwMjEgMTI6NDE6MzkgKzAxMDAKPiA+IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gVGhp
cyBkcml2ZXIgY2FuIGJlIHNpbXBsaWZpZWQgYSBsaXR0bGUgYml0IGJ5IHVzaW5nCj4gPiA+IHNw
aV9tZW1fZ2VuZXJpY19zdXBwb3J0c19vcCgpIGluc3RlYWQgb2YgdGhlCj4gPiA+IHNwaV9tZW1f
ZGVmYXVsdC9kdHJfc3VwcG9ydHNfb3AoKSBjb3VwbGUuIFRoZSBhbGxfZmFsc2UgYm9vbGVhbiBp
cwo+ID4gPiBpbnZlcnRlZCB0byBiZWNvbWUgYSBkdHIgYm9vbGVhbiwgd2hpY2ggY2hlY2tzIGlm
IGF0IGxlYXN0IG9uZSBvZiB0aGUKPiA+ID4gb3BlcmF0aW9uIG1lbWJlciB1c2VzIGR0ciBtb2Rl
LiBUaGUgaWRlYSBiZWhpbmQgdGhpcyBjaGFuZ2UgaXMgdG8KPiA+ID4gc2ltcGxpZnkgdGhlIGlu
dHJvZHVjdGlvbiBvZiB0aGUgcGlwZWxpbmVkIEVDQyBlbmdpbmUuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvc3BpL3NwaS1teGljLmMgfCAxMCArKystLS0tLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1teGljLmMgYi9kcml2ZXJzL3NwaS9z
cGktbXhpYy5jCj4gPiA+IGluZGV4IDQ4NWE3ZjJhZmI0NC4uNWU3MWFhNjMwNTA0IDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbXhpYy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvc3Bp
L3NwaS1teGljLmMKPiA+ID4gQEAgLTQ1Miw3ICs0NTIsNyBAQCBzdGF0aWMgc3NpemVfdCBteGlj
X3NwaV9tZW1fZGlybWFwX3dyaXRlKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjLAo+
ID4gPiAgc3RhdGljIGJvb2wgbXhpY19zcGlfbWVtX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVt
ICptZW0sCj4gPiA+ICAJCQkJICAgICBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4gPiA+
ICB7Cj4gPiA+IC0JYm9vbCBhbGxfZmFsc2U7Cj4gPiA+ICsJc3RydWN0IHNwaV9tZW1fY29udHJv
bGxlcl9jYXBzIGNhcHMgPSB7fTsKPiA+ID4gIAo+ID4gPiAgCWlmIChvcC0+ZGF0YS5idXN3aWR0
aCA+IDggfHwgb3AtPmFkZHIuYnVzd2lkdGggPiA4IHx8Cj4gPiA+ICAJICAgIG9wLT5kdW1teS5i
dXN3aWR0aCA+IDggfHwgb3AtPmNtZC5idXN3aWR0aCA+IDgpCj4gPiA+IEBAIC00NjUsMTMgKzQ2
NSw5IEBAIHN0YXRpYyBib29sIG14aWNfc3BpX21lbV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21l
bSAqbWVtLAo+ID4gPiAgCWlmIChvcC0+YWRkci5uYnl0ZXMgPiA3KQo+ID4gPiAgCQlyZXR1cm4g
ZmFsc2U7Cj4gPiA+ICAKPiA+ID4gLQlhbGxfZmFsc2UgPSAhb3AtPmNtZC5kdHIgJiYgIW9wLT5h
ZGRyLmR0ciAmJiAhb3AtPmR1bW15LmR0ciAmJgo+ID4gPiAtCQkgICAgIW9wLT5kYXRhLmR0cjsK
PiA+ID4gKwljYXBzLmR0ciA9IG9wLT5jbWQuZHRyIHx8IG9wLT5hZGRyLmR0ciB8fCBvcC0+ZHVt
bXkuZHRyIHx8IG9wLT5kYXRhLmR0cjsgICAgCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZSB0aGF0J3Mg
d2hhdCB5b3Ugd2FudCB0byBkbz8gc3BpX21lbV9jb250cm9sbGVyX2NhcHMgaXMKPiA+IHN1cHBv
c2VkIHRvIGVuY29kZSB0aGUgY29udHJvbGxlciBjYXBhYmlsaXRpZXMsIG5vdCB3aGV0aGVyIHRo
ZQo+ID4gb3BlcmF0aW9uIGNvbnRhaW5zIGEgRFRSIGN5Y2xlIG9yIG5vdC4gSSdkIGV4cGVjdCB0
aGlzIGNhcHMgb2JqZWN0IHRvIGJlCj4gPiBzdGF0aWNhbGx5IGRlZmluZWQsIHdpdGggcG9zc2li
bHkgb25lIGluc3RhbmNlIHBlci1jb21wYXQgaWYgdGhlIGNhcHMKPiA+IGRlcGVuZCBvbiB0aGUg
SFcgcmV2aXNpb24uICAKPiAKPiBJbiBvcmRlciB0byBrZWVwIHRoZSBzZXJpZXMgZWFzeSB0byBy
ZXZpZXcgSSBkZWNpZGVkIHRvIGdvIGZvciB0aGUKPiBmb2xsb3dpbmcgYXBwcm9hY2g6Cj4gKiBJ
bnRyb2R1Y2UgdGhlIHNwaV9tZW1fZ2VuZXJpY19zdXBwb3J0c19vcF9oZWxwZXIoKSB3aGljaCB0
YWtlcyBhCj4gICBjYXBhYmlsaXRpZXMgc3RydWN0dXJlLiBUaGlzIGhlbHBlciBnYXRoZXJzIGFs
bCB0aGUgY2hlY2tzIGZyb20KPiAgIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIGFuZCBz
cGlfbWVtX2R0cl9zdXBwb3J0c19vcCgpLiBUaGVzZQo+ICAgdHdvIGhlbHBlcnMgbm93IGNhbGwg
dGhlIG5ldyBvbmUgd2l0aCBlaXRoZXIgYSBOVUxMIHBvaW50ZXIgaW4gdGhlCj4gICBmb3JtZXIg
Y2FzZSwgb3IgYSBzdHJ1Y3R1cmUgd2l0aCB0aGUgLmR0ciBwYXJhbWV0ZXIgc2V0IHRvIHRydWUg
aW4KPiAgIHRoZSBsYXR0ZXIuCj4gKiBDaGFuZ2UgdGhlIEFQSSBvZiBzcGlfbWVtX2RlZmF1bHRf
c3VwcG9ydHNfb3AoKSwgdGhpcyBpbnZvbHZlcwo+ICAgdXBkYXRpbmcgbWFueSBkaWZmZXJlbnQg
ZHJpdmVycyBzbyB0aGlzIGNoYW5nZSBkb2VzIG9ubHkgdGhhdCBpbiBhCj4gICB2ZXJ5IHRyYW5z
cGFyZW50IHdheSwgd2l0aCBubyBmdW5jdGlvbmFsIGNoYW5nZXMgYXQgYWxsLiBBbGwgdGhlCj4g
ICBkcml2ZXJzIHByb3ZpZGUgYSBOVUxMIHBhcmFtZXRlciBmb3IgdGhlIGNhcGFiaWxpdGllcyBz
dHJ1Y3R1cmUuCj4gKiBBY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgbmV3IHBhcmFtZXRlciBvZgo+
ICAgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgaW4gdGhlIGRyaXZlcnMgQ2FkZW5jZSBh
bmQgTWFjcm9uaXgsCj4gICB3aGljaCBkbyBoYXZlIERUUiBzdXBwb3J0LiBUaGlzIGtpbGxzIHRo
ZSBzcGlfbWVtX2R0cl9zdXBwb3J0c19vcCgpCj4gICBoZWxwZXIuCj4gKiBLaWxsIHRoZSB0ZW1w
b3Jhcnkgc3BpX21lbV9nZW5lcmljX3N1cHBvcnRzX29wKCkgaGVscGVyIGJ5IG1vdmluZwo+ICAg
YWxsIHRoZSBsb2dpYyBiYWNrIGludG8gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkuCj4g
Cj4gVGhpcyBhcHByb2FjaCBpcyByZWFsbHkgc3RyYWlnaHRmb3J3YXJkIGFuZCBlYXNpbHkgYmlz
ZWN0YWJsZSBpZgo+IG5lZWRlZC4KClRoZXJlJ3MgYWxzbyBhIHNlY29uZCBvcHRpb24gdGhhdCBk
b2Vzbid0IGludm9sdmUgcGF0Y2hpbmcgZXhpc3RpbmcKdXNlcnM6IGFkZCBhIHNwaV9tZW1fY29u
dHJvbGxlcl9jYXBzIHRvIHRoZSBzcGlfY29udHJvbGxlciBzdHJ1Y3QsIGFuZApjaGVjayB0aGlz
IGluc3RhbmNlIGluIHlvdXIgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkKaW1wbGVtZW50
YXRpb24uIE5vdGUgdGhhdCB0aGUgYnVzd2lkdGggY2hlY2sgZG9uZSBpbiB0aGUgZ2VuZXJpYwpo
ZWxwZXIgaXMgYWxyZWFkeSBiYXNlZCBvbiBjYXBzIGV4cG9zZWQgYnkgdGhlIGNvbnRyb2xsZXIK
dGhyb3VnaCBzcGlfY29udHJvbGxlci5tb2RlX2JpdHMgKHtSWC9UWH1fe0RVQUwsUVVBRCxPQ1RB
TH0gYml0cykuCgo+IFdoaWxlIHdvcmtpbmcgb24gdGhpcywgSSBmaXhlZCB0aGUgY2hlY2sgd2Ug
ZGlzY3Vzc2VkIG9uIElSQwo+IGFib3V0IHRoZSBjb21tYW5kIHBhcmFtZXRlciB3aGVuIGluIGEg
RFRSIG9wZXJhdGlvbi4gSSBhbHNvIHJldmVydGVkCj4gdGhlIGxvZ2ljIGluIHRoZSB2YXJpb3Vz
IGNoZWNrcywgYXMgeW91IHN1Z2dlc3RlZC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
