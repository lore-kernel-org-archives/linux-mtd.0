Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C595FF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XypZWiVo3i9l3tRXOWyISAo4bT7UnyOKbiw8eeUoLw=; b=yIwFcBtDw1bH9j
	FRvfTxFVju+/fxtugXXgIhZIrapc4pfkj+CMVLQ3ADCdpaoXBsQoeVwUn8WxeymF2sz2MxodUv2bM
	B98VzUI33gPyh0o9fcrN5u83ejNfVsAUoo2af9SXU4IlzuC9Kl7xDDg++37wAKb5Bqg6Ip8MCW2Oz
	ipU8FlaeaDVApJZCKvSdjOieAM/wKamXxzAnp3XvYHIYHiSt03AjBeTzxAttIZihQZz6ERXlKGSTv
	67ca5DmZfboLMQuCwe+6c3oNoUkRwLrp0Mk1WrQ/2rmxmlttWetoB13PbjX2Q37NE/+vCFS33gQJh
	Wq9sUb06OjWJ7oOHN1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAhE-0000000FTHk-3y10;
	Tue, 05 May 2026 08:00:00 +0000
Received: from mail.rulkc.org ([155.212.184.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAhB-0000000FTGj-0F5e
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 07:59:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C87681006E6;
	Tue,  5 May 2026 10:59:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rulkc.org; s=dkim;
	t=1777967992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4OdOBoWJ4ACSfIixekPE8cVTYjRFt/rkbnFpQqOJuxQ=;
	b=SWIjxXx0kmTtkUzX9UBhUNI5cN9FyEAftPaPrNR/30tp+WsbGwZgV71cqRlQAf51OLdPmp
	q60eV1oLadf8IoHlPpyCb2CK4aCD6PrLntsjy3RenGzIYlIRb8be27Rl8IVFWHVPUPHcjU
	0Xy0/Bqir9Kkunwgn56F+dJpqAtvlx21M/xun1nJFLThBJ5fXZfGrZfeYkUeuD95SOC15y
	gR0grlgTEktZZnM3rYnQX1z1UIYN9OAFX8CWtDEJGuFtowYWEHyQwNZfjloGGgkVWf+Pes
	9VH6NsdGuhgnMq/hY9kGSiULY7ihuaM632DbiwtmLWt6iu7lyJ+l0mhOaM8/Zw==
Message-ID: <57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org>
Date: Tue, 5 May 2026 10:59:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, rulkc@linuxtesting.org, oxffffaa@gmail.com,
 stable@vger.kernel.org
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
 <87mryeqoqs.fsf@bootlin.com>
Content-Language: ru
From: Arseniy Krasnov <avkrasnov@rulkc.org>
In-Reply-To: <87mryeqoqs.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_005957_645595_B4990F2C 
X-CRM114-Status: UNSURE (   7.12  )
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

CjA1LjA1LjIwMjYgMTA6NTAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGksCj4KPiBPbiAwNS8w
NS8yMDI2IGF0IDAxOjEwOjEyICswMywgQXJzZW5peSBLcmFzbm92IDxhdmtyYXNub3ZAcnVsa2Mu
b3JnPiB3cm90ZToKPgo+IFR3byBpbXBvcnRhbnQgdHlwb3MgaW4gdGhlIGNvbW1pdCBsb2cgOi0p
Cj4KPj4gJ2NzJyBoZXJlIG11c3QgaW4gcmFuZ2UgWzA6bmFuZGRldl9udGFyZ2V0cykuCj4gICAg
ICAgICAgICAgICAgIGJlICAgICAgICAgICAgICAgICAgICAgICAgICAgWwoKCkhpLCBzb3JyeSwg
WW91IG1lYW4/CgoKJ2NzJyBoZXJlIG11c3QgYmUgaW4gcmFuZ2UgWzA6bmFuZGRldl9udGFyZ2V0
c10uwqAKCgpUaGFua3MKCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
