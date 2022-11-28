Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7497DC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipWwKV9abQaH4PyN3Fp9dp9u6NTv8K5VZwhd0H3GLts=; b=trZOjY3XAs2mC7
	CwFiwnWz1KBZ0+MmXFcoaI0oYN9EgK/YfU5E5R9YITjgXg8YU18K8jc2agHRoZugMrrBpplV5CApD
	vQF1jztd03jRvmy9a/t3hMX7bS0BPzlU2YVkyOlNps7j9fdAybDoLrZ7ufXHPfQpp4LHNJi5kXQ6L
	5A341vF8F4dTtkwjGFa9UJu+c5JjOAzJt/l74nniF6NvaGsrDD6BWPua2pTXknCCpgShEHgpaWG33
	5KE88MDgCijipQSH7Gpj7nMsgTjS2wAQ5mC17EBVotu552ugUa3SQqP4ZmPa8hCsq7ay043PG0f1R
	hdbFuK4qoiomjqMCUVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZXk-000FD6-Lx; Mon, 28 Nov 2022 08:31:12 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZXL-000F0P-7z; Mon, 28 Nov 2022 08:30:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6046760008;
	Mon, 28 Nov 2022 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669624242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V24Aaq988HpFuk8FMBp0+VYNbQHp6mco9JU3lqfOz1Q=;
	b=NnFQLqfWAY0F9/IpVrR3n0Tuv2AAexr6Q/CLUzGAXiupV52Xhw4ApUSmF7reojh1MykfhM
	o19kH/AoVRM3S3prp+q474utljNy1XVKFg7HJiLlJakBFZYzmU1+4mK7EbFJs+qsKOj1a3
	DCj8u+zkhtu4wMAyXg+lagZx3Qswfhnlq9uGOAG6S7l2BF7paVOXBIxqMCXBR9VICXMt9T
	5PvClBssOBYWZJi9Wr+hxF86l7vkC+Amv2qXIUGMa2PjFUaypSBwQN5ga7YUHBd2QgdziA
	oHLYHTPFmsIudsC3qABWWeLTVCwjw+v3G90S0ACBvX1dgkejEBZz4QfKNyih1A==
Date: Mon, 28 Nov 2022 09:30:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] nvmem: core: refactor .cell_post_process() CB
 arguments
Message-ID: <20221128093034.6646f191@xps-13>
In-Reply-To: <f2bb569404903bc937fbe3840582f3c4@walle.cc>
References: <20221128065923.1180-1-zajec5@gmail.com>
	<f2bb569404903bc937fbe3840582f3c4@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_003047_793320_53E85C2B 
X-CRM114-Status: GOOD (  20.82  )
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

