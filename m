Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF0EB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 13:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJihQtOtZNcJ297ymisLPVMYqj8Ar8xZowU0Phe1jWQ=; b=4hU3QwRdBACw+b
	xuiBxBOcXw4ddzO3YRZV61CJtkYc342s8Pk+A3yf+VE3pCx4yMmimWIO+xTKsO9g0hTVboOuxWgG8
	56u7nA5radcEXcDHpUnQW0G6hNNyHyRto1A55NGt2URN5iw2cpURYWDbQa1J4UHx3gekvtfg9R1HN
	RdIJ1az/Z6rghlewRELkoDwaB4GypUw2KqRhOeXbrxFNB/2cJHT66/Da/h8fBV2AGLvrJXEe0HDmV
	7pW08C8MAIpPOR6am7puRPSB/r/nXpVl3EYkTdCyKxAZa4xoCGMUvKIpSNUeeGa6r0yUsgTEL4UUd
	PNdOb3mY0U2VeqrcZuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1yP-00BXYf-0d;
	Sun, 16 Jul 2023 13:39:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1yK-00BXVl-2q
	for linux-mtd@lists.infradead.org;
	Sun, 16 Jul 2023 13:39:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73B13FF803;
	Sun, 16 Jul 2023 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689514772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+Ra7hhWn4EfJmcCYNqGxmHIKNgocGUiVSclQOBGyr0=;
	b=TATS50ECcuWRq/ij6HzuVA/IsJPYGVabBk7H0NVhcWXwNNnLguKQ66Bg/HVUm9eIZ8g+tH
	nG0LZxgyKB5XqR4zyeZoeg2LVxmpgXh0MO7D7qNa8Viq3Ymb2/P5m6myw5cv4dBsJM4mxz
	rlNS5KUA0aSs/E5gsEzlZz5b1oTo4zfuwMNTRGUWsgcKg5WjjfJZ7ngLp8dzbhNriPaUHj
	RQ2zDxGDDqSf7euqtKLz5JOhbVX1M5sS7qpYV7rEfNwzKroGi3cYoofNiMVX0MqFdrvIzF
	QDNZh0YhkJ3sQLwTsUo77wdwq2sd5vbt6nNQeAJEgCrQDeSl/5TRpZJf6ktb6w==
Date: Sun, 16 Jul 2023 15:39:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Lubart, Vitaly"
 <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 1/2] mtd: use refcount to prevent corruption
Message-ID: <20230716153926.5e975231@xps-13>
In-Reply-To: <CY5PR11MB63666C8DA33C93E1DC3BCB21ED3AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
	<20230620131905.648089-2-alexander.usyskin@intel.com>
	<TYWPR01MB87756794A30EB389AB017EB1C234A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
	<20230715174112.3909e43f@xps-13>
	<CY5PR11MB63666C8DA33C93E1DC3BCB21ED3AA@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_063937_075030_9BEA8AFB 
X-CRM114-Status: GOOD (  11.70  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFN1biwg
MTYgSnVsIDIwMjMgMDY6Mjk6MDIgKzAwMDA6Cgo+ID4gPiBXaXRoIHRoaXMgcGF0Y2ggYXBwbGll
ZCwgd2hlbiBJIGxvYWQgdXAgdGhlIG1vZHVsZSwgSSBnZXQgdGhlIHNhbWUgMwo+ID4gPiBkZXZp
Y2VzOgo+ID4gPiAvZGV2L210ZDAKPiA+ID4gL2Rldi9tdGQwcm8KPiA+ID4gL2Rldi9tdGRibG9j
azAKPiA+ID4KPiA+ID4gVXBvbiByZW1vdmFsLCB0aGUgYmVsb3cgMiBkZXZpY2VzIHN0aWxsIGhh
bmcgYXJvdW5kOgo+ID4gPiAvZGV2L210ZDAKPiA+ID4gL2Rldi9tdGQwcm8gIAo+ID4gICAKPiBP
dXIgdXNlLWNhc2UgZG8gbm90IHByb2R1Y2UgbXRkYmxvY2ssIG1heWJlIHRoZXJlIGFyZSBzb21l
IGltYmFsYW5jZXMgb2YgZ2V0L3B1dD8KPiBJIGhhdmUgc29tZXdoZXJlIHZlcnNpb24gd2l0aCBw
cl9kZWJ1ZyBhZnRlciBldmVyeSBrcmVmX2dldC9wdXQuIFRoYXQgbWF5IGhlbHAgdG8gY2F0Y2gg
d2hlcmUKPiBpdCBtaXNzZWQsIEkgaG9wZS4KCkkgYmVsaWV2ZSBtdGRibG9jayBpcyB0aGUgZ29v
ZCBjaXRpemVuIGhlcmUuIEp1c3QgZGlzYWJsZQpDT05GSUdfTVREX0JMT0NLIGZyb20geW91ciBj
b25maWd1cmF0aW9uIGFuZCB5b3Ugd2lsbCBsaWtlbHkgb2JzZXJ2ZQp0aGUgc2FtZSBpc3N1ZSwg
anVzdCBhIGJpdCBuYXJyb3dlZCwgcGVyaGFwcy4gSW5kZWVkLCBpZiB5b3UgbWFuYWdlIHRvCmZv
bGxvdyBhbGwgdGhlIGdldC9wdXQgY2FsbHMgaXQgY2FuIGhlbHAgdG8gZmluZCBhbiBpbWJhbGFu
Y2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
