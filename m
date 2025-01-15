Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D737C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4aV/4bbr/lmEd0Lw/H6CeUCbGpiqLuTCevZMDP7BwI=; b=OoGTSbtQzUXuJd
	RrF5TBTsziH/k1Gg/lTaXEqeqE8UqMG3gZp/A7ssmwsW+CbqaiZ2jNgJ0KJPaR732xIOwlUmzbOW1
	nts8csf4Zc+JIyz+jPmIoq9fejDw7IpYk7khcuSX0tWWO+u4cB6MOKDTtD1SAAEzRqUq7ZPEHYfM9
	SRvCk3T7dvazJXdGh5HI3Cr7x90zQbPu1SEqr0V+fc5f2Cks6fG3mh3k9YJO+0nVrkv3mpWjnrXA+
	Ndv0f7bTxuHxpyjcPzjBFlAJvDycIYxWrE1dfMRqxJhmlgkrxX8o+i5bvnXh70m8xI4oqvYdhnsUs
	08bpKMHPUE1SsjxbH4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Sp-0000000CeBM-1fO9;
	Wed, 15 Jan 2025 17:45:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Sl-0000000CeB1-0rk1
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 17:45:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E31631C0005;
	Wed, 15 Jan 2025 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736963152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8alWthHd7nBMjCmlqxpkwy3a0vMjahVNBx5feJtsx0=;
	b=M/0HO+JG87EEBiRYi6tfGSWBNY0hxVrIGEe65xg0WjpXQJPyKLXnl457OnyP6DuZEGoU3n
	Q1YxwolhMfZ6OCT37SnoohN4F1/KyUwDtJeW8aL2y98VoqH76UU3BxhTPkQJwUQzwm1Jov
	BKgIsUx/WuaoLf1rq8hem8K9NxQd2LQAy1YRgxq5Osj1am2+U5V/+1H+7zi9YWWq+7yQPd
	rcSYquGGZ+xTYltyOt/UfWxTZBDws4u5euihLafKFs6Al8gyGamDXLooNwbZz8lL2saoZB
	4bIKWA3ZX1s4a68f6FUNH8wR6R+gE69R+55BbueQQxSTSQ/Y9pK0w2UDBAkEYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cheng Ming Lin <linchengming884@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2] Revert "mtd: spi-nor: core: replace dummy buswidth from addr to data"
Date: Wed, 15 Jan 2025 18:45:50 +0100
Message-ID: <173696311816.425091.11020787403325383310.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250115134158.19908-1-pratyush@kernel.org>
References: <20250115134158.19908-1-pratyush@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_094555_520564_79FBAB5A 
X-CRM114-Status: UNSURE (   8.47  )
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

T24gV2VkLCAxNSBKYW4gMjAyNSAxMzo0MTo1NiArMDAwMCwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6
Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA5OGQxZmI5NGNlNzVmMzlmZWJkNDU2ZDZkM2NiYmU1OGI2
Njc4Nzk1Lgo+IAo+IFRoZSBjb21taXQgdXNlcyBkYXRhIG5iaXRzIGluc3RlYWQgb2YgYWRkciBu
Yml0cyBmb3IgZHVtbXkgcGhhc2UuIFRoaXMKPiBjYXVzZXMgYSByZWdyZXNzaW9uIGZvciBhbGwg
Ym9hcmRzIHdoZXJlIHNwaS10eC1idXMtd2lkdGggaXMgc21hbGxlcgo+IHRoYW4gc3BpLXJ4LWJ1
cy13aWR0aC4gSXQgaXMgYSBjb21tb24gcGF0dGVybiBmb3IgYm9hcmRzIHRvIGhhdmUKPiBzcGkt
dHgtYnVzLXdpZHRoID09IDEgYW5kIHNwaS1yeC1idXMtd2lkdGggPiAxLiBUaGUgcmVncmVzc2lv
biBjYXVzZXMKPiBhbGwgcmVhZHMgd2l0aCBhIGR1bW15IHBoYXNlIHRvIGJlY29tZSB1bmF2YWls
YWJsZSBmb3Igc3VjaCBib2FyZHMsCj4gbGVhZGluZyB0byBhIHVzdWFsbHkgc2xvd2VyIDAtZHVt
bXktY3ljbGUgcmVhZCBiZWluZyBzZWxlY3RlZC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQv
Zml4ZXMsIHRoYW5rcyEKClsxLzFdIFJldmVydCAibXRkOiBzcGktbm9yOiBjb3JlOiByZXBsYWNl
IGR1bW15IGJ1c3dpZHRoIGZyb20gYWRkciB0byBkYXRhIgogICAgICBjb21taXQ6IGQxNTYzOGJm
NzZhZDQ3ODc0ZWNiNWRjMzg2ZjA5NDVmYzBiMmE4NzUKClBhdGNoZShzKSB3aWxsIGJlIGF2YWls
YWJsZSB3aXRoaW4gaG91cnMgb246Cm10ZC9saW51eC5naXQKCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
