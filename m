Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9945CA5FA2
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2EEDcplFJtakZMUT31+vBxqEubRHU49KtUcVJamB3s=; b=glgGOFNtmSuNT1
	x3HnGqABGZsoLfQaksv7A2gGazG03mGiE4TInj729sh/4xTnq6T5ZykhiXZJJV7YmswjldCbXf8y9
	nvSoZNiHd61B8jD2m8ogAC4Y/ZyIX5BkcreJZbabKAT/go0HChBkFXJwEqKcodI1dQc58yqPJDNZO
	6OluzJyCs8iXTQ2TwkQiFGI0i4Lgtzt7NaCgZsZI1TWaRmjIwBZK5bc43qfcope5F/j0zmi4NDnaK
	5FoMfL3TWxokihOkhBET1HKPbD8aYjtX/k0HLl9EFQa8DZFNpdDoZCVYGNYsyYR7osb7jvetxvZiX
	dgFb7seRCkBAK0XI7iQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAyz-00000000c9Z-49mD;
	Mon, 28 Sep 2026 13:01:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAyx-00000000c8c-0Ekp
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 13:01:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D81241A103D;
	Mon, 28 Sep 2026 13:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3ABC601BD;
	Mon, 28 Sep 2026 13:01:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BADD4102F21C9;
	Mon, 28 Sep 2026 15:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790600472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nrBMdXAOCQg8QIx9ZbL+1R9dDHzRihoqAIVz8o6m+94=;
	b=1/ujRBHJ0In595xAmbixqbLIdGXmia955z0CYhdfO5u+aQy21xOCXYxLhZhddIlOtY/XOh
	f5sSdEXT0TDbrg7ROPlutjA/e5hvMXLBlX01Yj1KPWHhLSQowdpuc0botuU71uN4Mq45gf
	J7Ugig0lx76xfH/pu9X55m5kLxOPrWKGlLYzBJWXHFwXmnSpYsZ568OWlDUhJuIsWGkagW
	l3qJRUQ+E2SJj1SPxZPWOEivSB04Ed35yPajlJGQkZdkAGCdv/Otq3kbWmlinCZ+tJjRC4
	DKJyzn5wLgSXNi3VISI3lLUJdFricArljU/ovbQJAmAzypScr7I3h016b9tqfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  michael@walle.cc,  imx@lists.linux.dev,
  Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH] mtd: spi-nor: do not issue the legacy RDCR (0x35) in
 8D-8D-8D mode
In-Reply-To: <20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com> (haibo chen's
	message of "Mon, 28 Sep 2026 20:34:40 +0800")
References: <20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 28 Sep 2026 15:01:05 +0200
Message-ID: <87v77p7coe.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_060123_237628_8904539C 
X-CRM114-Status: GOOD (  12.05  )
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

SGkgSGFpYm8sCgo+ICsJLyoKPiArCSAqIFJEQ1IgKDB4MzUpIGlzIHRoZSBsZWdhY3kgc2luZ2xl
LWJ5dGUgInJlYWQgU1IyL2NvbmZpZ3VyYXRpb24KPiArCSAqIHJlZ2lzdGVyIiBvcGNvZGUgYW5k
IGlzIG9ubHkgbWVhbmluZ2Z1bCBpbiB0aGUgKHgpU1RSIHByb3RvY29scy4gSW4KPiArCSAqIDhE
LThELThEIChPUEkvRE9QSSkgbW9kZSBmbGFzaGVzIGV4cG9zZSB0aGVpciBzZWNvbmQgc3RhdHVz
IG9yCj4gKwkgKiBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIHRocm91Z2ggYSB2ZW5kb3Itc3BlY2lm
aWMgaW5kaXJlY3QgcmVnaXN0ZXIKPiArCSAqIHNwYWNlLCBvciBkbyBub3QgZXhwb3NlIGl0IGF0
IGFsbCwgc28gaXNzdWluZyBhIGJhcmUgMHgzNSBpcyBhbgo+ICsJICogdW5zdXBwb3J0ZWQgY29t
bWFuZDogdGhlIGZsYXNoIGRyaXZlcyBubyBkYXRhIGFuZCB0aGUgY29udHJvbGxlcgo+ICsJICog
cmVhZCB0aW1lcyBvdXQuIFVubGVzcyBhIG1hbnVmYWN0dXJlciBkcml2ZXIgaW5zdGFsbGVkIGEg
ZGVkaWNhdGVkCj4gKwkgKiA4RC1jYXBhYmxlIHJlYWRfc3IyIG9wY29kZSAoaS5lLiBzb21ldGhp
bmcgb3RoZXIgdGhhbiB0aGUgZGVmYXVsdAo+ICsJICogUkRDUiksIHNraXAgdGhlIFNSMiByZWFk
IGluIDhEIG1vZGUuCj4gKwkgKi8KPiArCWlmIChub3ItPnJlZ19wcm90byA9PSBTTk9SX1BST1RP
XzhfOF84X0RUUiAmJgo+ICsJICAgIHBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiA9PSBTUElOT1Jf
T1BfUkRDUikKPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7CgpJIGJlbGlldmUgdGhpcyBpcyBub3Qg
dGhlIGNvcnJlY3Qgc29sdXRpb24uIFRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkCmJlIHRvIGNs
ZWFyIG9wY29kZXMucmVhZF9zcjIgZm9yIE9EVFIgZmxhc2hlcyBieSBkZWZhdWx0IChpZiB0aGF0
J3MKcmVhbGx5IGEgZGVmYXVsdD8pIGFuZCB0aGVuIGhhbmRsZSB0aGUgcmVhZF9zcjIoKSBlcnJv
ciBjb3JyZWN0bHkgaW4gdGhlCmRlYnVnZnMgY2FjaGluZy4KCkFsc28gcGxlYXNlIHRlbGwgeW91
ciBMTE0gbm90IHRvIHB1dCBodWdlIGNvbW1lbnRzIGxpa2UgdGhhdCB0byBleHBsYWluCndoYXQg
aXMgYWxyZWFkeSBpbiB0aGUgY29tbWl0IGxvZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
