Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5BAC43463
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2D321789
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jKi9K+E0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2D321789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLzm8/jdBrifZxWDsNEQPbpjsK4DM1nuHtAjHYdDMLs=; b=jKi9K+E0M7eVzr/p7IGx6Ki5G
	XXOfBIcsu4ZNN9bU3HxBba5Pz/ivkFVshmzoqyd5Xk+Jenc24RztSRRMqsATSSZSqudgdOd0JS4LG
	elQa+MZWJEYdsaPfgJ1qGGPJgGSRRL0LKknNWmWHNsCb+r+R7heT2P7ZUbp6xK0G13pM3E2sCTNSS
	cwq0zDcv8FI36IUcDUB+jeXQ39ualDwlZgGAXFsCGgLKBikg4m0xqIk+fC9W9JpUFdApyvvEAn5tM
	aApvoq+GtEHOhwonbjjM36AaCLe5AZ8gN/av5/2tBsEZTD1VJN2ddFLPmx+UdcLmIaQ294B5vjoXW
	E3N9opg0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIU9-0002v6-NL; Mon, 21 Sep 2020 09:51:49 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIU6-0002tt-NY
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 09:51:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D8C596074023;
 Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ttaeKCKFAuYC; Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8997B6125F31;
 Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9wx99mlScufH; Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 66E366074023;
 Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
Date: Mon, 21 Sep 2020 11:51:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Kristof Havasi <havasiefr@gmail.com>
Message-ID: <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
In-Reply-To: <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
 <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS-AUTH panic after reboot
Thread-Index: ZD6qmydYgiDak8QYZ00WvkH7a79fFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_055146_868485_1B1790C8 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IERvZXMgdGhlIHByb2JsZW0gYWxz
byB0cmlnZ2VyIHdpdGggZW5jcnlwdGlvbiBkaXNhYmxlZD8gU28ganVzdCB3aXRoCj4+ID4gYXV0
aGVudGljYXRpb24/IAo+IEkgY291bGRuJ3QgdHJpZ2dlciB0aGUgc2FtZSBlcnJvciB3aXRoIGVu
Y3J5cHRpb24gZGlzYWJsZWQgYW5kIGF1dGhlbnRpY2F0aW9uCj4gZW5hYmxlZC4gRXZlbiBpZiBJ
IGVuYWJsZWQgYWxsIHRoZSBjaGtfKiBrbm9icyB1bmRlciBrZXJuZWwvZGVidWcvdWJpZnMvLCBu
bwo+IGZhaWxlZCBhc3NlcnRpb24gb3IgZXJyb3Ivd2FybmluZyBsb2cgY291bGQgYmUgb2JzZXJ2
ZWQuCgpTbywgd2l0aCBlaXRoZXIgZW5jcnlwdGlvbiBvciBhdXRoZW50aWNhdGlvbiBlbmFibGVk
IGV2ZXJ5dGhpbmcgaXMgZmluZQpidXQgd2hlbiBib3RoIGFyZSBlbmFibGVkIHlvdSBoaXQgdGhl
IHByb2JsZW0/CkludGVyZXN0aW5nLgoKPj4gRG9lcyBpdCBwcmludCBiaWcgTFBUIG9yIHNtYWxs
IExQVCBtb2RlbD8KPiAKPiBzbWFsbCBMUFQgbW9kZWwuCgpJJ2xsIHRyeSB0byByZXByb2R1Y2Ug
bm93IG9uIGEgc2ltaWxhciBzaXplZCBOQU5ELiA6LSkKClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
