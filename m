Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7F7C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:24:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E88A208E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4sogwfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E88A208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qbOE82djheW4DPFpj1ZJSGVU3C8lgNswCQ7BAGX8rs=; b=q4sogwfMcmsl2c
	bBVCxZFx/b1/yk0SOihdJcDaI0Xw+AGSOWzE/hoiHN9WC0b7dmbTEq70qsbVLnV56iqZELCYoc7uR
	q1UbeQEt7JL8LdsQqmwT+JC7NM2JNcAVrW0G+ZeRtDt9dKS3Y+FhWzmPMCnkDCyW+MU+LZPpqLinZ
	mzAVTStodY2jn/wxD8rkKPepavw4rlI6EcnR7/uZJiQcUVLellQufSGuRDf45yttD4+DWP+P6zVr+
	dZLkJipC0zRJJLX6oGVBZVmG5SxNkdI3SbCfVGrfyWk9xw7l4T9nHSp1Eny4iKDfM0mSP2bLKV16a
	clzBAMj99ToD7aaoMO7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAynO-0005Iq-FW; Mon, 01 Apr 2019 15:24:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAynA-00059D-Hx; Mon, 01 Apr 2019 15:24:15 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 02B1F40016;
 Mon,  1 Apr 2019 15:24:03 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:24:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 00/11] add support for sam9x60 nand controller
