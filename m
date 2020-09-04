Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D05C433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:57:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6FB206A5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mK2nsD6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6FB206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5exZA1FnSWKE2bAPmja4mIXX5hEiw4RWmvTIrF3Zzk0=; b=mK2nsD6pPIuqCH3drkxDNJKcU
	RNBzx4owAxw4OLjPgu3Q2adMASfStzOEPx6WG/QBd+AwlsRnz1zXwoLehRkfNou16L9tYCapdoFdV
	m/3a57LtTQ3JN8GnTrf6R8hnzOwvy8BcaWhu/H+nHUksXZeKnI8crWJ0KU93kjNn4DRBQy/wtloST
	4tftPrhCfu1qRexfFuL3Fk0hfoqSE2glgcJ4GOdGmMmacwfTFcLDFz15glzP36xMkeomKVTYpbHdL
	e+hep1gxLQ5ktFMn3IbrdFe/u1qlW4AoQCMhzBQrazpSENwYL6uwOBOsrysdtZgfGFcKm1bJZHdMF
	Pe3n9vJAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6ak-0004Ix-UQ; Fri, 04 Sep 2020 07:57:02 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6ai-0004I6-10
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 07:57:00 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 628AF81CF9476B8ECCAE;
 Fri,  4 Sep 2020 15:56:56 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 4 Sep 2020 15:56:50 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: =?UTF-8?Q?Matthias_Wei=c3=9fer?= <m.weisser.m@gmail.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <CAO8h3eE2ZzffbAC_pk+uDwxMtmPWbkHCXnxvXz-hLujueH3jFQ@mail.gmail.com>
 <47b73fec-7af2-98f8-776e-f9a8660bd219@hisilicon.com>
 <CAO8h3eEYVxzSp1eK6f8z=cnO=hpwq1o47JgnhkWpiLfLYPdtQg@mail.gmail.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <66809c03-0970-99a3-d089-3d6bd1cf0a9c@hisilicon.com>
Date: Fri, 4 Sep 2020 15:56:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAO8h3eEYVxzSp1eK6f8z=cnO=hpwq1o47JgnhkWpiLfLYPdtQg@mail.gmail.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_035700_328363_228C43B1 
X-CRM114-Status: GOOD (  17.37  )
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

