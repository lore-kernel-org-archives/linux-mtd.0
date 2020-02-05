Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D710C33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 10:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313092051A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 10:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VgjdxWBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 313092051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJTbVxXUdsH7j1IJOU3pFDt1fD92dTTLJLgwDrG2qh0=; b=VgjdxWBNSQD3RE
	BZ+AQ/dVmxcG5aUIcXbuS4FvV2+IIPXkV2R373Q77L3Yl23b9GzELO5nDjz3BCbEic2kVbNLZWuAM
	MMIXLe25TFPY9B6Ejt4s4JwBo71xQYcFajsl3r+APOmoYoNv1VaG+uwlK5k62xkw4fKWsaKAezvEM
	NwuNuNtBPcLa1tumfzwA1DdRpYjfFqX2tEfhTgVivG5EhOy0xKVZiTBkvNj8H7ENMklTwwdSH9IV8
	YnMPxecd0aWv/oo8h5s6ocDtCiQtzah/f0j8Kg/5POanR6yEenxF7ZRLG4sMZr6KN7htiX5EfXcGP
	EE2MvHYRp5KdEYj7M9mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izHUc-0007qW-Lr; Wed, 05 Feb 2020 10:01:10 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izHUY-0007pJ-Ux
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 10:01:08 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2940D1C000D;
 Wed,  5 Feb 2020 10:01:02 +0000 (UTC)
Date: Wed, 5 Feb 2020 11:01:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH] mtd: nand: Add comment about Kioxia ID
Message-ID: <20200205110101.3d4e2e6a@xps13>
In-Reply-To: <73dae14b-5bf0-b909-3229-aab3ed232669@kioxia.com>
References: <1580783163-5601-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
 <20200204095214.666c71fc@xps13>
 <73dae14b-5bf0-b909-3229-aab3ed232669@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_020107_134740_204505CD 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBUdWUsIDQgRmViIDIwMjAKMTk6MzA6MDQgKzA5MDA6Cgo+IERlYXIgTWlxdcOo
bCwKPiAKPiAKPiBPbiAyMDIwLzAyLzA0IDE3OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
SGkgWW9zaGlvLAo+ID4KPiA+IFlvc2hpbyBGdXJ1eWFtYSA8eXRjLW1iLXlmdXJ1eWFtYTdAa2lv
eGlhLmNvbT4gd3JvdGUgb24gVHVlLCAgNCBGZWIKPiA+IDIwMjAgMTE6MjY6MDMgKzA5MDA6Cj4g
PiAgCj4gPj4gQWRkIGEgY29tbWVudCBhYm92ZSBOQU5EX01GUl9UT1NISUJBIGFuZCBTUElOQU5E
X01GUl9UT1NISUJBIGRlZmluaXRpb25zCj4gPj4gdGhhdCBUb3NoaWJhIGFuZCBLaW94aWEgSUQg
YXJlIHRoZSBzYW1lLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogWW9zaGlvIEZ1cnV5YW1hIDx5
dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW50ZXJuYWxzLmggfCAxICsKPiA+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL3Rv
c2hpYmEuYyAgIHwgMSArCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgKPiA+PiBpbmRleCBjYmE2ZmU3Li4yOTE4
Mzc2YiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlcm5hbHMuaAo+
ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oCj4gPj4gQEAgLTMwLDYg
KzMwLDcgQEAKPiA+PiAgICNkZWZpbmUgTkFORF9NRlJfU0FNU1VORwkweGVjCj4gPj4gICAjZGVm
aW5lIE5BTkRfTUZSX1NBTkRJU0sJMHg0NQo+ID4+ICAgI2RlZmluZSBOQU5EX01GUl9TVE1JQ1JP
CTB4MjAKPiA+PiArLyogVG9zaGliYSBhbmQgS2lveGlhIElEIGFyZSB0aGUgc2FtZS4gKi8KPiA+
PiAgICNkZWZpbmUgTkFORF9NRlJfVE9TSElCQQkweDk4Cj4gPj4gICAjZGVmaW5lIE5BTkRfTUZS
X1dJTkJPTkQJMHhlZiAgCj4gPj4gICA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9z
cGkvdG9zaGliYS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jICAKPiA+PiBpbmRl
eCAwZGI1ZWU0Li5hOTJlY2M4IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L3Rvc2hpYmEuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3Rvc2hpYmEuYwo+ID4+
IEBAIC0xMCw2ICsxMCw3IEBACj4gPj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPj4g
ICAjaW5jbHVkZSA8bGludXgvbXRkL3NwaW5hbmQuaD4gIAo+ID4+ICAgPj4gKy8qIFRvc2hpYmEg
YW5kIEtpb3hpYSBJRCBhcmUgdGhlIHNhbWUuICovICAKPiA+PiAgICNkZWZpbmUgU1BJTkFORF9N
RlJfVE9TSElCQQkJMHg5OAo+ID4+ICAgI2RlZmluZSBUT1NIX1NUQVRVU19FQ0NfSEFTX0JJVEZM
SVBTX1QJKDMgPDwgNCkgIAo+ID4+ICAgPiAgCj4gPiAiQXJlIHRoZSBzYW1lIiBpcyBub3QgdmVy
eSBkZXNjcmlwdGl2ZSwgd2hhdCBhYm91dCAiS2lveGlhIGlzIHRoZSBuZXcKPiA+IG5hbWUgb2Yg
VG9zaGliYSI/ICAKPiAKPiAKPiBUaGF0J3MgYSBnb29kIGlkZWEuCj4gCj4gQWN0dWFsbHkgLAo+
IAo+IElzIHdhcyBjaGFuZ2VkIGEgY29tcGFueSBuYW1lIGZyb20gVG9zaGliYSBtZW1vcnkgQ28g
dG8gS2lveGlhIENvLsKgwqDCoMKgIFNpbmNlIGJlY2FtZSBpbmRlcGVuZGVudCBmcm9tIFRvc2hp
YmEgZ3JvdXAuCj4gCj4gSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWVudCBhcyAiS2lveGlhIGlzIG5l
dyBuYW1lIG9mIFRvc2hpYmEgbWVtb3J5IgoKV2VsbCwgaW4gdGhpcyBjYXNlIEkgd291bGQgZXZl
biByZWNvbW1lbmQgc29tZXRoaW5nIG1vcmUgbWVhbmluZ2Z1bDoKCiJTaW5jZSBpdHMgaW5kZXBl
bmRlbmNlIGZyb20gVG9zaGliYSBHcm91cCwgVG9zaGliYSBtZW1vcnkgQ28gaGFzIGJlY29tZSBL
aW94aWEgQ28iCgpBbHNvLCBwbGVhc2UgdXBkYXRlIHRoZSB2ZXJzaW9uIG9mIHlvdXIgcGF0Y2gg
dG8gInYzIiBpbiB0aGUgdGl0bGUKIltQQVRDSCB2M10gLi4uIiwgdGhpcyBjYW4gYmUgZG9uZSBh
dXRvbWF0aWNhbGx5IHdoZW4gZm9ybWF0dGluZyB5b3VyCnBhdGNoIHdpdGggZ2l0IGZvcm1hdC1w
YXRjaCB3aXRoIHRoZSAtdiAzIG9wdGlvbi4KCkFsc28gdGhlIHByZWZpeCBzaG91bGQgYmUgIm10
ZDogc3BpbmFuZDogdG9zaGliYToiCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
