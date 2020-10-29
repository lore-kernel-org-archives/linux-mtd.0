Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802EEC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC5620825
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AV6MAKFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC5620825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8uozPo6fXZKCvg5HbMhESPaFgUOmHm7TkSICIUaSD6A=; b=AV6MAKFyANKyElPMYd5JJjLZL
	ybWJ4+BWrSYR5Tjf8/ehn94goVgjhpI1HhtfVPlk9Mio09B4igjuQX9GU1GhbAeC7BOgpp9Al01B4
	5xFzgfQKDwN7t6FwVMlkFLh0MpXlvyv4nvA7Mc3ICsZQzsHf2Q7IX3AAhm8e3XxoxSp77DyMExmSi
	zS+y70yUbYPWl2OM6jlT/wBrlXyK9c+hC/ewpdpSbWjDot89FxGrnrdRxhXtjRTxpF5VPU6LqUAGD
	FqiWvMm5rhasbElzrcjxUuZZfHeeSXIWo/wWibaSvVRewf1rUUaelpDudOrMYD87li4GuIASKvK7A
	CmhlRGpjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY5GL-0002Hk-IL; Thu, 29 Oct 2020 10:34:33 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY5GJ-0002H5-DR
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 10:34:32 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 94073100013;
 Thu, 29 Oct 2020 10:34:26 +0000 (UTC)
Date: Thu, 29 Oct 2020 11:34:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: nand: ecc-hamming: Clarify the logic around rp17
Message-ID: <20201029113425.26f83231@xps13>
In-Reply-To: <20201029102705.GR18329@kadam>
References: <20201029083847.21128-1-miquel.raynal@bootlin.com>
 <20201029102705.GR18329@kadam>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_063431_610553_8DD66AF8 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel test robot <lkp@intel.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBUaHUsIDI5IE9jdCAyMDIwCjEzOjI3OjA1ICswMzAwOgoKPiBPbiBUaHUsIE9jdCAyOSwgMjAy
MCBhdCAwOTozODo0N0FNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gVGhpcyBjb2Rl
IGhhcyBiZWVuIHdyaXR0ZW4gaW4gMjAwOCBhbmQgaXMgZmluZSwgYnV0IGluIG9yZGVyIHRvIGtl
ZXAKPiA+IHJvYm90cyBoYXBweSwgSSB0aGluayBpdCdzIHRpbWUgdG8gY2hhbmdlIGEgbGl0dGxl
IGJpdCB0aGlzIGNvZGUganVzdAo+ID4gdG8gY2xhcmlmeSB0aGUgZGlmZmVyZW50IHBvc3NpYmxl
IHZhbHVlcyBvZiBlY2NzaXplX211bHQuIEluZGVlZCwgdGhpcwo+ID4gdmFyaWFibGUgbWF5IG9u
bHkgdGFrZSB0aGUgdmFsdWUgMSBvciAyIGJlY2F1c2Ugc3RlcF9zaXplLCBpbiB0aGUgY2FzZQo+
ID4gb2YgdGhlIHNvZnR3YXJlIEhhbW1pbmcgRUNDIGVuZ2luZSBtYXkgb25seSBiZSAyNTYgb3Ig
NTEyLiBEZXBlbmRpbmcKPiA+IG9uIHRoZSB2YWx1ZSBvZiBlY2NzaXplX211bHQsIGFuIGV4dHJh
IHJwMTcgdmFyaWFibGUgaXMgc2V0LCBvciBub3QKPiA+IGFuZCB0cmlnZ2VycyB0aGUgZm9sbG93
aW5nIHdhcm5pbmc6Cj4gPiAKPiA+ICAgICAgc21hdGNoIHdhcm5pbmdzOgo+ID4gICAgICBlY2Nf
c3dfaGFtbWluZ19jYWxjdWxhdGUoKSBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ3JwMTcn
Lgo+ID4gCj4gPiBBcyBoaWdobGlnaHRlZCBieSBEYW4gQ2FycGVudGVyLCBpZiB0aGUgb25seSBw
b3NzaWJsZSB2YWx1ZXMgZm9yCj4gPiBlY2NzaXplX211bHQgYXJlIDEgYW5kIDIsIHRoZW4gdGhl
IGNvZGUgaXMgZmluZSwgYnV0ICJpdCdzIGhhcmQgdG8KPiA+IHRlbGwganVzdCBmcm9tIGxvb2tp
bmciLgo+ID4gCj4gPiBTbyBpbnN0ZWFkIG9mIHNoaWZ0aW5nIHN0ZXBfc2l6ZSwgbGV0J3MgdXNl
IGEgdGVybmFyeSBjb25kaXRpb24gdG8KPiA+IGFzc2lnbiB0byBlY2NzaXplX211bHQgdGhlIG9u
bHkgdHdvIHBvc3NpYmxlIHZhbHVlcyBhbmQgY2xhcmlmeSB0aGUKPiA+IGRyaXZlcidzIGxvZ2lj
Lgo+ID4gCj4gPiBOb3cgdGhhdCB0aGUgc2l0dWF0aW9uIGlzIGNsYXJpZmllZCBmb3IgaHVtYW5z
LCBzZXQgcnAxNyB0byAwIGluIGFuCj4gPiBlbHNlIGJsb2NrIHRvIGtlZXAgcm9ib3RzIHNpbGVu
dCBhcyB3ZWxsLiAgCj4gCj4gU21hdGNoIHdpbGwgcGFyc2UgaXQgY29ycmVjdGx5IHdpdGgganVz
dCB0aGUgdGVybmFyeSBjaGFuZ2UgYnV0IHRoZXJlCj4gbWlnaHQgYmUgb3RoZXIgY2hlY2tlcnMg
d2hpY2ggd2FudCB0aGUgdGhlIGVsc2Ugc3RhdGVtZW50LiAgSSdtIG5vdAo+IHN1cmUuICBHQ0Mg
ZG9lc24ndCBzZWVtIHRvIHdhcm4gYWJvdXQgdW5pbml0aWFsaXplZCB2YXJpYWJsZXMgdGhlc2UK
PiBkYXlzLgoKV2VsbCwgSSB0aG91Z2h0IGFib3V0IHRoaXMgYWZ0ZXIgaGF2aW5nIHdyaXR0ZW4g
dGhlIGNvbW1pdCBsb2csIEkKYW1lbmRlZCB0aGUgY29tbWl0IHRvIGp1c3Qga2VlcCB0aGUgdGVy
bmFyeSBjaGFuZ2UgYW5kIEkgZm9yZ290IHRvIGRyb3AKdGhpcyBwYXJ0IG9mIHRoZSBjb21taXQg
bG9nLgoKU28gaWYgdGhlIGNoYW5nZSBsb29rcyBnb29kIHRvIHlvdSBJIGNhbiBzaW1wbHkgZHJv
cCB0aGUgbGFzdCBwYXJhZ3JhcGgKd2hlbiBhcHBseWluZy4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
