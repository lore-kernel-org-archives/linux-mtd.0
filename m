Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BDCC07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 22:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0214C6108B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 22:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0214C6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PaQj/091brAwwmK/uHUgIuedZ1RaDGeoNPA02HGkFWs=; b=Ltpl2/BJBIN7EKcdnwxKnOC7z8
	IbBeYuFqfNlsql/3BJeMgXNPROPY2JiQlIT/HClvDqe55QLK18uwdtlx6cGFSZ3QppDhdUzUTMrVR
	+c0cL2FMmvdTNY6tL5lsbyf0POwuNe26coGDQHPi4XhMNdagCPBIcFckhKvWTmKdby8277PL0w3kI
	DXWJBJ3kDAtPZHJcW3nQFkZWKR67sQEX6yZT67ZcSzzMQj6mSt6XKEHp2Jjbzfm1Oa8Ki7Vg+rYJo
	+t5LcovAoK1ENDL9vnO1yRHgMO1jKB1Elx9Ws7Ql8F7OUb37d+3r2tTCVlKV0YLa8XLBwQ0dqmJN1
	JKZ5S9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5bpR-00BS6P-6T; Mon, 19 Jul 2021 22:33:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5bpN-00BS5M-73
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 22:33:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A5764616F7B0;
 Tue, 20 Jul 2021 00:33:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Ct2dpVJWJJ6I; Tue, 20 Jul 2021 00:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4B3DB616F7B4;
 Tue, 20 Jul 2021 00:33:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id htDSajSipM-G; Tue, 20 Jul 2021 00:33:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 17D75616F7AF;
 Tue, 20 Jul 2021 00:33:30 +0200 (CEST)
Date: Tue, 20 Jul 2021 00:33:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: festevam <festevam@gmail.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Marek Vasut <marex@denx.de>, hs <hs@denx.de>
Message-ID: <1854293229.47089.1626734009890.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOMZO5CL7VVSUnQtB69xsrLLRiDZWDWkQCdegW6eJyk-zqB_MQ@mail.gmail.com>
References: <CAOMZO5BX9iYmZwBBGEstbcWpvftRNExtwq+kX_rQff0v_o1P5g@mail.gmail.com>
 <323618383.46712.1626723406949.JavaMail.zimbra@nod.at>
 <CAOMZO5CL7VVSUnQtB69xsrLLRiDZWDWkQCdegW6eJyk-zqB_MQ@mail.gmail.com>
Subject: Re: mtd-utils: Proper way to handle erasize=0
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd-utils: Proper way to handle erasize=0
Thread-Index: 25osE55kR9d/t3aXbgJFa38zN5JCcw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_153333_456481_9A229287 
X-CRM114-Status: UNSURE (   5.06  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0
IDQ6MzYgUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gCj4+
IERpZG4ndCB0aGlzIGNvbW1pdCBhZGRyZXNzIHRoYXQgcHJvYmxlbT8KPiAKPiBBaCwgdGhhbmtz
IGZvciBwb2ludGluZyB0aGF0IG91dC4gVGhpcyBzaG91bGQgZml4IGl0Lgo+IAo+IE9wZW5FbWJl
ZGRlZCBpcyBwdWxsaW5nIG10ZC11dGlscyAyLjEuMiwgd2hlcmUgdGhpcyBjb21taXQgaXMgbm90
IHByZXNlbnQuCj4gCj4gTWF5YmUgaXQgaXMgdGltZSB0byByZWxlYXNlIDIuMS4zPyA6LSkKCi9t
ZSBleWVzIERhdmlkLiA7KQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
