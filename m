Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEB0E77197
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 10:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ir4jDPyrruqlh5QYINpUyzgR/yp06mghBpAv4ePseOE=; b=B7uiumozLiq4wm
	cFNARgkNxsO1n3V20Jc2wdp2BVNEPsRowNkagMxfdtkrbeWHFRBtRHfoz7yZiLReqX/vAqfi6Rdl2
	/Cr4Uxrx8dmUuE8rRWlQkTBpM0aOyhSaQQMGiB10uIk408/tCmc8mdI70dNtSanHgOJjT+O7Ds0vG
	sa7vJ61c0/vi4+3j1t0K3UfOvsmCsoV/rWNMwGt5OfQTnF6hrKf87hnGKn1NPb7oXCd8kXVf2IYIr
	H/t4xLIIpzXjQ2g99Nf16y1guEwW6xd/ypdXChDAgoVg5jfm8qdJ20g3WfCA8Ug082ssdGgKtbH8M
	KjZmVWcE6V5sq1YV8AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIad-0000000AAfm-0SFY;
	Thu, 02 Jan 2025 10:38:07 +0000
Received: from smtp-71.smtpout.orange.fr ([80.12.242.71] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIVU-0000000A9ct-1PwO
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 10:32:49 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id TIVDtPSJjTjIXTIVGtoUGd; Thu, 02 Jan 2025 11:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735813960;
	bh=oIy4h6myCE9v5NQp61GRyssTTdt9xYDdFfwRLBqJIDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=swtrZoMGepjZWNNAMzAdUpPhr9dMP/Fwu1C5cyI05rm65XfLag7OwPCz6yqWeOyk0
	 QlYz9AXoLVNtzhi8M0OqKs4zm5g4eZlJFjPOejgVL4e3CQeSrAmKZue3XQlX3XbgmK
	 nRJjEwKYd7n83WhcV7RsIFMQyHp9S2SDoHSKh+tDJ+PZ2j6vM9rgtiIYuG2QGy6AdK
	 OrvAL0trVusI+uMq4s6/QuB4Qqh6VTXiLNUHebq9CEDZEHOFfsoBoGn6aMnGdPnjPO
	 aHaOUmsTTZGHo0XnGLg382uTD+q8bJuOOziFZeXWlYkWj/c1JuM6clHG32zTSsTw0t
	 Dn8lJ4UVRWiYA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Jan 2025 11:32:40 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
Date: Thu, 2 Jan 2025 11:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomas Winkler <tomasw@gmail.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-3-alexander.usyskin@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250101153925.865703-3-alexander.usyskin@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_023248_507976_42370978 
X-CRM114-Status: GOOD (  16.10  )
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

TGUgMDEvMDEvMjAyNSDDoCAxNjozOSwgQWxleGFuZGVyIFVzeXNraW4gYSDDqWNyaXTCoDoKPiBB
ZGQgYXV4aWxpYXJ5IGRyaXZlciBmb3IgaW50ZWwgZGlzY3JldGUgZ3JhcGhpY3MKPiBub24tdm9s
YXRpbGUgbWVtb3J5IGRldmljZS4KPiAKPiBDQzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4KPiBBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFRvbWFzIFdpbmtsZXIgPHRvbWFzd0BnbWFpbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgV2lua2xlciA8dG9tYXN3QGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwu
Y29tPgoKLi4uCgo+ICtzdHJ1Y3QgaW50ZWxfZGdfbnZtIHsKPiArCXN0cnVjdCBrcmVmIHJlZmNu
dDsKPiArCXZvaWQgX19pb21lbSAqYmFzZTsKPiArCXNpemVfdCBzaXplOwo+ICsJdW5zaWduZWQg
aW50IG5yZWdpb25zOwo+ICsJc3RydWN0IHsKPiArCQljb25zdCBjaGFyICpuYW1lOwo+ICsJCXU4
IGlkOwo+ICsJCXU2NCBvZmZzZXQ7Cj4gKwkJdTY0IHNpemU7Cj4gKwl9IHJlZ2lvbnNbXTsKCl9f
Y291bnRlZF9ieShucmVnaW9ucyk/Cgo+ICt9Owo+ICsKPiArc3RhdGljIHZvaWQgaW50ZWxfZGdf
bnZtX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gK3sKPiArCXN0cnVjdCBpbnRlbF9kZ19u
dm0gKm52bSA9IGNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgaW50ZWxfZGdfbnZtLCByZWZjbnQp
Owo+ICsJaW50IGk7Cj4gKwo+ICsJcHJfZGVidWcoImZyZWVpbmcgaW50ZWxfZGcgbnZtXG4iKTsK
PiArCWZvciAoaSA9IDA7IGkgPCBudm0tPm5yZWdpb25zOyBpKyspCj4gKwkJa2ZyZWUobnZtLT5y
ZWdpb25zW2ldLm5hbWUpOwo+ICsJa2ZyZWUobnZtKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBp
bnRlbF9kZ19tdGRfcHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eF9kZXYsCj4gKwkJ
CSAgICAgIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlX2lkICphdXhfZGV2X2lkKQo+ICt7
Cj4gKwlzdHJ1Y3QgaW50ZWxfZGdfbnZtX2RldiAqaW52bSA9IGF1eGlsaWFyeV9kZXZfdG9faW50
ZWxfZGdfbnZtX2RldihhdXhfZGV2KTsKPiArCXN0cnVjdCBkZXZpY2UgKmRldmljZTsKPiArCXN0
cnVjdCBpbnRlbF9kZ19udm0gKm52bTsKPiArCXVuc2lnbmVkIGludCBucmVnaW9uczsKPiArCXVu
c2lnbmVkIGludCBpLCBuOwo+ICsJc2l6ZV90IHNpemU7Cj4gKwljaGFyICpuYW1lOwo+ICsJaW50
IHJldDsKPiArCj4gKwlkZXZpY2UgPSAmYXV4X2Rldi0+ZGV2Owo+ICsKPiArCS8qIGNvdW50IGF2
YWlsYWJsZSByZWdpb25zICovCj4gKwlmb3IgKG5yZWdpb25zID0gMCwgaSA9IDA7IGkgPCBJTlRF
TF9ER19OVk1fUkVHSU9OUzsgaSsrKSB7Cj4gKwkJaWYgKGludm0tPnJlZ2lvbnNbaV0ubmFtZSkK
PiArCQkJbnJlZ2lvbnMrKzsKPiArCX0KPiArCj4gKwlpZiAoIW5yZWdpb25zKSB7Cj4gKwkJZGV2
X2VycihkZXZpY2UsICJubyByZWdpb25zIGRlZmluZWRcbiIpOwo+ICsJCXJldHVybiAtRU5PREVW
Owo+ICsJfQo+ICsKPiArCXNpemUgPSBzaXplb2YoKm52bSkgKyBzaXplb2YobnZtLT5yZWdpb25z
WzBdKSAqIG5yZWdpb25zOwoKc3RydWN0X3NpemUoKT8gKGFuZCBtYXliZSBubyBuZWVkIGZvciBz
aXplKQoKPiArCW52bSA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIW52bSkK
PiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlrcmVmX2luaXQoJm52bS0+cmVmY250KTsKPiAr
Cj4gKwludm0tPm5yZWdpb25zID0gbnJlZ2lvbnM7Cj4gKwlmb3IgKG4gPSAwLCBpID0gMDsgaSA8
IElOVEVMX0RHX05WTV9SRUdJT05TOyBpKyspIHsKPiArCQlpZiAoIWludm0tPnJlZ2lvbnNbaV0u
bmFtZSkKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCW5hbWUgPSBrYXNwcmludGYoR0ZQX0tFUk5F
TCwgIiVzLiVzIiwKPiArCQkJCSBkZXZfbmFtZSgmYXV4X2Rldi0+ZGV2KSwgaW52bS0+cmVnaW9u
c1tpXS5uYW1lKTsKPiArCQlpZiAoIW5hbWUpCj4gKwkJCWNvbnRpbnVlOwo+ICsJCW52bS0+cmVn
aW9uc1tuXS5uYW1lID0gbmFtZTsKPiArCQludm0tPnJlZ2lvbnNbbl0uaWQgPSBpOwo+ICsJCW4r
KzsKPiArCX0KClNob3VsZCB3ZSBzZXQgdGhlIGV4YWN0IG51bWJlciBvZiByZWdpb25zLCBzaG91
bGQgYSBrYXNwcmludGYoKSBmYWlsPwoJbnZtLT5ucmVnaW9ucyA9IG47ClRoaXMgd291bGQgbWFr
ZSBfX2NvdW50ZWRfYnkgYmUgbW9yZSBhY2N1cmF0ZSBpbiBpdHMgY2hlY2suCgo+ICsKPiArCW52
bS0+YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXZpY2UsICZpbnZtLT5iYXIpOwo+ICsJ
aWYgKElTX0VSUihudm0tPmJhc2UpKSB7Cj4gKwkJZGV2X2VycihkZXZpY2UsICJtbWlvIG5vdCBt
YXBwZWRcbiIpOwo+ICsJCXJldCA9IFBUUl9FUlIobnZtLT5iYXNlKTsKPiArCQlnb3RvIGVycjsK
PiArCX0KPiArCj4gKwlkZXZfc2V0X2RydmRhdGEoJmF1eF9kZXYtPmRldiwgbnZtKTsKPiArCj4g
KwlyZXR1cm4gMDsKPiArCj4gK2VycjoKPiArCWtyZWZfcHV0KCZudm0tPnJlZmNudCwgaW50ZWxf
ZGdfbnZtX3JlbGVhc2UpOwo+ICsJcmV0dXJuIHJldDsKPiArfQoKLi4uCgpDSgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
