Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC73E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrN9QAwHwN8ar1boMWTgPunubTa2YQXSx0D31FLLVZI=; b=NlsvTncMRsiqKn
	GS3mvw4PjnkzuYIHn9Bp6kjZvb1yfzntA7yyyj6aqm56/3M7YqFR8dBfEyvJI7eM4cBkN187+6GfS
	Zv+QheV3pAGTMrv41lOz5YEvsNs0732lr6P+vpQpBPV1dBur7LJBYvrlHNYiOVYKGUt2utMShUj0O
	FrqKduM94JMfdQGkklXtIeSf5aft7rDAKc9UZB4I3lDCYJ1Rj7dL5oJq4YNYEWKYc8OO1LJxpp2YK
	MajhWITlzAikDzD170NVK1YfsdQ7ZS34S0dH1bh5Jcg8LugszDuv+gt/CJkIwh8LPbuK8kXyLjKLI
	ePAHmao7TYhDAqAYlN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3jO-00000003Xbs-0V69;
	Fri, 13 Dec 2024 11:21:14 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3ig-00000003XTX-35tx
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 11:20:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E38A760003;
	Fri, 13 Dec 2024 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734088827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgs5eEtaoC2aOQnCdg0dxxuEk8iGEvez1t1Gap2xNtg=;
	b=LUT8tmplMj5AlS5Pmj6PujybGRR/KCUjZQg6wtQ5+toJ1LogUfipwMkBK8DGjM1fYSTa3r
	7xdoV0aD+HCtZ+6lsfgJSRj1Ka7QqBYeqW0L+5SBCdkzXaLVrgXiyBs7J0yH6L9QwfR7lR
	q3553a1OhAiRNpE21nuxcnKHPHo46+qjM9tfPrISHEtiKD/h7fy46oGGbpMYWShp4Gx9EA
	uRXkCcTHeIy9jAweI3hmSkcQa0lLjGzkREFWqxnedt+g/3DKpXhSJM061REWHPltQDIIGC
	IU/AMbQQ00uqXV5rydqO9HMrRRJAXzBQ5pc4SQae+dJCmghi1JnV2Te24bWclw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 03/24] spi: amd: Support per spi-mem operation frequency
 switches
In-Reply-To: <64ade17d-3800-4afc-847c-b8e5fc5d7360@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:36:15 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-4-miquel.raynal@bootlin.com>
	<64ade17d-3800-4afc-847c-b8e5fc5d7360@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 12:20:25 +0100
Message-ID: <87zfkzn81y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_032031_075450_23A6D047 
X-CRM114-Status: GOOD (  20.86  )
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

