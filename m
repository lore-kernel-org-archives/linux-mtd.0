Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7A9C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3717020746
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mx80T2Uf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3717020746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTQCh7FqCNdwkHZg8L3O41bftPqXRmVZxmNwzOTbyp8=; b=Mx80T2UfI8q28k
	TJhmqQaO+Zady3T4m3uKZtgL4oc/p8jjYcrUuI54iRb5v4QhSB4VxMhOFN8GK44q+NeLXPmemzyyq
	fYTqzzRCL3HsOmSp/b+tcLCdqE+lhKDCCLLvUyHPPzZ7Any2cwiJlhoX0MgKUfdic6UnS3f36gho0
	x3TM4Kq9wXWV4ez7iEV023MW6Yjs9jqTOE8JRwTgyPnA6MWugGeq93WtWakwUbBiOSFK9TXrpd/lQ
	gAEuhQLpJiLyzGo0TO5g28ALyZ7i0stKEAiF5FDIsajphe3688OOr4FlpXrmkboKG5XMdextIyTVi
	ibs9NcNnNihe5MgsUL4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWSt-0006F6-Ck; Mon, 04 May 2020 08:28:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWRI-0004bI-BZ
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:27:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5FC6720027;
 Mon,  4 May 2020 08:26:14 +0000 (UTC)
Date: Mon, 4 May 2020 10:26:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow
 erase issue
Message-ID: <20200504102612.5ba87dfc@xps13>
In-Reply-To: <BN7PR08MB568404414BA497C387EB913BDBA60@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com>
 <20200115091325.667c06a8@xps13>
 <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
 <20200503132913.40b739a3@xps13>
 <BN7PR08MB568404414BA497C387EB913BDBA60@BN7PR08MB5684.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_012700_549758_B1F12C81 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, "Zoltan
 Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "Wojtaszczyk,
 Piotr" <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwKCiJCZWFuIEh1byAoYmVhbmh1bykiIDxiZWFuaHVvQG1pY3Jvbi5jb20+IHdyb3Rl
IG9uIE1vbiwgNCBNYXkgMjAyMAowODowODozNCArMDAwMDoKCj4gPiAKPiA+IFNvIHRoZSBxdWVz
dGlvbnMgYXJlOgo+ID4gCj4gPiAxLyBXaGF0IHNob3VsZCB3ZSB3cml0ZSBleGFjdGx5OiAgCj4g
PiAgICAgLT4gdGhlIG1haW4gYXJlYQo+ID4gICAgIC0+IHRoZSBPT0IgYXJlYQo+ID4gICAgIC0+
IGJvdGggIAo+ID4gICAgPyAgCj4gCj4gVGhlIE1haW4gYXJlYSBpcyBvay4KPiAKPiA+IAo+ID4g
Mi8gU2hhbGwgd2UgcHJlZmVyIHdyaXRpbmcgOCBldmVuL29kZCBwYWdlcyBzdGFydGluZyBmcm9t
OiAgCj4gPiAgICAgLT4gdGhlIGJlZ2lubmluZyBvZiB0aGUKPiA+ICAgICAtPiB0aGUgbWlkZGxl
IG9mIHRoZSBibG9jawo+ID4gICAgIC0+IHdlIGRvIG5vdCBjYXJlICAKPiA+ICAgID8KPiA+ICAg
Cj4gRm9sbG93IHRoZSBzZXF1ZW5jZSBvZiBibG9jayBwcm9ncmFtbWluZywgZnJvbSB0aGUgbG93
ZXN0IHRvIHRoZSBoaWdoZXN0IHBhZ2UgYWRkcmVzcy4KPiBUaGlzIGlzIG5vcm1hbCBwcm9ncmFt
bWluZyBzZXF1ZW5jZS4gIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGJsb2NrIG1ha2Ugc2Vuc2UuCgpU
aGFua3MgZm9yIGFuc3dlcmluZyEgQW55IGNoYW5jZSB0aGF0IHlvdSBnaXZlIHVzIG1vcmUgZGV0
YWlscyBvbiB0aGUKc2VyaWVzIHdoaWNoIGFyZSBhZmZlY3RlZD8gCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
