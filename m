Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2A4C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F31216B7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yr/hbz2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3F31216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a50LOFjfsAPWVqgQITVUt0rtZfsCnKuUECcxG7NsyM=; b=Yr/hbz2fdaoPD5
	xADLtW373srhrr0zKpX3adErvF95H7GM05NY8qP3EECDPAYO3c2xDuyybAxFQ9SBjqB49rZQJJ1WX
	pwk1xUYaEBDh16/RKzLnxZ1qvCQ1U0fr+KAjzsGnyc5YSIHKLj0GIgMNo/SQZfuQJpKaSfCwq0Ise
	5kkLEm+oV8KGj6qMs79wpx91md0yp+g7mW1YSx2N45XkHe0d/3mHcErpFEiMiKyRKXmgqF7iH9zJT
	CAn6uw1EcLMmEMl04udE+7Fx9ruireSJSbzCZRQaG+sjMqzjAc6jtGWrl+b+HGDiKwu5EPuJBsFes
	albZ6zSM7Ukg33JgEQjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0DL-0000TR-9R; Tue, 21 May 2019 08:33:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0DI-0000SS-5O
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:33:38 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1C4251C000F;
 Tue, 21 May 2019 08:33:31 +0000 (UTC)
Date: Tue, 21 May 2019 10:33:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 00/14] Implement exec_op for GPMI nand driver
Message-ID: <20190521103331.0d788c31@xps13>
In-Reply-To: <20190521081955.hkl2f7lub3euz43k@pengutronix.de>
References: <20190521070643.6244-1-s.hauer@pengutronix.de>
 <20190521081955.hkl2f7lub3euz43k@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_013336_511483_19FC8037 
