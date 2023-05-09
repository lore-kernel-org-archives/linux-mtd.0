Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A237C77B75
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 07:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw3X5edUzXHD9Y+BeflQs5yma3kTCFimUudnTSnlPcE=; b=jb6V/PQJ6j3lD8
	m7iEneav53Jm9IXsD93RcURL7lQM98ovpTUwbQ5/8jdNvsphSR6/Va327ikDVe6hzWVTIuepkKNUK
	xy3AdEdRzry1qIBP6ke+1ylyXSF9TNXU9CISsxyQ5s9OVYrBLVGxNJDHBa8UZRAHnxWxYlz8QJT5r
	WB75o2ZDLBpeKPsVG3aDiDa7drQAUVRkMz9ychX/FZJsGpYlVFEsGFPYmBKz2FVgkTgjsugVbAf+y
	XcNs1JeCmXjfy8oGZu/zMul/glgvtwDu4oRBW94CE6w9wR75wwv7+Pz+L9mJ+oIJyuvSa0w5voNte
	2AlvO3tDYhyretabIBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwHp2-002WRI-0E;
	Tue, 09 May 2023 07:31:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwHox-002WPM-1J;
	Tue, 09 May 2023 07:31:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA47D20003;
	Tue,  9 May 2023 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683617494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=thBpxMdTvuKvVReNZXCUnuLFIZgJ3012Hq4MQ7xruTE=;
	b=jnrKyy4p05PGCckAgNbRnBNkw0Vhzx7U5n6NKTWD1CHpwFh96TVqS5zeSI56jqu/jOLsKM
	YSHaT5zzQMfuJWUJ27+DS1Q05Qc0W4epsxY4g9goiSTJyY4A+i/PZAKnEDOv1Yu6dvalsQ
	KGTzAfQZGyW0Tv1TmCw0SAF3mafX5ralBv7hlYtLovCdcZDYF2ULz1SJuRihe9ex/DOhe0
	BcU4cEA6oyambZ1C9x1t+OAcgl8Lcc1eVA3oqGsLFxlgI5UG2jPXu4Cy0EQxWKqXhOWr89
	3RIYcFYDNpFXJMCJw43QW44yQK+WSRjvIQDXERbH7DT7bFQpoTQa1T5sN45Lfg==
Date: Tue, 9 May 2023 09:31:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFm?=
 =?UTF-8?B?YcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add SEAMA partition types
Message-ID: <20230509093129.40b30c7a@xps-13>
In-Reply-To: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_003139_738269_722D0CE5 
X-CRM114-Status: GOOD (  14.09  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gU2F0LCAwNiBNYXkg
MjAyMyAxNzoyOTo0MyArMDIwMDoKCj4gVGhpcyB0eXBlIG9mIGZpcm13YXJlIHBhcnRpdGlvbiBh
cHBlYXIgaW4gc29tZSBkZXZpY2VzIGluCj4gTkFORCBmbGFzaCwgc28gd2UgbmVlZCB0byBiZSBh
YmxlIHRvIHRhZyB0aGUgcGFydGl0aW9ucwo+IHdpdGggdGhlIGFwcHJvcHJpYXRlIHR5cGUuCj4g
Cj4gVGhlIG9yaWdpbiBvZiB0aGUgIlNFQXR0bGUgaU1BZ2UiIGlzIHVua25vd24uCgpJIGRvbid0
IHNlZSBhbnkga2VybmVsIGNoYW5nZXMsIHdoeSBkbyB3ZSBuZWVkIGFuIGFkZGl0aW9uYWwgYmlu
ZGluZz8KCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgo+IC0tLQo+IExpbnVzIFdhbGxlaWogKDIpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBt
dGQ6IEFkZCBTRUFNQSBwYXJ0aXRpb24gYmluZGluZ3MKPiAgICAgICBBUk06IGR0czogYmNtNTMw
MXg6IEFkZCBTRUFNQSBjb21wYXRpYmxlcwo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9zZWFtYS55YW1sICB8IDUwICsrKysrKysrKysrKysrKysrKysrKysKPiAg
YXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOTQtZGxpbmstZGlyLTg4NWwuZHRzICAgICAgfCAgMSAr
Cj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0LWRsaW5rLWRpci04OTBsLmR0cyAgICAgIHwg
IDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNv
bW1pdDogY2FhZDcxZTdkMjI2OTIwNjIzZDc4YmUyZTYyODM1MTZkZWNkYzUwMgo+IGNoYW5nZS1p
ZDogMjAyMzA1MDYtc2VhbWEtcGFydGl0aW9ucy1iNjIwMTE3Yjk5ODUKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
