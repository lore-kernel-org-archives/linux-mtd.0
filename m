Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA42C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:51:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D82207DE
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwmxiVeE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gs51p7O1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D82207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdvEkmsNHXEL/p7N214yytDgspxMRVtcxVU471Mk6nA=; b=YwmxiVeE7jEn9ORW8mgdbtyWX
	fGMTLDhuyBYZ0aK4nT6el5DCRrlYhmXev9LkdbQmxj4vBaHpb75CExcAFJaP4VofD/RXhYTkSpeG+
	YAkLR3ea4DI59DjDHEWFL3KB+AN5qq8JStH3L7ZSmt09JQQKZUle80bvW9OC043/ni2pOkRysSSd0
	pd7B+cag8M9WlRTC10N15+0xfbQX23Xv5wxPK2zOz7+LORiUo50iEFLOMYfS6hg4mGn2WQRuYoikx
	XxmFHQmrKo2I9slXBUkSy+i0IE6IeFNEiEVD9qZaEZyyJrEbAjSqIh0k9zytHiYERRzBHGlR/vuc7
	eJ4SDTerw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNwAK-0007TO-2J; Thu, 01 Oct 2020 10:50:24 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNwAH-0007Sh-9f
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:50:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091AoEXG096966;
 Thu, 1 Oct 2020 05:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601549414;
 bh=zjVe+1hVGG9fRo6kpJTm9iQgf/nkwnz8d97EAW7jcHQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Gs51p7O1KF0ErqsOLXksH1++lJMAbEXKWq8FGE6JSfFd7leOjRdITaOGgicIo+gxG
 njCVWCPyg6suoqIctHNkEgqdc/aONWyvIQmRYl7eae4yW7BtHSyA5QXRFuOdqQGBYt
 gdEpG2JnLk3QoF7u4x9907aRBGjcAhbLwlUu3as4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091AoDCP020945;
 Thu, 1 Oct 2020 05:50:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 05:50:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 05:50:13 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091Ao9bt067843;
 Thu, 1 Oct 2020 05:50:11 -0500
Subject: Re: [PATCH v14 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
To: Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-2-p.yadav@ti.com>
 <5340adf5-1bb2-1eff-3812-6976b3b76faf@microchip.com>
 <20201001073425.txsfdngrsugsy6uf@ti.com> <20201001095012.5c331bf8@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b252d015-18d0-0651-87ec-5c4bbfab8411@ti.com>
Date: Thu, 1 Oct 2020 16:20:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001095012.5c331bf8@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_065021_426227_9345C1AD 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMC8xLzIwIDE6MjAgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPiB3cm90ZSBvbiBUaHUsIDEgT2N0IDIw
MjAgMTM6MDQ6MjcgKzA1MzA6Cj4gCj4+IE9uIDAxLzEwLzIwIDA3OjE5QU0sIFR1ZG9yLkFtYmFy
dXNAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+IE9uIDkvMzAvMjAgOTo1NyBQTSwgUHJhdHl1c2gg
WWFkYXYgd3JvdGU6ICAKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiAK
PiBJdCBzZWVtcyB0aGF0IHlvdXIgbWFpbGVyL3NlcnZlciBpbnRyb2R1Y2VkIHRoYXQgbGluZSBh
dXRvbWF0aWNhbGx5LAo+IGNhbiB5b3UgZG8gc29tZXRoaW5nIHRvIGF2b2lkIGl0Pwo+IAo+Pj4+
Cj4+Pj4gRU5PVFNVUFAgaXMgbm90IGEgU1VTVjQgZXJyb3IgY29kZS4gVXNpbmcgRU9QTk9UU1VQ
UCBpcyBwcmVmZXJyZWQKPj4+PiBpbiBpdHMgc3RlYWQuCj4gCj4gSSByYW4gaW50byB0aGlzIGNo
ZWNrcGF0Y2gucGwgZXJyb3IgcmVjZW50bHksIEkgY291bnQgODArIGl0ZXJhdGlvbnMgaW4KPiBk
cml2ZXJzL210ZC8gc28gcGVyaGFwcyBoYXZpbmcgYSBzdWJzeXN0ZW0gd2lkZSByZXBsYWNlbWVu
dCB3aWxsIGJlCj4gbmljZS4gSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIHRob3VnaCBhcyBpdCBp
cyBhZGRyZXNzaW5nIGFsbCBTUEktTk9SCj4gY2FzZXMgYWxyZWFkeS4KPiAKClllYWgsIHNpbmNl
IHRoaXMgaXMgU1BJIE5PUiB3aWRlIEkgd2lsbCBnbyBhaGVhZCBhbmQgYXBwbHkuCkFsc28sIHRo
aXMgd291bGQgYXZvaWQgY29uZnVzaW9uIGZvciBwcGwgYWRkaW5nIG5ldyBjb2RlIG9uIHdoZXRo
ZXIgdG8KYWRkcmVzcyB0aGUgY2hlY2twYXRjaCB3YXJuaW5nIG9yIGZvbGxvdyB0aGUgZXhpc3Rp
bmcgY29udmVudGlvbi4KClJlZ2FyZHMKVmlnbmVzaAoKPiBDaGVlcnMsCj4gTWlxdcOobAo+IAoK
Wy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
