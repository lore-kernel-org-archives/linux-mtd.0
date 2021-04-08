Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2480C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 06:16:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4AE61168
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 06:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4AE61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jHXlnIpnWYSom2rEmahUJZH1ArOfMhdvpcsBMHbLSuY=; b=Vd/H91dQ2rYL2X3wsNRoTv+uK
	KoKlxMHWoAKu4mrh5uD/kbgJ2WW+YYEJKdu+wYEmPUgjlmAce78bZZAPOOIsylfVytNdHnSkzR00p
	gYgfdl1zuK7n1ZOgYHf252o4+ofM6/zbLCaUQN+BikNLAtUXxb8UZilN6AhGem87Eg2TLyjB9arxv
	st7pOV0Vp64bOe9OAguMUTX/QTpwWYIvFRDq6rftGxPEnIot0Xkq/agZrSe5k3C+FHvYKj80vcVwp
	y9wSlRVjwT7Hs0vVTffzQLuF+3OTC4XitU+Agz+h5HBMmOIenh7I34q8yhe4S/zsLUyX9pCwHFHiE
	pZV/Pb2xw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNwk-0073se-1o; Thu, 08 Apr 2021 06:15:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNwe-0073rm-Uj
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 06:15:15 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DC68E2000B;
 Thu,  8 Apr 2021 06:15:09 +0000 (UTC)
