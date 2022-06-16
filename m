Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4869EC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVR89881qPofevZrbIoH75t4AyeR5LwF2qA9xFU4pu8=; b=gHakd2z1+dPu2M
	5kzbz9P/kffFXzwMcMRh9I3PSQVS7V6ivDQCyzwua9CfNWDI6UV7F4LrvsPXLv9fKJUja0VS/wvqZ
	UjVIq8bnUSfpBV+Hf2AxGIkdCMDoN9joxtNoPzkaIPm3dYTRfppixLLuARu/+ePH4rv/SJDFxSXWu
	TaMFIS8q5yA5E65+qPmHYsPxRNVsZhbhhM3rY12bQBM3040l73SS1pz69X3P3orB3st59nL4GzAll
	lmntPt0k7c/vYjuCnxNiA9viYEPdAExWxs7q39oJIRRtwaRNokfW/Bb2jv74aFnFU1PQlJEMBLjZ1
	k5TQGJkKdFJy5+Q7Uk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1p65-002N3j-9O; Thu, 16 Jun 2022 12:59:41 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1p63-002N39-14
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 12:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655384379; x=1686920379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cc3oGdVH1nDPzLTWA7m1b0GeLH9ZTWSmjCrCfx9L430=;
  b=BAZAgF/NCC+y6mhYcGXXzTJuxbC8mttsd0khz50eN8uEaunCYErKekML
   P1rWdVhgVdrR99GGOpHnq2Czt+v+XIDwZbzb+CRr1os9skWi5YEHq+wNI
   KqYkdy3he6aHc+lD+FjZbQtLGYtjZSGXzs2Bh6heaKTmmEeHzMVVaf9qs
   gwLbSIGfZoIRRdsgRUaNyVt5oHI/YYCWRDn8mnIIWpOLX5DAzamEx3BVj
   1Q4gRx7VOgtuVSHP+wJ8U8PFWEBbN2xlyYEAbKUlcaGldzMydpd+SwlIR
   sLYlY5z4uLHwHVgzKJf/QBzx5czjMQG2O9/SKEn4wTM+zCZ5qh27a4/z0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340897123"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="340897123"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:59:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="727880472"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:59:33 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Jun 2022 15:59:31 +0300
Date: Thu, 16 Jun 2022 15:59:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)" <oocheret@cisco.com>
Cc: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"michael@walle.cc" <michael@walle.cc>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
	"lee.jones@linaro.org" <lee.jones@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqspM2Sw+Fu9y56Z@lahna>
References: <YqsHcL5NPcZ4De77@lahna>
 <20220616121446.293408-1-oocheret@cisco.com>
 <YqsjGx54+Gd8Aws/@lahna>
 <BYAPR11MB2757CEBE99C3A0861928CD43CDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2757CEBE99C3A0861928CD43CDAC9@BYAPR11MB2757.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_055939_151667_FD3D08D1 
