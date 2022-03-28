Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF80C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 07:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UWw4rriWXLw0lUQ3qvu9ycYjpBA0rUGm4nW0VKAOcr4=; b=1CCIiW5RGvKvye8VdisXLkvD8Q
	yrUmVYGjSL+8jI3ZkbSGkjAcQqLsF5NkGkRa/hYPZBv4piKmp0chpdzoJpfUJjmdIieifMMc2PuQt
	BgklA3iayiFcC89ym0ldJuB6DxYWfh700ZYmeX5UurAkDIhlILSXWcjcpKxZ53p7NLoFXkZgm/NKk
	zb/AL5L5bDDRYuCzLKxCU595+O/7B94J28tbIRJXJegpUSnBnP//S+hT3rgS5s3sLIvA1Rsnsaxdt
	wLnC5PrjmFvty5RdjKmy1klouvtCkh19VjNlGkz0X+u5US+uTrZ/f75KokaC8Gw9OtEYCijl8zlvz
	YAMeg0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYjnL-007ccS-Hw; Mon, 28 Mar 2022 07:28:07 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYjnI-007cas-3t
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 07:28:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C4289609B3EA;
 Mon, 28 Mar 2022 09:27:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fwEuxPIVC-9g; Mon, 28 Mar 2022 09:27:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2D256609B3F1;
 Mon, 28 Mar 2022 09:27:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G9y_TDjZQQTf; Mon, 28 Mar 2022 09:27:50 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 001FB609B3EA;
 Mon, 28 Mar 2022 09:27:49 +0200 (CEST)