Message-ID: <20190401172352.7f18e49f@xps13>
In-Reply-To: <20190213085930.31578-1-tudor.ambarus@microchip.com>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082408_739690_6A27FAE6 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgo8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tPiB3cm90ZSBvbiBXZWQsIDEz
IEZlYiAyMDE5IDA4OjU5OjQxICswMDAwOgoKPiBGcm9tOiBUdWRvciBBbWJhcnVzIDx0dWRvci5h
bWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gCj4gVGhlIHNhbTl4NjAgYm9hcmQgZGVmaW5lcyB0aGUg
Q0NGR19FQklDU0EgcmVnaXN0ZXIgdW5kZXIgU0ZSLAo+IGFuZCBub3QgYXMgYSBNQVRSSVggcmVn
aXN0ZXIsIGFzIHByZXZpb3VzIGJvYXJkcyBkby4KPiBOQU5EIEZsYXNoIEkvT3MgYXJlIGNvbm5l
Y3RlZCB0byBEMTbigJNEMjMsIHRodXMKPiBTRlJfQ0NGR19FQklDU0EuTkZEMF9PTl9EMTYgaXMg
c2V0IHRvIDEuCj4gCj4gVGVzdGVkIHVzaW5nIG10ZC11dGlscy4KPiAKPiAtIHBhdGNoZXMgWzEs
IDddIGFkZCBzdXBwb3J0IGZvciB0aGUgc2FtOXg2MCBuYW5kIGNvbnRyb2xsZXIuIEkgd291bGQK
PiAgIHN1Z2dlc3QgdG8gZ2V0IHRoZW0gdGhyb3VnaCBsaW51eC1tdGQgdHJlZSwgaWYgYWxsIGFn
cmVlLgo+IC0gcGF0Y2ggOCBjYW4gYmUgdGFrZW4gYnkgQWxleGFuZHJlCj4gLSBwYXRjaCA5IC0g
U1BEWCBjaGFuZ2UsIGNhbiBiZSB0YWtlbiBieSBMZWUKPiAtIHBhdGNoIDEwIC0gU1BEWCBjaGFu
Z2UsIGNhbiBiZSB0YWtlbiBieSBBbGV4YW5kcmUKPiAtIHBhdGNoIDExIC0gU1BEWCBjaGFuZ2Us
IHNob3VsZCBnbyB0aHJvdWdoIGxpbnV4LW10ZAo+IAo+IGR0IGNvbXBhdGlibGUgc3RyaW5nIGZv
ciAibWljcm9jaGlwLHNhbTl4NjAtc2ZyIiBoYXMgYWxyZWFkeSBiZWVuCj4gc3VibWl0ZWQgYXQg
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDc5OTgzMS8KPiAKPiBUdWRvciBB
bWJhcnVzICgxMSk6Cj4gICBBUk06IGF0OTE6IGFkZCBzYW05eDYwIFNGUiBkZWZpbml0aW9ucwo+
ICAgbWVtb3J5OiBhdG1lbC1lYmk6IGFkZCBnZW5lcmljIG5hbWUgZm9yIGViaSByZWdtYXAKPiAg
IGR0LWJpbmRpbmdzOiBtZW1vcnk6IGF0bWVsLWViaTogYWRkIHNhbTl4NjAgY29tcGF0aWJsZQo+
ICAgbWVtb3J5OiBhdG1lbC1lYmk6IGFkZCBzYW05eDYwIEVCSSBzdXBwb3J0Cj4gICBtdGQ6IHJh
d25hbmQ6IGF0bWVsOiBhZGQgZ2VuZXJpYyBuYW1lIGZvciBFQklDU0EgcmVnbWFwCj4gICBkdC1i
aW5kaW5nczogbXRkOiBhdG1lbC1uYW5kOiBhZGQgc2FtOXg2MCBjb21wYXRpYmxlCj4gICBtdGQ6
IHJhd25hbmQ6IGF0bWVsOiBhZGQgc2FtOXg2MCBuYW5kIGNvbnRyb2xsZXIgc3VwcG9ydAo+ICAg
bWVtb3J5OiBhdG1lbC1lYmk6IG1vdmUgTlVNX0NTIGRlZmluaXRpb24gaW5zaWRlIGF0bWVsLWVi
aQo+ICAgbWZkOiBzeXNjb246IGF0bWVsOiBzd2l0Y2ggdG8gU1BEWCBsaWNlbnNlIGlkZW50aWZp
ZXJzCj4gICBtZW1vcnk6IGF0bWVsLWViaTogc3dpdGNoIHRvIFNQRFggbGljZW5zZSBpZGVudGlm
aWVycwo+ICAgbXRkOiByYXduYW5kOiBhdG1lbDogc3dpdGNoIHRvIFNQRFggbGljZW5zZSBpZGVu
dGlmaWVycwo+IAo+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2F0bWVsLGViaS50
eHQgICAgICB8ICAgMSArCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hdG1lbC1uYW5k
LnR4dCAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tZW1vcnkvYXRtZWwtZWJpLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDggKysrKysrLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2F0bWVsL25hbmQtY29udHJvbGxlci5jICAgICAgIHwgMTE3ICsrKysrKysrKysrKysrKystLS0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9wbWVjYy5jICAgICAgICAgICAgICAgICB8
ICAgNSArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9wbWVjYy5oICAgICAgICAgICAg
ICAgICB8ICAgNiArLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vYXRtZWwtbWF0cml4Lmgg
ICAgICAgICAgICB8ICAgNyArLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vYXRtZWwtbWMu
aCAgICAgICAgICAgICAgICB8ICAgNiArLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vYXRt
ZWwtc21jLmggICAgICAgICAgICAgICB8ICAgNSArLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNj
b24vYXRtZWwtc3QuaCAgICAgICAgICAgICAgICB8ICAgNiArLQo+ICBpbmNsdWRlL3NvYy9hdDkx
L2F0bWVsLXNmci5oICAgICAgICAgICAgICAgICAgICAgICB8ICAzNCArKysrLS0KPiAgMTEgZmls
ZXMgY2hhbmdlZCwgMTYxIGluc2VydGlvbnMoKyksIDc1IGRlbGV0aW9ucygtKQo+IAoKClBhdGNo
ZXMgMS03ICYgMTEgYXBwbGllZCB0bwpnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBvbiBuYW5kL25leHQuCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
