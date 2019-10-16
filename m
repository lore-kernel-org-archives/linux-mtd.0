Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B508CFA3728
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 11:06:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A3F20854
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 11:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBWVvZAp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A3F20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ggxiO/ASvxXTkKoqYVimKbOJhzAJYhqpw+sWFAp+B4=; b=mBWVvZApy1Ixug
	xtWkSeJPcgFrLTZmchiH1s9Jk+1hwMll/24nJ7bXeLoNne6ZfBS+vJEX5yTMU5fsREZbBpFyOYA+m
	hY2df8d3OzS3HIM1wT6Rcl4Ru8nw/k6oWroRGOTazF9j3wTP2JM/P1xOUie5xEtHFfOAbrifNzlqb
	TCuV47Ju31g93fPAb8w/HMmthe+KBuvFkhV2xLCKZyXt84VGhjvQr2/GjkJdJeUY19HiJEbboZE8w
	OV2TtcYlHFBqdGj12pUSfJxvmTrB10EnKiTT1iIxEeF5RuYZaEskruBwlGW3EnEUHiW7sevjHbAfv
	AxZ0XXkAZK0gfgCKsWgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKh8N-0005Ki-OX; Wed, 16 Oct 2019 11:06:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKh8J-0005KF-W2
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 11:06:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AAE346083266;
 Wed, 16 Oct 2019 13:06:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1K2eAwmll8TE; Wed, 16 Oct 2019 13:06:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A453560632EE;
 Wed, 16 Oct 2019 13:06:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bsT8FIbE57tZ; Wed, 16 Oct 2019 13:06:07 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4E66C609D2F7;
 Wed, 16 Oct 2019 13:06:07 +0200 (CEST)
Date: Wed, 16 Oct 2019 13:06:07 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Message-ID: <449133042.24923.1571223967091.JavaMail.zimbra@nod.at>
In-Reply-To: <205a5e75-e904-8c8f-a386-f3f51c7c6a01@huawei.com>
References: <20190929141157.115845-1-houtao1@huawei.com>
 <CAFLxGvwQ=4UOuscf0uuoOvckrncF2RC+rF_Pr70SpayFKfCg7Q@mail.gmail.com>
 <205a5e75-e904-8c8f-a386-f3f51c7c6a01@huawei.com>