X-CRM114-Status: GOOD (  32.44  )
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

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMTI6NTQ6NDJQTSArMDAwMCwgT2xla3NhbmRyIE9jaGVy
ZXRueWkgLVggKG9vY2hlcmV0IC0gR0xPQkFMTE9HSUMgSU5DIGF0IENpc2NvKSB3cm90ZToKPiAg
ICBIaSwKPiAKPiAgICAgID4gT3JpZ2luYWxseSBjb21taXQgMDk0ZDNiOSAoIm10ZDogc3BpLW5v
cjogQWRkIFVTRV9GU1IgZmxhZyBmb3IKPiAgICAgIG4yNXEqCj4gICAgICA+IGVudHJpZXMiKSBh
bmQgZm9sbG93aW5nIG9uZSA4ZjkzODI2ICgibXRkOiBzcGktbm9yOiBtaWNyb24tc3Q6Cj4gICAg
ICBjb252ZXJ0Cj4gICAgICA+IFVTRV9GU1IgdG8gYSBtYW51ZmFjdHVyZXIgZmxhZyIpIGVuYWJs
ZWQgU1BJTk9SX09QX1JERlNSIG9wY29kZQo+ICAgICAgaGFuZGxpbmcKPiAgICAgID4gYWJpbGl0
eSwgaG93ZXZlciBzb21lIGNvbnRyb2xsZXIgZHJpdmVycyBzdGlsbCBjYW5ub3QgaGFuZGxlIGl0
Cj4gICAgICBwcm9wZXJseQo+ICAgICAgPiBpbiB0aGUgbWljcm9uX3N0X25vcl9yZWFkeSgpIGNh
bGwgd2hhdCBicmVha3Mgc29tZSBtdGQgY2FsbGJhY2tzCj4gICAgICB3aXRoCj4gICAgICA+IG5l
eHQgZXJyb3IgbG9nczoKPiAgICAgID4KPiAgICAgID4gbXRkYmxvY2s6IGVyYXNlIG9mIHJlZ2lv
biBbYWRkcmVzczEsIHNpemUxXSBvbiAiQklPUyIgZmFpbGVkCj4gICAgICA+IG10ZGJsb2NrOiBl
cmFzZSBvZiByZWdpb24gW2FkZHJlc3MyLCBzaXplMl0gb24gIkJJT1MiIGZhaWxlZAo+ICAgICAg
Pgo+ICAgICAgPiBUaGUgSW50ZWwgU1BJIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3VwcG9ydCBsb3cg
bGV2ZWwgb3BlcmF0aW9ucywKPiAgICAgIGxpa2UKPiAgICAgID4gcmVhZGluZyB0aGUgZmxhZyBz
dGF0dXMgcmVnaXN0ZXIgKEZTUikuIEl0IG9ubHkgZXhwb3NlcyBhIHNldCBvZgo+ICAgICAgaGln
aAo+ICAgICAgPiBsZXZlbCBvcGVyYXRpb25zIGZvciBzb2Z0d2FyZSB0byB1c2UuIEZvciB0aGlz
IHJlYXNvbiBjaGVjayB0aGUKPiAgICAgIHJldHVybgo+ICAgICAgPiB2YWx1ZSBvZiBtaWNyb25f
c3Rfbm9yX3JlYWRfZnNyKCkgYW5kIGlmIHRoZSBvcGVyYXRpb24gd2FzIG5vdAo+ICAgICAgPiBz
dXBwb3J0ZWQsIHVzZSB0aGUgc3RhdHVzIHJlZ2lzdGVyIHZhbHVlIG9ubHkuIFRoaXMgYWxsb3dz
IHRoZQo+ICAgICAgY2hpcCB0bwo+ICAgICAgPiB3b3JrIGV2ZW4gd2hlbiBhdHRhY2hlZCB0byBJ
bnRlbCBTUEkgY29udHJvbGxlciAodGhlcmUgYXJlIHN1Y2gKPiAgICAgIHN5c3RlbXMKPiAgICAg
ID4gb3V0IHRoZXJlKS4KPiAgICAgID4KPiAgICAgID4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRy
IE9jaGVyZXRueWkgPG9vY2hlcmV0QGNpc2NvLmNvbT4KPiAgICAgID4gTGluazogWzFdaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZbVpVQ0lFJTJGTkQ4MkJsTmhAbGFobmEvCj4gICAgICA+
IC0tLQo+ICAgICAgPiAgUEFUQ0ggdjIgdXBkYXRlcyBQQVRDSCB2MSB0YWtpbmcgaW50byBhY2Nv
dW50IGNoYW5nZXMgZnJvbQo+ICAgICAgPgo+ICAgICAgWzJdaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjIwNTA2MTA1MTU4LjQzNjEzLTEtbWlrYS53ZXMKPiAgICAgIHRlcmJl
cmdAbGludXguaW50ZWwuY29tCj4gICAgICA+ICB0byBjaGVjayAtRU9QTk9UU1VQUCB2YWx1ZSBm
cm9tIG1pY3Jvbl9zdF9ub3JfcmVhZF9mc3IoKSBhcyB3ZWxsLgo+ICAgICAgPgo+ICAgICAgPiAg
ZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYyB8IDEyICsrKysrKysrKystLQo+ICAgICAg
PiAgZHJpdmVycy9zcGkvc3BpLWludGVsLmMgICAgICAgICB8ICAzICsrLQo+ICAgICAgPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICAgICAgPgo+
ICAgICAgPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+ICAg
ICAgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gICAgICA+IGluZGV4IGE5NmY3
NGUwZjU2OC4uZmQ1MmU4ZmVlYTQ0IDEwMDY0NAo+ICAgICAgPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL21pY3Jvbi1zdC5jCj4gICAgICA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWlj
cm9uLXN0LmMKPiAgICAgID4gQEAgLTM5OSw4ICszOTksMTYgQEAgc3RhdGljIGludCBtaWNyb25f
c3Rfbm9yX3JlYWR5KHN0cnVjdCBzcGlfbm9yCj4gICAgICAqbm9yKQo+ICAgICAgPiAgICAgICAg
ICAgICAgICByZXR1cm4gc3JfcmVhZHk7Cj4gICAgICA+Cj4gICAgICA+ICAgICAgICByZXQgPSBt
aWNyb25fc3Rfbm9yX3JlYWRfZnNyKG5vciwgbm9yLT5ib3VuY2VidWYpOwo+ICAgICAgPiAtICAg
ICBpZiAocmV0KQo+ICAgICAgPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICA+ICsg
ICAgIGlmIChyZXQgPCAwKSB7Cj4gICAgICA+ICsgICAgICAgICAgICAgLyoKPiAgICAgID4gKyAg
ICAgICAgICAgICAgKiBTb21lIGNvbnRyb2xsZXJzLCBzdWNoIGFzIEludGVsIFNQSSwgZG8gbm90
Cj4gICAgICBzdXBwb3J0IGxvdwo+ICAgICAgPiArICAgICAgICAgICAgICAqIGxldmVsIG9wZXJh
dGlvbnMgc3VjaCBhcyByZWFkaW5nIHRoZSBmbGFnIHN0YXR1cwo+ICAgICAgPiArICAgICAgICAg
ICAgICAqIHJlZ2lzdGVyLiBUaGV5IG9ubHkgZXhwb3NlIHNtYWxsIGFtb3VudCBvZiBoaWdoCj4g
ICAgICBsZXZlbAo+ICAgICAgPiArICAgICAgICAgICAgICAqIG9wZXJhdGlvbnMgdG8gdGhlIHNv
ZnR3YXJlLiBJZiB0aGlzIGlzIHRoZSBjYXNlCj4gICAgICB3ZSB1c2UKPiAgICAgID4gKyAgICAg
ICAgICAgICAgKiBvbmx5IHRoZSBzdGF0dXMgcmVnaXN0ZXIgdmFsdWUuCj4gICAgICA+ICsgICAg
ICAgICAgICAgICovCj4gICAgICA+ICsgICAgICAgICAgICAgcmV0dXJuIChyZXQgPT0gLUVOT1RT
VVBQIHx8IHJldCA9PSAtRU9QTk9UU1VQUCkgPwo+ICAgICAgc3JfcmVhZHkgOiByZXQ7Cj4gICAg
ICBUaGUgLUVPUE5PVFNVUFAgaGVyZSBpcyBub3QgbmVlZGVkIGFzIHlvdSBjaGFuZ2UgdGhlIElu
dGVsIFNQSQo+ICAgICAgZHJpdmVyIGluCj4gCj4gICAgdGhlIGJlbG93Lgo+IAo+ICAgIOKAi0hv
d2V2ZXIgSSByZW1lbWJlciB5b3UgY2F1Z2h0IHNpdHVhdGlvbiB3aGVyZSBtaWNyb25fc3Rfbm9y
X3JlYWRfZnNyKCkKPiAgICByZXR1cm5zIC1FT1BOT1RTVVBQCj4gICAgKGludGVsX3NwaV9leGVj
X21lbV9vcCBjYWxsYmFjayByZXR1cm5zIC1FT1BOT1RTVVBQKSwgYWNjb3JkaW5nIHRvIHlvdXIK
PiAgICBwYXRjaAo+ICAgIFszXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIy
MDUwNjEwNTE1OC40MzYxMy0xLW1pa2Eud2VzdGVyCj4gICAgYmVyZ0BsaW51eC5pbnRlbC5jb20v
IEkndmUgbm90ZWQgaW4gZGVzY3JpcHRpb24gYm9keS4gU28gSSB0aGluayBJIGhhdmUKPiAgICB0
byBjb3ZlciBib3RoIGVycm9yY29kZXMsIGhhdmVuJ3QgST8KCkkgd2FzIHRoaW5raW5nIHRoYXQg
eW91IGNoYW5nZSB0aGUgYm90aCBmdW5jdGlvbnMgaW4gSW50ZWwgU1BJIHRvIHJldHVybgotRU5P
VFNVUFAsIG5vdCBqdXN0IG9uZS4KCj4gICAgT3IgeW91ciBwYXRjaCBhcyB3ZWxsIGFzIG15IG9u
ZSBhcmUgZ29pbmcgc3VibWl0dGVkIGluZGVwZW5kZW50bHkgYW5kCj4gICAgY2FuIGJlIG1lcmdl
ZCBzZXF1ZW50aWFsbHk/CgpObywgbXkgcGF0Y2ggY2FuIGJlIGlnbm9yZWQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