SGkgVHVkb3IsCgpPbiAxMS8xMS8yMDI0IGF0IDEzOjM2OjE1IEdNVCwgVHVkb3IgQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTAvMjUvMjQgNToxNCBQTSwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gRXZlcnkgLT5leGVjX29wKCkgY2FsbCBjb3JyZWN0bHkg
Y29uZmlndXJlcyB0aGUgc3BpIGJ1cyBzcGVlZCB0byB0aGUKPj4gbWF4aW11bSBhbGxvd2VkIGZy
ZXF1ZW5jeSBmb3IgdGhlIG1lbW9yeSB1c2luZyB0aGUgY29uc3RhbnQgc3BpIGRlZmF1bHQKPj4g
cGFyYW1ldGVyLiBTaW5jZSB3ZSBjYW4gbm93IGhhdmUgcGVyLW9wZXJhdGlvbiBjb25zdHJhaW50
cywgbGV0J3MgdXNlCj4+IHRoZSB2YWx1ZSB0aGF0IGNvbWVzIGZyb20gdGhlIHNwaS1tZW0gb3Bl
cmF0aW9uIHN0cnVjdHVyZSBpbnN0ZWFkLiBJbgo+PiBjYXNlIHRoZXJlIGlzIG5vIHNwZWNpZmlj
IGxpbWl0YXRpb24gZm9yIHRoaXMgb3BlcmF0aW9uLCB0aGUgZGVmYXVsdCBzcGkKPj4gZGV2aWNl
IHZhbHVlIHdpbGwgYmUgZ2l2ZW4gYW55d2F5Lgo+PiAKPj4gVGhpcyBjb250cm9sbGVyIGhvd2V2
ZXIgcGVyZm9ybWVkIGEgZnJlcXVlbmN5IGNoZWNrLCB3aGljaCBpcyBhbHNvCj4+IG9ic2VydmVk
IGR1cmluZyB0aGUgLT5jaGVja19vcCgpIHBoYXNlLgo+PiAKPj4gVGhlIHBlci1vcGVyYXRpb24g
ZnJlcXVlbmN5IGNhcGFiaWxpdHkgaXMgdGh1cyBhZHZlcnRpc2VkIHRvIHRoZSBzcGktbWVtCj4+
IGNvcmUuCj4+IAo+PiBDYzogU2FuamF5IFIgTWVodGEgPHNhbmp1Lm1laHRhQGFtZC5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9zcGkvc3BpLWFtZC5jIHwgMTAgKysrKysrKysrLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1hbWQuYyBiL2RyaXZlcnMvc3BpL3NwaS1hbWQuYwo+PiBp
bmRleCAyMjQ1YWQ1NGIwM2EuLmY1OGRjNjM3NTU4MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9z
cGkvc3BpLWFtZC5jCj4+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1hbWQuYwo+PiBAQCAtMzY4LDYg
KzM2OCw5IEBAIHN0YXRpYyBib29sIGFtZF9zcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0g
Km1lbSwKPj4gIAkgICAgb3AtPmRhdGEuYnVzd2lkdGggPiAxIHx8IG9wLT5kYXRhLm5ieXRlcyA+
IEFNRF9TUElfTUFYX0RBVEEpCj4+ICAJCXJldHVybiBmYWxzZTsKPj4gIAo+PiArCWlmIChvcC0+
bWF4X2ZyZXEgPCBBTURfU1BJX01JTl9IWikKPgo+IEhvdyBhYm91dCB1c2luZyBtZW0tPnNwaS0+
Y29udHJvbGxlci0+bWluX3NwZWVkX2h6IGludGVhZD8KCkdvb2QgaWRlYS4gSSB0aGluayBJIHVz
ZWQgQU1EX1NQSV9NSU5fSFogdG8gZm9sbG93IHdoYXQgd2FzIGRvbmUKc29tZXdoZXJlIGVsc2Us
IGJ1dCB0aGF0J3MgZmluZS4KCj4KPj4gKwkJcmV0dXJuIGZhbHNlOwo+Cj4gSSBmaW5kIHRoZSBj
aGVjayBmaW5lIGhlcmUsIGJ1dCBJIHNlZSBob3dldmVyIHRoYXQgYW1kX3NldF9zcGlfZnJlcSgp
Cj4gZHVwbGljYXRlcyB0aGUgc2FtZSwgcmV0dXJuaW5nIC1FSU5WQUwgd2hlbiBzcGVlZF9oeiA8
IEFNRF9TUElfTUlOX0haCgpUaGlzIG9uZSBpcyB1c2VsZXNzLCB0aGUgc3BpIGNvcmUgYWxyZWFk
eSB0YWtlcyBjYXJlIG9mIHRoaXMgY2hlY2ssIEknbGwKZHJvcCBpdCBpbiBhIHNlcGFyYXRlIHBh
dGNoLgoKPj4gKwo+PiAgCXJldHVybiBzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AobWVtLCBv
cCk7Cj4+ICB9Cj4+ICAKPj4gQEAgLTQ0Myw3ICs0NDYsNyBAQCBzdGF0aWMgaW50IGFtZF9zcGlf
ZXhlY19tZW1fb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPj4gIAo+PiAgCWFtZF9zcGkgPSBzcGlf
Y29udHJvbGxlcl9nZXRfZGV2ZGF0YShtZW0tPnNwaS0+Y29udHJvbGxlcik7Cj4+ICAKPj4gLQly
ZXQgPSBhbWRfc2V0X3NwaV9mcmVxKGFtZF9zcGksIG1lbS0+c3BpLT5tYXhfc3BlZWRfaHopOwo+
PiArCXJldCA9IGFtZF9zZXRfc3BpX2ZyZXEoYW1kX3NwaSwgb3AtPm1heF9mcmVxKTsKPj4gIAlp
ZiAocmV0KQo+PiAgCQlyZXR1cm4gcmV0Owo+Cj4gaG93ZXZlciB0aGUgcmV0dXJuIGNvZGUgaXMg
Y2hlY2tlZCBqdXN0IG9uIHRoaXMgY2FsbCwgYW5kIGNvbXBsZXRlbHkKPiBpZ25vcmVkIGluIHRo
ZSAyIG90aGVyIGNhbGxzLiBJIGZpbmQgdGhlIGNvZGUgYSBiaXQgdWdseSBmb3IgdGhlIG5vbgo+
IFNQSU1FTSBjYXNlLCBidXQgbWF5YmUgc29tZXRoaW5nIGZvciB0aGUgYW1kIG93bmVyIHRvIGFk
ZHJlc3MuCgpPbmNlIHRoZSBhYm92ZSBjaGVjayByZW1vdmVkIChpdCBkb2VzIG5vdCBtYWtlIG11
Y2ggc2Vuc2UgdGhlcmUpLCB0aGUKZnVuY3Rpb24gY2FuIHJldHVybiB2b2lkLgoKQ2hlZXJzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
