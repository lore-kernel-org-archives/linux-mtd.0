Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58185C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244AF216FD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhEfwHNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244AF216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vr8X72PqmQowSoAGC8LRoXzvZwn8rsuqymqXMqDr9vg=; b=nhEfwHNwKCZCZ9
	cS9i3YuA8wUjT73UoVeDMOZI4YtK3QI+h5eNwcAw4x/fWHjdI5Xf8zWGsY10xJp+UvUxBsaXJt2Cv
	uWCliAWHhApZkB90mmfV2UpNvOEZwQUsPGsFF0uoe2P6lukPk2uB86csep5NVqaY+qQIaORw/S+9Y
	ZAioW5Fkj6G+PeXYe3Cn6aGf/Mgzn+K7tno3Kap+U8Js2hXuMRtYfMhq0W7Ogh55aDrK1RQxKkmbt
	Nf6kJbSEHaJQYg/fEZcci9GvPMBZkTjRSbac5AcxGwo9DcUv2SR6DBTzcDb/E4qJdSHZFomeoyI1R
	X9kRi17j2pNMNreNVcYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8ZI-0005B8-Vn; Mon, 27 Apr 2020 18:33:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8ZF-0005A1-DK
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:33:22 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2C647FF806;
 Mon, 27 Apr 2020 18:33:15 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:33:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 07/12] mtd: rawnand: stm32_fmc2: cleanup
Message-ID: <20200427203314.798b3c4e@xps13>
In-Reply-To: <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_113321_584402_3CEDC585 
X-CRM114-Status: GOOD (  10.32  )
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
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzozMSArMDIwMDoKCj4gVGhpcyBw
YXRjaCByZW5hbWVzIGZ1bmN0aW9ucyBhbmQgbG9jYWwgdmFyaWFibGVzIHRvIGJlIHJlYWR5IHRv
IHVzZQo+IHN0bTMyX2ZtYzIgc3RydWN0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPiAtLS0KCj4gLXN0YXRpYyBp
bnQgc3RtMzJfZm1jMl9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50
IGNoaXBuciwKPiAtCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2RhdGFfaW50ZXJmYWNlICpj
b25mKQo+ICtzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ICsJCQkJCSAgY29uc3Qgc3RydWN0IG5hbmRf
ZGF0YV9pbnRlcmZhY2UgKmNmKQoKSSBzdXBwb3NlIHlvdSBzL2NvbmYvY2YvIGJlY2F1c2Ugb2Yg
dGhlIDgwIGNoYXJzIGJvdW5kYXJ5LiBJbiB0aGlzIGNhc2UKSSBkb24ndCBtaW5kIGNyb3NzaW5n
IGl0LCBJIGRvbid0IHRoaW5rIGl0IGlzIGJldHRlciB0byByZW5hbWUgdGhlCmNvbmYgcGFyYW1l
dGVyIGZvciB0aGlzIHJlYXNvbi4KCj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90aW1p
bmdzICpzZHJ0Owo+ICAKPiAtCXNkcnQgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiAr
CXNkcnQgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjZik7Cj4gIAlpZiAoSVNfRVJSKHNkcnQpKQo+
ICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+ICAKPiAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRB
X0lGQUNFX0NIRUNLX09OTFkpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0Jc3RtMzJfZm1jMl9jYWxj
X3RpbWluZ3MoY2hpcCwgc2RydCk7Cj4gLQlzdG0zMl9mbWMyX3RpbWluZ3NfaW5pdChjaGlwKTsK
PiArCXN0bTMyX2ZtYzJfbmZjX2NhbGNfdGltaW5ncyhjaGlwLCBzZHJ0KTsKPiArCXN0bTMyX2Zt
YzJfbmZjX3RpbWluZ3NfaW5pdChjaGlwKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKClsu
Li5dCgo+ICAKPiAtc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfZm1jMl9kcml2
ZXIgPSB7Cj4gLQkucHJvYmUJPSBzdG0zMl9mbWMyX3Byb2JlLAo+IC0JLnJlbW92ZQk9IHN0bTMy
X2ZtYzJfcmVtb3ZlLAo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9mbWMy
X25mY19kcml2ZXIgPSB7Cj4gKwkucHJvYmUJPSBzdG0zMl9mbWMyX25mY19wcm9iZSwKPiArCS5y
ZW1vdmUJPSBzdG0zMl9mbWMyX25mY19yZW1vdmUsCj4gIAkuZHJpdmVyCT0gewo+IC0JCS5uYW1l
ID0gInN0bTMyX2ZtYzJfbmFuZCIsCj4gLQkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJfZm1jMl9t
YXRjaCwKPiAtCQkucG0gPSAmc3RtMzJfZm1jMl9wbV9vcHMsCj4gKwkJLm5hbWUgPSAic3RtMzJf
Zm1jMl9uZmMiLAo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2ZtYzJfbmZjX21hdGNoLAo+
ICsJCS5wbSA9ICZzdG0zMl9mbWMyX25mY19wbV9vcHMsCj4gIAl9LAo+ICB9Owo+IC1tb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bTMyX2ZtYzJfZHJpdmVyKTsKPiArbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihzdG0zMl9mbWMyX25mY19kcml2ZXIpOwo+ICAKPiAtTU9EVUxFX0FMSUFTKCJwbGF0Zm9y
bTpzdG0zMl9mbWMyX25hbmQiKTsKPiArTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpzdG0zMl9mbWMy
X25mYyIpOwo+ICBNT0RVTEVfQVVUSE9SKCJDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUu
a2VyZWxsb0BzdC5jb20+Iik7Cj4gLU1PRFVMRV9ERVNDUklQVElPTigiU1RNaWNyb2VsZWN0cm9u
aWNzIFNUTTMyIEZNQzIgbmFuZCBkcml2ZXIiKTsKPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzIgRk1DMiBuZmMgZHJpdmVyIik7CgpJIHdvdWxkIHByZWZlcjog
cy9uZmMvTkZDLyBoZXJlIHBsZWFzZS4KCj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKCldp
dGggdGhlc2UgdHdvIG5pdHMsCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
