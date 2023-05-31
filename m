Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B317C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDR+4G9ZgPkeOiO9WEsWdU+NYjvaS2SNvFS9RkmlNeU=; b=uOb4gUti3vCK/A
	6Jr1wbRYVimvGzY8fC/gOX3lrvBqZX/qIPYVIPMJPAT9MqFanV+UblhCMI7Jbh4IwoMduVDn2Vdfc
	bRXDfX+x1MMjw+PZtO0cnRFGLjKM+xyUzOuaYDCFHniO2MXp6pliAaPn1NIWJRH6hlNYSKZppmVu1
	hyZSb377/GTIaePjslRe63gO4+OM8rV4dQm7lO5XWRep7htAX55Q78/neE6gsLlsH14buRRNWlEOr
	npT65Oyf3v6Mn+K51X+47nG+ri71ucHFqip2CQEuA8RUqW/ihSlO+XuVZ/AuNvZ5zSNgDL6lZZqtC
	NvMkHQ++ecQOYrF+DFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GMu-00GSvv-15;
	Wed, 31 May 2023 07:35:40 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GMp-00GSrD-2b;
	Wed, 31 May 2023 07:35:38 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685518530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWtlFYzuHfQ3SlMfLkKb18GwFkwsJ5XNHKhR+KU6DsM=;
	b=I7lq4Ksn1hRLvrMAyPj7jTH0rXUWpa2y8sb11pCvfqi3hVSwuYZy8VjaAQKZIs9sF77P+L
	eib0ELs21oehsVa9MWbsXnKFAn82tJcFRc4HQySI1g3tKTJ+EInI0Mka7bHs13JiFEr/+8
	1sV9wggKRt3sbgTKIye5bjqasRH7gVhhMhATppUpfCbCpZXIS7MZgLjfMIDf6ty8ewQly/
	RMoIT877U92v9B9qlPKKkEegNyjYbG2ZMP85fMmeDb9K6XIKcreB2dA+JU9kt0lnjNUUdV
	G6B+RZkEDNxjEwAQ1qNfOPP12mBbkQYgkfCdFoCeTyPMma4hwfDLA3/0X5lsMQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39439E0016;
	Wed, 31 May 2023 07:35:27 +0000 (UTC)
Date: Wed, 31 May 2023 09:35:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com
Subject: Re: [PATCH v7 2/4] ARM: dts: mvebu: align MTD partition nodes to
 dtschema
Message-ID: <20230531093526.1fe2acb3@xps-13>
In-Reply-To: <20230530235456.1009082-3-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
	<20230530235456.1009082-3-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_003536_147382_6C6F8278 
X-CRM114-Status: GOOD (  12.69  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gV2Vk
LCAzMSBNYXkgMjAyMyAxMTo1NDo1NAorMTIwMDoKCj4gVXBkYXRlIHRoZSBub2RlIG5hbWVzIGZv
ciB0aGUgU1BJIE5PUiBhbmQgTkFORCBwYXJ0aXRpb25zIHRvIGNvbmZvcm0gdG8KPiB0aGUgcGFy
dGl0aW9uIHByb3BlcnRpZXMgaW4gdGhlIHJlbGV2YW50IGR0c2NoZW1hLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4K
ClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
PiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXJtYWRhLTM4NS1hdGwteDUzMC5kdHMgfCAxNCAr
KysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hcm1hZGEtMzg1LWF0
bC14NTMwLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FybWFkYS0zODUtYXRsLXg1MzAuZHRzCj4g
aW5kZXggMjQxZjVkN2M4MGU5Li41YTlhYjg0MTBiN2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvYXJtYWRhLTM4NS1hdGwteDUzMC5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9hcm1hZGEtMzg1LWF0bC14NTMwLmR0cwo+IEBAIC0xNzksMTkgKzE3OSwxOSBAQCBwYXJ0aXRp
b25zIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAgCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDE+Owo+IC0JCQlwYXJ0aXRpb25A
dS1ib290IHsKPiArCQkJcGFydGl0aW9uQDAgewo+ICAJCQkJcmVnID0gPDB4MDAwMDAwMDAgMHgw
MDEwMDAwMD47Cj4gIAkJCQlsYWJlbCA9ICJ1LWJvb3QiOwo+ICAJCQl9Owo+IC0JCQlwYXJ0aXRp
b25AdS1ib290LWVudiB7Cj4gKwkJCXBhcnRpdGlvbkAxMDAwMDAgewo+ICAJCQkJcmVnID0gPDB4
MDAxMDAwMDAgMHgwMDA0MDAwMD47Cj4gIAkJCQlsYWJlbCA9ICJ1LWJvb3QtZW52IjsKPiAgCQkJ
fTsKPiAtCQkJcGFydGl0aW9uQHVudXNlZCB7Cj4gKwkJCXBhcnRpdGlvbkAxNDAwMDAgewo+ICAJ
CQkJcmVnID0gPDB4MDAxNDAwMDAgMHgwMGU4MDAwMD47Cj4gIAkJCQlsYWJlbCA9ICJ1bnVzZWQi
Owo+ICAJCQl9Owo+IC0JCQlwYXJ0aXRpb25AaWRwcm9tIHsKPiArCQkJcGFydGl0aW9uQGZjMDAw
MCB7Cj4gIAkJCQlyZWcgPSA8MHgwMGZjMDAwMCAweDAwMDQwMDAwPjsKPiAgCQkJCWxhYmVsID0g
ImlkcHJvbSI7Cj4gIAkJCX07Cj4gQEAgLTIxNiwxNiArMjE2LDE2IEBAIHBhcnRpdGlvbnMgewo+
ICAJCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ICAJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiAgCQkJI3NpemUtY2VsbHMgPSA8MT47Cj4gLQkJCXBhcnRpdGlvbkB1c2VyIHsK
PiArCQkJcGFydGl0aW9uQDAgewo+ICAJCQkJcmVnID0gPDB4MDAwMDAwMDAgMHgwZjAwMDAwMD47
Cj4gIAkJCQlsYWJlbCA9ICJ1c2VyIjsKPiAgCQkJfTsKPiAtCQkJcGFydGl0aW9uQGVycmxvZyB7
Cj4gKwkJCXBhcnRpdGlvbkBmMDAwMDAwIHsKPiAgCQkJCS8qIE1heGltdW0gbXRkb29wcyBzaXpl
IGlzIDhNQiwgc28gc2V0IHRvIHRoYXQuICovCj4gIAkJCQlyZWcgPSA8MHgwZjAwMDAwMCAweDAw
ODAwMDAwPjsKPiAgCQkJCWxhYmVsID0gImVycmxvZyI7Cj4gIAkJCX07Cj4gLQkJCXBhcnRpdGlv
bkBuYW5kLWJidCB7Cj4gKwkJCXBhcnRpdGlvbkBmODAwMDAwIHsKPiAgCQkJCXJlZyA9IDwweDBm
ODAwMDAwIDB4MDA4MDAwMDA+Owo+ICAJCQkJbGFiZWwgPSAibmFuZC1iYnQiOwo+ICAJCQl9OwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
