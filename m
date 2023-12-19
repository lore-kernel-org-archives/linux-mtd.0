Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7863C46CCD
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsQPfJZPkS+zdRSc6fDeOGJRjirxrtTplZS+56Cbjqs=; b=Jo7m5/rP1mlUeY
	TbzT5o40BmbalBzskNYMFV31d8mNoQkJk0HwdKaNQ7rqqsnrDbEP4vfDkFOUHdtfG3FUEY9U4wfRf
	kwcxYVHfQwgVD+Ze2T/KuAYMJA/asK2DW1qKgcFPctC8Dhnpaw+uzoS8QcMYKqokhMPFYeYqgKn93
	fcsoqQaig4jg+9a7iNH6ffimr62+h+LccaTm2F1NpXIUFhs3rVTUenCgEcsmut30b2ka7LpFVo+21
	Mh7zVZ286+/HahZfSwJ3JcQPx8zQGSob7UFJBMJa71LGX67x7rrUs+b/mtMDjsxfMv7/AO/tbIra+
	W+i7Qq1daje3OVupT1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZe3-00E6KN-2D;
	Tue, 19 Dec 2023 12:56:23 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZdx-00E6FO-1B;
	Tue, 19 Dec 2023 12:56:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B05331C0002;
	Tue, 19 Dec 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702990575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfihV3HBWwPmuo9TrablG1cbbK4ITqKhYvZMqM/qu5U=;
	b=Zzn1AVGguZ3meU4seI1CzCwf2MQp2aupVvxMymiPTRC4z+QjszmSf7uJBr7aVjxNfLV+be
	/fk9reA8Bof/j0BGaeCImI/6gjEDWHFns5Y27/HJefdlDDv8dpSHe4bgK3H/UjAB6YLy5F
	U/oQ+Z3+GsOEYkhaysb8hztxdO/XtKt+38tpXKffPvcgrS+R1UAvPEZ+V4W7O+iFb3HfGo
	TVZyIW7dbdiXlqtMbCDuehuj8yH8/3hClf0t9LGNxXj46rcCrkeKFZZq9eI6DAAQX2ctvU
	TDEzgAuAxqAw4iMTvuNFxhBrF6wjQgHWw53yqCcKjI36LztsuYfEqfcebPh75A==
Date: Tue, 19 Dec 2023 13:56:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH v6.8 2/2] nvmem: drop nvmem_layout_get_match_data()
Message-ID: <20231219135614.57fd14f3@xps-13>
In-Reply-To: <20231219120104.3422-2-zajec5@gmail.com>
References: <20231219120104.3422-1-zajec5@gmail.com>
	<20231219120104.3422-2-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_045617_566321_BF31F0DC 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDEz
OjAxOjA0ICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhhbmtzIGZvciBsYXlvdXRzIHJlZmFjdG9yaW5nIHdlIG5vdyBoYXZlICJzdHJ1Y3Qg
ZGV2aWNlIiBhc3NvY2lhdGVkCj4gd2l0aCBsYXlvdXQuIEFsc28gaXRzIE9GIHBvaW50ZXIgcG9p
bnRzIGRpcmVjdGx5IHRvIHRoZSAibnZtZW0tbGF5b3V0Igo+IERUIG5vZGUuCj4gCj4gQWxsIGl0
IHRha2VzIHRvIGdldCBtYXRjaCBkYXRhIGlzIGEgZ2VuZXJpYyBvZl9kZXZpY2VfZ2V0X21hdGNo
X2RhdGEoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
