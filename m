Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE9C00528
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biSt9KutZe6SHDE9kVNbyTtwwOnCKz8MIy7/bZJOvp8=; b=1NBlgHl/pNEUV2
	SJRtY5Y9/t/k0YawsaxAWpwSn6ZTmaewqtROou+YdolILIAFGgGurwWUwIXO2QtaRjAqYaMegxiUi
	7dX/2uSrfzD4Rg64jPcte2Nt3cZWGGVkpTs+5U2G0lhHpEnaqDtKcTEPY1ic7KFKMqco+juXNnSdQ
	TOJWRPjQSVW5Kro2XfT+6i4mPIH5jeEimiosq9ljovt8LBw/KfsJ00RilXTmCrPH/VEpnEeRxTq92
	npD6/Bsw/sO1kEPqzpFXXl6aoivN+qxvbAIYbEVRO4TmT4aU6CI6//Hr9frINCBfz6+1LbK6vTPMq
	pa+5tw1Vr7edvlX8NtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5Do-00HaVL-1Z;
	Thu, 27 Jul 2023 17:56:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5Dl-00HaSs-2t
	for linux-mtd@bombadil.infradead.org;
	Thu, 27 Jul 2023 17:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kdGTSaZttWzXE70nDOUK2tohVaGSllQiBwLy7anvxFA=; b=PUMStpsdEECNQpiGhDgP735o59
	pLNL44nV3DZ5pJysfhgl/IX+elIov2Z59alnXu4cFzdtiCIEr9YJNt1zyHCvYdjfs5Hkplr0Xu/6u
	bQXNeQwAbtypH3atJX4VRzD9FNQ5KEN8waRpXmjGhgMAZuuUbOWEfcCVsdkr84fGwh3pvPMd4M8IA
	HrEv1q/pJr54FeiJMuncgQGJPj0hUGDWK5e/iX+v84oZ/tQfYNIwZ69OkMG8B+/fNMS91SUwG+Gec
	fz14m9zy2nDp1VaFAzNnnoWHHxBHyTYCLSJDXUVhBHpGoUrTGvFYbjvrLfxTXzESuoEoWa9uZ2pnZ
	5zJ9zUIA==;
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3yP-007AVg-2b
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 16:36:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F741C0008;
	Thu, 27 Jul 2023 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690475776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdGTSaZttWzXE70nDOUK2tohVaGSllQiBwLy7anvxFA=;
	b=gwbaqSDNeRzur4+HiLF4Q+AQOYWLgNup+cTf/E7YPQ0wFFV/oAHtQNdCkDkP9hZKhorxkD
	xZI2kw9GgScfprx+CUj/47lshiiGDujDREUPR3wLGCq0xpu9NjzgXy4xbQ/XZQqElnc17j
	eT+rGkvKqwJPjo2YO3LqPKXBKPIHuxphZuDxPvDaKbz5wzd/Tng4p9CqeWFqZs0wr8p0X0
	uy78U2ZWnXnYX2BqQ0t5J50JLJZ7APZ7mdkbJxb6L5z3QdCueQIiq/tSSHQ14NqWvuErUz
	tJkotP81jQRmfJlGM8O/ZP3ZG7CVnXiMxUwRnekoI7AjQuBYbCl31PKbuK6lSg==
Date: Thu, 27 Jul 2023 18:36:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tomas Winkler
 <tomas.winkler@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>, Zhang
 Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
Message-ID: <20230727183611.37d01f51@xps-13>
In-Reply-To: <ZMKUJbl7kFOfgKGg@smile.fi.intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
	<ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
	<20230727172013.7c85c05d@xps-13>
	<ZMKUJbl7kFOfgKGg@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_173622_513928_C5776853 
X-CRM114-Status: GOOD (  18.94  )
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

SGkgQW5keSwKCmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBUaHUs
IDI3IEp1bCAyMDIzIDE4OjU4OjI5CiswMzAwOgoKPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAw
NToyMDoxM1BNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gYW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tIHdyb3RlIG9uIFRodSwgMjcgSnVsIDIwMjMgMTg6MTI6MDQKPiA+
ICswMzAwOiAgCj4gPiA+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDA1OjU3OjU4UE0gKzAzMDAs
IEFsZXhhbmRlciBVc3lza2luIHdyb3RlOiAgCj4gCj4gLi4uCj4gCj4gPiA+ID4gRml4ZXM6IDE5
YmZhOWViZWJiNSAoIm10ZDogdXNlIHJlZmNvdW50IHRvIHByZXZlbnQgY29ycnVwdGlvbiIpICAK
PiA+ID4gCj4gPiA+IENsb3NlczogPyAgCj4gPiAKPiA+IERpZCBJIG1pc3MgYSByZWNlbnQgdXBk
YXRlIG9uIHRoZSB1c2Ugb2YgRml4ZXM/ICAKPiAKPiBUaGV5IGFyZSBvcnRob2dvbmFsIHRvIGVh
Y2ggb3RoZXIuIEFjdHVhbGx5IENsb3NlcyBnb2VzIGNsb3NlciB3aXRoCj4gUmVwb3J0ZWQtYnku
Cj4gCj4gSSBiZWxpZXZlIGJvdGggb2YgdGhlbSBuZWVkcyB0byBiZSBhZGRlZCAoYnkgSSBtaWdo
dCBtaXNzIHNvbWV0aGluZykuCj4gCj4gPiBJIHRob3VnaHQgQ2xvc2VzIHdhcwo+ID4gc3VwcG9z
ZWQgdG8gcG9pbnQgYXQgYSBidWcgcmVwb3J0IHdoaWxlIEZpeGVzIHdvdWxkIHBvaW50IHRvIHRo
ZSBmYXVsdHkKPiA+IGNvbW1pdC4gIAo+IAo+IENvcnJlY3QuCj4gCj4gPiBSaWdodCBub3cgSSBm
ZWVsIGxpa2UgRml4ZXMgaXMgdGhlIHJpZ2h0IHRhZywgIAo+IAo+IE5vYm9keSBvYmplY3RzIHRo
YXQgKHNlZSBhYm92ZSkuCj4gCj4gPiBidXQgaWYgeW91IGhhdmUgYSBzb3VyY2UgZXhwbGFpbmlu
ZyB3aHkgd2Ugc2hvdWxkIG5vdCBsb25nZXIgZG8gaXQgbGlrZQo+ID4gSSBhbSB1c2VkIHRvLCBJ
IHdvdWxkIGFwcHJlY2lhdGUgYSBsaW5rLiAgCj4gCj4gU2luY2UgeW91IGtub3cgYWJvdXQgQ2xv
c2VzIGFscmVhZHksIEkgdGhpbmsgdGhlcmUgaXMgbm90aGluZyB0byBhZGQuCgpBaCBzb3JyeSBJ
IG1pc3VuZGVyc3Rvb2QgeW91ciBmaXJzdCBlLW1haWwuIEkgdGhvdWdodCB5b3Ugd2VyZQpzdWdn
ZXN0aW5nIHRvIHJlcGxhY2UgRml4ZXMgYnkgQ2xvc2VzLiBTb3JyeSBmb3IgdGhlIG1pc3VuZGVy
c3RhbmRpbmcgOikKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
