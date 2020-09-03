Return-Path: <SRS0=UES7=CM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7B2C433E2
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 03:04:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661CE20773
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 03:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PuqmNuEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661CE20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UafWZdvx7wjOZ4RCkuyjL0lpGiK4/CDdjIn6a86ygPg=; b=PuqmNuEqXoCZBa3Np83rv8ZU3
	NLq46NGM93GYfQIWDvtJjy5vstnu6u8K7ZTbYbQfb4PkIHusFTjOeiVflQklgmpeBaRILTWICSiUI
	SnVdtCJfbBsMn2W/VB+Vrel8Uk9Z+CEv2s8iJD8HiaalvlNL/UmdWwpm6Cb0qy+1sCut+r06gSTSy
	B/iih0CRaSgBwF8YS6y1MQpQ+eAd5ICRWQ6DflbLnr1vC/jerd7cJAM+MH6vBYbq2AJiMvgxTwgtZ
	yVo394uZBqWj2o0kbQ/6EenvfiQQ4r99uVWXNML+IE2o395LHxQ9/gLKGtbEtf+H1bEj8TD23sTMj
	9YvmedrCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDfX5-0002ml-Cl; Thu, 03 Sep 2020 03:03:27 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDfX2-0002lS-4U
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2020 03:03:25 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A5A2626F663645869677;
 Thu,  3 Sep 2020 11:03:15 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 3 Sep 2020 11:03:06 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: =?UTF-8?Q?Matthias_Wei=c3=9fer?= <m.weisser.m@gmail.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <CAO8h3eE2ZzffbAC_pk+uDwxMtmPWbkHCXnxvXz-hLujueH3jFQ@mail.gmail.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <47b73fec-7af2-98f8-776e-f9a8660bd219@hisilicon.com>
Date: Thu, 3 Sep 2020 11:03:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAO8h3eE2ZzffbAC_pk+uDwxMtmPWbkHCXnxvXz-hLujueH3jFQ@mail.gmail.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_230324_457729_D2CC941E 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgoKT24gMjAyMC85LzIgMjA6MTUsIE1hdHRoaWFzIFdlacOfZXIgd3JvdGU6
Cj4gSGkgVmlnbmVzaAo+Cj4gQW0gRGkuLCAxLiBTZXB0LiAyMDIwIHVtIDE2OjIwIFVociBzY2hy
aWViIFlpY29uZyBZYW5nCj4gPHlhbmd5aWNvbmdAaGlzaWxpY29uLmNvbT46Cj4+IEkndmUgdGVz
dGVkIHRoZSBmb2xsb3dpbmcgcGF0Y2ggd2l0aCBzMjVmczEyOHMxLgo+PiBJIGxlZnQgdGhlIGZs
YXNoIHF1YWQgZW5hYmxlZCBiZWZvcmUgbWFuYWdlZCBieSBzcGktbm9yIGRyaXZlciwKPj4gYW5k
IGl0J2xsIHN0YXkgUUUgYWZ0ZXIgcmVtb3ZlZC4gU28gSSB0aGluayBpdCdsbCBhbHNvIGFkZHJl
c3MgdGhlIGlzc3VlCj4+IG1lbnRpb25lZC4gUGxlYXNlIGhhdmUgYSB0ZXN0Lgo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoLiBJIGNhbiBjb25maXJtIHRoYXQgY3VycmVudCA1LjktcmMzIGJyaWNrcyBt
eSBoYXJkd2FyZQo+IGFuZCB5b3VyIHBhdGNoIG9uIHRvcCBvZiBpdCBmaXhlcyB0aGF0LiBUaGVy
ZWZvcmUKPgo+IFRlc3RlZC1ieTogTWF0dGhpYXMgV2Vpc3NlciA8bS53ZWlzc2VyLm1AZ21haWwu
Y29tPgo+Cj4gQnV0IEkgYW0gc3RpbGwgY29uY2VybmVkIGFib3V0IHdlYXJpbmcgb3V0IG5vbnZv
bGF0aWxlIFFFIGJpdHMgKG5vdCBpbiBteQo+IGNhc2UsIGJ1dCB0aGVyZSBtYXkgYmUgb3RoZXJz
KSB3aGljaCBtYXkgYWxzbyBicmljayBoYXJkd2FyZSBhZnRlciBhIGxvdCBvZgo+IGJvb3RzIChi
eSBzZXQgYW5kIHJlc2V0IFFFIGJpdCBvbiBldmVyeSBib290KS4KPgo+IFNvLCBmcm9tIG15IGxp
bWl0ZWQgcG9pbnQgb2YgdmlldywgeW91ciBwYXRjaCBmaXhlcyBteSBwcm9ibGVtIGJ1dCBvdmVy
YWxsCj4gSSB0aGluayB0aGUgb3JpZ2luYWwgYXBwcm9hY2ggc2hvdWxkIGJlIHRob3VnaHQtb3V0
IGEgYml0IG1vcmUuCgpUaGFua3MgZm9yIHRlc3RpbmcgdGhlIHBhdGNoLgoKVGhlIGRyaXZlciB3
aWxsIHRyeSB0byBzZXQgdGhlIFFFIGJpdCB3aGVuIDEpIGluIC0+cXVhZF9lbmFibGUoKSBpZiBR
RSBiaXQgaXMgbm90IHNldCBhbmQKMikgcHJldmlvdXNseSB3aXRob3V0IHRoaXMgcGF0Y2ggaW4g
c3BpX25vcl9yZXN0b3JlKCkgdG8gdHJ5IHRvIGRpc2FibGUgdGhlIGZsYXNoIHF1YWQgbW9kZS4K
CldpdGggdGhpcyBwYXRjaCwgaWYgdGhlIFFFIGJpdCBpcyBvcmlnaW5hbGx5IHNldCB0aGUgZHJp
dmVyIHdpbGwgb25seSByZWFkIGFuZCByZWNvcmQgaXQgYW5kCndpbGwgbm90IGRpc2FibGUgdGhl
IHF1YWQgbW9kZSBpbiBzcGlfbm9yX3Jlc3RvcmUoKS4gV2hhdCB0aGUgZHJpdmVyIHdpbGwgZG8g
aXMgdG8gcmVhZAp0aGUgYml0LCB3aXRob3V0IHRyeWluZyB0byBzZXQgb3IgcmVzZXQgaXQuIFNv
IEkgdGhpbmsgaXQgd2lsbCBub3Qgd2VhciBvdXQgdGhlIHRob3NlIG5vbnZvbGF0aWxlClFFIGJp
dHMuCgpSZWdhcmRzLApZaWNvbmcKCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+IC4KPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
