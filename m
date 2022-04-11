Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3A5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rodJF7gCbjmWZHpklgvtEI/gvX86D9UGnUfVL0D+q0k=; b=Ag+61YM55sxiLW
	au2OQdxqknSLTlUeT5e2D4dal+tEU+FiBxo2EzKHqJKSrNPJBAE8664xI8rsZvAP0vMmImdK2gO4/
	HSDMlYg0IZEwOflNF1CDMlimQXImvL0s/buGqJdszR7aaAY4x2aJ/ZNUW/UOVpX9A0N4MoJSiTTmb
	GTP82yOja1lDUZTOX5y/pZ3VBunjr+syc/0UAKeiCdqlM0sa9D5yUrDQcpPpMisaTeT11tBXgMDHu
	VTSkGY865Kt7R8aAnEtLXrMFUQ7Rv10LySI51HyHzvwaga/JMWtVnGHkKOjGtDtwG0XdWx3OF9ZEi
	ykZKOkMaUmIaSsD/abqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrJv-008LoD-GG; Mon, 11 Apr 2022 10:30:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndquw-0089z0-Bd; Mon, 11 Apr 2022 10:05:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9035F24000C;
 Mon, 11 Apr 2022 10:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649671500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbYj23K6jfuxj8TlVhbvMc+NFVh8TGna4cbWn2gXvfo=;
 b=LjGlxuAS+8lEZjBd1Z3IfJcpClR4X7Gistt7AQq+NgaeCMlVCkTK7N5+KG0/9RsLQqjtzO
 MBYF2FjKIsUzjTx7yHqq2bVhSrzUZ1XFzksIuoFAG9zL4EbBqo/y9Crl6XlbR5Xhw0lCZD
 P0tmVR9Aap+3OP6SNsDaCFJFQbW0BFfv7TpY7WMqbQB9IpPX0CnUYQyyOANqGAGKN8Nzmx
 BKnaGzS5FR8PG3XNdgAXFfPUQcTK/9UQoSWAazSoosjnDjyMsrpP1ImZD6SqnmD3OncxUj
 0UfN0FHRAxEf4LYFWYBl+pmJoF1vTToDPcehE1xHg+faEzuVwokH05/v+c+JkQ==
Date: Mon, 11 Apr 2022 12:04:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini
 <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1p?=
 =?UTF-8?B?xYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] nvmem: add driver handling U-Boot environment
 variables
Message-ID: <20220411120456.16edb643@xps13>
In-Reply-To: <e6343890-2c8c-ea83-636a-61230a1e1759@linaro.org>
References: <20220411085926.10925-1-miquel.raynal@bootlin.com>
 <e6343890-2c8c-ea83-636a-61230a1e1759@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_030506_627839_79F577B4 
X-CRM114-Status: GOOD (  13.96  )
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

SGkgU3Jpbml2YXMsCgpzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmcgd3JvdGUgb24gTW9u
LCAxMSBBcHIgMjAyMiAxMDo0NTo1MyArMDEwMDoKCj4gT24gMTEvMDQvMjAyMiAwOTo1OSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IE9uIFdlZCwgMjAyMi0wNC0wNiBhdCAxNDozMjoyNSBVVEMs
ID0/dXRmLTg/Yj9VbUZtWWNXQ0lFMXB4WUpsWTJ0cD89IHdyb3RlOiAgCj4gPj4gRnJvbTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4+Cj4gPj4gVS1Cb290IHN0b3JlcyBp
dHMgc2V0dXAgYXMgZW52aXJvbm1lbnQgdmFyaWFibGVzLiBJdCdzIGEgbGlzdCBvZgo+ID4+IGtl
eS12YWx1ZSBwYWlycyBzdG9yZWQgb24gZmxhc2ggZGV2aWNlIHdpdGggYSBjdXN0b20gaGVhZGVy
Lgo+ID4+Cj4gPj4gVGhpcyBjb21taXQgYWRkcyBhbiBOVk1FTSBkcml2ZXIgdGhhdDoKPiA+PiAx
LiBQcm92aWRlcyBOVk1FTSBhY2Nlc3MgdG8gZW52aXJvbm1lbnQgdmFycyBiaW5hcnkgZGF0YQo+
ID4+IDIuIEV4dHJhY3RzIHZhcmlhYmxlcyBhcyBOVk1FTSBjZWxscwo+ID4+Cj4gPj4gSXQgY2Fu
IGJlIHVzZWQgZm9yOgo+ID4+IDEuIEFjY2Vzc2luZyBlbnYgdmFyaWFibGVzIGZyb20gdXNlci1z
cGFjZQo+ID4+IDIuIFJlYWRpbmcgTlZNRU0gY2VsbHMgYnkgTGludXggZHJpdmVycwo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiAgCj4g
PiAKPiA+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLiAgCj4gCj4gSGkgTWlxdWVs
LAo+IAo+IEFueSByZWFzb24gd2h5IHRoaXMgbnZtZW0gZHJpdmVyIGlzIHRha2VuIHZpYSBtdGQg
dHJlZT8KPiAKPiBUaGlzIGlzIGdvaW5nIHRvIGNvbmZsaWN0IHdpdGggb3RoZXIgbnZtZW0gcGF0
Y2hlcyB0aGF0IGFyZSB0b3VjaGluZyBLQ29uZmlnIGFuZCBNYWtlZmlsZQoKU29ycnkgSSBzZWxl
Y3RlZCBpdCBieSBtaXN0YWtlLiBJJ2xsIGxldCB5b3UgdGFrZSBpdCB0aHJvdWdoIG52bWVtCnVu
bGVzcyB0aGVyZSBpcyBzdGlsbCBzb21ldGhpbmcgbWlzc2luZyBvbiB5b3VyIHNpZGU/CgpBbnl3
YXksIGl0J3Mgbm93IGRyb3BwZWQgZnJvbSBtdGQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
