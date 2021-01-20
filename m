Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC20C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:44:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03FA82336D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03FA82336D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BRQ7qfi5a20nbzIyxIERMmyxAe9qESc3vK+qgs0uWY=; b=O8BIYJykMHE3vauLFO0loDy/2
	7Lv+2z1gUOyymld8HbR3iG4C/tKv2xz4aa7JreN0TEcOoh5iiDBYzsuryktWFgY9quWEQ1V4puhiV
	5SWn0HniOpOKH06ds4rLrVdRI/3LlTYpfjWuMuBolxfCjb4THy0YTqjQzhxyPykXJB24kYWf0eTqp
	HobH1OwU+mct5hcGGH0obC7KyqqgiZHoAJcdXbBlVCdguwxEYRrhC4Dx/DsMmhNTnr8BMfPqoqFd1
	uzfnbX/ImOUr2mO7GoxKkWNGhPw0ZGlW/5OLtZyl3KvhcvOoJmD5Yqa+oxWx8Hexj7o0jDmZSa52U
	bMBCDp86Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Fdv-0007qp-KK; Wed, 20 Jan 2021 15:43:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Fdn-0007mi-PO; Wed, 20 Jan 2021 15:43:28 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 835311BF204;
 Wed, 20 Jan 2021 15:43:23 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:43:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] nand: raw: remove tango driver
Message-ID: <20210120164322.644720d3@xps13>
In-Reply-To: <CAK8P3a3imz7hiir0iJbAN4v-SVbjQPPiieoV0PJ5UKgj4DaTuA@mail.gmail.com>
References: <20210120150555.1610132-1-arnd@kernel.org>
 <20210120162904.1a1588bf@xps13>
 <CAK8P3a3imz7hiir0iJbAN4v-SVbjQPPiieoV0PJ5UKgj4DaTuA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_104327_931065_E163F02E 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: Mans Rullgard <mans@mansr.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CkFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGUgb24gV2VkLCAyMCBKYW4gMjAy
MSAxNjo0MToxNgorMDEwMDoKCj4gT24gV2VkLCBKYW4gMjAsIDIwMjEgYXQgNDoyOSBQTSBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBB
cm5kLAo+ID4KPiA+IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGUgb24gV2Vk
LCAyMCBKYW4gMjAyMSAxNjowNToyNgo+ID4gKzAxMDA6Cj4gPiAgCj4gPiA+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+Cj4gPiA+IFRoZSB0YW5nbyBwbGF0Zm9ybSBp
cyBnZXR0aW5nIHJlbW92ZWQsIHNvIHRoZSBkcml2ZXIgaXMgbm8KPiA+ID4gbG9uZ2VyIG5lZWRl
ZC4KPiA+ID4KPiA+ID4gQ2M6IE1hcmMgR29uemFsZXogPG1hcmMudy5nb256YWxlekBmcmVlLmZy
Pgo+ID4gPiBDYzogTWFucyBSdWxsZ2FyZCA8bWFuc0BtYW5zci5jb20+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+ICAKPiA+Cj4gPiBJIGRpZG4ndCBr
bm93LiBJJ2xsIGp1c3QgZml4IHRoZSB0aXRsZSB3aGVuIGFwcGx5aW5nIHRvIHNvbWV0aGluZyBs
aWtlCj4gPgo+ID4gICAgICAgICBtdGQ6IHJhd25hbmQ6IHRhbmdvOiBSZW1vdmUgdGhlIGRyaXZl
cgo+ID4KPiA+IElmIHlvdSBkb24ndCBtaW5kLiAgCj4gCj4gU3VyZSwgcGxlYXNlIGRvLgo+IAo+
IElmIHlvdSBsaWtlLCB5b3UgY2FuIGFsc28gYWRkIGEgcG9pbnRlciB0byB0aGUgcGxhdGZvcm0g
cmVtb3ZhbAo+IAo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJu
ZWwvMjAyMTAxMjAxMjQ4MTIuMjgwMDAyNy0xLWFybmRAa2VybmVsLm9yZy9ULwo+IAo+IHdoaWNo
IEkgaGFkIGFkZGVkIHRvIHNvbWUgb2YgdGhlIG90aGVyIHN1Ym1pc3Npb25zLCBidXQgZm9yZ290
IGhlcmUuCgpTdXJlLCBJJ2xsIGRvIGl0LgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
