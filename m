Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F196C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 22:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fFWm4qynrNY/i/b3ZlFYa5FEGMXSCM6TxWnOzTbpOWE=; b=HkLEl/XTZNGDu0Mf6G8cTWyEYO
	rHSKAVQ5mGp3v9WdGrUpRMmN7P59u1jPEUu3JImPtHoXxrWfJX2BIxKcohp8g0eOSTYY7Wm+O0MO9
	awcwaRO7FXWT4Z0gAYEqlnkjsV0Bve97dagScCMVyT1XQfJcM9+iNGgpnyXgUsO7UAZcxazS1AK5G
	BodEBKnPDkb5znKWp8MyUaAgmj2U9OOC5bkC+BCkoOH0ZPis+oimjuFRK+9rRDZAtS+5eEX+2GhAc
	AoGg66A6CslmKxmt6xUBunmuDXQ2Tl/IKpO438G590UY3l2IRJmk7dxytvCSMK1im1TOfE9s4BukR
	SP3/HFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbhk-00EORp-6E; Wed, 16 Mar 2022 22:01:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbhf-00EOPP-4G
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 22:01:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D913F6081104;
 Wed, 16 Mar 2022 23:01:09 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8vaihv-rfqXQ; Wed, 16 Mar 2022 23:01:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4F3016081107;
 Wed, 16 Mar 2022 23:01:09 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dGMp6Mx7hpNU; Wed, 16 Mar 2022 23:01:09 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1FE796081104;
 Wed, 16 Mar 2022 23:01:09 +0100 (CET)
Date: Wed, 16 Mar 2022 23:01:09 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: libaokun <libaokun1@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
 christian brauner <christian.brauner@ubuntu.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 yukuai3 <yukuai3@huawei.com>, stable <stable@vger.kernel.org>, 
 Hulk Robot <hulkci@huawei.com>
Message-ID: <1891491465.152789.1647468069089.JavaMail.zimbra@nod.at>
In-Reply-To: <8a175ec6-1555-8575-1f03-0002efac1740@huawei.com>
References: <20211228125430.1880252-1-libaokun1@huawei.com>
 <8a175ec6-1555-8575-1f03-0002efac1740@huawei.com>
