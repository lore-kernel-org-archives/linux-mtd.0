Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576B8C61DB6
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InDI7BMjUigKJ1+3rsiDyH6jva2avfCJ9vRrCD2BkW4=; b=XlavHl56KpQO/L
	cxNJBRwYlI2AuYTl1hQhxfO2BszgITRi2Ay84Qfc3eR9vOkb2r4W3JoSge+W3kPvbjTPdsqkQFH6K
	hAqLjCX3g+IWG8HkuheKuP6z5L7MHjg04BhMOWuRmH5k5N/IyvbbRZ7zYe3YDjeQ9/9X66xWtzmit
	7s7xkpyqUtY6kdCKN6vHk2aRgP26uZRzvjN34ud/vucfzQ1FR2QM1sLfznfTg5QI4lVB10Aw9btIs
	PArfqGEQeXm6HCxrP/8bSz5ErbooiPcnge49eb1TrHOB/+pThrIOaHUsK0x0KMkxIQE/cQJ3Ng96b
	SxRMuu/7amRhw3SZBCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn9k-00000000SBJ-0CfG;
	Tue, 25 Aug 2026 09:09:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn9g-00000000SAo-3F5r
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 09:09:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C3AC14E412E5;
	Tue, 25 Aug 2026 09:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96F1C604C4;
	Tue, 25 Aug 2026 09:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 396CB11C7A247;
	Tue, 25 Aug 2026 11:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787648948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Elys4dNv6mqSI4zLl4ODog5miDdDALJ+akBka8bjTnM=;
	b=A5of0bdADpnmAu5Ugp7H77N3jL3Ky4XLopUo5WtD2WJsCS/Ga1fA9+AMhix/LwG+67GYiD
	pWW1PA6r768rgprxS7/u8dmqGollAG+V1Xg9XDCWG6tKDI34fvikiOQDzEF5vdEH6eDmQn
	EVayH1JAU7xOO4X+NGJbe6xl5AsxfO2qadJIitM4wgud97Z0NJGgP/0GinSMOg7O4qtq4y
	u3mDOFLAYmsyIVStDo2x9RYwYRB1xRqoqYOdG/6ng9OA/y16iBQrP06j6EY9/lvaewDDgp
	XPrLhSlHHvywjAsw6CGLvQuwvBUZz7aXQqdeqgGHGzgFGnWdXvfIfxG1ZIlMMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Huasin Liao <huasinliao@gmail.com>
Cc: asmadeus@codewreck.org,  vigneshr@ti.com,  richard@nod.at,
  tudor.ambarus@linaro.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  huasin.liao@airoha.com
Subject: Re: [PATCH] mtd: spinand: winbond: add support for W25N04LV
In-Reply-To: <20260816165614.16262-1-huasinliao@gmail.com> (Huasin Liao's
	message of "Mon, 17 Aug 2026 00:56:14 +0800")
References: <aoGcpsZFxXdtkspZ@codewreck.org>
	<20260816165614.16262-1-huasinliao@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 11:09:03 +0200
Message-ID: <874igik1n4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_020916_977914_1795832E 
X-CRM114-Status: UNSURE (   8.26  )
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

Cj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyB3MjVuMDRsdl9vb2Js
YXlvdXQgPSB7Cj4+PiArCS5lY2MgPSB3MjVuMDRsdl9vb2JsYXlvdXRfZWNjLAo+Pj4gKwkuZnJl
ZSA9IHcyNW4wNGx2X29vYmxheW91dF9mcmVlLAo+PiAKPj4gRldJVywgdGhlc2UgdHdvIGFyZSB0
aGUgc2FtZSBhcyB3aGF0IEkgY29uc29saWRhdGVkIGluCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNjA4MTQtdzI1bjA0bHctdjMtMS1jNmE3NDIzYWM3ZDBAYXRtYXJrLXRlY2huby5j
b20KPj4gdXNpbmcgb29ic2l6ZSwgc28gd2UgcHJvYmFibHkgd2FudCB0byByZXVzZSB0aGF0IGhl
cmUgdG9vCj4KPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBhbmQgZ29vZCB0byBzZWUgTWlxdWVs
IGlzIGZpbmUgd2l0aCByZXVzaW5nCj4gdzI1bjAya3Zfb29ibGF5b3V0LiBPbmNlIHlvdXIgcGF0
Y2ggbGFuZHMsIEknbGwgcmViYXNlIG9uIHRvcCBvZiBpdAo+IGFuZCBzd2l0Y2ggZnJvbSB3MjVu
MDRsdl9vb2JsYXlvdXQgdG8gdzI1bjAya3Zfb29ibGF5b3V0IOKAlCBpcyB0aGF0IGluCj4gbGlu
ZSB3aXRoIHdoYXQgeW91J2QgZXhwZWN0PwoKSSBndWVzcyBzbywgdGhhbmtzIQoKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
