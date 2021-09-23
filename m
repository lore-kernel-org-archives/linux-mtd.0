Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD8C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C6B610C8
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51C6B610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jZ1uqztMnlgSq2Let4ipCzyPb1GvugoOAJOamC+SbE=; b=YE+S7YMGWydPDe
	6wGQS7tBchybyiQUmogDeW+iTUoQ6l05MhOWkM5LHLe2wYAl8DvEPN6fuUGBEiqPRp3LJWSjVpaiO
	EDzmP7fdxwKfOOD5bOzcpc4T2kpfJ32GM8k17Ljg1VY6BccJawnKiFG7F+Vn1x2/m7Zr00WMwRx0d
	FD4VFHbMuNwmhq9yDHfzsKWcxsWyAP9P4zR8dtHUCU89hBfUs/ZCFGAqm5kZFzLByTGRq3uxKYtke
	HW88thhxuNPwYN2rBG+fupTtSxS6sC9GJghRbUBTb5/P99eoCj0xN9HOLbcZVXAJo12zGvmCBqS6h
	ntSrKj//urJIcCbNChwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTTwi-00CPul-Fi; Thu, 23 Sep 2021 18:59:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTTwV-00CPtF-8l; Thu, 23 Sep 2021 18:59:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18NIx6kg010807;
 Thu, 23 Sep 2021 13:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632423546;
 bh=8FiQ79nvdAQVZ3eveOp9w7xiAk/Itwx8l0UKnlfYlmA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=e7qCP915ren9z/q/L9tgu8Vs16nvaLUsLjq0sVTkqwUcRNBbKvlB7sEeNdaoA92eu
 RB1u9rsFDnGrwAAgfz7Xt5XA4cuwKPfeAUomnAa6PIXckGjEZMGIGG4p5+la3Xx7mQ
 qO+Q46S7Ti0lQxki4/iTQlX5J3+snw9n36EPxSvY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18NIx6NA045820
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Sep 2021 13:59:06 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 13:59:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Sep 2021 13:59:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18NIx5BM002948;
 Thu, 23 Sep 2021 13:59:05 -0500
Date: Fri, 24 Sep 2021 00:29:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <arnd@arndb.de>, <olof@lixom.net>,
 <soc@kernel.org>, <dinguyen@kernel.org>, <p.zabel@pengutronix.de>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <tn@semihalf.com>, <ka@semihalf.com>, <jam@semihalf.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Message-ID: <20210923185902.6wgkuz4jcelcawrq@ti.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-2-pan@semihalf.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920124141.1166544-2-pan@semihalf.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_115935_439764_A56299F8 
X-CRM114-Status: GOOD (  14.28  )
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

K1R1ZG9yCgpPbiAyMC8wOS8yMSAwMjo0MVBNLCBQYXdlxYIgQW5pa2llbCB3cm90ZToKPiBBZGQg
c2NoZW1hIGZvciB0aGUgbjI1cTAwIE5PUiBmbGFzaCBtZW1vcnkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1u
b3IueWFtbAo+IGluZGV4IGVkNTkwZDdjNmUzNy4uZWZiM2M1ZTA1YzVhIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGkt
bm9yLnlhbWwKPiBAQCAtMTgsNyArMTgsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAtIGl0ZW1z
Ogo+ICAgICAgICAgICAgLSBwYXR0ZXJuOiAiXigoKChtaWNyb258c3BhbnNpb258c3QpLCk/XAo+
ICAgICAgICAgICAgICAgIChtMjVwKDQwfDgwfDE2fDMyfDY0fDEyOCl8XAo+IC0gICAgICAgICAg
ICAgIG4yNXEoMzJifDA2NHwxMjhhMTF8MTI4YTEzfDI1NmF8NTEyYXwxNjRrKSkpfFwKPiArICAg
ICAgICAgICAgICBuMjVxKDAwfDMyYnwwNjR8MTI4YTExfDEyOGExM3wyNTZhfDUxMmF8MTY0aykp
KXxcCgpJSVVDIHRoaXMgaXMgc3VwcG9zZWQgdG8gb25seSBiZSBmb3IgbGVnYWN5L29sZCBmbGFz
aGVzIHRoYXQgc3RhcnRlZCBvdXQgCnVzaW5nIGZsYXNoLXNwZWNpZmljIGNvbXBhdGlibGVzLiBB
bnkgbmV3IGZsYXNoZXMgc2hvdWxkIHNpbXBseSB1c2UgCmplZGVjLHNwaS1ub3IgdW5sZXNzIHRo
ZXJlIGlzIGEgbGVnaXRpbWF0ZSByZWFzb24gdG8gZG8gc28uCgpVbnRpbCB5b3UganVzdGlmeSB0
aGF0IHJlYXNvbiwKCk5hY2tlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgoK
PiAgICAgICAgICAgICAgICBhdG1lbCxhdDI1ZGYoMzIxYXw2NDF8MDgxYSl8XAo+ICAgICAgICAg
ICAgICAgIGV2ZXJzcGluLG1yMjVoKDEwfDQwfDEyOHwyNTYpfFwKPiAgICAgICAgICAgICAgICAo
bXhpY3l8bWFjcm9uaXgpLG14MjVsKDQwMDVhfDE2MDZlfDY0MDVkfDgwMDV8MTI4MDVkfDI1NjM1
ZSl8XAo+IC0tIAo+IDIuMjUuMQoKLS0gClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2ClRleGFzIElu
c3RydW1lbnRzIEluYy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