Subject: Re: [PATCH -next] jffs2: fix use-after-free in
 jffs2_clear_xattr_subsystem
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: fix use-after-free in jffs2_clear_xattr_subsystem
Thread-Index: CCC9RxtPxe322JVfIQ6ZCv5ouCR7KA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_150111_550738_B2AE46CD 
X-CRM114-Status: GOOD (  10.63  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImxpYmFva3VuIiA8bGliYW9r
dW4xQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiRGF2aWQg
V29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJjaHJpc3RpYW4gYnJhdW5lciIKPiA8
Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlz
dHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+Cj4gQ0M6ICJ5dWt1YWkzIiA8eXVrdWFpM0BodWF3ZWkuY29tPiwgInN0YWJsZSIg
PHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+LCAiSHVsayBSb2JvdCIgPGh1bGtjaUBodWF3ZWkuY29t
PiwgImxpYmFva3VuIgo+IDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogRG9ubmVy
c3RhZywgMTAuIE3DpHJ6IDIwMjIgMDk6MzU6MTgKPiBCZXRyZWZmOiBSZTogW1BBVENIIC1uZXh0
XSBqZmZzMjogZml4IHVzZS1hZnRlci1mcmVlIGluIGpmZnMyX2NsZWFyX3hhdHRyX3N1YnN5c3Rl
bQoKPiBBIGdlbnRsZSBwaW5nLCBzb3JyeSBmb3IgdGhlIG5vaXNlLgo+IAo+IOWcqCAyMDIxLzEy
LzI4IDIwOjU0LCBCYW9rdW4gTGkg5YaZ6YGTOgo+PiBXaGVuIHdlIG1vdW50IGEgamZmczIgaW1h
Z2UsIGFzc3VtZSB0aGF0IHRoZSBmaXJzdCBmZXcgYmxvY2tzIG9mCj4+IHRoZSBpbWFnZSBhcmUg
bm9ybWFsIGFuZCBjb250YWluIGF0IGxlYXN0IG9uZSB4YXR0ci1yZWxhdGVkIGlub2RlLAo+PiBi
dXQgdGhlIG5leHQgYmxvY2sgaXMgYWJub3JtYWwuIEFzIGEgcmVzdWx0LCBhbiBlcnJvciBpcyBy
ZXR1cm5lZAo+PiBpbiBqZmZzMl9zY2FuX2VyYXNlYmxvY2soKS4gamZmczJfY2xlYXJfeGF0dHJf
c3Vic3lzdGVtKCkgaXMgdGhlbgo+PiBjYWxsZWQgaW4gamZmczJfYnVpbGRfZmlsZXN5c3RlbSgp
IGFuZCB0aGVuIGFnYWluIGluCj4+IGpmZnMyX2RvX2ZpbGxfc3VwZXIoKS4KPj4KPj4gRmluYWxs
eSB3ZSBjYW4gb2JzZXJ2ZSB0aGUgZm9sbG93aW5nIHJlcG9ydDoKPj4gICA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4g
ICBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0
ZW0rMHg5NS8weDZhYwo+PiAgIFJlYWQgb2Ygc2l6ZSA4IGF0IGFkZHIgZmZmZjg4ODEyNDMzODRl
MCBieSB0YXNrIG1vdW50LzcxOQo+Pgo+PiAgIENhbGwgVHJhY2U6Cj4+ICAgIGR1bXBfc3RhY2sr
MHgxMTUvMHgxNmIKPj4gICAgamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtKzB4OTUvMHg2YWMK
Pj4gICAgamZmczJfZG9fZmlsbF9zdXBlcisweDg0Zi8weGMzMAo+PiAgICBqZmZzMl9maWxsX3N1
cGVyKzB4MmVhLzB4NGMwCj4+ICAgIG10ZF9nZXRfc2IrMHgyNTQvMHg0MDAKPj4gICAgbXRkX2dl
dF9zYl9ieV9ucisweDRmLzB4ZDAKPj4gICAgZ2V0X3RyZWVfbXRkKzB4NDk4LzB4ODQwCj4+ICAg
IGpmZnMyX2dldF90cmVlKzB4MjUvMHgzMAo+PiAgICB2ZnNfZ2V0X3RyZWUrMHg4ZC8weDJlMAo+
PiAgICBwYXRoX21vdW50KzB4NTBmLzB4MWU1MAo+PiAgICBkb19tb3VudCsweDEwNy8weDEzMAo+
PiAgICBfX3NlX3N5c19tb3VudCsweDFjNS8weDJmMAo+PiAgICBfX3g2NF9zeXNfbW91bnQrMHhj
Ny8weDE2MAo+PiAgICBkb19zeXNjYWxsXzY0KzB4NDUvMHg3MAo+PiAgICBlbnRyeV9TWVNDQUxM
XzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Cj4+Cj4+ICAgQWxsb2NhdGVkIGJ5IHRhc2sgNzE5
Ogo+PiAgICBrYXNhbl9zYXZlX3N0YWNrKzB4MjMvMHg2MAo+PiAgICBfX2thc2FuX2ttYWxsb2Mu
Y29uc3Rwcm9wLjArMHgxMGIvMHgxMjAKPj4gICAga2FzYW5fc2xhYl9hbGxvYysweDEyLzB4MjAK
Pj4gICAga21lbV9jYWNoZV9hbGxvYysweDFjMC8weDg3MAo+PiAgICBqZmZzMl9hbGxvY194YXR0
cl9yZWYrMHgyZi8weGEwCj4+ICAgIGpmZnMyX3NjYW5fbWVkaXVtLmNvbGQrMHgzNzEzLzB4NDc5
NAo+PiAgICBqZmZzMl9kb19tb3VudF9mcy5jb2xkKzB4YTcvMHgyMjUzCj4+ICAgIGpmZnMyX2Rv
X2ZpbGxfc3VwZXIrMHgzODMvMHhjMzAKPj4gICAgamZmczJfZmlsbF9zdXBlcisweDJlYS8weDRj
MAo+PiAgIFsuLi5dCj4+Cj4+ICAgRnJlZWQgYnkgdGFzayA3MTk6Cj4+ICAgIGttZW1fY2FjaGVf
ZnJlZSsweGNjLzB4N2IwCj4+ICAgIGpmZnMyX2ZyZWVfeGF0dHJfcmVmKzB4NzgvMHg5OAo+PiAg
ICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0rMHhhMS8weDZhYwo+PiAgICBqZmZzMl9kb19t
b3VudF9mcy5jb2xkKzB4NWU2LzB4MjI1Mwo+PiAgICBqZmZzMl9kb19maWxsX3N1cGVyKzB4Mzgz
LzB4YzMwCj4+ICAgIGpmZnMyX2ZpbGxfc3VwZXIrMHgyZWEvMHg0YzAKPj4gICBbLi4uXQo+Pgo+
PiAgIFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVjdCBhdCBmZmZmODg4MTI0
MzM4NGI4Cj4+ICAgIHdoaWNoIGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGpmZnMyX3hhdHRyX3JlZiBv
ZiBzaXplIDQ4Cj4+ICAgVGhlIGJ1Z2d5IGFkZHJlc3MgaXMgbG9jYXRlZCA0MCBieXRlcyBpbnNp
ZGUgb2YKPj4gICAgNDgtYnl0ZSByZWdpb24gW2ZmZmY4ODgxMjQzMzg0YjgsIGZmZmY4ODgxMjQz
Mzg0ZTgpCj4+ICAgWy4uLl0KPj4gICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4KPj4gVGhlIHRyaWdnZXJpbmcgb2Yg
dGhlIEJVRyBpcyBzaG93biBpbiB0aGUgZm9sbG93aW5nIHN0YWNrOgo+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBqZmZzMl9m
aWxsX3N1cGVyCj4+ICAgIGpmZnMyX2RvX2ZpbGxfc3VwZXIKPj4gICAgICBqZmZzMl9kb19tb3Vu
dF9mcwo+PiAgICAgICAgamZmczJfYnVpbGRfZmlsZXN5c3RlbQo+PiAgICAgICAgICBqZmZzMl9z
Y2FuX21lZGl1bQo+PiAgICAgICAgICAgIGpmZnMyX3NjYW5fZXJhc2VibG9jayAgICAgICAgPC0t
LSBFUlJPUgo+PiAgICAgICAgICBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0gICAgPC0tLSBm
cmVlCj4+ICAgICAgamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtICAgICAgICA8LS0tIGZyZWUg
YWdhaW4KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4KPj4gQW4gZXJyb3IgaXMgcmV0dXJuZWQgaW4gamZmczJfZG9fbW91bnRf
ZnMoKS4gSWYgdGhlIGVycm9yIGlzIHJldHVybmVkCj4+IGJ5IGpmZnMyX3N1bV9pbml0KCksIHRo
ZSBqZmZzMl9jbGVhcl94YXR0cl9zdWJzeXN0ZW0oKSBkb2VzIG5vdCBuZWVkIHRvCj4+IGJlIGV4
ZWN1dGVkLiBJZiB0aGUgZXJyb3IgaXMgcmV0dXJuZWQgYnkgamZmczJfYnVpbGRfZmlsZXN5c3Rl
bSgpLCB0aGUKPj4gamZmczJfY2xlYXJfeGF0dHJfc3Vic3lzdGVtKCkgYWxzbyBkb2VzIG5vdCBu
ZWVkIHRvIGJlIGV4ZWN1dGVkIGFnYWluLgo+PiBTbyBtb3ZlIGpmZnMyX2NsZWFyX3hhdHRyX3N1
YnN5c3RlbSgpIGZyb20gJ291dF9pbm9oYXNoJyB0byAnb3V0X3Jvb3QnCj4+IHRvIGZpeCB0aGlz
IFVBRiBwcm9ibGVtLgo+Pgo+PiBGaXhlczogYWE5OGQ3Y2Y1OWI1ICgiW0pGRlMyXVtYQVRUUl0g
WEFUVFIgc3VwcG9ydCBvbiBKRkZTMiAodmVyc2lvbi4gNSkiKQo+PiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEJhb2t1biBMaSA8bGliYW9rdW4xQGh1YXdlaS5jb20+CgpBcHBs
aWVkLiBUaGFua3MgZm9yIGZpeGluZyEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
