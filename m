Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B126C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 20:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C012075E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 20:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AuijPpRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C012075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB8GbXqpjt0915V+t19OpwdyEvow9b5cs2wlQPSGQ/k=; b=AuijPpRHNBMlQe
	Gwvf2j+Rmlr01Umsa+YvV6PHs89lRooim30iTRAC6Oyvan8U0QoueTCh1xDAc7chF8j0f8wLveQp9
	Q3lVipc5D7nvcby8hJJE9WUu41XFmojt7SE6Hg2vfCp0HvLAqmJAakv2qPsdLFfAULNRrbjvjjBtA
	sIwRQdh/dcCDcluo0RabpJHwpn2NLEYktQhURrUqDDnsip2soz2hPVjmL0qfy3qZdaB5gMMDHCCbj
	cpXxQ6jpfweORv+tqB0BR4VoPI6Ov+xGx3oxaWlPOcHkUsv6AUM+vFUrlc7FL9jfnXM3UDj+9N6bL
	OeC/8DCbp3u1gamvHYwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQqD-0005vs-Eq; Wed, 06 May 2020 20:40:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQq7-0005vE-SB
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 20:40:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C91192A073C;
 Wed,  6 May 2020 21:40:19 +0100 (BST)
Date: Wed, 6 May 2020 22:40:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506224016.2d48d0b4@collabora.com>
In-Reply-To: <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_134025_047473_A61C1995 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>, "Zoltan Szubbocsev,
 zszubbocsev" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>, "Bean Huo,
 beanhuo" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA2IE1heSAyMDIwIDIxOjIzOjE4ICswMjAwIChDRVNUKQpSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+ID4gVm9uOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Cj4gPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiA+IENDOiAiQmVhbiBI
dW8sIGJlYW5odW8iIDxiZWFuaHVvQG1pY3Jvbi5jb20+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIKPiA+IDx2aWduZXNo
ckB0aS5jb20+LCAiVHVkb3IgQW1iYXJ1cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4s
ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJTdGV2ZQo+ID4g
ZGVSb3NpZXIiIDxkZXJvc2llckBnbWFpbC5jb20+LCAiVGhvbWFzIFBldGF6em9uaSIgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+LCAidGdseCIgPHRnbHhAbGludXRyb25peC5kZT4sICJa
b2x0YW4KPiA+IFN6dWJib2NzZXYsIHpzenViYm9jc2V2IiA8enN6dWJib2NzZXZAbWljcm9uLmNv
bT4sICJQaW90ciBXb2p0YXN6Y3p5ayIgPFdvanRhc3pjenlrUEBjdW1taW5zYWxsaXNvbi5jb20+
Cj4gPiBHZXNlbmRldDogTWl0dHdvY2gsIDYuIE1haSAyMDIwIDIxOjAxOjU4Cj4gPiBCZXRyZWZm
OiBSZTogW0VYVF0gW1BBVENIIHYyIDMvM10gbXRkOiByYXduYW5kOiBtaWNyb246IEFkZHJlc3Mg
dGhlIHNoYWxsb3cgZXJhc2UgaXNzdWUgIAo+IAo+ID4gT24gV2VkLCA2IE1heSAyMDIwIDIwOjQ0
OjI5ICswMjAwIChDRVNUKQo+ID4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4g
d3JvdGU6Cj4gPiAgIAo+ID4+IEJlYW4sIEJvcmlzLAo+ID4+IAo+ID4+IC0tLS0tIFVyc3Byw7xu
Z2xpY2hlIE1haWwgLS0tLS0gIAo+ID4+ID4+ID4gQ29uY2VybmluZyB0aGlzLCBJIHN0aWxsIGhh
dmUgcXVlc3Rpb24sIGZvciB0aGUgVUJJRlMsICBJZiBJIGFtCj4gPj4gPj4gPiBjb3JyZWN0LCB0
aGVyZSBhcmUgRUMgYW5kIFZJRCBoZWFkZXIgYm90aCBiZWluZyBkYW1hZ2VkLCB0aGVuIFVCSUZT
Cj4gPj4gPj4gPiB3aWxsIHJlLWVyYXNlIGl0LiBJIGRvbid0IGtub3cgaWYgVUJJRlMgY2FuIGhh
bmRsZSB0aGVyZSBpcyBkaXJ0eS9maWxsaW5nIGRhdGEKPiA+PiA+PiA+IGluIHRoZSAgCj4gPj4g
Pj4gc29tZSBwYWdlcyAgYW5kIEVDL1ZJRCB2YWxpZC4gIAo+ID4+IAo+ID4+IFVoaC4gRGFtYWdp
bmcganVzdCBwYXlsb2FkIGFza3MgZm9yIHRyb3VibGUuICAKPiA+IAo+ID4gSSdkIGV4cGVjdCBV
QkkgdG8ganVzdCBtYXJrIHRoZSBMRUIgYXMgYmFkIGFuZCBzY2hlZHVsZSBpdCBmb3IgZXJhc3Vy
ZQo+ID4gKGFnYWluLCBwcmV0dHkgc2ltaWxhciB0byBhbiBpbnRlcnJ1cHRlZCBlcmFzZSkuICAK
PiAKPiBVQkkgc2NhbnMgb25seSBoZWFkZXJzIGR1cmluZyBhdHRhY2guIElmIHlvdSBkb24ndCB0
b3VjaCB0aGVzZSwgbm8gd2F5LgoKU29ycnksIEkgbWlzdW5kZXJzdG9vZCB3aGF0IHlvdSBtZWFu
dCBieSBwYXlsb2FkLiBVQkkgc2hvdWxkIHNjaGVkdWxlCnRoZSBQRUIgZm9yIGVyYXNlIGlmIHRo
ZSBFQy9WSUQgaGVhZGVyIGlzIGNvcnJ1cHRlZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
