Return-Path: <SRS0=O0jx=BR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17897C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 06:57:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9050020866
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 06:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O49hk5my"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9050020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Di2VqCxNqn52rhahFrrzYba08y/wyTUAnN5ByngSCrM=; b=O49hk5myq//cwsigpgi3McUSh
	+kGCPElVX2MjPsiatKrjeTrvfM9zP6pwTl/XcMb9M/1n0ZZHdxi1vUafDyo5v7s8wY/lacDUqSFLM
	QqbpKEkdAyILPBVDxqQVxo8xbpDNUIyT3+WQw3xl/DaTo0OEhe9ivpqefAacaqhpONyEGAPpnwJh2
	+XVqjgkceuDxJUeXh5hQey3oI5HVCMazq+hKOiTzcsTL+6Ogm68xXTloCKZim4EAhTLNeNFUQOPvI
	Ovh+W9bPCKQ+NW2Cnjs9c/9o6Z9qnEDegFU9O21g+obEkLo5jwgJnIAm3RHBkvWxvSnUVodP7AAYx
	ElEgqd4sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3wIW-0004XE-JX; Fri, 07 Aug 2020 06:56:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3wIS-0004WR-Uj
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2020 06:56:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CF60561BD1A9;
 Fri,  7 Aug 2020 08:55:58 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Er7tSwulmXcX; Fri,  7 Aug 2020 08:55:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D85C661D8AB5;
 Fri,  7 Aug 2020 08:55:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CE4kgNJr8QiI; Fri,  7 Aug 2020 08:55:56 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B22C961D8A9A;
 Fri,  7 Aug 2020 08:55:56 +0200 (CEST)
Date: Fri, 7 Aug 2020 08:55:56 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <244434421.219056.1596783356613.JavaMail.zimbra@nod.at>
In-Reply-To: <20200807082747.43a9d466@xps13>
References: <20200807082747.43a9d466@xps13>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.9
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: nand: Changes for 5.9
Thread-Index: V/9gaqZ39NlhishPiGLAmuicC/Li6Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_025609_112289_448E3F45 
X-CRM114-Status: UNSURE (   7.02  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiVHVk
b3IgQW1iYXJ1cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIgo+IDx2aWduZXNockB0aS5jb20+LCAiU2NocmVtcGYgRnJpZWRlciIgPGZyaWVkZXIu
c2NocmVtcGZAa29udHJvbi5kZT4KPiBHZXNlbmRldDogRnJlaXRhZywgNy4gQXVndXN0IDIwMjAg
MDg6Mjc6NDcKPiBCZXRyZWZmOiBbR0lUIFBVTExdIG10ZDogbmFuZDogQ2hhbmdlcyBmb3IgNS45
Cgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9yIDUuOS4KPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjNhOWUz
Yjk2MjJhZTEwMDY0ODI2ZGNjYjRmN2E1MmJkODhjNzQwNzoKPiAKPiAgTGludXggNS44LXJjMSAo
MjAyMC0wNi0xNCAxMjo0NTowNCAtMDcwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKPiAKPiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9uYW5kL2Zvci01LjkKClB1bGxlZCBhbmQgcHVz
aGVkIHRvIG10ZC9uZXh0IQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
