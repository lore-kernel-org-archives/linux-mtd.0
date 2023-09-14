Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E2EEDE990
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTVb5APVBU/oUU3LuwzWEAH+kMM6LaI2JW1DUA8Jves=; b=VamvErvGMN4RbO
	BxKzHRtv2VmhrBwPGRZBcRungBLVpJFkL6uzcFDMdj24ra8jJ33L8xcHcwXVCVGaACEg+ZxbSG8o4
	cCAq1oBozlp2RIuCmY049e6zAhSMFssitaaqfoH0WjuYSa0oiF8n6OBhF34w+MDvXp70LcAjMcRKT
	FFS6USmdCiyBj1Rrq+yoctBQls5+0Hi+Sp6JnWOU2gQyFB0/orN5yOy8aNPkNJKzwBti/PvBHF7vV
	dTHzJOzqGWlnls+ZLyxeqreMJz4ieVZZ9nWlhRIccHfrPFhUJod8FadiTX6hrMna7WRMeofLVNf7E
	CRC+d687vbWNWZAcRDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghjz-007i8H-0I;
	Thu, 14 Sep 2023 08:30:23 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghjw-007i6a-27
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1694680215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3QNlCsd4KrtdLCl8FujpLR9D66KZlMKVr8PFtC9Zj8=;
	b=tIBeXCzmhsYqsWsjrwpnqguwuBD5fXYC/Eb4uuoG7n3c3EEb7DyvSU4Y9dpM1IUgC0bySP
	sG97FPryrWMEsDiLl/oJcqji3jRNgnJ6zBwkJCJXtRnpV2RmtcooQ8L6WNXv9o0oMYkE9c
	SXsy27g2omhA+TmEn9Kgnnz6BYKzv5U=
Message-ID: <4de724a1630eda74f4f304dc224dc981eb3b0875.camel@crapouillou.net>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Miquel Raynal
	 <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel
 Scally <djrscally@gmail.com>,  Hans de Goede <hdegoede@redhat.com>, Mark
 Gross <markgross@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 14 Sep 2023 10:30:13 +0200
In-Reply-To: <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
References: <20230913115001.23183-1-brgl@bgdev.pl>
	 <20230913115001.23183-3-brgl@bgdev.pl>
	 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
	 <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
	 <20230913222338.07d1625b@xps-13>
	 <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_013020_863119_6FA68F08 
X-CRM114-Status: GOOD (  16.08  )
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

SGksCgpMZSBqZXVkaSAxNCBzZXB0ZW1icmUgMjAyMyDDoCAxMDowMiArMDMwMCwgQW5keSBTaGV2
Y2hlbmtvIGEgw6ljcml0wqA6Cj4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTE6MjPigK9QTSBN
aXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gbGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnwqB3cm90ZSBvbiBXZWQsIDEzIFNlcCAyMDIzIDIyOjEyOjQw
ICswMjAwOgo+ID4gPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAxMDowNeKAr1BNIEFuZHkgU2hl
dmNoZW5rbwo+ID4gPiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMjo1MOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kKPiA+
ID4gPiA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gCj4gLi4uCj4gCj4gPiA+ID4gV2h5IG5vdCBt
b3ZpbmcgdGhpcyBxdWlyayB0byBncGlvbGliLW9mLmM/Cj4gPiA+IAo+ID4gPiBUaGF0J3MgYSBi
ZXR0ZXIgaWRlYSBoZXJlIEkgdGhpbmssIGl0J3MgY2xlYXJseSBhIHF1aXJrIGZvciBhCj4gPiA+
IGJ1Z2d5IGRldmljZSB0cmVlLgo+ID4gCj4gPiBBZ3JlZWQsIGl0J3MganVzdCBmb3IgYmFja3dh
cmQgY29tcGF0aWJpbGl0eSBwdXJwb3NlcyBpbiBhIHNpbmdsZQo+ID4gZHJpdmVyLiBJIGJlbGll
dmUgaXQgc2hvdWxkIHN0YXkgaGVyZS4KPiAKPiBJIGJlbGlldmUgTGludXMgd2FzIGZvciBtb3Zp
bmcuCgpXaGljaCBMaW51cz8gQmVjYXVzZSB0aGUgb25lIHdobydzIGFsc28gdGhlIGdwaW8gbWFp
bnRhaW5lciBqdXN0IHdyb3RlCmFib3ZlIHRoYXQgaXQgd2FzIGJldHRlciB0byBrZWVwIGl0IGlu
IHRoZSBkcml2ZXIuCgpDaGVlcnMsCi1QYXVsCgo+IAo+IGdwaW9saWItb2YuYyBjb250YWlucyBh
IGxvdCBvZiBxdWlya3MsIGluY2x1ZGluZyB0aGlzIG9uZS4gQ2FsbGluZwo+IHRoZXNlIG5ldyAo
b3Igb2xkKSBBUElzIGZvciBvdmVycmlkaW5nIHBvbGFyaXR5IGluIG1hbnkgY2FzZXMKPiBzaG91
bGRuJ3QgYmUgbmVlZGVkIGlmIHdlcmUgbm8gaXNzdWVzIHdpdGggRFQgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
