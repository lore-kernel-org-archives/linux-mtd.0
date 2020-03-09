Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CFBC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C585A20727
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 14:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WT9C0jzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C585A20727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GslzFuSGMvN5hku5bNvklyQsBrky6yPY3t00Jmkm2Ic=; b=WT9C0jzBmODfA4T6+IgBQcA9y
	ayhDB32O0dj4Da1Mu/SXzPFg+IRa/cwtzYXsQDmKBpNoZRVIH8O+G226UolC0kDhd/xSX5XQ0BB0q
	xqOIOPJWDTQE83OOww6xUuY6ilXbAd294bZFoTSNUIKdqlOLrJDLCNA1LlGdy+5C4QyAjxr7Zg2WB
	UvPIRm7b0lt/8yWxcPmg3oQ5bSlvpjvJ4r3zV17NKeOAxSbEz5rCjGBeEiQ/yTbMMYnQ1EJ34ysxA
	QjFF2tbgePf+0sVKMog7s8SDiiXRLqbd50vx27bbxJuAfv0NfAkkoEFRYULuDZ5GTbMYSEn/73E9L
	hHr7E4vtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBJFj-0003eH-Hn; Mon, 09 Mar 2020 14:19:31 +0000
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBJFg-0003dc-3J
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 14:19:29 +0000
Received: from player762.ha.ovh.net (unknown [10.108.57.226])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 1F01A94A2F
 for <linux-mtd@lists.infradead.org>; Mon,  9 Mar 2020 15:19:21 +0100 (CET)
Received: from RCM-web5.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id E6ACD10361EA2;
 Mon,  9 Mar 2020 14:19:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 09 Mar 2020 15:19:10 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: fix calculating partition end address
In-Reply-To: <20200309150424.4b75af66@xps13>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <6125d86fee0c83653cc281b3069e1587@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 5793036499761204934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepgggtgfffhffvufgjfhgfkfigihesthekjhdttderjeenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_071928_290589_65742275 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wMy0wOSAxNTowNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBSYWZhxYIgTWnFgmVj
a2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgIDkgTWFyIDIwMjAgMDg6NDQ6NDUK
PiArMDEwMDoKPiAKPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+
PiAKPj4gVGhpcyBmaXhlcyBjaGVjayBmb3IgcGFydGl0aW9ucyB0aGF0IGRvbid0IHN0YXJ0IGF0
IGJlZ2lubmluZyBvZiB0aGVpcgo+PiBwYXJlbnRzLiBNaXNzaW5nIHBhcnRpdGlvbidzIG9mZnNl
dCBpbiBmb3JtdWxhIGNvdWxkIHJlc3VsdCBpbiBmb3JjaW5nCj4+IHJlYWQtb25seSBpbmNvcnJl
Y3RseS4KPj4gCj4+IEZpeGVzOiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRp
bmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgCj4+IHdoZW4gY2hlY2tpbmcgZm9yIGFsaWdubWVudCIp
Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4g
LS0tCj4+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPj4gaW5kZXggNzMyOGMwNjZj
NWJhLi5jNjgzYjQzMmNjNWUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0
aWMgc3RydWN0IG10ZF9wYXJ0ICphbGxvY2F0ZV9wYXJ0aXRpb24oc3RydWN0IAo+PiBtdGRfaW5m
byAqcGFyZW50LAo+PiAgCQkJcGFydC0+bmFtZSk7Cj4+ICAJfQo+PiAKPj4gLQl0bXAgPSBwYXJ0
X2Fic29sdXRlX29mZnNldChwYXJlbnQpICsgc2xhdmUtPm10ZC5zaXplOwo+PiArCXRtcCA9IHBh
cnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+b2Zmc2V0ICsgCj4+IHNsYXZlLT5t
dGQuc2l6ZTsKPiAKPiBJIHRoaW5rIHlvdSBhcmUgZG9pbmcgdGhlIGNoYW5nZSBhdCB0aGUgd3Jv
bmcgcGxhY2UsIGlmIHlvdSB3YW50IHRvCj4gY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3Rh
cnRzKiB5b3Ugc2hvdWxkIGRvIGl0IGEgZmV3IGxpbmVzIGFib3ZlLgo+IEJ1dCBJIHRoaW5rIHRo
ZSBjaGVjayBzaG91bGQgYmUgaGVyZSBhcyB3ZWxsLCBwcm9iYWJseS4KClRoZSBjaGVjayB3aGVy
ZSB0aGUgcGFydGl0aW9uICpzdGFydHMqIGlzIE9LIGFuZCBJIGRvbid0IG1lYW4gdG8gY2hhbmdl
Cml0LiBUaGUgYnVnIGlzIGFib3V0IGNhbGN1bGF0aW5nIGFic29sdXRlICplbmQqIGFkZHJlc3Mg
b2YgcGFydGl0aW9uLgoKCj4gQW55d2F5LCBJIGp1c3QgYXBwbGllZCBvbiBteSBsb2NhbCB0cmVl
IGEgcGF0Y2ggcmV3cml0aW5nIGEgYml0IHRoZQo+IHBhcnRpdGlvbmluZyBzY2hlbWUsIGNvdWxk
IHlvdSBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiB0b2RheSdzCj4gbXRkL25leHQgYW5kIHJlc2Vu
ZCB0aGlzIHBhdGNoIHVwZGF0ZWQ/Cj4gCj4gSGVyZSBpcyB0aGUgY2hhbmdlIHRoYXQgSSd2ZSBk
b25lIGF0IHRoaXMgcGxhY2U6Cj4gCS0gICAgICAgdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQo
cGFyZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsKPiAJKyAgICAgICB0bXAgPSBtdGRfZ2V0X21hc3Rl
cl9vZnMoY2hpbGQsIDApICsgY2hpbGQtPnNpemU7CgpJJ2xsIGdpdmUgaXQgYSB0cnkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
