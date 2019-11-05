Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44FCC5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 23:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E7A20663
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 23:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ht93CUAq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E7A20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyBTR6VyGY8pqDlKzrILwxRKVlSLit/SuVx16hxjA3A=; b=Ht93CUAqd9UQoy
	brutk4DaEXUhEqnV39HcEkF4ORreBWQ1x7f42Die334/G1wtujbWjA6I2tlUSSVyWeUOEqvrzrsls
	CQ8ssTZuSTY0tjz0L5XoxJVn10XG1JSdz0F8pTspNgmSTNumK2pWXHXQmlfPJC+31kQV/tkWz9/+u
	LLmu30sclnXzJQrjbswBGSUnxfzQxEiN5Su96bJuRyAYudMA4IC0Z8J9sZTFMZOvcFUGelUY7wL1l
	aoWDbuS0Vd1YXz4d2T+pqoMa4HeTdg370LJ7ZLTT9Sqdnbh36Qcu/7kdjAkz3Z63mmk+1Eu8lQWa4
	wTI9PEER3qYi89++GX6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS8Q1-0000IF-LR; Tue, 05 Nov 2019 23:39:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS8Px-0000Gt-Sh
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 23:39:23 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EA46FE0004;
 Tue,  5 Nov 2019 23:39:11 +0000 (UTC)
Date: Wed, 6 Nov 2019 00:39:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] mtd: devices: fix mchp23k256 read and write
Message-ID: <20191106003910.162191b9@xps13>
In-Reply-To: <20191105231709.GB12610@lunn.ch>
References: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
 <20191105194122.4dcee126@xps13> <20191105231709.GB12610@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_153922_066003_A518456A 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 Angelo Dureghello <angelo.dureghello@timesys.com>, vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5kcmV3LAoKQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZSBvbiBXZWQsIDYg
Tm92IDIwMTkgMDA6MTc6MDkgKzAxMDA6Cgo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDA3OjQx
OjIyUE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBBbmdlbG8sCj4gPiAKPiA+
ICsgQW5kcmV3Cj4gPiAKPiA+IEFuZ2VsbyBEdXJlZ2hlbGxvIDxhbmdlbG8uZHVyZWdoZWxsb0B0
aW1lc3lzLmNvbT4gd3JvdGUgb24gV2VkLCAzMCBPY3QKPiA+IDIwMTkgMTI6Mzk6NTcgKzAxMDA6
Cj4gPiAKPiA+ID4gRHVlIHRvIHRoZSB1c2Ugb2Ygc2l6ZW9mKCksIGNvbW1hbmQgc2l6ZSBzZXQg
Zm9yIHRoZSBzcGkgdHJhbnNmZXIKPiA+ID4gd2FzIHdyb25nLiBEcml2ZXIgd2FzIHNlbmRpbmcg
YW5kIHJlY2VpdmluZyBhbHdheXMgMSBieXRlIGxlc3MKPiA+ID4gYW5kIGVzcGVjaWFsbHkgb24g
d3JpdGUsIGl0IHdhcyBoYW5naW5nLgo+ID4gPiAKPiA+ID4gZWNobyAtbiAtZSAiXFx4MVxceDJc
XHgzXFx4NCIgPiAvZGV2L210ZDEKPiA+ID4gCj4gPiA+IEFuZCByZWFkIHBhcnQgdG9vIG5vdyB3
b3JrcyBhcyBleHBlY3RlZC4KPiA+ID4gCj4gPiA+IGhleGR1bXAgLUMgLW4xNiAvZGV2L210ZDEK
PiA+ID4gMDAwMDAwMDAgIDAxIDAyIDAzIDA0IGFiIGYzIGFkIGMyICBhYiBlMyBmNCAzNiBkZCAz
OCAwNCAxNQo+ID4gPiAwMDAwMDAxMAo+ID4gPiAKPiA+IAo+ID4gTG9va3MgZmluZSBieSBtZSwg
anVzdCBhZGRlZCBBbmRyZXcgaW4gY2FzZSBoZSB3YW50cyB0byByZXZpZXcgdGhlCj4gPiBwYXRj
aCBhcyBoZSB3YXMgdGhlIG9yaWdpbmFsIGNvbW1pdHRlci4KPiA+IAo+ID4gQW55d2F5IHlvdSdy
ZSBtaXNzaW5nIGEgQ2M6IHN0YWJsZSBhbmQgRml4ZXMgdGFnIG9uCj4gPiA1ZGMxN2ZhNmZiNzAg
KCJtdGQ6IG1jaHAyM2syNTY6IEFkZCBkcml2ZXIgZm9yIHRoaXMgU1BJIFNSQU0gZGV2aWNlIikK
PiAKPiBIaSBNaXF1w6hsCj4gCj4gVGhpcyBpcyB0aGUgd3JvbmcgZml4ZXMgdGFnLiBUaGUgY29y
cmVjdCBvbmUgaXMKPiAKPiBGaXhlczogNDM3OTA3NWE4NzBiICgibXRkOiBtY2hwMjNrMjU2OiBB
ZGQgc3VwcG9ydCBmb3IgbWNocDIzbGN2MTAyNCIpCgpPaCBjcmFwLCB5b3UncmUgcmlnaHQsIHRo
YW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24hCgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+Cj4gCj4gICAgIEFuZHJldwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