SGkgUmFmYWwsCgptaWNoYWVsQHdhbGxlLmNjIHdyb3RlIG9uIE1vbiwgMjggTm92IDIwMjIgMDg6
MzU6MjQgKzAxMDA6Cgo+IEFtIDIwMjItMTEtMjggMDc6NTksIHNjaHJpZWIgUmFmYcWCIE1pxYJl
Y2tpOgo+ID4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4gCj4g
PiBQYXNzIHdob2xlIE5WTUVNIGNlbGwgc3RydWN0IGFuZCBsZW5ndGggcG9pbnRlciBhcyBhcmd1
bWVudHMgdG8gPiBjYWxsYmFjawo+ID4gZnVuY3Rpb25zLgo+ID4gCj4gPiBUaGlzIGFsbG93czoK
PiA+IAo+ID4gMS4gQ2VsbHMgY29udGVudCB0byBiZSBtb2RpZmllZCBiYXNlZCBvbiBtb3JlIGlu
Zm8KPiA+ICAgIFNvbWUgY2VsbHMgKGlkZW50aWZpZWQgYnkgdGhlaXIgbmFtZXMpIGNvbnRhaW4g
c3BlY2lmaWMgZGF0YSB0aGF0Cj4gPiAgICBuZWVkcyBmdXJ0aGVyIHByb2Nlc3NpbmcuIFRoaXMg
Y2FuIGJlIGUuZy4gTUFDIGFkZHJlc3Mgc3RvcmVkIGluIGFuCj4gPiAgICBBU0NJSSBmb3JtYXQu
IE5WTUVNIGNvbnN1bWVycyBleHBlY3QgTUFDIHRvIGJlIHJlYWQgaW4gYSBiaW5hcnkgPiBmb3Jt
Lgo+ID4gICAgTW9yZSBjb21wbGV4IGNlbGxzIG1heSBiZSBhZGRpdGlvbmFsbHkgZGVzY3JpYmVk
IGluIERULiBUaGlzIGNoYW5nZQo+ID4gICAgYWxsb3dzIGFsc28gYWNjZXNzaW5nIHJlbGV2YW50
IERUIG5vZGVzIGFuZCByZWFkaW5nIGV4dHJhIGluZm8uCj4gPiAKPiA+IDIuIEFkanVzdGluZyBk
YXRhIGxlbmd0aAo+ID4gICAgSWYgY2VsbCBwcm9jZXNzaW5nIHJlc3VsdHMgaW4gcmVmb3JtYXR0
aW5nIGl0LCBpdCdzIHJlcXVpcmVkIHRvCj4gPiAgICBhZGp1c3QgbGVuZ3RoLiBUaGlzIGFnYWlu
IGFwcGxpZXMgZS5nLiB0byB0aGUgTUFDIGZvcm1hdCBjaGFuZ2UgZnJvbQo+ID4gICAgQVNDSUkg
dG8gdGhlIGJ5dGUtYmFzZWQuCgpNaWNoYWVsJ3Mgc2VyaWVzIGJyaW5ncyByZWFkX3Bvc3RfcHJv
Y2VzcywgaXNuJ3Qgd2hhdCB5b3UgbmVlZCBoZXJlPwoKPiA+IAo+ID4gTGF0ZXIgb24gd2UgbWF5
IGNvbnNpZGVyIG1vcmUgY2xlYW51cHMgJiBmZWF0dXJlcyBsaWtlOgo+ID4gMS4gRHJvcHBpbmcg
ImNvbnN0IGNoYXIgKmlkIiBhbmQganVzdCB1c2luZyBOVk1FTSBjZWxsIG5hbWUKPiA+IDIuIEFk
ZGluZyBleHRyYSBhcmd1bWVudCBmb3IgY2VsbHMgcHJvdmlkaW5nIG11bHRpcGxlIHZhbHVlcwo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gPiAtLS0KPiA+IFRoaXMgc29sdXRpb24gY29uZmxpY3RzIHdpdGggMSBwYXJ0IG9mIE1pY2hh
ZWwncyB3b3JrOgo+ID4gW1BBVENIIHYyIDAwLzIwXSBudm1lbTogY29yZTogaW50cm9kdWNlIE5W
TUVNIGxheW91dHMKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwv
MjAyMjA5MDEyMjE4NTcuMjYwMDM0MC0xLW1pY2hhZWxAd2FsbGUuY2MvCj4gPiAKPiA+IEluc3Rl
YWQgb2Y6Cj4gPiAxLiBBZGRpbmcgTlZNRU0gY2VsbC1sZXZlbCBwb3N0X3Byb2Nlc3MgY2FsbGJh
Y2sKPiA+IDIuIEFkZGluZyBjYWxsYmFjayAoLmZpeHVwX2NlbGxfaW5mbygpKSBmb3Igc2V0dGlu
ZyBjYWxsYmFja3MKPiA+IDMuIERyb3BwaW5nIE5WTUVNIGRldmljZS1sZXZlbCBwb3N0X3Byb2Nl
c3MgY2FsbGJhY2sKPiA+IEkgZGVjaWRlZCB0byByZWZhY3RvciBleGlzdGluZyBjYWxsYmFjay4K
PiA+IAo+ID4gTWljaGFlbCdzIHdvcmsgb24gYWRkaW5nICNudm1lbS1jZWxsLWNlbGxzIHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBlYXNpbHkKPiA+IHJlYmFzZSBvbiB0b3Agb2YgdGhvc2UgY2hhbmdl
cy4gIAoKWWVhaCwgSSBndWVzcyBzaW5jZSBNaWNoYWVsJ3Mgc2VyaWVzIGhhcyBiZWVuIG91dCBm
b3IgMiB5ZWFycyBhbmQgd2UKZmluYWxseSBhZ3JlZWQgb24gdGhlIGJpbmRpbmdzIHBsdXMgc29t
ZSBpbXBsZW1lbnRhdGlvbiBwb2ludHMsIEkgd291bGQKZXhwZWN0IGl0IHRvIGJlIG1lcmdlZCB2
ZXJ5IHNvb24gKEkgZG9uJ3Qga25vdyBpZiBTcmluaXZhcyBzdGlsbCBwbGFucwp0byB0YWtlIGl0
IGZvciB0aGlzIHJlbGVhc2Ugb3IgZm9yIHRoZSBuZXh0PykgdW5sZXNzIHNvbWVvbmUgc3BlYWtz
IHVwCmFnYWluc3QgaXQuCgo+IEFzIHlvdXJzIHNob3VsZCBiZSBlYXNpbHkgYWRkZWQgb24gdG9w
IG9mIG15IHNlcmllcy4gSSd2ZSBzaG93ZWQgdGhhdAo+IHByb3ZpZGluZyBhIGdsb2JhbCBwb3N0
IHByb2Nlc3MgaG9vayBpcyBiYWQgYmVjYXVzZSB0aGF0IHdheSB5b3UgbmVlZAo+IHRvIGhhdmUg
KmFsbCogY2VsbHMgb2YgeW91ciBkZXZpY2UgcmVhZC1vbmx5Lgo+IAo+IC1taWNoYWVsCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