T24gMjAyMC85LzMgMTM6MzMsIE1hdHRoaWFzIFdlacOfZXIgd3JvdGU6Cj4gQW0gRG8uLCAzLiBT
ZXB0LiAyMDIwIHVtIDA1OjA0IFVociBzY2hyaWViIFlpY29uZyBZYW5nCj4gPHlhbmd5aWNvbmdA
aGlzaWxpY29uLmNvbT46Cj4+IEhpIE1hdHRoaWFzLAo+PiBPbiAyMDIwLzkvMiAyMDoxNSwgTWF0
dGhpYXMgV2Vpw59lciB3cm90ZToKPj4+IEhpIFZpZ25lc2gKPj4+Cj4+PiBBbSBEaS4sIDEuIFNl
cHQuIDIwMjAgdW0gMTY6MjAgVWhyIHNjaHJpZWIgWWljb25nIFlhbmcKPj4+IDx5YW5neWljb25n
QGhpc2lsaWNvbi5jb20+Ogo+Pj4+IEkndmUgdGVzdGVkIHRoZSBmb2xsb3dpbmcgcGF0Y2ggd2l0
aCBzMjVmczEyOHMxLgo+Pj4+IEkgbGVmdCB0aGUgZmxhc2ggcXVhZCBlbmFibGVkIGJlZm9yZSBt
YW5hZ2VkIGJ5IHNwaS1ub3IgZHJpdmVyLAo+Pj4+IGFuZCBpdCdsbCBzdGF5IFFFIGFmdGVyIHJl
bW92ZWQuIFNvIEkgdGhpbmsgaXQnbGwgYWxzbyBhZGRyZXNzIHRoZSBpc3N1ZQo+Pj4+IG1lbnRp
b25lZC4gUGxlYXNlIGhhdmUgYSB0ZXN0Lgo+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIEkgY2Fu
IGNvbmZpcm0gdGhhdCBjdXJyZW50IDUuOS1yYzMgYnJpY2tzIG15IGhhcmR3YXJlCj4+PiBhbmQg
eW91ciBwYXRjaCBvbiB0b3Agb2YgaXQgZml4ZXMgdGhhdC4gVGhlcmVmb3JlCj4+Pgo+Pj4gVGVz
dGVkLWJ5OiBNYXR0aGlhcyBXZWlzc2VyIDxtLndlaXNzZXIubUBnbWFpbC5jb20+Cj4+Pgo+Pj4g
QnV0IEkgYW0gc3RpbGwgY29uY2VybmVkIGFib3V0IHdlYXJpbmcgb3V0IG5vbnZvbGF0aWxlIFFF
IGJpdHMgKG5vdCBpbiBteQo+Pj4gY2FzZSwgYnV0IHRoZXJlIG1heSBiZSBvdGhlcnMpIHdoaWNo
IG1heSBhbHNvIGJyaWNrIGhhcmR3YXJlIGFmdGVyIGEgbG90IG9mCj4+PiBib290cyAoYnkgc2V0
IGFuZCByZXNldCBRRSBiaXQgb24gZXZlcnkgYm9vdCkuCj4+Pgo+Pj4gU28sIGZyb20gbXkgbGlt
aXRlZCBwb2ludCBvZiB2aWV3LCB5b3VyIHBhdGNoIGZpeGVzIG15IHByb2JsZW0gYnV0IG92ZXJh
bGwKPj4+IEkgdGhpbmsgdGhlIG9yaWdpbmFsIGFwcHJvYWNoIHNob3VsZCBiZSB0aG91Z2h0LW91
dCBhIGJpdCBtb3JlLgo+PiBUaGFua3MgZm9yIHRlc3RpbmcgdGhlIHBhdGNoLgo+Pgo+PiBUaGUg
ZHJpdmVyIHdpbGwgdHJ5IHRvIHNldCB0aGUgUUUgYml0IHdoZW4gMSkgaW4gLT5xdWFkX2VuYWJs
ZSgpIGlmIFFFIGJpdCBpcyBub3Qgc2V0IGFuZAo+PiAyKSBwcmV2aW91c2x5IHdpdGhvdXQgdGhp
cyBwYXRjaCBpbiBzcGlfbm9yX3Jlc3RvcmUoKSB0byB0cnkgdG8gZGlzYWJsZSB0aGUgZmxhc2gg
cXVhZCBtb2RlLgo+Pgo+PiBXaXRoIHRoaXMgcGF0Y2gsIGlmIHRoZSBRRSBiaXQgaXMgb3JpZ2lu
YWxseSBzZXQgdGhlIGRyaXZlciB3aWxsIG9ubHkgcmVhZCBhbmQgcmVjb3JkIGl0IGFuZAo+PiB3
aWxsIG5vdCBkaXNhYmxlIHRoZSBxdWFkIG1vZGUgaW4gc3BpX25vcl9yZXN0b3JlKCkuIFdoYXQg
dGhlIGRyaXZlciB3aWxsIGRvIGlzIHRvIHJlYWQKPj4gdGhlIGJpdCwgd2l0aG91dCB0cnlpbmcg
dG8gc2V0IG9yIHJlc2V0IGl0LiBTbyBJIHRoaW5rIGl0IHdpbGwgbm90IHdlYXIgb3V0IHRoZSB0
aG9zZSBub252b2xhdGlsZQo+PiBRRSBiaXRzLgo+IEkgdGhpbmsgaXQgd2lsbC4gRXhwZWN0IGEg
Zmxhc2ggd2l0aCB0aGUgUUUgYml0IG5vdCBzZXQuIEtlcm5lbCBib290cywgc2V0IHRoZQo+IGJp
dCB3aGljaCB3aWxsIGNhdXNlIGFuIGVyYXNlIGN5Y2xlIChzZXR0aW5nIGl0IGZyb20gMCB0byAx
KS4gT24gc2h1dGRvd24gdGhlCj4gYml0IGlzIHJlc2V0ICh0cmFuc2l0aW9uIGZyb20gMSB0byAw
KSB3aGljaCB3aWxsIGNhdXNlIGEgcHJvZ3JhbSBjeWNsZS4gU28sCj4gZXZlcnkgYm9vdCAtPiBz
aHV0ZG93biBjeWNsZSBjYXVzZXMgYXQgbGVhc3Qgb25lIHByb2dyYW0tZXJhc2UgY3ljbGUgd2hp
Y2ggd2lsbAo+IHdlYXIgb3V0IHRoYXQgYXJlYSBvZiB0aGUgZmxhc2guCj4KPiBTZWUgYWxzbyB0
aGlzIHF1b3RlIGZyb20gdGhlIGRhdGFzaGVldCBvZiBGMjVGTDUxMlM6Cj4gIk5vbi12b2xhdGls
ZSBiaXRzIGhhdmUgdGhlIHNhbWUgY3ljbGluZyAoZXJhc2UgYW5kIHByb2dyYW0pIGVuZHVyYW5j
ZQo+IGFzIHRoZSBtYWluCj4gZmxhc2ggYXJyYXkuIgo+Cj4gSSBzdGlsbCB0aGluayB0aGUgcmVz
ZXQgb2YgdGhlIFFFIChvciBhbnkgb3RoZXIgbm9uLXZvbGF0aWxlKSBiaXQgb24KPiBzaHV0ZG93
biBzaG91bGQKPiBiZSBwcmV2ZW50ZWQgYW5kIG9ubHkgYWxsb3dlZCBieSBleHBsaWNpdGx5IGVu
YWJsZSBpdCAoZS5nLiBwZXIgc3lzdGVtIGluIERUIG9yCj4gcGVyIGZsYXNoIGluIGZsYXNoX2lu
Zm8gc3RydWN0KS4KCnlvdSBtYXkgZmluZCB0aGUgcmV2ZXJ0IHBhdGNoZXMgYXQ6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNTk5MjA1NjQwLTI2NjkwLTEtZ2l0LXNlbmQtZW1h
aWwteWFuZ3lpY29uZ0BoaXNpbGljb24uY29tLwoKdGhhbmtzIGZvciB0aGUgaWxsdXN0cmF0aW9u
LgoKUmVnYXJkcywKWWljb25nCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+IC4KPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
