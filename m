Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B14C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdgJfh6B+zidYda7XVbFY79fDF5Ojm0/qQcnmUhoopE=; b=RWrQ2VnjDPNLcK
	9En8mGDXEKksi3lywkVwtctWVftrSPn0j5pH/sDlIP2ukGNUX3BrFePZnOFrAtPAUFeOUAgxnL2Es
	pLqrYqgckYU6NGKtw7GKzgF0jEI6W6/sl1wdLTigHkiH3a4Ab0wO+K8LgBoSRj1V2wAnvPSBvOcq4
	C8eUb5O7l4t2vMaaRJI3KNkSL4PCncK4S95bUfYHvsFVBAatP3oy0/8uVXW/p8GM9bw9xyg8EdI9I
	o2fe7LrghirUyk9MXz2j3CGPcseLuf6s5sIxa6F4AWdRmpYFzAL0Rrts7EvhFpS/nI3XnOm5ta+Lo
	tOLoMZleOh0b7fc+T9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsDU-00APot-06;
	Wed, 06 Dec 2023 13:45:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsDQ-00APoD-2l;
	Wed, 06 Dec 2023 13:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 59251B81F7D;
	Wed,  6 Dec 2023 13:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4B2C433C8;
	Wed,  6 Dec 2023 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701870326;
	bh=OOXRFN1r525T5U/njmTicMNcjvpIFxjy3A/HJdvfhfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMJkqtlg1H/lfcxRidEk7JS2+6JHsSK8Oaipk5bLara6T7MNPhJC5VKPOjx+SdPno
	 uCWxbS/TJs4f1gWuxZaeIOW5th2aEFpvQW+ZfG1wYPG3+aGkgOk6PL04zy4ogMMzHa
	 Z/8+KlmxPAFiM+m3P77xxqPF/sqPECISOroDNxmuAQcwNidGj8XcM2g8hxB5TxyhI5
	 TiOGQVFmnoACjmtlMexS14HQGlqjYOp3G92DQhq1DYKE/GaNESYN+tO+JaIRg61lrJ
	 Kd7vldTl89+fLxEoXKq9BpOq5YbQu60A3cz+84jEz5gyXwM2Uuvzt0l4cMkDwUW7lo
	 gTVdXRPV9JMBA==
Date: Wed, 6 Dec 2023 13:45:18 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: (subset) [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to
 access spi->chip_select
Message-ID: <20231206134518.GE3375667@google.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
 <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_054529_036212_A501F58C 
X-CRM114-Status: GOOD (  11.26  )
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

T24gRnJpLCAwMSBEZWMgMjAyMywgTWFyayBCcm93biB3cm90ZToKCj4gT24gRnJpLCBEZWMgMDEs
IDIwMjMgYXQgMDk6NTc6MzZBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gU2F0LCAy
NSBOb3YgMjAyMyAxNDo1MToyOCArMDUzMCwgQW1pdCBLdW1hciBNYWhhcGF0cmEgd3JvdGU6Cj4g
PiA+IEluIHByZXBhcmF0aW9uIGZvciBhZGRpbmcgbXVsdGlwbGUgQ1Mgc3VwcG9ydCBmb3IgYSBk
ZXZpY2UsIHNldC9nZXQKPiA+ID4gZnVuY3Rpb25zIHdlcmUgaW50cm9kdWNlcyBhY2Nlc3Npbmcg
c3BpLT5jaGlwX3NlbGVjdCBpbgo+ID4gPiAnY29tbWl0IDMwM2ZlYjNjYzA2YSAoInNwaTogQWRk
IEFQSXMgaW4gc3BpIGNvcmUgdG8gc2V0L2dldAo+ID4gPiBzcGktPmNoaXBfc2VsZWN0IGFuZCBz
cGktPmNzX2dwaW9kIiknLgo+ID4gPiBSZXBsYWNlIHNwaS0+Y2hpcF9zZWxlY3Qgd2l0aCBzcGlf
Z2V0X2NoaXBzZWxlY3QoKSBBUEkuCj4gCj4gPiBBcHBsaWVkLCB0aGFua3MhCj4gCj4gPiBbMDEv
MTBdIG1mZDogdHBzNjU5NDogVXNlIHNldC9nZXQgQVBJcyB0byBhY2Nlc3Mgc3BpLT5jaGlwX3Nl
bGVjdAo+ID4gICAgICAgICBjb21taXQ6IGRkNjM2NjM4NDQ2Yzg3Yzk1YzViZWRkY2QzNjdkOTVh
YzY3NjRjNmMKPiAKPiBJcyB0aGVyZSBhIHNpZ25lZCB0YWcgYXZhaWxhYmxlIGZvciB0aGlzIC0g
d2l0aG91dCB0aGlzIGNoYW5nZSB0aGUKPiBzdWJzZXF1ZW50IFNQSSBjaGFuZ2VzIGludHJvZHVj
ZSBhIGJ1aWxkIGJyZWFrYWdlLgoKTm90IHlldCwgYnV0IEkgY2FuIGdldCBhcm91bmQgdG8gbWFr
aW5nIG9uZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
