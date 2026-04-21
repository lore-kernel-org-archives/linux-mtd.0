Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA8AF327B4
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeTge3oViQQzWHR3b5aapG4E5ZeFifc8B6Bmn8jXlek=; b=SU1hzpkk/ohg3P
	b0D/PlSKkohQJcOpBkKbINe1sk1Oa5SYVRQd7Lj7ncME7US/ZQQb4Xkv9fkElPuT4pOpqfP2JE6Iv
	rH1yX25NNMMr/Rkoijk10m89vbuKbLz4ti1Uw3OjGXll66ayUceYCUfAo6e0sQ6V1RCiUQNNmEzMI
	qBDVOJ80RZpcvkZBnIRfVklXvwLJnJUQIYRR78dLWyiz5R1ZyCRK/2Q+ocEQPFnsACAId1W67/Q8n
	rDq+j8w/26gFdKfkk3I9B5UDklfIKQKDcpbRlcAukgFWTpVIDQoyFqjPx7/X5G4GXAlG6y6FzdooP
	mJ+O2+ecN3Ql05OKj1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5du-00000008BwK-1cKl;
	Tue, 21 Apr 2026 07:35:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5do-00000008Bva-3mc5
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 07:35:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 84BF51A337C;
	Tue, 21 Apr 2026 07:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5938F600D2;
	Tue, 21 Apr 2026 07:35:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD0EA1046093A;
	Tue, 21 Apr 2026 09:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776756923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tjDRDh3IFRsUTJociGMi2a37LGpLwz5EHWQZhwlDXuk=;
	b=uhy0t4T1BIHFXIp8/Zxc/fi1FZ/u4Uk/IJrJNO9pHGIXTBiC6RsEslNnnn+K2E/+na+vny
	O/pe0fZpZ0kFg7ff4OXC+4KLr0kB3aCxPrfrGmzPsT4Au2eCoezwdXZ+8Wthf1VHs2ItL2
	WttOFoh96fBJJncDn3rG14ak9b9D/KwjzlHkdhXK2MyNYvquGlC3/YWZHjj9iLUv4aGu+b
	5M4OSSEMpREAMjyOElrHunp9BScFmx7ZQTcusLvUQ6nLlT9kxNWZKYiU7Cy9vW6PW+P02+
	GayWVztPWZzdz2Fqnru0z+q7Y2A8MKxNPC6LN2Ag+gA5lLDABq5Ikqoy1OXlfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
In-Reply-To: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
	(Tudor Ambarus's message of "Fri, 17 Apr 2026 15:24:39 +0000")
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 21 Apr 2026 09:35:20 +0200
Message-ID: <87jyu07olj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_003531_043294_0C0FA2C3 
X-CRM114-Status: UNSURE (   5.70  )
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

SGkgVHVkb3IsCgpPbiAxNy8wNC8yMDI2IGF0IDE1OjI0OjM5IEdNVCwgVHVkb3IgQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gU2FzaGlrbyBub3RpY2VkIGFuIG91
dC1vZi1ib3VuZHMgcmVhZCBbMV0uCgpbLi4uXQoKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IEZpeGVzOiAwMjU3YmU3OWZjNGEgKCJtdGQ6IHNwaS1ub3I6IGV4cG9zZSBpbnRlcm5hbCBw
YXJhbWV0ZXJzIHZpYSBkZWJ1Z2ZzIikKPiBDbG9zZXM6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDQxNy1kaWUtZXJhc2UtZml4LXYyLTEtNzNiYjcwMDRlYmFkJTQwaW5maW5l
b24uY29tIFsxXQo+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNA
bGluYXJvLm9yZz4KPiAtLS0KPiBXZSBzaGFsbCBhc3NpZ24gYSBDVkUgdG8gdGhpcy4gSSdsbCBs
b29rIGludG8gaG93IG5leHQgd2Vlay4KClRoZXkgYXJlIGFzc2lnbmVkIGF1dG9tYXRpY2FsbHkg
dG8gZXZlcnkgZml4LCBubz8KCklmIHNwaS1ub3IgZm9sa3Mgd2FudCB0byBhY2ssIEkgbWlnaHQg
dGFrZSBpdCB0aHJvdWdoIGFuIG10ZC9maXhlcyBQUi4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
