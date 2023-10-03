Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A78E75426
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Oct 2023 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUEri3sOxlnpXSz7W7SdcZ5BQDFfPUE753RhmjVSnV8=; b=isG13Sqsu+fCqC
	mL5VlB6EZHBxFUHfYURIxR65fYZzU0K0ryMQ0LAvUGi4edSML90xjt6eTW79vOfcnI8Y94FvXets0
	ebzTDVtcNRljRv63LU/G2u0+jJvbWz4VIg+0t4LA1FwzBeR5BaqZuKoRMzeVkFSbguH561hTzZhDh
	fixd+jqKx3Mu4f5T3YY22j9N6QBoWgn1Vzz1EaNJxW/skiFejyT/fZxpexiJ2f4mHmpd0ZKZutNiE
	SqDsM0M+chte1SNPZzK1ajy0IPAH9+qjj/Ywl7QsRe9hFJImWKEh0GPWFYWVr44LzMFkJKZ4VTa2D
	ba2MOvuQAwVIru+oAcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qne0a-00EZOm-2P;
	Tue, 03 Oct 2023 11:56:12 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qne0X-00EZO7-2M
	for linux-mtd@lists.infradead.org;
	Tue, 03 Oct 2023 11:56:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0C411BF20C;
	Tue,  3 Oct 2023 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696334165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AjFIqqJD4tF1YqoMJRAP1nIBhemfG2Wgo5vBuPOAe/I=;
	b=UD+euMUZG1tvk6eZMPI2f1Ws9UgfMUmdMiaHYM5OkB//v1FCXct1X716hk8Kthq5AClhK6
	qunJNbgDCHCr6zQDfXTwJu4nlLHoX04xDYy6jolq3AX2Il7mUZSnC54lqk5rZpn84Zg8IM
	VQpZxfq2pG4hKx7k3+oj59jgk/0i4VWLNmeLFWeC8j1J5HtBYrmvjLDwOnLmTRuJVat1t+
	6+fc4itbULghecLV6qmVm6DqR+t5hu53mkxxLH3FHlX8e6U9f6jTasyZ+QkApnkyr4itDA
	dirhEZbvkBGeVFc03i+8YZIRkDM8gXwpxkjfWr2KJAKziqkU7802GA4O+JC4vg==
Date: Tue, 3 Oct 2023 13:56:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Domenico Punzo <dpunzo@micron.com>
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>, Rouven
 Czerwinski <r.czerwinski@pengutronix.de>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?=
 <mans@mansr.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 JaimeLiao <jaimeliao.tw@gmail.com>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean
 =?UTF-8?B?Tnlla2rDpnI=?= <sean@geanix.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [EXT] Re: [PATCH v2] mtd: rawnand: Ensure the nand chip
 supports cached reads
Message-ID: <20231003135601.6cf0d522@xps-13>
In-Reply-To: <BYAPR08MB4437B83D7D50F4135D0D40A9BBC4A@BYAPR08MB4437.namprd08.prod.outlook.com>
References: <20230922141717.35977-1-r.czerwinski@pengutronix.de>
	<e911f5d9c7def8c80904a17ad3924ecba6625998.camel@geanix.com>
	<20230926132725.5d570e1b@xps-13>
	<20230927170516.2604e8f2@xps-13>
	<b8de26e243afa3e5920455a4d8e5a3451a06d074.camel@geanix.com>
	<BYAPR08MB4437B83D7D50F4135D0D40A9BBC4A@BYAPR08MB4437.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_045609_919988_0A4CA799 
X-CRM114-Status: GOOD (  10.48  )
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

SGkgRG9tZW5pY28sCgpkcHVuem9AbWljcm9uLmNvbSB3cm90ZSBvbiBUdWUsIDMgT2N0IDIwMjMg
MTE6Mjk6MzMgKzAwMDA6Cgo+IE1pY3JvbiBDb25maWRlbnRpYWwKPiAKPiBIZWxsbyBNaXF1ZWws
Cj4gCj4gSGVyZSBpcyBhIHNob3J0IGxpc3Qgb2YgZGV2aWNlcyBoYXZpbmcgY2FjaGUgcmVhZCB3
aXRoIEVDQyBlbmFibGVkLgo+IAo+IE1UMjlGMkcwOEFCQUdBSDQsIE1UMjlGMkcwOEFCQkdBSDQs
IE1UMjlGMkcxNkFCQkdBSDQKPiBNVDI5RjFHMDhBQkFGQUg0LCBNVDI5RjFHMDhBQkJGQUg0LCBN
VDI5RjFHMTZBQkJGQUg0CgpHcmVhdCEgVGhhbmtzIGEgbG90LgoKSXQgYXBwZWFycyB0aGF0IGV2
ZW4gd2l0aG91dCBpbnRlcm5hbCBFQ0MgZW5hYmxlZCB3ZSBnZXQgZmFpbHVyZXMgb24KTWljcm9u
IHBhcnRzLCBzbyBJIGJlbGlldmUgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgdGhhdCB3ZSBuZWVk
IHRvCmludmVzdGlnYXRlLiBCdXQgdGhhbmtzIGZvciB0aGUgbGlzdCwgSSB3aWxsIHByb3Bvc2Ug
YSBwYXRjaCBwcmV2ZW50aW5nCnRoZSB1c2Ugb2Ygb24tZGllIEVDQyB0b2dldGhlciB3aXRoIHNl
cXVlbnRpYWwgY2FjaGUgcmVhZHMgb24gYWxsIHBhcnRzCmJ1dCB0aGUgb25lcyBpbiB0aGlzIGxp
c3QgKGNhbiBiZSBleHRlbmRlZCBsYXRlcikuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
