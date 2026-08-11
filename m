Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C3C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=917hvir+14QJyRkGj7QN8uSrdpqEb9INnSfAOVltBiU=; b=R3LHDJivuCH3AR
	xZF8Abqw/PH34t/IHWK5DQFTYRnJRiZZE+dTTXzJa4cYsLdozXynSqakH9vm+HC4PX+YCVPklDT3r
	qMflNewN2+OGxoksddZ/Q9kN2RZQB8uCLOAytCghp8i13+9cYqZ6YlRC7uAFYaMavZxF4Ok5bDs2j
	ZCrUdbUZ/omUr15An5kbL4PD5B14RzojjXbHhSM/AeSHLHRhfKWJVFkbJ7VRqZU8zw/6Om87Ku2Un
	TPk0Q7Ra4rK+RJZfIahMexeqJUvtpGgyUjCKqB/egg/un+D/UpYqxPI22/5mBXfGt4Xuej5+r8YBg
	u6JwS9/Um6EiUp6JFDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnbD-0000000EEQd-0dbR;
	Tue, 11 Aug 2026 14:37:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnb9-0000000EEPi-2EuN
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 14:37:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0BE874E411B9;
	Tue, 11 Aug 2026 14:36:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCB826033C;
	Tue, 11 Aug 2026 14:36:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AFFC11C48D69;
	Tue, 11 Aug 2026 16:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786459014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dIwtbpfTYyW6Ohr75acw57sAphuxwRk8EfRKzj3UCVw=;
	b=pHAPjdIstMc+aRhOzPPTp1nBbb8nDjYbkch3lCpybHxApdOIhxhEd9FkHAtcmXGyUccVmD
	YWXH9VPQNEqA0HU/+DJZtEcO6RUrHbMbGm3O03BPqMYrtWuE4sLvBwB+PcPzEOpXuIo9kv
	6RukzXS6LWZLscF4ftTtkVabrzWmiojYYlZDyrx/KPs2c9GTfqUekEqm5A/iitZ2PPQNvh
	TzmdHWKh8jl5Z1XLvMH8S4K3G4AApB48ZlZZ8dnLmZwdPbKZZAukEbu6HXdA+7HK8HGdj0
	b7sStVLjq4bQkh46ETfsDbjSD0mGFHmwxQNo+OvqRV0PkOk0az46hS3uMfCTBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
In-Reply-To: <56991b48-cbe9-45bf-a24c-d7aa771c55d2@linaro.org> (Tudor
	Ambarus's message of "Tue, 11 Aug 2026 13:42:17 +0300")
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
	<20260811083111.403453-1-runyu.xiao@seu.edu.cn>
	<0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
	<56991b48-cbe9-45bf-a24c-d7aa771c55d2@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 11 Aug 2026 16:36:49 +0200
Message-ID: <87jypwoha6.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_073659_714603_4590D214 
X-CRM114-Status: UNSURE (   4.54  )
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

Cj4gTWlxdWVsLAo+Cj4gSGF2ZSB5b3Ugc2VlbiBzYXNoaWtvJ3MgcmV2aWV3IGF0IAo+IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgxMTA4MzExMS40MDM0NTMtMS1ydW55dS54
aWFvJTQwc2V1LmVkdS5jbj8KPgo+IEJvdGggY29uY2VybnMgbG9vayB2YWxpZCB0byBtZS4gRG8g
eW91IHRoaW5rIHlvdSBjYW4gYWxsb2NhdGUgdGltZSB0bwo+IGZpeCB0aGVtPwoKU2FzaGlrbyBp
cyBiZWNvbWluZyBhIG5pZ2h0bWFyZS4gSSdsbCBhZGQgdGhpcyB0byBteSB0b2RvIGxpc3QsIGJ1
dCBpZgpzb21lb25lIGluIGxhY2sgb2YgdGVjaG5pY2FsIGNoYWxsZW5nZSB3YW50cyB0byBwcm9w
b3NlIGZpeGVzLCBiZSBteQpndWVzdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