Date: Thu, 8 Apr 2021 08:15:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: super: don't reply on mtdblock device minor
Message-ID: <20210408081508.1d04eb31@xps13>
In-Reply-To: <YG4qVPz68WAwPtB+@makrotopia.org>
References: <YG4qVPz68WAwPtB+@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_071513_149073_090FE883 
X-CRM114-Status: GOOD (  20.67  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+IHdyb3RlIG9u
IFdlZCwgNyBBcHIgMjAyMSAyMjo1NTozMgorMDEwMDoKCj4gRm9yIG10ZGJsb2NrIGRldmljZXMg
d2l0aCBwYXJ0aXRpb25zIChpZS4gcGFydF9iaXRzICE9IDApIHRoZQo+IGFzc3VtcHRpb24gdGhh
dCB0aGUgbWlub3IgbnVtYmVyIG9mIHRoZSBtdGRibG9jayBkZXZpY2UgbWF0Y2hlcwo+IHRoZSBt
dGRudW0gZG9lc24ndCBob2xkIHRydWUuCj4gUHJvcGVybHkgcmVzb2x2ZSBtdGQgZGV2aWNlIGZy
b20gYmxrdHJhbnMgbGF5ZXIgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29s
bGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRkc3VwZXIu
YyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbXRkc3VwZXIuYyBiL2RyaXZlcnMvbXRkL210ZHN1cGVyLmMKPiBpbmRleCBjM2Uy
MDk4MzcyZjJlLi5kYzUyZjk5MjljOGZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHN1
cGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRzdXBlci5jCj4gQEAgLTksNiArOSw3IEBACj4g
ICAqLwo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9zdXBlci5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvbXRkL2Jsa3RyYW5zLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9uYW1laS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvZXhwb3J0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPgo+IEBAIC0xMjEs
NyArMTIyLDggQEAgaW50IGdldF90cmVlX210ZChzdHJ1Y3QgZnNfY29udGV4dCAqZmMsCj4gIHsK
PiAgI2lmZGVmIENPTkZJR19CTE9DSwo+ICAJc3RydWN0IGJsb2NrX2RldmljZSAqYmRldjsKPiAt
CWludCByZXQsIG1ham9yOwo+ICsJc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmJsa3RyYW5zX2Rl
djsKPiArCWludCByZXQsIG1ham9yLCBwYXJ0X2JpdHM7Cj4gICNlbmRpZgo+ICAJaW50IG10ZG5y
Owo+ICAKPiBAQCAtMTY5LDIxICsxNzEsMzggQEAgaW50IGdldF90cmVlX210ZChzdHJ1Y3QgZnNf
Y29udGV4dCAqZmMsCj4gIAkvKiB0cnkgdGhlIG9sZCB3YXkgLSB0aGUgaGFjayB3aGVyZSB3ZSBh
bGxvd2VkIHVzZXJzIHRvIG1vdW50Cj4gIAkgKiAvZGV2L210ZGJsb2NrJChuKSBidXQgZGlkbid0
IGFjdHVhbGx5IF91c2VfIHRoZSBibG9ja2Rldgo+ICAJICovCj4gLQliZGV2ID0gbG9va3VwX2Jk
ZXYoZmMtPnNvdXJjZSk7Cj4gKwliZGV2ID0gYmxrZGV2X2dldF9ieV9wYXRoKGZjLT5zb3VyY2Us
IEZNT0RFX1JFQUQsIE5VTEwpOwo+ICAJaWYgKElTX0VSUihiZGV2KSkgewo+ICAJCXJldCA9IFBU
Ul9FUlIoYmRldik7Cj4gIAkJZXJyb3JmKGZjLCAiTVREOiBDb3VsZG4ndCBsb29rIHVwICclcyc6
ICVkIiwgZmMtPnNvdXJjZSwgcmV0KTsKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+IC0JcHJfZGVi
dWcoIk1URFNCOiBsb29rdXBfYmRldigpIHJldHVybmVkIDBcbiIpOwo+ICsJcHJfZGVidWcoIk1U
RFNCOiBibGtkZXZfZ2V0X2J5X3BhdGgoKSByZXR1cm5lZCAwXG4iKTsKPiAgCj4gIAltYWpvciA9
IE1BSk9SKGJkZXYtPmJkX2Rldik7Cj4gLQltdGRuciA9IE1JTk9SKGJkZXYtPmJkX2Rldik7Cj4g
LQliZHB1dChiZGV2KTsKPiAgCj4gLQlpZiAobWFqb3IgPT0gTVREX0JMT0NLX01BSk9SKQo+IC0J
CXJldHVybiBtdGRfZ2V0X3NiX2J5X25yKGZjLCBtdGRuciwgZmlsbF9zdXBlcik7Cj4gKwlpZiAo
bWFqb3IgPT0gTVREX0JMT0NLX01BSk9SKSB7Cj4gKwkJaWYgKCFiZGV2LT5iZF9kaXNrKSB7Cj4g
KwkJCWJsa2Rldl9wdXQoYmRldiwgRk1PREVfUkVBRCk7Cj4gKwkJCUJVRygpOwo+ICsJCQlyZXR1
cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwo+ICsJCWJsa3RyYW5zX2RldiA9IChzdHJ1Y3QgbXRkX2Js
a3RyYW5zX2RldiAqKShiZGV2LT5iZF9kaXNrLT5wcml2YXRlX2RhdGEpOwo+ICsJCWlmICghYmxr
dHJhbnNfZGV2IHx8ICFibGt0cmFuc19kZXYtPnRyKSB7Cj4gKwkJCWJsa2Rldl9wdXQoYmRldiwg
Rk1PREVfUkVBRCk7Cj4gKwkJCUJVRygpOwoKQ291bGQgeW91IGF2b2lkIHRoZXNlIGNhbGxzPyBJ
IGRvdWJ0IHRoZXkgYnJpbmcgYW55dGhpbmcgdXNlZnVsIGFuZApyZXR1cm5pbmcgLUVJTlZBTCBz
aG91bGQgYmUgZW5vdWdoIGFueXdheS4KCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiAr
CQltdGRuciA9IGJsa3RyYW5zX2Rldi0+ZGV2bnVtOwo+ICsJCXBhcnRfYml0cyA9IGJsa3RyYW5z
X2Rldi0+dHItPnBhcnRfYml0czsKPiArCQlibGtkZXZfcHV0KGJkZXYsIEZNT0RFX1JFQUQpOwo+
ICsJCWlmIChNSU5PUihiZGV2LT5iZF9kZXYpICE9IChtdGRuciA8PCBwYXJ0X2JpdHMpKQo+ICsJ
CQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gKwkJcmV0dXJuIG10ZF9nZXRfc2JfYnlfbnIoZmMsIG10
ZG5yLCBmaWxsX3N1cGVyKTsKPiArCX0KPiArCWJsa2Rldl9wdXQoYmRldiwgRk1PREVfUkVBRCk7
Cj4gICNlbmRpZiAvKiBDT05GSUdfQkxPQ0sgKi8KPiAgCj4gIAlpZiAoIShmYy0+c2JfZmxhZ3Mg
JiBTQl9TSUxFTlQpKQoKT3RoZXJ3aXNlIGxndG0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
