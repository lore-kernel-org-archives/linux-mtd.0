Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D78C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 14:31:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164ED213F2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 14:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="es38x4VM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164ED213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL687QDzCKdb3z+EMPk0YtYaAzZm1d8te82f2p8FtcM=; b=es38x4VM/9/hCh
	3SvDcSioyiheKGhekHXx6HXRBYN6yXtDLv4mNNrNmtWYD5IZPbccpkmZIKPa1txoEbL2f7KH7DwaH
	u4c6L4aBLsoawvDdoHm0UumGYtO1fGUXQxtdLPIzQeUyz1gH3lfK4NKnXrdpiIjXck1yZkvPTstNn
	6d5gk6bvh5N6Ddf5SpAhGXN07kS4ZbUkZdbnM7t9VE/lf/pYrXarGHIvXfp4yE1Zu9ooC4Wp3TcBv
	VOs5IncUuMD7YOVuNYutM8tKXg/dGxhkXnVcjPLb0ya5+W6yvH6dXExx1pwPRJUfU5XiqZtCNS3TS
	We/jnCCO1p02iBr/O5Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjKQ-0000sh-KK; Mon, 20 May 2019 14:31:50 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjKJ-0000rz-H3
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 14:31:48 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7DCA260005;
 Mon, 20 May 2019 14:31:32 +0000 (UTC)
Date: Mon, 20 May 2019 16:31:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] mtd: rawnand: use longest matching pattern
Message-ID: <20190520163131.7c143ebe@xps13>
In-Reply-To: <20190419074717.22576-1-stefan@agner.ch>
References: <20190419074717.22576-1-stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073143_715771_CBF5F1B3 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: bbrezillon@kernel.org, richard@nod.at,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU3RlZmFuLAoKU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+IHdyb3RlIG9uIEZyaSwg
MTkgQXByIDIwMTkgMDk6NDc6MTcgKzAyMDA6Cgo+IFNvbWV0aW1lcyB0aGUgZXhlY19vcCBwYXJz
ZXIgZG9lcyBub3QgY2hvb3NlIHRoZSBvcHRpbWFsIHBhdHRlcm4gaWYKPiBtdWx0aXBsZSBwYXR0
ZXJucyB3aXRoIG9wdGlvbmFsIGVsZW1lbnRzIGFyZSBhdmFpbGFibGUuIFNpbmNlIHRoZSBzdGFj
awo+IGF1dG9tYXRpY2FsbHkgc3BsaXRzIG9wZXJhdGlvbnMgaW4gbXVsdGlwbGUgZXhlY19vcCBj
YWxscywgYSBub24tb3B0aW1hbAo+IHBhdHRlcm4gZ2V0cyBicm9rZW4gdXAgaW50byBtdWx0aXBs
ZSBjYWxscy4gRS5nLiBhbiBPT0IgcmVhZCB1c2luZyB0aGUKPiB2ZjYxMCBkcml2ZXI6Cj4gICBu
YW5kOiBleGVjdXRpbmcgc3Vib3A6Cj4gICBuYW5kOiAgICAgLT5DTUQgICAgICBbMHgwMF0KPiAg
IG5hbmQ6ICAgICAtPkFERFIgICAgIFs1IGN5YzogMDAgMDggZWEgOTQgMDJdCj4gICBuYW5kOiAg
ICAgLT5DTUQgICAgICBbMHgzMF0KPiAgIG5hbmQ6ICAgICAtPldBSVRSRFkgIFttYXggMjAwMDAw
IG1zXQo+ICAgbmFuZDogICAgICAgREFUQV9JTiAgWzY0IEJdCj4gICBuYW5kOiBleGVjdXRpbmcg
c3Vib3A6Cj4gICBuYW5kOiAgICAgICBDTUQgICAgICBbMHgwMF0KPiAgIG5hbmQ6ICAgICAgIEFE
RFIgICAgIFs1IGN5YzogMDAgMDggZWEgOTQgMDJdCj4gICBuYW5kOiAgICAgICBDTUQgICAgICBb
MHgzMF0KPiAgIG5hbmQ6ICAgICAgIFdBSVRSRFkgIFttYXggMjAwMDAwIG1zXQo+ICAgbmFuZDog
ICAgIC0+REFUQV9JTiAgWzY0IEJdCj4gCj4gSG93ZXZlciwgdGhlIHZmNjEwIGRyaXZlciBoYXMg
YSBwYXR0ZXJuIHdoaWNoIGNhbiBleGVjdXRlIHRoZSBjb21wbGV0ZQo+IGNvbW1hbmQgaW4gYSBz
aW5nbGUgZ28uLi4KPiAKPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgdGhhdCB0aGUgbG9uZ2VzdCBt
YXRjaGluZyBwYXR0ZXJuIGlzIGNob3Nlbgo+IGluc3RlYWQgb2YgdGhlIGZpcnN0IChwb3RlbnRp
YWxseSBvbmx5IHBhcnRpYWwpIG1hdGNoLiBXaXRoIHRoaXMKPiBjaGFuZ2UgdGhlIHZmNjEwIHJl
YWRzIHRoZSBPT0IgaW4gYSBzaW5nbGUgZXhlY19vcCBjYWxsOgo+ICAgbmFuZDogZXhlY3V0aW5n
IHN1Ym9wOgo+ICAgbmFuZDogICAgIC0+Q01EICAgICAgWzB4MDBdCj4gICBuYW5kOiAgICAgLT5B
RERSICAgICBbNSBjeWM6IDAwIDA4IGMwIDFkIDAwXQo+ICAgbmFuZDogICAgIC0+Q01EICAgICAg
WzB4MzBdCj4gICBuYW5kOiAgICAgLT5XQUlUUkRZICBbbWF4IDIwMDAwMCBtc10KPiAgIG5hbmQ6
ICAgICAtPkRBVEFfSU4gIFs2NCBCXQo+IAo+IFJlcG9ydGVkLWJ5OiBTYXNjaGEgSGF1ZXIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gU3VnZ2VzdGVkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IFRlc3RlZC1ieTogU3RlZmFuIEFnbmVyIDxz
dGVmYW5AYWduZXIuY2g+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWdu
ZXIuY2g+Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
