Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DB9CD3436
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frljvYa3Rte8bd7kxHQtqBfr7VWjvAA00NWvez3oPNE=; b=Im2DPSuzYUEx+U
	2tBqN5WUORR/Ts1hqDvCcyM9h0oRB3ALA5ur6IBXALRzAxQUc88iY6DI1kp3kFBBOXrKfUSImMpUB
	ZBxcc3t2wo8BX5/3Lu8Qab7EkLKNVklUq418KwFh+JbINdOlSqRa0TKRUxbeKaIbvkNfbm/rjAbnv
	duefeXqwPm9Tzkg6E+NjDVTjWdcdnzjVM20bfRoPZfHsqJUuLsGPO6wACBKDtHLe/xLt+NB7/9+w1
	id1g26GcAC1MoUdLMNKHusjGYouMPIKNtksUFn6M5B5KjDjpk0VW+hKDxGeogObarNKTlkVMr4qT8
	nCOTxm9Kz7O5d2oVatwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYy1-00000000Pop-1X5l;
	Wed, 06 May 2026 09:54:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYxy-00000000PoH-1jeN
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 09:54:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67968C5DC42;
	Wed,  6 May 2026 09:55:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B8596053C;
	Wed,  6 May 2026 09:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F25102F1D29;
	Wed,  6 May 2026 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778061291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kry9DMuUnA50j0a4HF1Gs9PIvidQcY7aI9zrq2OMqy4=;
	b=w/K8N5T1Svt/xDNEBV6ax1XTRM83cFoNBt3d8gaLlAfaXLqtb+ymSSvo01oPl7WAc1plJF
	9qHr7K731lDqUul6+eo0b/HW4MtTW/KxewO/pjvaZcppCLHhdmY0DRHgYWPpTHbz+egL6g
	D5K1JzUbOvG8CJSz5yA7sYCABXNoiF6nrlBNMnfmnmW5o4sWVXTQwMBXwVyxp/8nNSwd3j
	rAn+CiT0eXLu6bEhv68LMfVEbIBHTtGxXTOjOVwv2aHCttq1jgaTVlwpQlngo4V21nTzjI
	ci+MgVj82Dm8TMsK7ltflGvKW4YLlmT/5t/Ds1zyviZJgU9v4S5YhJu1Yv1GGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,  "Steam Lin"
 <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org> (Michael Walle's message
	of "Wed, 06 May 2026 11:06:22 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	<2vxzbjet266g.fsf@kernel.org> <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 11:54:45 +0200
Message-ID: <87cxz8n9qy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025456_212283_DD42E1C5 
X-CRM114-Status: GOOD (  15.89  )
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

T24gMDYvMDUvMjAyNiBhdCAxMTowNjoyMiArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUdWUgTWF5IDUsIDIwMjYgYXQgNjowNSBQTSBDRVNULCBQ
cmF0eXVzaCBZYWRhdiB3cm90ZToKPj4gT24gRnJpLCBBcHIgMDMgMjAyNiwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4KPj4+IFRoZXJlIGFyZSBtYW55IGhlbHBlcnMgYWxyZWFkeSB0byBlaXRoZXIg
cmVhZCBhbmQvb3Igd3JpdGUgU1IgYW5kL29yIENSLAo+Pj4gYXMgd2VsbCBhcyBzb21ldGltZXMg
Y2hlY2sgdGhlIHJldHVybmVkIHZhbHVlcy4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0bwo+Pj4gc3dp
dGNoIGZyb20gYSAxIGJ5dGUgc3RhdHVzIHJlZ2lzdGVyIHRvIGEgMiBieXRlcyBzdGF0dXMgcmVn
aXN0ZXIgd2hpbGUKPj4+IGtlZXBpbmcgdGhlIHNhbWUgbGV2ZWwgb2YgdmVyaWZpY2F0aW9uLCBs
ZXQncyBpbnRyb2R1Y2UgYSBuZXcgaGVscGVyCj4+PiB0aGF0IHdyaXRlcyB0aGVtIGJvdGggKGF0
b21pY2FsbHkpIGFuZCB0aGVuIHJlYWRzIHRoZW0gYmFjayAoc2VwYXJhdGVkKQo+Pj4gdG8gY29t
cGFyZSB0aGUgdmFsdWVzLgo+Pj4KPj4+IEluIGNhc2UgMiBieXRlcyByZWdpc3RlcnMgYXJlIG5v
dCBzdXBwb3J0ZWQsIHdlIHN0aWxsIGhhdmUgdGhlIHVzdWFsCj4+PiBmYWxsYmFjayBhdmFpbGFi
bGUgaW4gdGhlIGhlbHBlciBiZWluZyBleHBvcnRlZCB0byB0aGUgcmVzdCBvZiB0aGUgY29yZS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+Pgo+PiBJJ20gY29uZnVzZWQuIERvZXNuJ3Qgc3BpX25vcl93cml0ZV8xNmJpdF9z
cl9hbmRfY2hlY2soKSBkbyB0aGUgc2FtZQo+PiB0aGluZz8gSG93IGFyZSB0aGVzZSB0d28gZGlm
ZmVyZW50Pwo+Cj4gU28gSSd2ZSBuZXZlciBjb21lIGFyb3VuZCB0byBmaW5pc2ggcmV2aWV3aW5n
IHRoaXMgc2VyaWVzIGR1ZSB0bwo+IHBlcnNvbmFsIHJlYXNvbnMsIGJ1dCBoZXJlIGFyZSBteSBy
ZW1hcmtzLiBQZXJzb25hbGx5LCBJIHJlYWxseQo+IGRvbid0IGxpa2UgYWxsIHRoZXNlIG11bHRp
cGxlIGhlbHBlcnMgZG9pbmcgYWxtb3N0IHRoZSBzYW1lIHRoaW5nLgo+IEJ1dCBpdCBpcyB3aGF0
IGlzIGlzIGZvciBub3cuCj4KPiBCYWNrIHdoZW4gcmV2aWV3aW5nIHRoaXMgc2VyaWVzLCBJJ3Zl
IGRpZ2dlZCBpbnRvIHRoaXMgYW5kIGl0IG1vc3RseQo+IGV2b2x2ZSBhcm91bmQgaG93IHRvIGVu
YWJsZSB0aGUgUUUgYml0LCB0aGF0IGlzIGRlZmluZWQgaW4gdGhlIDE1dGgKPiBTRkRQIERXT1JE
LiBPbmUgY291bGQgc2VlIGhvdyB3ZSBjb3VsZCBjb25zb2xpZGF0ZSBhbGwgdGhlIHN0YXR1cwo+
IHJlZ2lzdGVyIGhhbmRsaW5nIGluIG9uZSBmdW5jdGlvbiB3aGljaCBhcmUgdGhlbiBjYWxsZWQg
YnkgdGhlCj4gZGlmZmVyZW50IChzcGVjaWZpZWQpIHF1YWRfZW5hYmxlIGhlbHBlcnMuCgpJIGFs
cmVhZHkgaGFkIGEgbG9vaywgaXQgZG9lc24ndCBzZWVtIHNvIHN0cmFpZ2h0Zm9yd2FyZC4gQnV0
IEkgd2lsbApsb29rIGludG8gaXQgZGVlcGVyLCBJIGFtIHdpbGxpbmcgdG8gaW1wcm92ZSB0aGlu
Z3MuIFRoZXJlIHdpbGwgYW55d2F5CmJlIGEgd2lkZSB2YXJpZXR5IG9mIGhlbHBlcnMgYmVjYXVz
ZSB0aGVyZSBpcyBhIHdpZGUgdmFyaWV0eSBvZiBRRVIKcG9zc2liaWxpdGllcy4gV2hhdCB3ZSBj
YW4gZG8gdGhvdWdoLCBpcyB0byBkZWNvdXBsZSBzdGF0dXMgcmVnaXN0ZXIKd3JpdGluZyBhbmQg
UUUgYml0IG1hc2tpbmcuCgpIb3dldmVyLCBJIHdvdWxkIGxpa2UgdG8gcG9pbnQgdGhhdCB0aGlz
IGlzIHRvdGFsbHkgb3J0aG9nb25hbCB0byB0aGUKd2hvbGUgKGFsbW9zdCAzMCBwYXRjaCBsb25n
KSBsb2NraW5nIGNsZWFudXAgYW5kIENNUCBmZWF0dXJlIHNlcmllcywgc28KSSBkbyBub3QgcGxh
biB0byBjaGFuZ2UgdGhpcyBwYXJ0aWN1bGFyIGltcGxlbWVudGF0aW9uIGluCnY1LiBSZW9yZ2Fu
aXNpbmcgdGhlc2UgaGVscGVycyBzaG91bGQgYmUgZG9uZSBpbiBpdHMgb3duIGZvbGxvdy11cApz
ZXJpZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
