Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4044C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvozNjGtWRrSj9Daljur7VDBCHdocq2r6cO3C535gZI=; b=vLGSwx20Naclon
	+gCfCUd7P5WABIvUjnpOJmt+OGRq6khIbI2ZlZSGzhwY388gzIk/f2NxCPfQkERyJwaewpjmfDKzy
	uOQM1iML+brA2PrioCY7EbzIF8gBTiVwK7HHPV438kQNwmMZzRHhz6RkzX/jXDNCriXnU5DxEeRs4
	WXijx95NUD0Baj1MDwvA/4F0f9HvuJLeWsvZlcRLPHmjIUgNG74ICe1otRRcuHaF/zSbIqG6kZQi1
	SJfysc38/Pz9B/GTElAjXan9XxaZGlmvSQfaFeKA346ALBNxG4mi4ZZTR8qdaZX+y77VZcPHeGPCF
	FJWHX3znk9PQ9EImH97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uy-0000000DZnp-1Ecj;
	Fri, 25 Sep 2026 14:28:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uv-0000000DZmD-3oGB
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6548B1A0FF7;
	Fri, 25 Sep 2026 14:28:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3259E6073B;
	Fri, 25 Sep 2026 14:28:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A5D9102F1E10;
	Fri, 25 Sep 2026 16:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qQValb4cdXQVQPWw0cUkOsUztHcoNAL4ungnrJTbea0=;
	b=Yas0I/aMMutQJ5rQT1HRAoH/UT2oGQTScVXHc/N/RpiVYPjCtWZ6NS2B26ruvVTZthFVIS
	MUhfMNMcHUCFhRxB+MsT/8RiaPm61lS9HEFPgCB0uZdVPzFXOyypbnqikN+71qkd4pfYXw
	gmzyjlTFATxm5o3Acx9goeh8lGrNm4xWM9Fl1LT7odQ3fyIQXw+TNs9cntB5DZQTaz8uYt
	u3z/3LbetShpZJf3JDw5zr5HytNqqUM53y4IDF6mLG4Y+sRI56eJABV4heQ10MRVLeLBvW
	nIU7nMABZUb0oW38ooWonS1VKaHJrR1hdBQucNNeUbSgC4lfkEeQ7BBxSfq4uQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: akpm@osdl.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, 
 stable@vger.kernel.org
In-Reply-To: <20260917102051.2146567-1-vulab@iscas.ac.cn>
References: <20260917102051.2146567-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: amd76xrom: Fix PCI device reference leak in
 amd76xrom_init_one()
Message-Id: <179034652046.1166139.1375101716012625421.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072850_083766_DC581CBF 
X-CRM114-Status: UNSURE (   6.79  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxMDoyMDo1MSArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IGluaXRfYW1kNzZ4cm9tKCkgb2J0YWlucyB0aGUgUENJIGRldmljZSB3aXRoIHBjaV9nZXRfZGV2
aWNlKCkgYW5kCj4gaGFuZHMgdGhlIHJlZmVyZW5jZSBvdmVyIHRvIGFtZDc2eHJvbV9pbml0X29u
ZSgpLCB3aGljaCBzdG9yZXMgaXQgaW4KPiB3aW5kb3ctPnBkZXYuICBXaGVuIHJlc2VydmluZyB0
aGUgUk9NIHdpbmRvdyBmYWlscywgdGhhdCBmdW5jdGlvbgo+IHJldHVybnMgLUVCVVNZIGRpcmVj
dGx5IGluc3RlYWQgb2YgZ29pbmcgdGhyb3VnaCBhbWQ3Nnhyb21fY2xlYW51cCgpLAo+IHNvIHRo
ZSByZWZlcmVuY2UgaXMgbmVpdGhlciByZWxlYXNlZCBub3IgY2xlYXJlZC4KPiAKPiBEcm9wIHRo
ZSByZWZlcmVuY2UgYW5kIGNsZWFyIHdpbmRvdy0+cGRldiBvbiB0aGF0IHBhdGguCj4gCj4gWy4u
Ll0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogYW1kNzZ4cm9tOiBG
aXggUENJIGRldmljZSByZWZlcmVuY2UgbGVhayBpbiBhbWQ3Nnhyb21faW5pdF9vbmUoKQogICAg
ICBjb21taXQ6IDFhMTIyZjVmZWNiYWJkNDdiODFiMWJlM2YwOTM0ZjU3Yjc4YWFkNDIKClBhdGNo
ZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFy
dCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhl
bikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
