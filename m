Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4EFC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBAj0aR/4TmeHyVCRL2XshkVokclTcgGDjkHJbahFdE=; b=eleYMiA5gJSqYB
	35uWescegmtpELZE/at1SW5P6v2ay03zbFlxVT06h6qiRSpuDabQ7/SBDXMT/Mv4Ba7hvbBV72KBr
	gvFot+YTj+HkrFMDAfVSmn8ZCrzMD1OeIL4DsjYpJ37nOLAe0Oolt+JT8jdRuM5dUQjsCYC+O9UjC
	N0zcT4b6BIHLqrmbhOBDdbBH65AucuwFFFQrWeyvkd76LSvJPr2jOHxVQIwunSkqyFj5YQfumdRGX
	/UQXJvDvRyNsvR5XrBoIjo93yAdSYhXT1iQXbPZ35fuPykKrVEIyA9+VfONapA804yQmRGR8cddsp
	NE56Mg4Sjwps+M5u78Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG4G-001JvN-Qx; Thu, 24 Feb 2022 15:30:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNG4D-001Jsh-Gi
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 15:30:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6BBEFF81B;
 Thu, 24 Feb 2022 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645716600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLDYXb9hrlljs1/QTRBzSDTSgQfcN0kZKSo1IOtS6bw=;
 b=UzOe+jF1LeYx1ig368vp+H8eu0DVEoC7y/B8ja01GYIU3LzN2Tr6XxmZLA6RGbNU20mfsE
 /eDJFCitIiuBq5CobXKjW3JPKKrBUFb7O/DJK+SRh+xptMW1E814O9JzHVlea0E0pYPPwj
 5EC/dDCi/vpOaXTFqR6XnVe44kJyZTbyVGMgG/bDEuzJW8UFI2JkB3WA7ch8MFtp2Z7nDZ
 CQ8jGSzhp3Fhge6h5s1tHZ6N/JGkEWIszmiL9AgvFeuDSBU6l+KjvBvZKPIdPeUmavZc4a
 /jZotSB6v1bJm7sev0S7P5BcwLgnMEbpYj5zmPWzqL9+56MD8USZ5B0OH4ZwUg==
Date: Thu, 24 Feb 2022 16:29:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel =?UTF-8?B?R2zDtmNrbmVy?= <dg@emlix.com>
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org, Lothar
 =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <20220224162958.184079e4@xps13>
In-Reply-To: <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_073005_974525_0A856B83 
X-CRM114-Status: GOOD (  12.85  )
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

SGkgRGFuaWVsLAoKZGdAZW1saXguY29tIHdyb3RlIG9uIFdlZCwgMjMgRmViIDIwMjIgMTE6NTk6
MDIgKzAxMDA6Cgo+IEFtIDIyLjAyLjIyIHVtIDIzOjAyIHNjaHJpZWIgSGFuIFh1Ogo+ID4gT24g
MjIvMDIvMjEgMDg6MDBQTSwgRGFuaWVsIEdsw7Zja25lciB3cm90ZTogIAo+ID4+IHdlIGFyZSB1
c2luZyBVQkkgb24gYSBOQU5EIGZsYXNoIHdpdGggQkJUIGFuZCBoYXZlIHJlY2VudGx5IG9ic2Vy
dmVkCj4gPj4gYmFkIGJsb2NrcyB3aGVyZSBuYW5kX21hcmtiYWRfYmJtIHJldHVybnMgYW4gZXJy
b3IuIFNpbmNlIHRoYXQgZXJyb3IgaXMKPiA+PiByZXR1cm5lZCBieSBuYW5kX2Jsb2NrX21hcmti
YWRfbG93bGV2ZWwgZXZlbiB3aGVuIG1hcmtpbmcgdGhlIGJsb2NrIGluCj4gPj4gdGhlIEJCVCBz
dWNjZWVkcywgVUJJIGdvZXMgaW50byByZWFkLW9ubHkgbW9kZS4gV2Ugd291bGQgdGhlcmVmb3Jl
IGxpa2UKPiA+PiB0byBzZXQgTkFORF9CQlRfTk9fT09CX0JCTS4gIAo+ID4gCj4gPiBDb3VsZCB5
b3UgcGxlYXNlIGRlc2NyaWJlIG1vcmUgZGV0YWlscyBhYm91dCB3aGF0IGtpbmQgb2YgZXJyb3Is
IGhvdyB0bwo+ID4gcmVwcm9kdWNlIGl0IGFuZCBvbiB3aGljaCBrZXJuZWwgdmVyc2lvbj8gIAo+
IAo+IFlvdSBuZWVkIGEgZmxhc2ggdGhhdCBoYXMgb25lIGJhZCBibG9jayB3aGVyZSBwcm9ncmFt
bWluZyB0aGUgQkJNIHNldHMKPiBOQU5EX1NUQVRVU19GQUlMIGluIGl0cyBzdGF0dXMgcmVnaXN0
ZXIuIFRoZSBsYXRlc3Qga2VybmVscyBzaG91bGQgc3RpbGwKPiBoYXZlIHByb2JsZW1zIHdoZW4g
dGhpcyBoYXBwZW5zIGluIGEgVUJJLgoKSSBiZWxpZXZlIHdlIHNob3VsZCB0cnkgdG8gdGFja2xl
ICJ3aHkiIHRoaXMgaGFwcGVucyBtb3JlIHRoYW4gdHJ5IHRvCndvcmthcm91bmQgaXRzIGNvbnNl
cXVlbmNlcy4gQ2FuIHlvdSBnaXZlIG1vcmUgZGV0YWlscyBhYm91dCB3aHkgd2UgZ2V0CnRoaXMg
c3RhdHVzPwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