Subject: Re: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: blkdevs: protect tr->devs list by mtd_table_mutex
Thread-Index: bDU/H5S0rh73/7vleRS4+atCOC+xVw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_040624_324585_1F8B0B52 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkhvdSBUYW8iIDxob3V0YW8x
QGh1YXdlaS5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNoYXJkLndlaW5iZXJn
ZXJAZ21haWwuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIKPiA8dmlnbmVzaHJAdGkuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4sICJNYXhpbSBMZXZpdHNreSIgPG1heGltbGV2aXRza3lAZ21haWwuY29tPiwgIk1h
cmVrIFZhc3V0Igo+IDxtYXJlay52YXN1dEBnbWFpbC5jb20+LCAiQnJpYW4gTm9ycmlzIiA8Y29t
cHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPiwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJh
ZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAxNi4gT2t0b2JlciAyMDE5IDEyOjU1OjEy
Cj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbXRkOiBibGtkZXZzOiBwcm90ZWN0IHRyLT5kZXZzIGxp
c3QgYnkgbXRkX3RhYmxlX211dGV4Cgo+IEhpLAo+IAo+IE9uIDIwMTkvMTAvMTYgNDoxMCwgUmlj
aGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+PiBPbiBTdW4sIFNlcCAyOSwgMjAxOSBhdCA0OjA1IFBN
IEhvdSBUYW8gPGhvdXRhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhlcmUgbWF5IGJl
IGxpc3QgY29ycnVwdGlvbiBpZiB0aGVyZSBhcmUgY29uY3VycmVudCBsaXN0IHRyYXZlcnNhbAo+
Pj4gYW5kIGxpc3QgZGVsZXRpb24gb24gdHItPmRldnMgYXMgc2hvd2VkIGluIHRoZSBmb2xsb3dp
bmcgY2FzZToKPj4+Cj4+PiBDUFUgMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFUg
MQo+Pj4KPj4+IG9wZW4gL2Rldi9tdGRibG9jazEKPj4+Cj4+PiAvLyByZW1vdmUgbXRkMQo+Pj4g
YmxrdHJhbnNfbm90aWZ5X3JlbW92ZSgpCj4+PiAgICAgZGVsX210ZF9ibGt0cmFuc19kZXYoKQo+
Pj4KPj4+IGNsb3NlIC9kZXYvbXRkYmxvY2sxCj4+PiAgIGJsa3RyYW5zX3JlbGVhc2UKPj4+ICAg
ICBibGt0cmFuc19kZXZfcHV0Cj4+PiAgICAgICBhY3F1aXJlIGJsa3RyYW5zX3JlZl9tdXRleCAg
ICAgLy8gcmVtb3ZlIG10ZDAKPj4+ICAgICAgIC8vIHRoZSBmaW5hbCByZWxlYXNlICAgICAgICAg
ICBhY3F1aXJlIG10ZF90YWJsZV9tdXRleAo+Pj4gICAgICAgYmxrdHJhbnNfZGV2X3JlbGVhc2Uo
KSAgICAgICAgIGJsa3RyYW5zX25vdGlmeV9yZW1vdmUoKQo+Pj4gICAgICAgICAvLyByZW1vdmUg
bXRkYmxvY2sxICAgICAgICAgICAgLy8gbmV4dCBpcyBtdGRibG9jazEKPj4+ICAgICAgICAgbGlz
dF9kZWwoJmRldi0+bGlzdCkgICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpCj4+
Pgo+Pj4gV2UgY291bGQgZml4IHRoZSBwcm9ibGVtIGJ5IGFjcXVpcmluZyBibGt0cmFuc19yZWZf
bXV0ZXggZHVyaW5nCj4+PiB0aGUgdHJhdmVyc2FsIG9mIHRyLT5kZXZzLCBidXQgYmxrdHJhbnNf
cmVmX211dGV4IG5lZWRzIHRvIGJlIHJlbGVhc2VkCj4+PiBiZWZvcmUgaW52b2tpbmcgdHItPnJl
bW90ZV9kZXYoKSwgc28gd2UgYWxzbyBuZWVkIHRvIGluY3JlYXNlIHRoZSBrcmVmCj4+PiBvZiBj
dXJyZW50IGRldmljZSBlbHNlIHRoZSBkZXZpY2UgbWF5IGJlIGZyZWVkIGFuZCBkZWNyZWFzZSB0
aGUga3JlZgo+Pj4gYWZ0ZXIgdGhlIHJlbW92YWwuCj4+Pgo+Pj4gT3Igd2UgY291bGQgbW92ZSB0
aGUgbGlzdCBkZWxldGlvbiB0byBkZWxfbXRkX2Jsa3RyYW5zX2RldigpLCBhbmQgcHJvdGVjdAo+
Pj4gdGhlIG9wZXJhdGlvbnMgb24gdHItPmRldnMgYnkgbXRkX3RhYmxlX211dGV4IHdoaWNoIGhh
cyBhbHJlYWR5IGJlIHRha2VuLgo+Pj4KPj4+IFRoZSBsYXR0ZXIgZml4IGlzIHNpbXBsZXIuIFdl
IGFsc28gY2FuIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgYWNxdWlzaXRpb25zCj4+PiBvZiBibGt0
cmFuc19yZWZfbXV0ZXggaW4gYWRkX210ZF9ibGt0cmFuc19kZXYoKSBiZWNhdXNlIG9wZXJhdGlv
bnMgb24KPj4+IHRyLT5kZXZzIGhhdmUgYWxyZWFkeSBiZWVuIHByb3RlY3RlZCBieSBtdGRfdGFi
bGVfbXV0ZXguCj4+Pgo+Pj4gRml4ZXM6IDA0OGQ4NzE5OTU2NiAoIm10ZDogYmxrdHJhbnM6IEhv
dHBsdWcgZml4ZXMiKQo+Pj4gU2lnbmVkLW9mZi1ieTogSG91IFRhbyA8aG91dGFvMUBodWF3ZWku
Y29tPgo+Pj4gLS0tCj4+PiBJIGZvdW5kIHRoZSBwcm9ibGVtIGJ5IGNvZGUgcmV2aWV3LCBhbmQg
Y291bGQgbm90IGZpbmQgYSB3YXkgdG8KPj4+IGVuc3VyZSB0aGUgcHJvYmxlbSwgYmVjYXVzZSB0
aGUgcmVtb3ZhbCBvZiBtdGQgZGV2aWNlcyBhbG1vc3QKPj4+IGNvbWVzIGZyb20gdGhlIHJlbW92
YWwgb2YgbW9kdWxlcywgYW5kIHRoZSBvcGVuIG9mIC9kZXYvbXRkYmxvY2tYCj4+PiB3aWxsIHBy
ZXZlbnQgdGhlIG1vZHVsZSBmcm9tIHJlbW92aW5nLgo+PiAKPj4gSSdtIGNvbmZ1c2VkLiBDYW4g
dGhlIHByb2JsZW0gb25seSBoYXBwZW4gaWYgeW91IHJlbW92ZSBhIG10ZCB3aGlsZQo+PiBpdCBp
cyBvcGVuPwo+PiAKPiBOby4gVGhlIHByb2JsZW0gbWF5IGhhcHBlbiB3aGVuIGNsb3NpbmcgYSBt
dGQgYmxvY2sgZGV2aWNlIChpbnN0ZWFkIG9mCj4gdGhlIG10ZCBjaGFyIGRldmljZSkgZm9yIHdo
aWNoIGl0cyBtdGQgZGV2aWNlIGhhZCBhbHJlYWR5IGJlZW4gcmVtb3ZlZC4KPiAKPiBUaGUgcmVh
c29uIHdoeSBJIGNhbiBub3QgY29uZmlybSB0aGUgcHJvYmxlbSBpcyB0aGF0IEkgYW0gdHJ5aW5n
IHRvCj4gY29uZmlybSB0aGUgcHJvYmxlbSBieSB0aGUgZm9sbG93aW5nIHN0ZXBzOgo+ICgxKSBp
bnNtb2QgYmxvY2sybXRkLmtvIHRvIGNyZWF0ZSBhIG10ZCBkZXZpY2UgKGUuZy4sIC9kZXYvbXRk
MCkKPiAoMikgb3BlbiAvZGV2L210ZGJsb2NrMAo+ICgzKSByZW1vdmUgL2Rldi9tdGQwIGJ5IHJl
bW92aW5nIGJsb2NrMm10ZC5rbwo+IAo+IHN0ZXAgKDMpIGFsd2F5cyBmYWlscyBiZWNhdXNlIHRo
ZSBvcGVuaW5nIG9mIC9kZXYvbXRkYmxvY2swIGhhcyBhbHJlYWR5Cj4gaW5jcmVhc2VkIHRoZSBy
ZWZlcmVuY2UgY291bnQgb2YgYmxvY2sybXRkLmtvLCBzbyAvZGV2L210ZDAgY2FuIG5vdCBiZSBy
ZW1vdmVkLgoKT2suIEJ1dCB5ZWFoLCB0aGUgcHJvYmxlbSBpcyByZWFsIGFuZCBJJ20gc3VyZSB3
aXRoIHViaStnbHVlYmkgaXQgY2FuIGJlIHRyaWdnZXJlZC4KClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
