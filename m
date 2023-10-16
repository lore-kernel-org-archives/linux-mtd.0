Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D82CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9i5BiCWKWGRcAOWJt/NaxilgFqoJhAUUHGvZehNNEc=; b=l3IS3jsawWUb1b
	oSQv4vmzrJsH3UKbPsLVQgeuN31/NlHR2x1ydOUtlFMQcCeFjvXVA35inxElFO1oiMKBBk9/bT/fS
	u3gP9zX2Bhcxk9Rg8EC29bAQF8CHLUoFro9b9oCX3hQ2nEpRzyl0NobhcI0AJr1QtRsG7+dLYWhTw
	6L9mkpfqwWiRhMW1Qx81p+1zFHxl6dqdFYw2wk0R2hgNHsFuaULGjL3N2sfqy7i5ZrRjJ6sv+9J1w
	jqGXQsV4H2UrEBBYV7uyBIyo5hRHdH+eKAR9qsdX6I1rmxc6wZQL9N2135a5P1hiKNUxL0X+lR2KH
	kdMvidyltpKXOWUnpcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ8o-008rtt-0i;
	Mon, 16 Oct 2023 08:39:58 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ8k-008rsU-1K
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 08:39:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C8141C000C;
	Mon, 16 Oct 2023 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697445586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC3xNrtIntlMiyJnUWOHJsV65ucq25DkqdsLxZQyYMk=;
	b=VLrzZ3jlSMJzDBTAo/POIHPXpsyP4rdM1ckkpzAI/911d4VFeVvL0Km8LYFNjzMbyI/NQ6
	0hl7bu9Vrk+MiLqkZyp65bW3FurU8RMBSLz73GM/49psy3HW6NohyPJ4j5Y/K1JNbbkHlV
	rrbHTBFS8hD+mSi9jpwINc6cuVzgACKZaSNSFgeRgdSfu3Netyp/LnHfokrUTqn3XS1GVo
	O5V7UZPJuJwWP4G3j0HyDjSTNWiiJJtKl19y5iWKw/FSirMKMTMrr7mnhQrMwctop+84XF
	fsU5geqUMlexprG4Uk9HXZqQWvAK1VFA9q7j/ADSq0F/bKuPkJknlMs/NF4DuA==
Date: Mon, 16 Oct 2023 10:39:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>,
 linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org, Tomas
 Winkler <tomas.winkler@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/10] drm/i915/spi: spi register with mtd
Message-ID: <20231016103939.67445bee@xps-13>
In-Reply-To: <20230910123949.1251964-7-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_013955_778378_94223839 
X-CRM114-Status: GOOD (  11.78  )
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

SGkgQWxleGFuZGVyLAoKPiArc3RhdGljIGludCBpOTE1X3NwaV9pbml0X210ZChzdHJ1Y3QgaTkx
NV9zcGkgKnNwaSwgc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ICsJCQkgICAgIHVuc2lnbmVkIGlu
dCBucGFydHMpCj4gK3sKPiArCXVuc2lnbmVkIGludCBpOwo+ICsJdW5zaWduZWQgaW50IG47Cj4g
KwlzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHMgPSBOVUxMOwo+ICsJaW50IHJldDsKPiArCj4g
KwlkZXZfZGJnKGRldmljZSwgInJlZ2lzdGVyaW5nIHdpdGggbXRkXG4iKTsKPiArCj4gKwlzcGkt
Pm10ZC5vd25lciA9IFRISVNfTU9EVUxFOwo+ICsJc3BpLT5tdGQuZGV2LnBhcmVudCA9IGRldmlj
ZTsKPiArCXNwaS0+bXRkLmZsYWdzID0gTVREX0NBUF9OT1JGTEFTSCB8IE1URF9XUklURUFCTEU7
Cj4gKwlzcGktPm10ZC50eXBlID0gTVREX0RBVEFGTEFTSDsKPiArCXNwaS0+bXRkLnByaXYgPSBz
cGk7Cj4gKwlzcGktPm10ZC5fd3JpdGUgPSBpOTE1X3NwaV93cml0ZTsKPiArCXNwaS0+bXRkLl9y
ZWFkID0gaTkxNV9zcGlfcmVhZDsKPiArCXNwaS0+bXRkLl9lcmFzZSA9IGk5MTVfc3BpX2VyYXNl
Owo+ICsJc3BpLT5tdGQuX2dldF9kZXZpY2UgPSBpOTE1X3NwaV9nZXRfZGV2aWNlOwo+ICsJc3Bp
LT5tdGQuX3B1dF9kZXZpY2UgPSBpOTE1X3NwaV9wdXRfZGV2aWNlOwo+ICsJc3BpLT5tdGQud3Jp
dGVzaXplID0gU1pfMTsgLyogMSBieXRlIGdyYW51bGFyaXR5ICovCgpZb3Ugc2F5IHdyaXRlc2l6
ZSBzaG91bGQgYmUgYWxpZ25lZCB3aXRoIDQgaW4geW91ciBuZXh0IHBhdGNoPwoKPiArCXNwaS0+
bXRkLmVyYXNlc2l6ZSA9IFNaXzRLOyAvKiA0SyBieXRlcyBncmFudWxhcml0eSAqLwo+ICsJc3Bp
LT5tdGQuc2l6ZSA9IHNwaS0+c2l6ZTsKPiArCj4gKwlwYXJ0cyA9IGtjYWxsb2Moc3BpLT5ucmVn
aW9ucywgc2l6ZW9mKCpwYXJ0cyksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFwYXJ0cykKPiArCQly
ZXR1cm4gLUVOT01FTTsKPiArCj4gKwlmb3IgKGkgPSAwLCBuID0gMDsgaSA8IHNwaS0+bnJlZ2lv
bnMgJiYgbiA8IG5wYXJ0czsgaSsrKSB7Cj4gKwkJaWYgKCFzcGktPnJlZ2lvbnNbaV0uaXNfcmVh
ZGFibGUpCj4gKwkJCWNvbnRpbnVlOwo+ICsJCXBhcnRzW25dLm5hbWUgPSBzcGktPnJlZ2lvbnNb
aV0ubmFtZTsKPiArCQlwYXJ0c1tuXS5vZmZzZXQgID0gc3BpLT5yZWdpb25zW2ldLm9mZnNldDsK
PiArCQlwYXJ0c1tuXS5zaXplID0gc3BpLT5yZWdpb25zW2ldLnNpemU7Cj4gKwkJaWYgKCFzcGkt
PnJlZ2lvbnNbaV0uaXNfd3JpdGFibGUpCj4gKwkJCXBhcnRzW25dLm1hc2tfZmxhZ3MgPSBNVERf
V1JJVEVBQkxFOwo+ICsJCW4rKzsKPiArCX0KPiArCj4gKwlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lz
dGVyKCZzcGktPm10ZCwgcGFydHMsIG4pOwo+ICsKPiArCWtmcmVlKHBhcnRzKTsKPiArCj4gKwly
ZXR1cm4gcmV0Owo+ICt9Cj4gKwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
