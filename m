Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9FDC04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 06:49:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60FC720989
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 06:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vl165JsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60FC720989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNUf/BzB2OoJnCR3OLyFvbWxOcUC6sYQwDvntj4jsFs=; b=Vl165JsL7EtBpe
	WXws7whGl/q0MsTqD0Sycd7FMlv53yTmugOZ2XykPUpkyU7cq1O+R4zGf2ucRUlF65sEkkWQ6E0UJ
	kBrR3Wdi2MyUzRL0KkG6YeuIbmLMLO4z7GPK/eNV24eHhzySoEx1FBCiwIw+JhL5GlUPA7Eiofrn/
	J8ppVXRHskwlu46NFAkGqIrWESP+rpkBoNF/6/3ig3b8PCLsh8zMoWWwd8U+Ekk8oTcrlOf/2uH1B
	fX2rEAE3rJUIi9eFLrj1XoLDI2Xe8F1SdKwF75F7FWRizYjLbh7MGfMeMhsIm/w8z7nY7LL1i6X38
	cxARHeJXnCw9oFV2/o/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOGOT-00081e-4h; Wed, 08 May 2019 06:49:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOGOP-000813-Ho
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 06:49:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DBB1C6083252;
 Wed,  8 May 2019 08:49:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Q22Vkv5wiLM7; Wed,  8 May 2019 08:49:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 72C4B6083269;
 Wed,  8 May 2019 08:49:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Yig6-Nlv4VD1; Wed,  8 May 2019 08:49:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4BBA46083252;
 Wed,  8 May 2019 08:49:18 +0200 (CEST)
Date: Wed, 8 May 2019 08:49:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <1170873772.48849.1557298158182.JavaMail.zimbra@nod.at>
In-Reply-To: <20190508031954.GA26575@sol.localdomain>
References: <20190326075232.11717-1-s.hauer@pengutronix.de>
 <20190326075232.11717-2-s.hauer@pengutronix.de>
 <20190508031954.GA26575@sol.localdomain>
Subject: Re: [PATCH 1/2] ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
Thread-Index: nv8odDrziMGsORrNKuAatbhNUuTenA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_234929_880665_1088110C 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: tytso <tytso@mit.edu>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-fscrypt@vger.kernel.org,
 kernel <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RXJpYywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJFcmljIEJpZ2dl
cnMiIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPgo+IEFuOiAiU2FzY2hhIEhhdWVyIiA8cy5oYXVlckBw
ZW5ndXRyb25peC5kZT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJsaW51eC1t
dGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sIGxpbnV4LWZzY3J5cHRAdmdlci5r
ZXJuZWwub3JnLCAidHl0c28iIDx0eXRzb0BtaXQuZWR1PiwgImtlcm5lbCIKPiA8a2VybmVsQHBl
bmd1dHJvbml4LmRlPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgOC4gTWFpIDIwMTkgMDU6MTk6NTUK
PiBCZXRyZWZmOiBSZTogW1BBVENIIDEvMl0gdWJpZnM6IFJlbW92ZSAjaWZkZWYgYXJvdW5kIENP
TkZJR19GU19FTkNSWVBUSU9OCgo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0IDA4OjUyOjMxQU0g
KzAxMDAsIFNhc2NoYSBIYXVlciB3cm90ZToKPj4gaWZkZWZzIHJlZHVjZSByZWFkYWJsaXR5IGFu
ZCBjb21waWxlIGNvdmVyYWdlLiBUaGlzIHJlbW92ZXMgdGhlIGlmZGVmcwo+PiBhcm91bmQgQ09O
RklHX0ZTX0VOQ1JZUFRJT04gYnkgdXNpbmcgSVNfRU5BQkxFRCBhbmQgcmVseWluZyBvbiBzdGF0
aWMKPj4gaW5saW5lIHdyYXBwZXJzLiBBIG5ldyBzdGF0aWMgaW5saW5lIHdyYXBwZXIgZm9yIHNl
dHRpbmcgc2ItPnNfY29wIGlzCj4+IGludHJvZHVjZWQgdG8gYWxsb3cgZmlsZXN5c3RlbXMgdG8g
dW5jb25kaXRpb25hbGx5IGNvbXBpbGUgaW4gdGhlaXIKPj4gc19jb3Agb3BlcmF0aW9ucy4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4K
Pj4gLS0tCj4+ICBmcy91Ymlmcy9pb2N0bC5jICAgICAgICB8IDExICstLS0tLS0tLS0tCj4+ICBm
cy91Ymlmcy9zYi5jICAgICAgICAgICB8ICA3ICsrKystLS0KPj4gIGZzL3ViaWZzL3N1cGVyLmMg
ICAgICAgIHwgIDQgKy0tLQo+PiAgaW5jbHVkZS9saW51eC9mc2NyeXB0LmggfCAxMSArKysrKysr
KysrKwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKPj4gCj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9pb2N0bC5jIGIvZnMvdWJpZnMvaW9jdGwu
Ywo+PiBpbmRleCA4MmU0ZTZhMzBiMDQuLjZiMDViM2VjNTAwZSAxMDA2NDQKPj4gLS0tIGEvZnMv
dWJpZnMvaW9jdGwuYwo+PiArKysgYi9mcy91Ymlmcy9pb2N0bC5jCj4+IEBAIC0xOTMsNyArMTkz
LDYgQEAgbG9uZyB1Ymlmc19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNt
ZCwKPj4gdW5zaWduZWQgbG9uZyBhcmcpCj4+ICAJCXJldHVybiBlcnI7Cj4+ICAJfQo+PiAgCWNh
c2UgRlNfSU9DX1NFVF9FTkNSWVBUSU9OX1BPTElDWTogewo+PiAtI2lmZGVmIENPTkZJR19GU19F
TkNSWVBUSU9OCj4+ICAJCXN0cnVjdCB1Ymlmc19pbmZvICpjID0gaW5vZGUtPmlfc2ItPnNfZnNf
aW5mbzsKPj4gIAo+PiAgCQllcnIgPSB1Ymlmc19lbmFibGVfZW5jcnlwdGlvbihjKTsKPj4gQEAg
LTIwMSwxNyArMjAwLDkgQEAgbG9uZyB1Ymlmc19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5z
aWduZWQgaW50IGNtZCwKPj4gdW5zaWduZWQgbG9uZyBhcmcpCj4+ICAJCQlyZXR1cm4gZXJyOwo+
PiAgCj4+ICAJCXJldHVybiBmc2NyeXB0X2lvY3RsX3NldF9wb2xpY3koZmlsZSwgKGNvbnN0IHZv
aWQgX191c2VyICopYXJnKTsKPj4gLSNlbHNlCj4+IC0JCXJldHVybiAtRU9QTk9UU1VQUDsKPj4g
LSNlbmRpZgo+PiAgCX0KPj4gLQljYXNlIEZTX0lPQ19HRVRfRU5DUllQVElPTl9QT0xJQ1k6IHsK
Pj4gLSNpZmRlZiBDT05GSUdfRlNfRU5DUllQVElPTgo+PiArCWNhc2UgRlNfSU9DX0dFVF9FTkNS
WVBUSU9OX1BPTElDWToKPj4gIAkJcmV0dXJuIGZzY3J5cHRfaW9jdGxfZ2V0X3BvbGljeShmaWxl
LCAodm9pZCBfX3VzZXIgKilhcmcpOwo+PiAtI2Vsc2UKPj4gLQkJcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+PiAtI2VuZGlmCj4+IC0JfQo+PiAgCj4+ICAJZGVmYXVsdDoKPj4gIAkJcmV0dXJuIC1FTk9U
VFk7Cj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9zYi5jIGIvZnMvdWJpZnMvc2IuYwo+PiBpbmRl
eCA2N2ZhYzFlOGFkZmIuLjJhZmM4YjFkNGMzYiAxMDA2NDQKPj4gLS0tIGEvZnMvdWJpZnMvc2Iu
Ywo+PiArKysgYi9mcy91Ymlmcy9zYi5jCj4+IEBAIC03NDgsMTQgKzc0OCwxMiBAQCBpbnQgdWJp
ZnNfcmVhZF9zdXBlcmJsb2NrKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+PiAgCQlnb3RvIG91dDsK
Pj4gIAl9Cj4+ICAKPj4gLSNpZm5kZWYgQ09ORklHX0ZTX0VOQ1JZUFRJT04KPj4gLQlpZiAoYy0+
ZW5jcnlwdGVkKSB7Cj4+ICsJaWYgKCFJU19FTkFCTEVEKENPTkZJR19VQklGU19GU19FTkNSWVBU
SU9OKSAmJiBjLT5lbmNyeXB0ZWQpIHsKPj4gIAkJdWJpZnNfZXJyKGMsICJmaWxlIHN5c3RlbSBj
b250YWlucyBlbmNyeXB0ZWQgZmlsZXMgYnV0IFVCSUZTIgo+PiAgCQkJICAgICAiIHdhcyBidWls
dCB3aXRob3V0IGNyeXB0byBzdXBwb3J0LiIpOwo+PiAgCQllcnIgPSAtRUlOVkFMOwo+PiAgCQln
b3RvIG91dDsKPj4gIAl9Cj4gCj4gQSBiaXQgbGF0ZSwgYnV0IEkgbm90aWNlZCB0aGlzIGluIHVi
aWZzL2xpbnV4LW5leHQuICBUaGlzIG5lZWRzIHRvIHVzZQo+IENPTkZJR19GU19FTkNSWVBUSU9O
IGhlcmUsIG5vdCBDT05GSUdfVUJJRlNfRlNfRU5DUllQVElPTiwgYXMgdGhlIGxhdHRlciBubwo+
IGxvbmdlciBleGlzdHMuCgpUaGFua3MgZm9yIHNwb3R0aW5nLiBJJ2xsIGZpdCBpdCBteXNlbGYg
aW4gLW5leHQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
