Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DADBC47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEEIcSzzSldt9jreLcvRwRH06CMMxqqcWwpCcq0AxPE=; b=dElL0G1zdfxEbm
	6g/cKmzDU8HyZNgh0Mv61o6hW0DCEqEV4KM1rQKs8etb3pUACWzxn3ehFE9oOMf8ioubRO3Mjobom
	Z13tZs8xlK/2uBMxT1pRFIlYWY8VTMhSHt6pUIwIYrTvzfANXEWGo0hN9j8looh9rkBJ1Cg5leiqR
	2tGFqt3/fFRSiwYzV5jfFqIaZ/Uwu57qnBBM9FxuR6Hy0ZvZ+QDFM+GMWNo+RNe3KHRuid+SvAp2l
	dCy70bkH5hPRry/qOI0bAh65d4Vx3MusKoeYctwzECiVVz6gnj25YhT62RlLmzfQ++SLOgYRjCFFb
	VQkIBR6JVfZnVz2fcIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPvK-00EXv3-2s;
	Thu, 04 Jan 2024 15:46:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPvH-00EXsR-1i;
	Thu, 04 Jan 2024 15:46:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C51F6B81A4A;
	Thu,  4 Jan 2024 15:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F095C433C9;
	Thu,  4 Jan 2024 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704383177;
	bh=SfZbR38GEcgJBvCINBMSek/E8wPgRnRG8ktuyVrX3zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IveUNarCqW/WK/8Gk5NEKAQVJAt7LI3pmLVBOPmtCgUAUkU72rXXr29d8Yqn28wQ1
	 vA16eeqmAhjiBrrO4iFDP0X/daoMm8Qttz4qBoqex04PAfTjpwLL0Aq/gPcV9LNetX
	 IIDC7o4DtIGWqenWBYGChQgZSp+95PDVJQKSK00k=
Date: Thu, 4 Jan 2024 16:46:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 6/6] nvmem: layouts: add U-Boot env layout
Message-ID: <2024010446-willfully-swoop-8510@gregkh>
References: <20231221173421.13737-1-zajec5@gmail.com>
 <20231221173421.13737-6-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221173421.13737-6-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_074619_721844_61743E8E 
X-CRM114-Status: GOOD (  13.10  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDY6MzQ6MjFQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBN
b3ZlIGFsbCBnZW5lcmljIChOVk1FTSBkZXZpY2VzIGluZGVwZW5kZW50KSBjb2RlIGZyb20gTlZN
RU0gZGV2aWNlCj4gZHJpdmVyIHRvIE5WTUVNIGxheW91dCBkcml2ZXIuIFRoZW4gYWRkIGEgc2lt
cGxlIE5WTUVNIGxheW91dCBjb2RlIG9uCj4gdG9wIG9mIGl0Lgo+IAo+IFRoYW5rcyB0byBwcm9w
ZXIgbGF5b3V0IGl0J3MgcG9zc2libGUgdG8gc3VwcG9ydCBVLUJvb3QgZW52IGRhdGEgc3RvcmVk
Cj4gb24gYW55IGtpbmQgb2YgTlZNRU0gZGV2aWNlLgo+IAo+IEZvciBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IHdpdGggb2xkIERUIGJpbmRpbmdzIHdlIG5lZWQgdG8ga2VlcCBvbGQKPiBOVk1FTSBk
ZXZpY2UgZHJpdmVyIGZ1bmN0aW9uYWwuIFRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24gZXhwb3J0
IGFuZAo+IHJldXNlIGEgcGFyc2luZyBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gVjI6IFN1cHBvcnQgbmV3IGNv
bXBhdGlibGVzICYgdXNlIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGhlbHBlcgo+IFYzOiBVc2Ug
aW1wZXJhdGl2ZSBpbiBjb21taXQgYm9keQo+IAo+IElNUE9SVEFOVDoKPiBUaGlzIGlzIGJhc2Vk
IG9uIHRvcCBvZiB0aGU6Cj4gW1BBVENIIHY2LjggMS8yXSBudm1lbTogbGF5b3V0czogcmVmYWN0
b3IgLmFkZF9jZWxscygpIGNhbGxiYWNrIGFyZ3VtZW50cwoKSSBhcHBsaWVkIHBhdGNoZXMgMi01
IGluIHRoaXMgc2VyaWVzLCBJJ2xsIGxldCB5b3UgcmViYXNlIHRoZSByZW1haW5pbmcKdHdvIGFm
dGVyIGFkZHJlc3NpbmcgdGhlIGlzc3VlcyBkaXNjdXNzZWQgaW4gcGF0Y2ggMS4KCnRoYW5rcywK
CmdyZSBnay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
