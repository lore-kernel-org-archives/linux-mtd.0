Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC6C25B78
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHIgWjWYSN44C+VOOOPnPU7IuFmEw2p1hV4NBKC2rKU=; b=YUYqiDngBstHff
	G0YtbUdBW1ZAIIWwgzuedLILjYYeIAmfG1+FxXhue5I2KlZPQlssLubxqbJrwKEQfCsPZy/SJcpo/
	rHu3n9t1UTB5zwHOi6VwB7qRwdRF3cQiZNkoB0Elzve+xzhxH6GuktgfXcem2JXgAWrVRAcUhJJJB
	6ZNkG5j8DJ2GSXuc9JmUHBQ5YXZpkhTGvQ0GlX4OAS/uquNIzu4CaOa24boJoKiwY1xMWY0rsmCAa
	Xhf7f4QcPvcKQAzQ+xOKYHj7c9XostOvHhkZiQG5g3z8MshFSW8xyPtD2Ni9bRs7bkZH3PvL+U6GO
	cudi96ldRIulxbpQjrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Yar-00000004W9H-49oO;
	Thu, 16 May 2024 10:44:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Yao-00000004W7G-43jP
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 10:44:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C21BA2000C;
	Thu, 16 May 2024 10:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715856247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZxMRCr3U247a7pzMzNRUdfjSJgipOrsTt2uVfBhf68=;
	b=hTqTdi7QxnvGDshjF8nWfXQNLwDQmsGSL1oITzxcohjcutOMjL9tOqCc8LbCkoI77zLpRW
	TH3MqQ1siOOJ42oiSxkjZPINO9M4WcKIdXjlFBalLKIm96+7Nh170n17WJiBaNXq/u9AMv
	ilPCD9YqK5KWOioBu9eHkJhrQslVSvlslx0eUB7nXeYN/2vYOUrboTpbwvq/quIQOCfp5n
	geB9kozgnFUIhGejHyquYAGoOvJRpcUYe0d7fOr7szFMjX87Qtn6yXO7amIiCq7L808xlM
	ne3Gx10WLUWcdVH1n+O+lf/+8OE/NE2qrZb210fBO6wNV2L1YbzAR85AHxONRQ==
Date: Thu, 16 May 2024 12:44:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240516124405.2da1aa23@xps-13>
In-Reply-To: <ZkXfJ6n-06YqOr39@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
	<20240514-mtd-nand-mxc-nand-exec-op-v3-2-3e6f45fd3d82@pengutronix.de>
	<20240516103214.57a8ce33@xps-13>
	<ZkXfJ6n-06YqOr39@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_034411_168878_F1DEBF01 
X-CRM114-Status: GOOD (  13.73  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUaHUsIDE2IE1heSAy
MDI0IDEyOjI1OjQzICswMjAwOgoKPiBPbiBUaHUsIE1heSAxNiwgMjAyNCBhdCAxMDozMjoxNEFN
ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FzY2hhLAo+ID4gICAKPiA+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9vcF9wYXJzZXIgbXhjbmRfb3BfcGFyc2VyID0gTkFO
RF9PUF9QQVJTRVIoCj4gPiA+ICsJTkFORF9PUF9QQVJTRVJfUEFUVEVSTihteGNuZF9kb19leGVj
X29wLAo+ID4gPiArCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9DTURfRUxFTShmYWxzZSks
Cj4gPiA+ICsJCQkgICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX0FERFJfRUxFTSh0cnVlLCA3KSwK
PiA+ID4gKwkJCSAgICAgICBOQU5EX09QX1BBUlNFUl9QQVRfQ01EX0VMRU0odHJ1ZSksCj4gPiA+
ICsJCQkgICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX1dBSVRSRFlfRUxFTSh0cnVlKSwKPiA+ID4g
KwkJCSAgICAgICBOQU5EX09QX1BBUlNFUl9QQVRfREFUQV9JTl9FTEVNKHRydWUsIE1BWF9EQVRB
X1NJWkUpKSwgIAo+ID4gCj4gPiBDTUQsIEFERFIsIENNRCwgREFUQSBpcyB0aGUgUk5ET1VUIHBh
dHRlcm4uIFNvIGl0IGlzIG5vdyB3b3JraW5nIGZpbmU/ICAKPiAKPiBZZXMsIFJORE9VVCBpcyB3
b3JraW5nIG5vdy4KCkV4Y2VsbGVudCEKCj4gPiBPciBkaWQgeW91IGZvcmdldCB0byBhZGFwdCB0
aGUgcGF0dGVybnMgdG8geW91ciB1c2UgY2FzZT8gIAo+IAo+IEFsdGhvdWdoIGl0IGxvb2tzIGxp
a2UgdGhlIHBhdHRlcm5zIGZyb20gdGhlIHBsMzV4LW5hbmQtY29udHJvbGxlci5jLAo+IHRoZXJl
IGlzIG9uZSBzbGlnaHQgZGlmZmVyZW5jZS4gVGhlICdmYWxzZScgaW4gdGhlIE5BTkRfT1BfUEFS
U0VSX1BBVF9DTURfRUxFTQo+IGFib3ZlIGhhcyB0aGUgZWZmZWN0IHRoYXQgYSBwbGFpbiBOQU5E
X09QX1BBUlNFUl9QQVRfREFUQV9JTl9FTEVNIGlzCj4gZGlzYWxsb3dlZC4KCkknbSBub3Qgc3Vy
ZSBJIGZvbGxvdywgdGhlIGFib3ZlIHBhdHRlcm4gbWVhbnM6IGEgc2luZ2xlIGNvbW1hbmQgY3lj
bGUKaXMgc3VwcG9ydGVkLCBubz8KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
