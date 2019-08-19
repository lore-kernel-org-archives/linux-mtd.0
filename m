Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3764C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 04:40:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746272087E
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 04:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXCxZJNX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mWIrPMjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746272087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGTwsgP1f3ow6DqHFoVzuJZh6rQgtmf9QDWu0a/LDgY=; b=TXCxZJNXHncar2
	EQ/VbNpqY6SmJ0/ng32KciL76nhCKTkzmt0fm8D/j7E9G5NJaP2qBEn0ztdce7Z3BU7RlszaN5lOp
	5eRIKCoTU8YkwuTQwgmcx2YFJEVO4aCOhhh9scvlfeURctpunViIvQnEh24oxUWMPEgfYbgGp4VhR
	iDWDblFCrQQawEi54PgKc0QFOmMVnenBVMnaiNT3lDZObOEoL130dDHlacu9K0Py/sB7dLY/80tGC
	yqrNAOCKim2PLFeau+CeoEdnNWXc6vGXbQGqpYHU1ilNAtL9XIsR4DtDjyvOfq6h62a5pafEm3jfO
	14nP460CcsYN9mjQTiEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzZSN-0002fg-1F; Mon, 19 Aug 2019 04:39:47 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzZSJ-0002aV-G7
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 04:39:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7J4dJ36095386;
 Sun, 18 Aug 2019 23:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566189559;
 bh=SBM143+uKwC8gIRpIrvI0uZ39YPdVq+NjfiPpDmemoo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mWIrPMjNpyIs7BqM2nUDCV/ei9nWDDqt8QKvxJ+iaeM9/iE34NmkGfPAnRCXtTRHW
 9ivB8nziFGW3asvd7KDnmcRabF98N2WdpXJTcGargtxrDEoCyFK6SYUca2LMC5878i
 w+SKd9PWojDPRnqOshmsGo2kX8iqvZoLNBmlvvhw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7J4dJ5W065905
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 18 Aug 2019 23:39:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 18
 Aug 2019 23:39:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 18 Aug 2019 23:39:18 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7J4dEZr069725;
 Sun, 18 Aug 2019 23:39:15 -0500
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
To: John Garry <john.garry@huawei.com>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
 <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
