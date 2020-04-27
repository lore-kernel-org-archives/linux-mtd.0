Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED956C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B814F215A4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LCRJnmJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B814F215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nz1C5LEk4mF5SMBCDUW1sv/I8wldS0JG/T9/z7yC3wY=; b=LCRJnmJQ/U5j7v
	f4DB+MPTq9OLiLfwlhMfKw6kPHZht967YDD/zGKC9ckmhDLhGs+/ca/tQl2vZJ1TGC92Yf6nwqKZQ
	bVfoJ94TSaccsfAQ3kKRls+cC734G6STwl6pyt27wv6g++H2Ob8A/B6eF4Z7jRTLH/0qecvAjyLUX
	lvF8JG/y4sWIz9Xc/z5Ry5rb45Kz17DO1qkRFf/0D8YWZH2Xxk83sn6VyFew3jh9ZlKKWvwfwUFtc
	eK2MyeCr480iPg2EruSE86J9zZSI8+bwc8v4hVQbLuApiNWtYto2xN1ZY9YVDLYd8Af81VhSDsEIZ
	kpIXx5miZLD+kfbPKFTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT7rI-00055K-Ii; Mon, 27 Apr 2020 17:47:56 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT7rE-00053s-U2
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:47:54 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 94DDD20005;
 Mon, 27 Apr 2020 17:47:48 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:47:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 04/12] mtd: rawnand: stm32_fmc2: manage all errors
 cases at probe time
Message-ID: <20200427194747.224a2402@xps13>
In-Reply-To: <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-5-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_104753_107899_23B3568B 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzoyOCArMDIwMDoKCj4gVGhpcyBw
YXRjaCBkZWZlcnMgaXRzIHByb2JlIHdoZW4gdGhlIGV4cGVjdGVkIHJlc2V0IGNvbnRyb2wgaXMg
bm90Cj4geWV0IHJlYWR5LiBUaGlzIHBhdGNoIGFsc28gaGFuZGxlcyBwcm9wZXJseSBhbGwgZXJy
b3JzIGNhc2VzIGF0IHByb2JlCj4gdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggYjZkNDVjZC4uMGE5Njc5NyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gQEAgLTE5NjcsNyArMTk2Nywx
MSBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgCX0KPiAgCj4gIAlyc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldChkZXYsIE5V
TEwpOwo+IC0JaWYgKCFJU19FUlIocnN0YykpIHsKPiArCWlmIChJU19FUlIocnN0YykpIHsKPiAr
CQlyZXQgPSBQVFJfRVJSKHJzdGMpOwo+ICsJCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikKPiAr
CQkJZ290byBlcnJfY2xrX2Rpc2FibGU7Cj4gKwl9IGVsc2Ugewo+ICAJCXJlc2V0X2NvbnRyb2xf
YXNzZXJ0KHJzdGMpOwo+ICAJCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7Cj4gIAl9Cj4g
QEAgLTE5NzUsNyArMTk3OSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJLyogRE1BIHNldHVwICovCj4gIAlyZXQgPSBzdG0z
Ml9mbWMyX2RtYV9zZXR1cChmbWMyKTsKPiAgCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAr
CQlnb3RvIGVycl9kbWFfc2V0dXA7Cj4gIAo+ICAJLyogRk1DMiBpbml0IHJvdXRpbmUgKi8KPiAg
CXN0bTMyX2ZtYzJfaW5pdChmbWMyKTsKPiBAQCAtMTk5Nyw3ICsyMDAxLDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9mbWMyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkvKiBT
Y2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBkZXZpY2UgKi8KPiAgCXJldCA9IG5hbmRfc2Nh
bihjaGlwLCBuYW5kLT5uY3MpOwo+ICAJaWYgKHJldCkKPiAtCQlnb3RvIGVycl9zY2FuOwo+ICsJ
CWdvdG8gZXJyX2RtYV9zZXR1cDsKPiAgCj4gIAlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVyKG10
ZCwgTlVMTCwgMCk7Cj4gIAlpZiAocmV0KQo+IEBAIC0yMDEwLDcgKzIwMTQsNyBAQCBzdGF0aWMg
aW50IHN0bTMyX2ZtYzJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgZXJy
X2RldmljZV9yZWdpc3RlcjoKPiAgCW5hbmRfY2xlYW51cChjaGlwKTsKPiAgCj4gLWVycl9zY2Fu
Ogo+ICtlcnJfZG1hX3NldHVwOgo+ICAJaWYgKGZtYzItPmRtYV9lY2NfY2gpCj4gIAkJZG1hX3Jl
bGVhc2VfY2hhbm5lbChmbWMyLT5kbWFfZWNjX2NoKTsKPiAgCWlmIChmbWMyLT5kbWFfdHhfY2gp
Cj4gQEAgLTIwMjEsNiArMjAyNSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc2dfZnJlZV90YWJsZSgmZm1jMi0+ZG1hX2Rh
dGFfc2cpOwo+ICAJc2dfZnJlZV90YWJsZSgmZm1jMi0+ZG1hX2VjY19zZyk7Cj4gIAo+ICtlcnJf
Y2xrX2Rpc2FibGU6Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZm1jMi0+Y2xrKTsKPiAgCj4g
IAlyZXR1cm4gcmV0OwoKSSBkaWRuJ3Qgc3BvdCBpdCBkdXJpbmcgbXkgZWFybGllciByZXZpZXdz
IGJ1dCBJIHJlYWxseSBwcmVmZXIgdXNpbmcKbGFiZWxzIGV4cGxhaW5pbmcgd2hhdCB5b3UgZG8g
dGhhbiBoYXZpbmcgdGhlIHNhbWUgbmFtZSBvZiB0aGUgZnVuY3Rpb24Kd2hpY2ggZmFpbGVkLiBU
aGlzIHdheSB5b3UgZG9uJ3QgaGF2ZSB0byByZXdvcmsgdGhlIGVycm9yIHBhdGggd2hlbgp5b3Ug
aGFuZGxlIGFuIGFkZGl0aW9uYWwgZXJyb3IuCgpTbywgd291bGQgeW91IG1pbmQgZG9pbmcgdGhp
cyBpbiB0d28gc3RlcHM6CgoxLwpSZXBsYWNlCgogICAgZXJyX3NjYW46Cgp3aXRoLCBlZy4KCiAg
ICByZWxlYXNlX2RtYV9vYmpzOgoKMi8KQWRkIGEKCiAgICBnb3RvIHJlbGVhc2VfZG1hX29ianM7
CgppbiAqX2RtYV9zZXR1cCgpIGVycm9yIHBhdGgsIGFuZCBkZWZpbmUgYW5kIHVzZSBhCgogICAg
cmVsZWFzZV9jbGsKCmxhYmVsIGxpa2UgeW91IGFscmVhZHkgZG8uCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
