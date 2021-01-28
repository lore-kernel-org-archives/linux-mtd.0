Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8495C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:27:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5163464DCC
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5163464DCC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0R33H8jsxUWiSYC/UtMUOHHe+gOQinjQt9Hpo+wjzbQ=; b=3Zq0O9lRJrdpMFkoh3qtZpPG8
	JMYIxlI18w9ja0r4zqu62+B1CL/zQpV1MzCSYSg7+F1xT2pWhFPgfttKyBIQj8aYWhG0l+nw96p1C
	0wWod4ygUmrourG/8LymRBfk+Q1/zNnRhKooJUWFwVk+ofR2/VqmnSq6rjMyOa7P/G8O/bTEq2zIR
	UMLKoVbqmkWFTqjHezc03d3iOUdat4ZDRVanO8vqTaXsQy/9AXzFPW99/nVGzTsFg/CGmtBTnYiyV
	2irLMi3XCjcZcGLjg0SfouixFpQRWRiAmaV09J4ekbi+hpIrBFi2YBvYtzNNzbg8RlBkytrkeO5u4
	zVnWiC3BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54VX-0002NI-TA; Thu, 28 Jan 2021 10:26:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54VV-0002MK-Mh
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 10:26:34 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 50CE8200006;
 Thu, 28 Jan 2021 10:26:28 +0000 (UTC)
Date: Thu, 28 Jan 2021 11:26:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20210128112627.1429b02a@xps13>
In-Reply-To: <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <781dd4e6-a694-c3e1-ee13-9c5c51598623@kernel.org>
 <53cb8db7-bcf8-ee7c-84ee-59a14a04aad9@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_052633_906962_0E29AD2D 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KVGh1LCAyOCBKYW4gMjAyMSAxMDo0NToyOSArMDEwMDoK
Cj4gSGkgR3JlZwo+IAo+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDI6NTAgQU0gR3JlZyBVbmdl
cmVyIDxnZXJnQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEJvcmlzLAo+ID4KPiA+IE9u
IDEyLzgvMTkgNTozMSBwbSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOiAgCj4gPiA+IE9uIE1vbiwg
MTIgQXVnIDIwMTkgMTI6NTA6MzYgKzEwMDAgIAo+ID4gW3NuaXBdICAKPiA+ID4gSG0sIENUUkwx
IGlzIGlkZW50aWNhbC4gQ2FuIHlvdSBkdW1wIGFsbCByZWdzIGF0IHRoZSBiZWdpbm5pbmcgYW5k
IGF0Cj4gPiA+IHRoZSBlbmQgb2YgdGhvc2UgZnVuY3M/ICAKPiA+Cj4gPiBIZXJlIGlzIGEgbW9y
ZSBjb21wbGV0ZSBkdW1wIG9mIHJlZ2lzdGVycy4gVHJhY2UgcG9pbnRzIGFyZSBhdAo+ID4gZW50
cnkgYW5kIGV4aXQgb2YgdGhlIHJlc3BlY3RpdmUgZnVuY3Rpb25zIGluIHRoZSBkaWZmZXJlbnQK
PiA+IGtlcm5lbCB2ZXJzaW9ucy4gUmVnaXN0ZXIgZHVtcGluZyBjb2RlIGlzIGlkZW50aWNhbCBm
b3IgYm90aC4KPiA+Cj4gPgo+ID4gTGludXggdmVyc2lvbiA0LjE2LjAgKGdlcmdAZ29vYmVyKSAo
Z2NjIHZlcnNpb24gNC44LjMgKEdDQykpICMxMCBUdWUgQXVnIDEzIDEwOjI0OjI4IEFFU1QgMjAx
OQo+ID4gLi4uICAKPiAKPiBJIHJhbiBhbiBvdmVybmlnaHQgcmVib290IHByb2Nlc3Mgb24gbGlu
dXgtNC4xOS55IHRhZzogdjQuMTkuMTY5IGFuZAo+IEknbSBub3QgYWJsZSB0byByZXByb2R1Y2Ug
dXAgdG8gbm93Lgo+IAo+IERvIHlvdSBoYXZlIGFuIHVwZGF0ZSBmcm9tIHlvdXIgc2lkZT8KClBl
cmhhcHMgdGhpcyBwYXRjaCBbMV0gd2FzIGJhY2twb3J0ZWQgdG8gdjQuMTkuMTY5IChJIGRpZG4n
dCBjaGVjaykgYnV0Cml0IG1pZ2h0IGhhdmUgZml4ZWQgdGhlIERNQSBpc3N1ZSB5b3Ugd2VyZSBz
ZWVpbmcsIGF0IGxlYXN0IGluIHRoZQpyZWNlbnQga2VybmVsIHZlcnNpb25zLgoKWzFdIG10ZDog
cmF3bmFuZDogZ3BtaTogRml4IHRoZSByYW5kb20gRE1BIHRpbWVvdXQgaXNzdWUKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
