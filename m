Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E61C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 09:27:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EF864F37
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 09:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EF864F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+qxF/fYQ9Hyua+x8HtHojQVfRFxEYj0hL0jZIFMG9o=; b=iJgIUH7qrDM/c3+lJqKOuc+5u
	AXdlXb3NlUligsIfi59PPgLZlcHg6zpmLFuHVGfgTb8LM7CCWhcVAKE7XWh484Yak1BVKko0YMND1
	HUl+fkmDGFmEG74hvdV/VuCvThFZyDp41Z77+OUuRPc1tqy/+ZNObY+BohwvbnSyFsAZGyh37R0/k
	OBIy+V1tnnhd9Wic2SgRg45ibKarbTej4qygh3pXB+FzsE9SjYLYyRhOTiq7orRP40o80A9/tTnOd
	DSOuD8QWiarAvpsUs0j58nk1x67B2IU8VZY+gcCxgL4avVMwJQPLRqq2M9gtcaSAROLIVFn0ewD0E
	mViCwUrbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSRO-002qUK-Oj; Wed, 17 Mar 2021 09:26:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSRG-002qTp-TO
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 09:26:08 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3B8CAC0005;
 Wed, 17 Mar 2021 09:25:57 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:25:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
Subject: Re: [PATCH 1/2] mtd: parsers: trx: Allow to specify trx-magic in DT
Message-ID: <20210317102556.68b76e96@xps13>
In-Reply-To: <20210315170711.567358-2-hauke@hauke-m.de>
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-2-hauke@hauke-m.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_092603_104977_6E868535 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

SGkgSGF1a2UsCgpIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1a2UtbS5kZT4gd3JvdGUgb24gTW9u
LCAxNSBNYXIgMjAyMSAxODowNzoxMAorMDEwMDoKCj4gQnVmZmFsbyB1c2VzIGEgZGlmZmVyZW50
IFRSWCBtYWdpYyBmb3IgZXZlcnkgZGV2aWNlLCB0byBiZSBhYmxlIHRvIHVzZQo+IHRoaXMgdHJ4
IHBhcnNlciwgbWFrZSBpdCBwb3NzaWJsZSB0byBzcGVjaWZ5IHRoZSBUUlggbWFnaWMgaW4gZGV2
aWNlCj4gdHJlZS4gSWYgbm8gVFJYIG1hZ2ljIGlzIHNwZWNpZmllZCBpbiBkZXZpY2UgdHJlZSwg
dGhlIHN0YW5kYXJkIHZhbHVlCj4gd2lsbCBiZSB1c2VkLiBUaGlzIHZhbHVlIHNob3VsZCBvbmx5
IGJlIHNwZWNpZmllZCBpZiBhIHZlbmRvciBjaG9vc2VzIHRvCj4gdXNlIGEgbm9uIHN0YW5kYXJk
IFRSWCBtYWdpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1
a2UtbS5kZT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnR4
dCAgICAgIHwgIDUgKysrKysKPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgICAg
ICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrLQoKQ2FuIHlvdSBwbGVhc2Ugc3BsaXQg
dGhpcyBwYXRjaDoKMS0gZHQtYmluZGluZyB1cGRhdGUKMi0gZHJpdmVyIHVwZGF0ZQoKVGhpcyB3
YXkgd2UgY2FuIGNvbGxlY3QgUm9iJ3MgYWNrIGZvciB0aGUgYmluZGluZyBwYXRjaC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