X-CRM114-Status: GOOD (  12.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsIDIxIE1heSAyMDE5CjEwOjE5OjU1ICswMjAwOgoKPiBPbiBUdWUsIE1heSAyMSwgMjAx
OSBhdCAwOTowNjoyOUFNICswMjAwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4gPiBXaGVuIHJlYmFz
aW5nIG9uIHY1LjItcmMxIEkgb2JzZXJ2ZSB0aGlzIGJhY2t0cmFjZToKPiA+IAo+ID4gWyAgIDEw
Ljc4OTc2MV0gV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCAvcHR4L3dvcmsvV09SS19PT0dITy9z
aGEvYmFja3VwL2xpbnV4L2xpbnV4L2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oOgo+
ID4gMTE0IG5hbmRfcmVzZXRfb3ArMHgxOTQvMHgxYzQKPiA+IFsgICAxMC44MDMxMzddIE1vZHVs
ZXMgbGlua2VkIGluOgo+ID4gWyAgIDEwLjgwNjQ0MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2Fw
cGVyLzAgTm90IHRhaW50ZWQgNS4yLjAtcmMxLTAwMDE0LWc3OTNmMjNlNWFkYjAtZGlydHkgIzY3
Ngo+ID4gWyAgIDEwLjgxNTI5N10gSGFyZHdhcmUgbmFtZTogRnJlZXNjYWxlIGkuTVg2IFF1YWQv
RHVhbExpdGUgKERldmljZSBUcmVlKQo+ID4gWyAgIDEwLjgyMjA1NF0gWzxjMDExMjkyOD5dICh1
bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAxMGQxNDA+XSAoc2hvd19zdGFjaysweDEwLzB4MTQp
Cj4gPiBbICAgMTAuODMwMDU0XSBbPGMwMTBkMTQwPl0gKHNob3dfc3RhY2spIGZyb20gWzxjMGJk
NjVjYz5dIChkdW1wX3N0YWNrKzB4ZDgvMHgxMTApCj4gPiBbICAgMTAuODM3NjA5XSBbPGMwYmQ2
NWNjPl0gKGR1bXBfc3RhY2spIGZyb20gWzxjMDEyNzE0OD5dIChfX3dhcm4rMHhlMC8weDEwYykK
PiA+IFsgICAxMC44NDQ3OTFdIFs8YzAxMjcxNDg+XSAoX193YXJuKSBmcm9tIFs8YzAxMjcyODg+
XSAod2Fybl9zbG93cGF0aF9udWxsKzB4M2MvMHg0OCkKPiA+IFsgICAxMC44NTI2MDRdIFs8YzAx
MjcyODg+XSAod2Fybl9zbG93cGF0aF9udWxsKSBmcm9tIFs8YzA3MGJlNTA+XSAobmFuZF9yZXNl
dF9vcCsweDE5NC8weDFjNCkKPiA+IFsgICAxMC44NjEyMDddIFs8YzA3MGJlNTA+XSAobmFuZF9y
ZXNldF9vcCkgZnJvbSBbPGMwNzBkYjQ0Pl0gKG5hbmRfcmVzZXQrMHg1OC8weGI0KQo+ID4gWyAg
IDEwLjg2ODkyNF0gWzxjMDcwZGI0ND5dIChuYW5kX3Jlc2V0KSBmcm9tIFs8YzA3MGY0NTQ+XSAo
bmFuZF9zY2FuX3dpdGhfaWRzKzB4MTUyYy8weDE2MjQpCj4gPiBbICAgMTAuODc3NDQ0XSBbPGMw
NzBmNDU0Pl0gKG5hbmRfc2Nhbl93aXRoX2lkcykgZnJvbSBbPGMwNzFhOGE4Pl0gKGdwbWlfbmFu
ZF9wcm9iZSsweDJmOC8weDZhYykKPiA+IFsgICAxMC44ODYyMzVdIFs8YzA3MWE4YTg+XSAoZ3Bt
aV9uYW5kX3Byb2JlKSBmcm9tIFs8YzA2N2MyY2M+XSAocGxhdGZvcm1fZHJ2X3Byb2JlKzB4NDgv
MHg5OCkKPiA+IFsgICAxMC44OTQ4NDRdIFs8YzA2N2MyY2M+XSAocGxhdGZvcm1fZHJ2X3Byb2Jl
KSBmcm9tIFs8YzA2N2ExNWM+XSAocmVhbGx5X3Byb2JlKzB4ZWMvMHgyYzgpCj4gPiBbICAgMTAu
OTAzMjcyXSBbPGMwNjdhMTVjPl0gKHJlYWxseV9wcm9iZSkgZnJvbSBbPGMwNjdhNDk0Pl0gKGRy
aXZlcl9wcm9iZV9kZXZpY2UrMHg1Yy8weDE2OCkKPiA+IFsgICAxMC45MTE3ODFdIFs8YzA2N2E0
OTQ+XSAoZHJpdmVyX3Byb2JlX2RldmljZSkgZnJvbSBbPGMwNjdhNzQ4Pl0gKGRldmljZV9kcml2
ZXJfYXR0YWNoKzB4NTgvMHg2MCkKPiA+IFsgICAxMC45MjA5MDldIFs8YzA2N2E3NDg+XSAoZGV2
aWNlX2RyaXZlcl9hdHRhY2gpIGZyb20gWzxjMDY3YTdkND5dIChfX2RyaXZlcl9hdHRhY2grMHg4
NC8weGMwKQo+ID4gWyAgIDEwLjkyOTY4NF0gWzxjMDY3YTdkND5dIChfX2RyaXZlcl9hdHRhY2gp
IGZyb20gWzxjMDY3ODVkYz5dIChidXNfZm9yX2VhY2hfZGV2KzB4NzAvMHhiNCkKPiA+IFsgICAx
MC45MzgxMDddIFs8YzA2Nzg1ZGM+XSAoYnVzX2Zvcl9lYWNoX2RldikgZnJvbSBbPGMwNjc5NWZj
Pl0gKGJ1c19hZGRfZHJpdmVyKzB4MTU0LzB4MWUwKQo+ID4gWyAgIDEwLjk0NjYxNV0gWzxjMDY3
OTVmYz5dIChidXNfYWRkX2RyaXZlcikgZnJvbSBbPGMwNjdiNDMwPl0gKGRyaXZlcl9yZWdpc3Rl
cisweDc0LzB4MTA4KQo+ID4gWyAgIDEwLjk1NDk1Ml0gWzxjMDY3YjQzMD5dIChkcml2ZXJfcmVn
aXN0ZXIpIGZyb20gWzxjMDEwMzE3Yz5dIChkb19vbmVfaW5pdGNhbGwrMHg4MC8weDMzMCkKPiA+
IFsgICAxMC45NjMzODVdIFs8YzAxMDMxN2M+XSAoZG9fb25lX2luaXRjYWxsKSBmcm9tIFs8YzEx
MDExYTA+XSAoa2VybmVsX2luaXRfZnJlZWFibGUrMHgyZTgvMHgzY2MpCj4gPiBbICAgMTAuOTcy
MzQ2XSBbPGMxMTAxMWEwPl0gKGtlcm5lbF9pbml0X2ZyZWVhYmxlKSBmcm9tIFs8YzBiZjBjNjA+
XSAoa2VybmVsX2luaXQrMHg4LzB4MTE0KQo+ID4gWyAgIDEwLjk4MDc2OF0gWzxjMGJmMGM2MD5d
IChrZXJuZWxfaW5pdCkgZnJvbSBbPGMwMTAxMGI0Pl0gKHJldF9mcm9tX2ZvcmsrMHgxNC8weDIw
KQo+ID4gCj4gPiBJIGFsc28gcmVwb3J0ZWQgdGhpcyBhcyBhbiBhbnN3ZXIgdG8gdGhlIG9yaWdp
bmFsIHBhdGNoIGludHJvZHVjaW5nCj4gPiB0aGlzIGJhY2t0cmFjZSBoZXJlOgo+ID4gCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTktTWF5LzA4
OTYwMC5odG1sCj4gPiAKPiA+IE5vIGlkZWEgd2hhdCBnb2VzIHdyb25nIGhlcmUsIGJ1dCBpbiB0
aGUgaG9wZSB0aGF0IGl0J3Mgbm90IHRoZSBmYXVsdCBvZiB0aGlzCj4gPiBzZXJpZXMgSSdtIHJl
c2VuZGluZyB0aGlzIHJlYmFzZWQgdmVyc2lvbiBhbnl3YXkuICAKPiAKPiBPa2F5LCB0aGlzIGdv
ZXMgZG93biB0byBhbiBpc3N1ZSBvcnRob2dvbmFsIHRvIHRoaXMgc2VyaWVzLiBXaXRoIHRoaXM6
CgpHcmVhdC4gSSdtIGFwcGx5aW5nIHRoaXMgc2VyaWVzIHRvIG15IDAtZGF5IHJlcG9zaXRvcnks
IHdpbGwgcHVzaCBvbgprZXJuZWwub3JnIHJlcG8gaW4gYSBmZXcgZGF5cy4KCj4gCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE5LU1heS8wODk2MjYu
aHRtbAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
