Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD508C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=64NCzHMocZHrvCpxb5cytizT+bOASGgS29u6NvvKUbE=; b=Az+ujt1oHcIMcANM55PlBz2g6I
	sVuMBhnNS1iXWXJQW4EFlfD/m4KvQU/LqtltkQYgoCySROb3almK+1HYao0bZscVJCHn5ro0J97Hj
	KD99BFiZ5GirpMoO81L0H4jUUXYct56Vs6YIp616lQxaW54aP/kuAKXnO9lWBZl2an2I8dTQEYOHM
	yrTlsWB4LhSvLjegzWknNn0AWfGtBUi/A+RyMmkjkBKfHCb/ZjGXynCkh7uCAYyJ7PUAS3hvksOyS
	Os3eA10EQkfaU1y/zDdpr5Z2X5ray9lgFQfoZKFI3VX3xNFn78DpMgym56kne23sb9DaAElC1fDf5
	pCyh6XxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roovm-00000001JIq-2Vcv;
	Mon, 25 Mar 2024 18:20:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roovh-00000001JDh-0Jdf
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 18:20:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC3CC62F2902;
	Mon, 25 Mar 2024 19:20:04 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id K3LxzLwggEyW; Mon, 25 Mar 2024 19:20:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BB5A564103E7;
	Mon, 25 Mar 2024 19:20:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qZ50c87yJ2ct; Mon, 25 Mar 2024 19:20:03 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 551BD62F2902;
	Mon, 25 Mar 2024 19:20:03 +0100 (CET)
Date: Mon, 25 Mar 2024 19:20:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: linux-fsdevel@kvack.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	Richard Weinberger <richard.weinberger@gmail.com>, 
	Ezequiel Garcia <ezequiel@collabora.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <321330094.101965.1711390802883.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLjQPo8hoawK73H7FOVitQHp21HHODExO+7cguGrtURKWg@mail.gmail.com>
References: <CAOuPNLjQPo8hoawK73H7FOVitQHp21HHODExO+7cguGrtURKWg@mail.gmail.com>
Subject: Re: linux-mtd: ubiattach taking long time
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: linux-mtd: ubiattach taking long time
Thread-Index: Mx3wAXRAa/xn1RI2GU7JLp9fVCsk7g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_112017_300587_6026538D 
X-CRM114-Status: UNSURE (   4.72  )
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

UGludHUsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiUGludHUgQWdh
cndhbCIgPHBpbnR1LnBpbmdAZ21haWwuY29tPgo+IEkgaGF2ZSB0cmllZCB1c2luZyBmYXN0bWFw
IGFzIHdlbGwsIGJ1dCBzdGlsbCBubyBkaWZmZXJlbmNlLgo+IEFyZSB0aGVyZSBhbnkgb3RoZXIg
dGVjaG5pcXVlcyB0byBpbXByb3ZlIHRoZSB1YmlhdHRhY2ggdGltaW5nID8KPiAKPiBMb2dzOgo+
IC0tLS0tLS0tLS0KPiBEb2luZyBmcm9tIGluaXRyYW1mczoKPiB7e3sKPiBbICAgIDYuOTQ5MTQz
XVsgIFQyMTRdIHViaTA6IGF0dGFjaGluZyBtdGQ1NAo+IFsgICAgOC4wMjM3NjZdWyAgVDIxNF0g
dWJpMDogc2Nhbm5pbmcgaXMgZmluaXNoZWQKCk5vIGZhc3RtYXAgYXR0YWNoIGhlcmUuCgpNYWtl
IHN1cmUgdG8gc2V0IGZtX2F1dG9jb252ZXJ0OgpodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRl
YWQub3JnL2RvYy91YmkuaHRtbCNMX2Zhc3RtYXAKSWYgc2V0LCBVQkkgY3JlYXRlIGFmdGVyIGEg
ZmV3IHdyaXRlcyBhIGZhc3RtYXAuCgpTcGVha2luZyBvZiBvdGhlciB0ZWNobmlxdWVzLCB5b3Ug
Y2FuIGltcHJvdmUgc2Nhbm5pbmcgdGltZSBhbHNvIGJ5CnR1bmluZyBVQkkgZm9yIHlvdXIgTkFO
RCBjb250cm9sbGVyL3NldHVwLgpFLmcuIHRyYW5zZmVycmluZyBvbmx5IHRoZSBhbW91bnQgb2Yg
Ynl0ZXMgbmVlZGVkIGZvciBhbiBoZWFkZXIuCk9yIHJlYWRpbmcgd2l0aG91dCBFQ0MgYW5kIHJl
LXJlYWRpbmcgd2l0aCBFQ0MgaWYgdGhlIGhlYWRlciBDUkMtY2hlY2sgZmFpbHMuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
