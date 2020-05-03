Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F74C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028F620721
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 11:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDzQqxeT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028F620721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4lpFvQVknzbSJ/PiWYYQCv168Q6ZJg3v+kyyfaUt3U=; b=ZDzQqxeTC6mZzW
	5ul2dbSIQciLciWb3hgRenqNrBpyXWx1SZVud5Y0QCzBXAUSJ0bhYlksunllL2eEx62722l4+nnyC
	vsm04fwJXtzy45LD+rzaWVVgDb2ajZPOq4ykmhinibBXSe9bJ5CYcrlbx8Eb8mBzCDvG057XnC4h5
	GDsYp1MPHK+n5Qpl8YyrsRscQgMe3YpmsHQNnBm33o4beOVrQmZtA6+ZtVJNonvn2mPyW2c6B5iEL
	8jd/GsavhuJj9fXKIDAXCCeKeeE6jBa2SKww2sPCAf/95e61H9FMA8XA7+8AmOM0+Shucr+phg8C/
	sVi1CycHTcTxmLXgJOJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVCoK-00015V-Fe; Sun, 03 May 2020 11:29:28 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVCoG-00013G-Me
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 11:29:26 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8915A240003;
 Sun,  3 May 2020 11:29:15 +0000 (UTC)
Date: Sun, 3 May 2020 13:29:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>, Bean Huo
 <beanhuo@micron.com>
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Message-ID: <20200503132913.40b739a3@xps13>
In-Reply-To: <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com>
 <20200115091325.667c06a8@xps13>
 <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_042924_877695_5CA33097 
X-CRM114-Status: GOOD (  11.57  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwKClRoZXJlIGFyZSB0d28gdGVjaG5pY2FsIHF1ZXN0aW9ucyBiZWxvdyB0aGF0IEkg
d291bGQgbGlrZSB5b3UgdG8gYW5zd2VyLgoKPiA+Pj4gQWxzbyBhZnRlciBwb3dlciBsb3NzIGFs
bCBmbGFncyBpbiBtaWNyb24tPndyaXR0ZW5wIGFyZSBnb25lIHNvIHRoZQo+ID4+PiBtaWNyb25f
bmFuZF9hdm9pZF9zaGFsbG93X2VyYXNlIHdpbGwgcGVyZm9ybSBvbiBhbGwgUEVCcyBjYXVzaW5n
IHBlcmZvcm1hbmNlIGxvc3MuICAKPiA+Pgo+ID4+IFllcywgdGhhdCdzIGEgcGVyZm9ybWFuY2Ug
aGl0IHdlJ2xsIGhhdmUgdG8gYWNjZXB0IGZvciBub3cuCj4gPj4gIAo+ID4gCj4gPiBUaGlzIGlz
IHF1aXRlIHNldmVyZSBpc3N1ZSwgdGhpcyBpcyB0aGUgYmVzdCBpZGVhIHdlIGNhbWUgd2l0aCB0
bwo+ID4gbGltaXQgcGVyZm9ybWFuY2UgaGl0cy4gIAo+IAo+IFRoaXMgd2lsbCBiZSBhbiBpc3N1
ZSBvbiBkZXZpY2VzIHdoaWNoIHJlc3RhcnRzIHF1aXRlIG9mdGVuLCB3aGF0IGlmIHdlIHJlYWQg
T09CIG9mIG1pZGRsZSAKPiBwYWdlIG9mIHRoZSBibG9jayB3ZSBhcmUgYWJvdXQgdG8gZXJhc2Ug
YW5kIGlmIGl0IGhhcyBhbGwgMHhmZiB0aGUgaXQgbWVhbnMgaXQgaXMgCj4gcGFydGlhbGx5IHBy
b2dyYW1tZWQgYW5kIG5lZWRzIHRoZSBxdWlyay4gSXQncyByZWFkaW5nIDY0LzEyOCBieXRlcyAo
ZGVwZW5kaW5nIG9uIE5BTkQgCj4gc2l6ZSkgYmVmb3JlIGV2ZXJ5IGVyYXNlIHZlcnN1cyBwcm9n
cmFtbWluZyA4IHBhZ2VzIG9uIGVhY2ggUEVCIGVyYXNlIG9uY2UgcGVyIGRldmljZSByZXN0YXJ0
Lgo+IAo+IEFsc28gSSBrbm93IGJ5IHNwZWFraW5nIHdpdGggTWljcm9uIHRoYXQgcHJvZ3JhbW1p
bmcgMCBpbiBzcGFyZSBhcmVhIGlzIGVub3VnaCBhbmQgCj4gYWN0dWFsbHkgd2Ugc2hvdWxkIHBy
b2dyYW0gOCBldmVuL29kZCBwYWdlcyBzdGFydGluZyBmcm9tIG1pZGRsZSBvZiBQRUIuIEluIGNh
c2UgUEVCIGhhcyAKPiA2NCBwYWdlcyB3ZSBzaG91bGQgcHJvZ3JhbSBPT0Igb2YgcGFnZSAzMSwz
MywzNSwzNywzOSw0MSw0Myw0NSBvciAzMiwzNCwzNiwzOCw0MCw0Miw0NCw0Ngo+IENhbiBzb21l
Ym9keSBmcm9tIE1pY3JvbiBjb25maXJtIHRoYXQ/CgpTbyB0aGUgcXVlc3Rpb25zIGFyZToKCjEv
IFdoYXQgc2hvdWxkIHdlIHdyaXRlIGV4YWN0bHk6CiAgICAtPiB0aGUgbWFpbiBhcmVhCiAgICAt
PiB0aGUgT09CIGFyZWEKICAgIC0+IGJvdGgKICAgPwoKMi8gU2hhbGwgd2UgcHJlZmVyIHdyaXRp
bmcgOCBldmVuL29kZCBwYWdlcyBzdGFydGluZyBmcm9tOgogICAgLT4gdGhlIGJlZ2lubmluZyBv
ZiB0aGUKICAgIC0+IHRoZSBtaWRkbGUgb2YgdGhlIGJsb2NrCiAgICAtPiB3ZSBkbyBub3QgY2Fy
ZQogICA/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
