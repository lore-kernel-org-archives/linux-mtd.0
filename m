Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7F9C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 17:41:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF2924125
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 17:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYbCBmkh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Ya36BD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF2924125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1k93wW5os4ErOYOzlUxPVLjNq4HYh+RLa8Y5yYtjKJ8=; b=qYbCBmkhWbwihL
	XkoXezKr5ViHM1ykGFKzjNizeVVQlyJcFGkSXuc5tpG2RF83ZifIECo7l3V3Pv5NjV/hEU+5PPcGs
	I57gK+Zhx3KuJB7PxuwAidwvZUsvuIRStP7Tfz0wuEvv8DurrHmMVisBJ7Om9VusEEtpJkd5x+agF
	vJyrXPEd8OHMl18JRdu6fNTvsbmJCSfPUScoJ2UwbvYET5Hi5lKoXf3DpoCQh0WhsjsyPDO7BIJ/M
	6ljkGEOlZYD4kPyl4Z+iN9iakFS37buyc/toKq6Vwdsgdni+i2fSKptaewlR7uGMVj9f4KL3mTw6E
	AHRZuhGHs5mrmMCcbkVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuK0R-0001Ba-Vw; Wed, 22 Jan 2020 17:41:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuK0O-0001B7-Db
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 17:41:30 +0000
Received: from xps13 (98.197.23.93.rev.sfr.net [93.23.197.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7289F24125;
 Wed, 22 Jan 2020 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579714887;
 bh=YGZ2cRqG5u4bxPklZHpHWDQi8QEwqwd/Zc28kRnomzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V8Ya36BDaBIBQBr6PhRda8ehKTO24jQw4a2r6ushXaJ8q2k3IY2Ebytd6NzFYjUTQ
 0zLl/q7dHK1rIepkQM2BYPSSmvKSiQXevCDQmKnsyYsJmF26mtKwIA21USoS+pDf6T
 +1Rs5gVzvPKqm+G2MG6hUO5lqY4UtMFX3HWoUekI=
Date: Wed, 22 Jan 2020 18:41:14 +0100
From: Miquel Raynal <mraynal@kernel.org>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v1 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <20200122184114.125b42c8@xps13>
In-Reply-To: <2c6000b1-ae25-564b-911a-2879e9c244b2@allwinnertech.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-12-git-send-email-liaoweixiong@allwinnertech.com>
 <20200120110306.32e53fd8@xps13>
 <27226590-379c-8784-f461-f5d701015611@allwinnertech.com>
 <20200121094802.61f8cb4d@xps13>
 <2c6000b1-ae25-564b-911a-2879e9c244b2@allwinnertech.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_094128_502628_8B57F1B7 
X-CRM114-Status: GOOD (  35.45  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgoKPiA+Pj4+ICsvKgo+ID4+Pj4gKyAqIEFsbCB6b25lcyB3aWxsIGJlIHJlYWQgYXMg
cHN0b3JlL2JsayB3aWxsIHJlYWQgem9uZSBvbmUgYnkgb25lIHdoZW4gZG8KPiA+Pj4+ICsgKiBy
ZWNvdmVyLgo+ID4+Pj4gKyAqLwo+ID4+Pj4gK3N0YXRpYyBzc2l6ZV90IG10ZHBzdG9yZV9yZWFk
KGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUsIGxvZmZfdCBvZmYpCj4gPj4+PiArewo+ID4+Pj4gKwlz
dHJ1Y3QgbXRkcHN0b3JlX2NvbnRleHQgKmN4dCA9ICZvb3BzX2N4dDsKPiA+Pj4+ICsJc2l6ZV90
IHJldGxlbjsKPiA+Pj4+ICsJaW50IHJldDsKPiA+Pj4+ICsKPiA+Pj4+ICsJaWYgKG10ZHBzdG9y
ZV9ibG9ja19pc2JhZChjeHQsIG9mZikpCj4gPj4+PiArCQlyZXR1cm4gLUVORVhUOwo+ID4+Pj4g
Kwo+ID4+Pj4gKwlwcl9kZWJ1ZygidHJ5IHRvIHJlYWQgb2ZmIDB4JWxseCBzaXplICV6dVxuIiwg
b2ZmLCBzaXplKTsKPiA+Pj4+ICsJcmV0ID0gbXRkX3JlYWQoY3h0LT5tdGQsIG9mZiwgc2l6ZSwg
JnJldGxlbiwgKHVfY2hhciAqKWJ1Zik7Cj4gPj4+PiArCWlmICgocmV0IDwgMCAmJiAhbXRkX2lz
X2JpdGZsaXAocmV0KSkgfHwgc2l6ZSAhPSByZXRsZW4pICB7ICAKPiA+Pj4KPiA+Pj4gSUlSQyBz
aXplICE9IHJldGxlbiBkb2VzIG5vdCBtZWFuIGl0IGZhaWxlZCwgYnV0IHRoYXQgeW91IHNob3Vs
ZAo+ID4+PiBjb250aW51ZSByZWFkaW5nIGFmdGVyIHJldGxlbiBieXRlcywgbm8/ICAKPiA+Pj4g
ICAgPj4gIAo+ID4+IFllcywgeW91IGFyZSByaWdodC4gSSB3aWxsIGZpeCBpdC4gVGhhbmtzLgo+
ID4+ICAKPiA+Pj4gQWxzbywgbXRkX2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIHRoYXQgeW91
IGFyZSByZWFkaW5nIGEgZmFsc2UKPiA+Pj4gYnVmZmVyLCBidXQgdGhhdCB0aGUgZGF0YSBoYXMg
YmVlbiBjb3JyZWN0ZWQgYXMgaXQgY29udGFpbmVkIGJpdGZsaXBzLgo+ID4+PiBtdGRfaXNfZWNj
ZXJyKCkgaG93ZXZlciwgd291bGQgYmUgbWVhbmluZ2Z1bC4gIAo+ID4+PiAgICA+PiAgCj4gPj4g
U3VyZSBJIGtub3cgbXRkX2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIGZhaWx1cmUsIGJ1dCBJ
IGRvIG5vdCB0aGluawo+ID4+IG10ZF9pc19lY2NlcnIoKSBzaG91bGQgYmUgaGVyZSBzaW5jZSB0
aGUgY29kZXMgYXJlIHJldCA8IDAgYW5kIE5PVAo+ID4+IG10ZF9pc19iaXRmbGlwKCkuICAKPiA+
IAo+ID4gWWVzLCBqdXN0IGRyb3AgdGhpcyBjaGVjaywgb25seSBrZWVwIHJldCA8IDAuCj4gPiAg
IAo+IAo+IElmIEkgZG9uJ3QgZ2V0IGl0IHdyb25nLCBpdCBzaG91bGQgbm90CSBiZSBkcm9wcGVk
IGhlcmUuIExpa2UgeW91ciB3b3JkcywKPiAibXRkX2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFu
IHRoYXQgeW91IGFyZSByZWFkaW5nIGEgZmFsc2UgYnVmZmVyLAo+IGJ1dCB0aGF0IHRoZSBkYXRh
IGhhcyBiZWVuIGNvcnJlY3RlZCBhcyBpdCBjb250YWluZWQgYml0ZmxpcHMuIiwgdGhlCj4gZGF0
YSBJIGdldCBhcmUgdmFsaWQgZXZlbiBpZiBtdGRfaXNfYml0ZmxpcCgpIHJldHVybiB0cnVlLiBJ
dCdzIGNvcnJlY3QKPiBkYXRhIGFuZCBpdCdzIG5vIG5lZWQgdG8gZ28gdG8gaGFuZGxlIGVycm9y
LiBUbyBtZSwgdGhlIGNvZGVzCj4gc2hvdWxkIGJlOgo+IAlpZiAocmV0IDwgMCAmJiAhbWl0X2lz
X2JpdGZsaXAoKSkKPiAJCVtlcnJvciBoYW5kbGluZ10KClBsZWFzZSBjaGVjayB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgbXRkX2lzX2JpdGZsaXAoKS4gWW91J2xsIHByb2JhYmx5CmZpZ3VyZSBvdXQg
d2hhdCBJIGFtIHNheWluZy4KCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgjTDU4NQoKCnwuLi5dCgo+ID4+Pj4gKwkJ
cmV0dXJuOwo+ID4+Pj4gKwl9Cj4gPj4+PiArCWlmICh1bmxpa2VseShpbmZvLT5kbWVzZ19zaXpl
ICUgbXRkLT53cml0ZXNpemUpKSB7Cj4gPj4+PiArCQlwcl9lcnIoInJlY29yZCBzaXplICVsdSBL
QiBtdXN0IGFsaWduIHRvIHdyaXRlIHNpemUgJWQgS0JcbiIsCj4gPj4+PiArCQkJCWluZm8tPmRt
ZXNnX3NpemUgLyAxMDI0LAo+ID4+Pj4gKwkJCQltdGQtPndyaXRlc2l6ZSAvIDEwMjQpOyAgCj4g
Pj4+Cj4gPj4+IFRoaXMgY29uZGl0aW9uIGlzIHdlaXJkLCB3aHkgd291bGQgeW91IGNoZWNrIHRo
aXM/ICAKPiA+Pj4gICAgPj4gIAo+ID4+IHBzdG9yZS9ibGsgd2lsbCB3cml0ZSAncmVjb3JkX3Np
emUnIGRtZXNnIGxvZyBhdCBvbmUgdGltZS4KPiA+PiBTaW5jZSBlYWNoIHdyaXRlIGRhdGEgbXVz
dCBiZSBhbGlnbmVkIHRvICd3cml0ZXNpemUnIGZvciBmbGFzaCwgSSBhbSBub3QKPiA+PiBzdXJl
Cj4gPj4gYWxsIGZsYXNoIGRyaXZlcnMgYXJlIGNvbXBhdGlibGUgd2l0aCBtaXNhbGlnbmVkIGRh
dGEsIHRoYXQncyB3aHkgaQo+ID4+IGNoZWNrIHRoaXMuICAKPiA+IAo+ID4gSSB0aGluayB5b3Ug
c2hvdWxkIGVuZm9yY2UgdGhpcyBhbGlnbm1lbnQgaW5zdGVhZCBvZiBjaGVja2luZyBpdC4KPiA+
ICAgCj4gCj4gRG8geW91IG1lYW4gdGhhdCBtdGRwc3RvcmUgc2hvdWxkIGVuZm9yY2UgdGhpcyBh
bGlnbm1lbnQgd2hpbGUgcnVubmluZz8KPiBUaGUgd2F5IEkgY2FuIHRoaW5rIG9mIGlzIHRvIGhh
bmRsZSBhIGJ1ZmZlciBhbGlnbmVkIHRvIHdyaXRlc2l6ZSBhbmQKPiB3cml0ZSB0byBmbGFzaCB3
aXRoIHRoaXMgYWxpZ25lZCBidWZmZXIuCj4gCj4gVGhhdCBjYXVzZXMgc29tZSBlcnJvci4gVGhl
IE1URCBkZXZpY2Ugd2lsbCBiZSBkaXZpZGVkIGludG8gbXV0aWwKPiBjaHVua3MgYWNjcm9kaW5n
IHRvIGRtZXNnX3NpemUuIEVhY2ggY2h1bmsgc3RvcmVzIGEgaW5kaXZpZHVhbAo+IE9PUFMvUGFu
aWMgbG9nLiBJZiBkbWVzZ19zaXplIGlzIG1pc2FsaWduZWQgdG8gd3JpdGVzaXplLCB0aGUgbGFz
dAo+IHdyaXRlIHJlc3VsdHMgaW4gbmV4dCB3cml0ZSBmYWlsdXJlIGJlY2F1c2UgdGhlIHBhZ2Ug
b2YgZmxhc2ggY2FuIG9ubHkKPiBiZSBwcm9ncmFtZWQgb25jZSBiZWZvcmUgbmV4dCBlcmFzZSBh
bmQgdGhlIHBhZ2Ugc2hhcmVkIGJ5IHR3byBjaHVua3MKPiBoYXMgYmVlbiB1c2VkIGJ5IHRoZSBs
YXN0IHdyaXRlLiBCZXNpZGVzLCB3ZSBjYW4gbm90IHJlYWQgdG8gYnVmZmVyLAo+IGVyc2FlIGFu
ZCB3cml0ZSBiYWNrIGFzIHRoZXJlIGlzIG5vIHJlYWQvZXJhc2UgZm9yIHBhbmljIGNhc2UuCgpJ
IG1lYW46IHdoYXQgaXMgdGhlIHVzdWFsIHNpemUgb2YgZG1lc2c/IEkgZG9uJ3QgZ2V0IHdoeSB5
b3UgbmVlZCBpdCB0bwpiZSBpZS4gYSBtdWx0aXBsZSBvZiAyay4gSXQgcHJvYmFibHkgaXMgYWN0
dWFsbHksIEkgZG9uJ3Qga25vdyBpZiB0aGVyZQppcyBhIHN0YW5kYXJkLiBCdXQgaWYgZG1lc2df
c2l6ZSBpcyBlZyAzaywganVzdCBza2lwIHRoZSBlbmQgb2YgdGhlCnBhcnRpYWxseSB3cml0dGVu
IHBhZ2UgYW5kIHN0YXJ0IHdyaXRpbmcgYXQgdGhlIG5leHQgcGFnZT8KCj4gCj4gPj4gIAo+ID4+
Pj4gKwkJcmV0dXJuOwo+ID4+Pj4gKwl9Cj4gPj4+PiArCWlmICh1bmxpa2VseShtdGQtPnNpemUg
PiBNVERQU1RPUkVfTUFYX01URF9TSVpFKSkgewo+ID4+Pj4gKwkJcHJfZXJyKCJtdGQlZCBpcyB0
b28gbGFyZ2UgKGxpbWl0IGlzICVkIE1pQilcbiIsCj4gPj4+PiArCQkJCW10ZC0+aW5kZXgsCj4g
Pj4+PiArCQkJCU1URFBTVE9SRV9NQVhfTVREX1NJWkUgLyAxMDI0IC8gMTAyNCk7ICAKPiA+Pj4K
PiA+Pj4gU2FtZSBxdWVzdGlvbj8gSSBjb3VsZCB1bmRlcnN0YW5kIHRoYXQgaXQgaXMgZWFzaWVy
IHRvIG1hbmFnZSBibG9ja3MKPiA+Pj4ga25vd2luZyB0aGVpciBtYXhpbXVtIG51bWJlciB0aG91
Z2guICAKPiA+Pj4gICAgPj4gIAo+ID4+IEl0IHJlZmVycyB0byBtdGRvb3BzLiAgCj4gPiAKPiA+
IFdoYXQgZG8geW91IG1lYW4/Cj4gPiAgIAo+IAo+IFRvIG1lLCBpdCdzIHVubmVjZXNzYXJ5IHRv
IGNoZWNrIGF0IGFsbCwgaG93ZXZlciBpdCBpcyByZWFsbHkgdGhlcmUKPiBvbiBjb2RlcyBvZiBt
dGRvb3BzLiBJIHJlZmVyIHRvIG1vZHVsZSBtdGRvb3BzIHdoZW4gSSBkZXNpZ24gbXRkcHN0b3Jl
Lgo+IEl0IG1heSBiZSBoZWxwZnVsbCBmb3Igc29tZSBjYXNlcyBvdXQgb2YgbXkgdGhpbmssIHRo
YXQncyB3aHkgSSBrZWVwIGl0LgoKV2h5IG5vdC4KClsuLi5dCgo+ID4+Cj4gPj4gSW4gY2FzZSBv
ZiByZXBlYXRlZCBlcmFzZSB3aGVuIHVzZXJzIHJlbW92ZSBzZXZlcmFsIGxvZyBmaWxlcywgbXRk
cHN0b3JlCj4gPj4gZG8gcmVtb3ZlIGpvYnMgd2hlbiBleGl0Lgo+ID4+Cj4gPj4gQmVzaWRlcywg
bXRkcHN0b3JlIGRvIG5vdCBjaGVjayB0aGUgcmV0dXJuIGNvZGUgdG8gZW5zdXJlIHdyaXRlIGJh
Y2sgdmFsaWQKPiA+PiBsb2cgYXMgbXVjaCBhcyBwb3NzaWJsZS4gIAo+ID4gCj4gPiBZb3UgYXJl
IG5vdCBpbiBhIGNyaXRpY2FsIHBhdGgsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IGRvbid0
IGNoZWNrCj4gPiBpdD8gSWYgaXQgcmV0dXJucyBhbiBlcnJvciwgaXQgbWVhbnMgdGhlIGRhdGEg
aXMgbm90IHdyaXR0ZW4uIElNSE8gaXQKPiA+IGlzIGJlc3QgdG8gYWxlcnQgdGhlIHVzZXIgdGhh
biB0byBzaWxlbnRseSBmYWlsLgo+ID4gICAKPiAKPiBUaGlzIGZ1bmN0aW9uIHdpbGwgYmUgY2Fs
bGVkIG9ubHkgd2hlbiBtdGQgZGV2aWNlIGlzIHJlbW92aW5nLiBJdCdzCj4gdXNlbGVzcyB0byBh
bGVydCB0aGUgdXNlciBidXQgdHJ5IHRvIGZsdXNoIHRoZSBvdGhlciB2YWxpZCBkYXRhIHRvCgpJ
dCBpcyB1c2VmdWwgdG8gYWxlcnQgdGhlIHVzZXIhIEl0IG1lYW5zIHNvbWV0aGluZyB3ZW50IHdy
b25nIHdoaWxlCmV2ZXJ5dGhpbmcgc2VlbXMgZmluZS4KCj4gZmxhc2ggYXMgbXVzaCBhcyBwb3Nz
aWJsZSBieSB3aGljaCByZWR1Y2UgbG9zc2VzLiBJZiBpdCdzIGp1c3QKPiBiZWNhdXNlIG9mIGJ1
c3ksIHdoYXQgaGFwcGVucyBuZXh0IHRpbWU/CgpKdXN0IGJlY2F1c2Ugb2YgYnVzeT8gSSBkb24n
dCBnZXQgaXQuCgpJJ20gb2theSB3aXRoIHRoZSBpZGVhIG9mIHRyeWluZyB0byB3cml0ZSB0aGUg
b3RoZXIgY2h1bmtzIHRob3VnaDoKCgl3aGlsZSAocmVtYWluaW5nX2NodW5rKSB7CgkJcmV0ID0g
bXRkX3dyaXRlKCkKCQlpZiAocmV0KSB7CgkJCWFsZXJ0LXVzZXI7CgkJCWNvbnRpbnVlOwoJCX0K
CX0KCj4gCj4gPj4gIAo+ID4+Pj4gKy4gPj4+PiArCQlvZmYgKz0gem9uZXNpemU7Cj4gPj4+PiAr
CQlzaXplIC09IG1pbl90KHVuc2lnbmVkIGludCwgem9uZXNpemUsIHNpemUpOwo+ID4+Pj4gKwl9
Cj4gPj4+PiArCj4gPj4+PiArZnJlZToKPiA+Pj4+ICsJa2ZyZWUoYnVmKTsKPiA+Pj4+ICsJcmV0
dXJuIHJldDsKPiA+Pj4+ICt9Cj4gPj4+PiArICAKPiA+IAo+ID4gCj4gPiBbLi4uXQo+ID4gICAK
PiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBNaXF1w6hsICAKPiA+Pj4gICAgPj4gIAo+ID4+IEkg
d2lsbCBjb2xsZWN0IG1vcmUgc3VnZ2VzdGlvbnMgYW5kIHN1Ym1pdCB0aGUgbmV3IHZlcnNpb24g
YXQgb25lIHRpbWUuCj4gPj4gIAo+ID4gCj4gPiBTdXJlLCBubyBodXJyeS4KPiA+ICAgCj4gCj4g
SSBhbSBvbiBob2xpZGF5LCBwbGVhc2UgZm9yZ2l2ZSBtZSBmb3IgbXkgc2xvdyByZXNwb25zZS4K
ClRha2UgeW91ciB0aW1lLCBhcyBJIHNhaWQsIG5vIGh1cnJ5LgoKPiAKPiA+IAo+ID4gVGhhbmtz
LAo+ID4gTWlxdcOobAo+ID4gICAKCgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
