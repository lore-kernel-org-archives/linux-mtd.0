Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2769C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0948464E9D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0948464E9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bRS0ijNaAAaWiskWGl8GiFZeID0XJGJZvQ8Ga2Lbzok=; b=Opb5wwykrmdvKzHsE2sp40Fm/
	WXevyvlqH37v+BlZXBnMVG9KDomHHlpUTsA4LZ0YOe8H4dLCl0RVQqtEhkcnB0d1jxkQoYSDlF9Cl
	MuL61G/Ng1qabLU7H76LZO3jI3BDzv/V2j1J4azzxvw/2AA7Rr16pf+rvUWnHKRf4c0m0sXVHePHI
	Cz5vETFww5CWXzd76CkSk44jUepQ6bbu50J8dzTD1sZcIOky9ICCr+292+DCsg9Edo+jIr2tDRzs9
	+xzvvemkOetcZ3vuqo+7dWIX97RCELA9lt5q1Gg1O7KM+bxSRQGuaf9PTZoDbv5GRIvh3LGSyM2MN
	wLFAV0XZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9WDS-0001ue-7C; Tue, 09 Feb 2021 16:50:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9WDP-0001u8-Ad
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 16:50:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 493E46083270;
 Tue,  9 Feb 2021 17:50:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LgSQItoluF3W; Tue,  9 Feb 2021 17:50:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E8B21608A38F;
 Tue,  9 Feb 2021 17:50:12 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GB4FDVzrT0QH; Tue,  9 Feb 2021 17:50:12 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B1F2F6083270;
 Tue,  9 Feb 2021 17:50:12 +0100 (CET)
Date: Tue, 9 Feb 2021 17:50:12 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Luca Risolia <luca.risolia@studio.unibo.it>
Message-ID: <492787386.378826.1612889412476.JavaMail.zimbra@nod.at>
In-Reply-To: <705c010b-653a-1dd0-87b9-f3cc83c21802@studio.unibo.it>
References: <20210124232007.21639-1-richard@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
 <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
 <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
 <1517729157.378701.1612886684264.JavaMail.zimbra@nod.at>
 <ad4fd822-016e-e11e-682c-077a1ced2a18@studio.unibo.it>
 <231074135.378774.1612888173941.JavaMail.zimbra@nod.at>
 <705c010b-653a-1dd0-87b9-f3cc83c21802@studio.unibo.it>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: q37PlZSRNO35cCN77UrdwzImPA2u1g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_115015_483322_1DB8F0B8 
X-CRM114-Status: UNSURE (   4.82  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Ron Minnich <rminnich@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE9uIDA5LzAyLzIxIDE3OjI5LCBSaWNo
YXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IFRoZSBtbWFwKCkgY2FsbCBpdHNlbGYuIE9mIGNvdXJz
ZSB5b3UgbmVlZCB0byB0b3VjaCBjb2RlLgo+PiBNYXliZSBqdXN0IGN1c2VfbG93bGV2ZWwuYywg
bWF5YmUga2VybmVsIHRvby4KPiAKPiBBIHBhdGNoIGhhZCBiZWVuIHN1Ym1pdHRlZCBzb21lIHll
YXJzIGFnbywgbW9yZSB0aGFuIG9uY2UsIGFza2luZyBmb3IKPiBpbmNsdXNpb24gaW4gdGhlIGtl
cm5lbCwgYnV0IGZhY3RzIGFyZSB0aGF0IGF0IHRoYXQgdGltZSBub2JvZHkgaW4gdGhlCj4gRlVT
RSBncm91cCBjb25zaWRlcmVkIGl0LiBTbyBtdWNoIHdvcmsgYW5kIHRpbWUgbG9zdCwgdW5mb3J0
dW5hdGVseS4KCldlbGwsIEkgdGhpbmsgaGF2aW5nIGEgZ2VuZXJpYyBtbWFwKCkgZm9yIENVU0Ug
aXMgaGFyZCB0byBhY2hpZXZlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