Date: Mon, 19 Aug 2019 10:09:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_213943_622367_985BB4FE 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxNi8wOC8xOSAzOjUwIFBNLCBKb2huIEdhcnJ5IHdyb3RlOgo+IE9uIDA2LzA4LzIw
MTkgMTc6NDAsIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6ClsuLi5dCj4gCj4gSGksCj4gCj4gQ291
bGQgc29tZW9uZSBraW5kbHkgYWR2aXNlIG9uIHRoZSBmb2xsb3dpbmc6Cj4gCj4gSSBhbSBsb29r
aW5nIGF0IEFDUEkgc3VwcG9ydCBvbmx5IGZvciBhbiBtdGQgc3BpIG5vciBkcml2ZXIgd2UncmUK
PiB0YXJnZXRpbmcgZm9yIG1haW5saW5lIHN1cHBvcnQuCj4gCgpJZiBpdHMgYSBuZXcgZHJpdmVy
LCBwbGVhc2UgYWRkIGl0IHVuZGVyIGRyaXZlcnMvc3BpIGltcGxlbWVudGluZyBTUEkKTUVNIGZy
YW1ld29yay4KVGhlcmUgYXJlIGZldyBkcml2ZXJzIHVuZGVyIGRyaXZlcnMvc3BpIHRoYXQgY2Fu
IGJlIHVzZWQgYXMgZXhhbXBsZS4KKFNlYXJjaCBmb3IgInNwaV9tZW1fb3BzIikKCj4gU28gZm9y
IHRoZSBob3N0LCBJIGNvdWxkIHVzZSBhIHByb3ByaWV0YXJ5IEhJRCBpbiB0aGUgRFNEVCBmb3Ig
bWF0Y2hpbmcKPiBpbiB0aGUga2VybmVsIGRyaXZlci4KPiAKPiBBYm91dCB0aGUgY2hpbGQgc3Bp
IGZsYXNoIGRldmljZXMsIGlzIHRoZSByZWNvbW1lbmRhdGlvbiB0byBqdXN0IHVzZQo+IFBSUDAw
MDEgSElEIGFuZCAiamVkZWMsc3BpLW5vciIgY29tcGF0aWJsZT8KPgoKSSBhbSBub3QgcXVpdGUg
ZmFtaWxpYXIgd2l0aCBBQ1BJIHN5c3RlbXMsIGJ1dCBjaGlsZCBmbGFzaCBkZXZpY2Ugc2hvdWxk
CnVzZSAiamVkZWMsc3BpLW5vciIgYXMgY29tcGF0aWJsZS4KClJlZ2FyZHMKVmlnbmVzaAoKPiB0
aGFua3MsCj4gSm9obgo+IAo+IAo+Pgo+PiBATWFpbnRhaW5lcnM6Cj4+IE1heWJlIHRoZSBkb2Nz
IHVuZGVyIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tdGQgc2hvdWxkIGJlIG9mZmljaWFsbHkK
Pj4gbWFpbnRhaW5lZCBieSB0aGUgTVREIHN1YnN5c3RlbSAoYW5kIGFkZGVkIHRvIE1BSU5UQUlO
RVJTKS4gQW5kIGlmIHRoZXJlCj4+IHdpbGwgYmUgc29tZSBkcml2ZXIgQVBJIGRvY3MgZm9yIFNQ
SSBNRU0gaXQgc2hvdWxkIHByb2JhYmx5IGxpdmUgaW4KPj4gRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL3NwaSBpbnN0ZWFkIG9mIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tdGQsIGFzCj4+IHNw
aS1tZW0uYyBpdHNlbGYgaXMgaW4gZHJpdmVycy9zcGkuCj4+Cj4+IFJlZ2FyZHMsCj4+IEZyaWVk
ZXIKPj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBKb2huCj4+Pgo+Pj4+IEBAIC01OSw3ICs1OSw3IEBA
IFBhcnQgSUlJIC0gSG93IGNhbiBkcml2ZXJzIHVzZSB0aGUgZnJhbWV3b3JrPwo+Pj4+Cj4+Pj4g
wqBUaGUgbWFpbiBBUEkgaXMgc3BpX25vcl9zY2FuKCkuIEJlZm9yZSB5b3UgY2FsbCB0aGUgaG9v
aywgYSBkcml2ZXIKPj4+PiBzaG91bGQKPj4+PiDCoGluaXRpYWxpemUgdGhlIG5lY2Vzc2FyeSBm
aWVsZHMgZm9yIHNwaV9ub3J7fS4gUGxlYXNlIHNlZQo+Pj4+IC1kcml2ZXJzL210ZC9zcGktbm9y
L3NwaS1ub3IuYyBmb3IgZGV0YWlsLiBQbGVhc2UgYWxzbyByZWZlciB0bwo+Pj4+IGZzbC1xdWFk
c3BpLmMKPj4+PiArZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgZm9yIGRldGFpbC4gUGxl
YXNlIGFsc28gcmVmZXIgdG8KPj4+PiBzcGktZnNsLXFzcGkuYwo+Pj4+IMKgd2hlbiB5b3Ugd2Fu
dCB0byB3cml0ZSBhIG5ldyBkcml2ZXIgZm9yIGEgU1BJIE5PUiBjb250cm9sbGVyLgo+Pj4+IMKg
QW5vdGhlciBBUEkgaXMgc3BpX25vcl9yZXN0b3JlKCksIHRoaXMgaXMgdXNlZCB0byByZXN0b3Jl
IHRoZSBzdGF0dXMKPj4+PiBvZiBTUEkKPj4+PiDCoGZsYXNoIGNoaXAgc3VjaCBhcyBhZGRyZXNz
aW5nIG1vZGUuIENhbGwgaXQgd2hlbmV2ZXIgZGV0YWNoIHRoZQo+Pj4+IGRyaXZlciBmcm9tCj4+
Pj4KPj4+Cj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
PiAKPiAKCi0tIApSZWdhcmRzClZpZ25lc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
