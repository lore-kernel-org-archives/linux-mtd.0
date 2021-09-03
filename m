Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA42C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 09:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5ADA61051
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 09:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5ADA61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te17L1J718Juo3RS6v9sOXT/j97Aa32WiphVk3ZQM3I=; b=acn6eOVcIOjYps
	NQh2iQQ9Z/l5JuR47yBwPeX+5ME/Ojzp1CpFoROAgxS/8CmG8NlBHSwcEWP3cZah8hJdpEOyzb6dc
	S12b9gppiKJ86f9ItN1EZFQcoYspiVn/w38/4yihVh4U90PesN9+WReNgKpaJotQ+uwI5+QJVRBVN
	qMzFol5+yrborDVUWO+pYZlw/1CuohErG4T+PPi18kz+v4YuaiY6h+56eXYyc8EdsAEAvquMC7mow
	mqTj2T77qZfwdSNef2slFZEwVCZXrBHpUa+wJaS3/a3Id/0Jl7IxKkBXLtZbrDaz2xA8b3NBlJcEw
	w17Rmyrjc8P7ZBpV+6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM5Kp-00BQoS-4Z; Fri, 03 Sep 2021 09:18:07 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM5Kj-00BQlN-5B
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 09:18:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BC5AC20005;
 Fri,  3 Sep 2021 09:17:56 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:17:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Richard Weinberger <richard@nod.at>, Linux PM
 <linux-pm@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] PM / suspend: move userspace freeze before disk sync
Message-ID: <20210903111755.0972850d@xps13>
In-Reply-To: <20210903081751.3qq36nrksucqthss@skn-laptop>
References: <20210901083442.210230-1-sean@geanix.com>
 <CAJZ5v0j5dMDSDjhuXaZd=_J5JOP4Z09WUXfjWX_iCcT4RDisCg@mail.gmail.com>
 <20210903081751.3qq36nrksucqthss@skn-laptop>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_021801_355468_2F64B8E1 
X-CRM114-Status: GOOD (  23.96  )
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

SGkgU2VhbiwKCnNlYW5AZ2Vhbml4LmNvbSB3cm90ZSBvbiBGcmksIDMgU2VwIDIwMjEgMTA6MTc6
NTEgKzAyMDA6Cgo+IE9uIFRodSwgU2VwIDAyLCAyMDIxIGF0IDA2OjI4OjE0UE0gKzAyMDAsIFJh
ZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gV2VkLCBTZXAgMSwgMjAyMSBhdCAxMDozNSBB
TSBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+IHdyb3RlOiAgCj4gPiA+Cj4gPiA+IFRo
aXMgZml4ZXMgYW4gaXNzdWUgd2hlcmUgZGF0YSByZW1haW5zIHVud3JpdHRlbiBiZWZvcmUgc3Vz
cGVuZC4gIAo+ID4gCj4gPiBXZWxsLCBpdCBkb2Vzbid0IG1ha2UgdGhlIGlzc3VlIGdvIGF3YXks
IGl0IGp1c3QgaGlkZXMgaXQgZm9yIHlvdSBhbmQKPiA+IGl0IG1heSB2ZXJ5IHdlbGwgZXhwb3Nl
IGl0IGZvciBzb21lb25lIGVsc2UuICAKPiAKPiBPSwo+IAo+ID4gCj4gPiBJbiBwYXJ0aWN1bGFy
LCBub3RlIHRoYXQgeW91IGNhbiBjb21waWxlIHRoZSBrZXJuZWwgd2l0aAo+ID4gQ09ORklHX1NV
U1BFTkRfU0tJUF9TWU5DIHNldCB3aGljaCBtYWtlcyBpdCBub3Qgc3luYyBhdCBhbGwgZHVyaW5n
Cj4gPiBzeXN0ZW0td2lkZSBzdXNwZW5kIGFuZCB0aGlzIGlzIGEgdmFsaWQgY2FzZSBleHBlY3Rl
ZCB0byB3b3JrLiAgSXQKPiA+IGxvb2tzIGxpa2UgdGhpcyBjYXNlIGRvZXNuJ3Qgd29yayBmb3Ig
eW91Lgo+ID4gICAKPiA+ID4gVUJJIHRyaWVkIHRvIHdyaXRlIGRhdGEsIGJlZm9yZSB0aGUgbXRk
IGRldmljZSBoYWQgYmVlbiB1bnN1c3BlbmRlZC4gIAo+ID4gCj4gPiBXZWxsLCB0aGF0J3MgdGhl
IHJlYWwgcHJvYmxlbSBhbmQgaXQgY2FuIGhhcHBlbiByZWdhcmRsZXNzIG9mIHdoZXRoZXIKPiA+
IG9yIG5vdCB0aGlzIHBhdGNoIGlzIHRoZXJlLiAgCj4gCj4gSG93IHRvIGZpeCBpdCB0aGVuPwo+
IFdlIGNhbid0IGxpdmUgd2l0aCBkZXZpY2VzIHRoYXQgYnJpY2tzIG9uIHVuc3VzcGVuZCA6LwoK
V2UgdGhlbiBuZWVkIHRvIGZvY3VzIG9uIFVCSS9VQklGUyBpbXBsZW1lbnRhdGlvbiAoUmljaGFy
ZCBpcyBjdXJyZW50bHkKb2ZmKSwgbWF5YmUgdGhlcmUgaXMgbW9yZSBsb2dpYyB0aGFuIGp1c3Qg
YSBiYXNpYyByZXRyeSB0byBpbXBsZW1lbnQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
