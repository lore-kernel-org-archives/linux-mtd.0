Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D96C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 07:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDZBzM2JuG01FrivAQaY89LtnEitQI4+CnLPXhRpYcY=; b=3aeyAnOxVeZqC8
	+f9SB+CqD163Yf/Ja+V5hT1CD2BocF3ArHPrDMiV80liNOuUXhAUSBx0hF+hdaNm3OQyXao0pW6+t
	iHFJr82rHrQ7ZoHboXsC+GKAulXnCfxRQMM1Grn5dpl5UOsbYmMQFnwwJ4d1AB9CS9JGP2OXcHE8h
	IDUnyu1Gb72ybEHvvzJ2yRg1/XxnWTbrxZhMUUJODDRiCP8cLOmpsHEINmBporSdz8yTdbXZ+yWQB
	0StdpjqdlCxQnrS7B4669Oaf+RVVuc29PVtiK08qiAqpfV1pTAzyclyP9ldpEPVhkwKPgQoJ8obd9
	AtB3zsajhHeOBvFR9TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMum-00A7YK-IQ; Thu, 07 Apr 2022 07:50:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMuf-00A7UJ-Kq
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 07:50:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6978B1BF211;
 Thu,  7 Apr 2022 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649317836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3OKhDZjreANiVSmqGGydRlnuMvAyPh4lgkQf8qUzg0=;
 b=lbtPsVZh6pq8voIez1V3yyAVlwyeVvrW5AZPImqzhrKXA0Fs1VZdJSAC20WEn07jN+p5qs
 fqjG2u8aD9ecWbRdUFoWRPUuPqtQ1VatzY31Yb+osfn1aVFg9fMWTxSaLayz9rKyUWsu0L
 07RgQ3oWzMyWW+h4fQ6yXIDb/tgVbMVxEsLtOKPd/ZwggE9xivqh1FiEHBuexygaAOLBmJ
 chGkOGe2VjEyCbMV+jijOFQwMpY8RnEaY1ozfPH8GwdeCrliiiIvBpAWzjizzgJK/L0HQ2
 tqv7nzFtRgfCaDh5+PKEYNQ1haC1PFbZI3wks5CkvlNr01MgIL69UuA3G6hFsg==
Date: Thu, 7 Apr 2022 09:50:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Felix Matouschek <felix@matouschek.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
Message-ID: <20220407095034.2f0e623f@xps13>
In-Reply-To: <CAJsYDVJ7e4zagG9Yvu5r8dQn++ta9TpetC6YHzq4S-GBFEBABQ@mail.gmail.com>
References: <20220401212951.1133780-1-felix@matouschek.org>
 <20220404104141.7b7b79d5@xps13>
 <c1387c1949a8ec705116f5ee8a73fa35979aa196.camel@matouschek.org>
 <CAJsYDVJ7e4zagG9Yvu5r8dQn++ta9TpetC6YHzq4S-GBFEBABQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_005042_109305_4DFC6426 
X-CRM114-Status: GOOD (  13.06  )
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

CmdjaDk4MTIxM0BnbWFpbC5jb20gd3JvdGUgb24gVGh1LCA3IEFwciAyMDIyIDE1OjA5OjQzICsw
ODAwOgoKPiBIaSEKPiAKPiBPbiBUaHUsIEFwciA3LCAyMDIyIGF0IDEyOjIwIEFNIEZlbGl4IE1h
dG91c2NoZWsgPGZlbGl4QG1hdG91c2NoZWsub3JnPiB3cm90ZToKPiA+IFRoZSBkYXRhLXNoZWV0
IHNheXMgdGhhdCBvbmx5IG9mZnNldHMgODAxSCB0byA4MDdIIGNhbiBiZSB1c2VkIGZvciB1c2Vy
Cj4gPiBkYXRhIGFuZCBhcmUgbm90IGNvdmVyZWQgYnkgRUNDIChvZmZzZXQgODAwSCBpcyByZXNl
cnZlZCBmb3IgdGhlIGJhZAo+ID4gYmxvY2sgbWFyaykuCj4gPgo+ID4gVGhlIHJlbWFpbmluZyAx
NiBieXRlcyBmcm9tIG9mZnNldCA4MzBIIHRvIDgzRkggYXJlIHJlYWQtb25seSB3aGVuIEVDQwo+
ID4gaXMgZW5hYmxlZCwgc28gdGhleSBhcmUgb2Ygbm8gdXNlPyBDYW4geW91IHBsZWFzZSBhZHZp
c2UgaWYgdGhlcmUgaXMKPiA+IHNvbWV0aGluZyBJIGNhbiBjaGFuZ2U/ICAKPiAKPiBBY2NvcmRp
bmcgdG8gcGFnZSAzMCBvZiB0aGUgZGF0YXNoZWV0WzBdLCB0aGUgNjRCeXRlIE9PQiBsYXlvdXQg
aXM6Cj4gOCBieXRlczogT09CIG5vdCBwcm90ZWN0ZWQgYnkgRUNDCj4gNDAgYnl0ZXM6IE9PQiBw
cm90ZWN0ZWQgYnkgRUNDCj4gMTYgYnl0ZXM6IEVDQyBwYXJpdHkgZGF0YQo+IAo+IHNvIHlvdXIg
T09CIGxheW91dCBzaG91bGQgYmU6Cj4gRUNDOgo+IHJlZ2lvbi0+b2Zmc2V0ID0gNDg7Cj4gcmVn
aW9uLT5sZW5ndGggPSAxNjsKPiAKPiBGcmVlOgo+IC8qIFJlc2VydmUgMSBieXRlIGZvciB0aGUg
QkJNLiAqLwo+IHJlZ2lvbi0+b2Zmc2V0ID0gMTsKPiByZWdpb24tPmxlbmd0aCA9IDQ3Owo+IAo+
IFswXTogaHR0cHM6Ly9wZXNlLm9zcy1jbi1zaGVuemhlbi5hbGl5dW5jcy5jb20vcGRmcy8yMDA1
MjUxMDM0X1hUWC1YVDI2RzAxQVdTRUdBX0M1NTg4NDEucGRmCgpBZ3JlZWQhCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