Date: Mon, 28 Mar 2022 09:27:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Message-ID: <798660053.192180.1648452469848.JavaMail.zimbra@nod.at>
In-Reply-To: <20220325120025.17931-1-zajec5@gmail.com>
References: <20220325120025.17931-1-zajec5@gmail.com>
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: nandwrite: warn about writing 0xff blocks
Thread-Index: vPeWAbjeMiokfVb1PgbrqhMM4NKsug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_002804_498779_E1254201 
X-CRM114-Status: GOOD (  13.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJhZmHFgiBNacWCZWNraSIg
PHphamVjNUBnbWFpbC5jb20+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJsaW51eC1tdGQi
IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJSYWZhxYIgTWnFgmVja2kiIDxyYWZh
bEBtaWxlY2tpLnBsPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCAyNS4gTcOkcnogMjAyMiAxMzowMDoy
NQo+IEJldHJlZmY6IFtQQVRDSCBtdGQtdXRpbHNdIG5hbmR3cml0ZTogd2FybiBhYm91dCB3cml0
aW5nIDB4ZmYgYmxvY2tzCgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPiAKPiBTdWNoIGJsb2NrcyBtYXkgYmUgaW5jb3JyZWN0bHkgdHJlYXRlZCBhcyBlbXB0eSAo
ZXZlbiB0aG91Z2ggdGhleSBtYXkKPiBoYXZlIG5vbi1lcmFzZSBPT0IpLiBXYXJuIGFib3V0IGl0
IHNvIHBlb3BsZSBtYXkgc3RhcnQgc3VpbmcKPiAtLXNraXAtYWxsLWZmcyAuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IG5hbmQt
dXRpbHMvbmFuZHdyaXRlLmMgfCAxMyArKysrKysrKysrKystCj4gMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbmFuZC11dGls
cy9uYW5kd3JpdGUuYyBiL25hbmQtdXRpbHMvbmFuZHdyaXRlLmMKPiBpbmRleCBlOGEyMTBjLi5j
ZDUzYTE3IDEwMDY0NAo+IC0tLSBhL25hbmQtdXRpbHMvbmFuZHdyaXRlLmMKPiArKysgYi9uYW5k
LXV0aWxzL25hbmR3cml0ZS5jCj4gQEAgLTI4MCw2ICsyODAsNyBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPiAJbGlibXRkX3QgbXRkX2Rlc2M7Cj4gCWludCBlYnNp
emVfYWxpZ25lZDsKPiAJdWludDhfdCB3cml0ZV9tb2RlOwo+ICsJc2l6ZV90IGFsbF9mZnNfY250
ID0gMDsKPiAKPiAJcHJvY2Vzc19vcHRpb25zKGFyZ2MsIGFyZ3YpOwo+IAo+IEBAIC00MTcsNiAr
NDE4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCj4gCSAqLwo+
IAl3aGlsZSAoKGltZ2xlbiA+IDAgfHwgd3JpdGVidWYgPCBmaWxlYnVmICsgZmlsZWJ1Zl9sZW4p
Cj4gCQkmJiBtdGRvZmZzZXQgPCBtdGQuc2l6ZSkgewo+ICsJCWJvb2wgYWxsZmZzOwo+ICsKPiAJ
CS8qCj4gCQkgKiBOZXcgZXJhc2VibG9jaywgY2hlY2sgZm9yIGJhZCBibG9jayhzKQo+IAkJICog
U3RheSBpbiB0aGUgbG9vcCB0byBiZSBzdXJlIHRoYXQsIGlmIG10ZG9mZnNldCBjaGFuZ2VzIGJl
Y2F1c2UKPiBAQCAtNTU1LDcgKzU1OCw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICogY29u
c3QgYXJndltdKQo+IAkJfQo+IAo+IAkJcmV0ID0gMDsKPiAtCQlpZiAoIXNraXBhbGxmZnMgfHwg
IWJ1ZmZlcl9jaGVja19wYXR0ZXJuKHdyaXRlYnVmLCBtdGQubWluX2lvX3NpemUsIDB4ZmYpKSB7
Cj4gKwkJYWxsZmZzID0gYnVmZmVyX2NoZWNrX3BhdHRlcm4od3JpdGVidWYsIG10ZC5taW5faW9f
c2l6ZSwgMHhmZik7Cj4gKwkJaWYgKCFhbGxmZnMgfHwgIXNraXBhbGxmZnMpIHsKCldoeSBpcyBj
aGVja2luZyBmb3IgYWxsZmZzIG5lZWRlZCBoZXJlPwoKPiAJCQkvKiBXcml0ZSBvdXQgZGF0YSAq
Lwo+IAkJCXJldCA9IG10ZF93cml0ZShtdGRfZGVzYywgJm10ZCwgZmQsIG10ZG9mZnNldCAvIG10
ZC5lYl9zaXplLAo+IAkJCQkJbXRkb2Zmc2V0ICUgbXRkLmViX3NpemUsCj4gQEAgLTU2NCw2ICs1
NjgsOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPiAJCQkJCXdy
aXRlb29iID8gb29iYnVmIDogTlVMTCwKPiAJCQkJCXdyaXRlb29iID8gbXRkLm9vYl9zaXplIDog
MCwKPiAJCQkJCXdyaXRlX21vZGUpOwo+ICsJCQlpZiAoIXJldCAmJiBhbGxmZnMpCgpXaHkgY2hl
Y2tpbmcgZm9yICFyZXQ/Cgo+ICsJCQkJYWxsX2Zmc19jbnQrKzsKPiAJCX0KPiAKPiAJCWlmIChy
ZXQpIHsKPiBAQCAtNjE1LDYgKzYyMSwxMSBAQCBjbG9zZWFsbDoKPiAJCSAgIHx8ICh3cml0ZWJ1
ZiA8IGZpbGVidWYgKyBmaWxlYnVmX2xlbikpCj4gCQlzeXNfZXJybXNnX2RpZSgiRGF0YSB3YXMg
b25seSBwYXJ0aWFsbHkgd3JpdHRlbiBkdWUgdG8gZXJyb3IiKTsKPiAKPiArCWlmIChhbGxfZmZz
X2NudCkgewo+ICsJCWZwcmludGYoc3RkZXJyLCAiV3JpdHRlbiAlenUgYmxvY2tzIGNvbnRhaW5p
bmcgb25seSAweGZmIGJ5dGVzXG4iLAo+IGFsbF9mZnNfY250KTsKPiArCQlmcHJpbnRmKHN0ZGVy
ciwgIlRob3NlIGJsb2NrIG1heSBiZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIGVtcHR5IVxuIik7
Cj4gKwl9Cj4gKwoKV2hpbGUgSSBsaWtlIHRoZSBwYXRjaCBJJ20gc3RpbGwgbm90IHNvIGNvbnZp
bmNlZCB3aHkgd2UgY2FuJ3QgbWFrZSBza2lwYWxsZmZzPXRydWUgYnkgZGVmYXVsdC4KClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
