Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B879C04A6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 20:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AD320830
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 20:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNSEGQxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7AD320830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UWUfIMVobsnR22jYEaWq1rhgC5LU9urfkMRne9ehF0=; b=BNSEGQxqKPKJ/s
	adHuSGw3zhgcLkMipAe86eZn5CiHYE/EKe2W4WoV2CD/T0Jko9laphpyjQCguRCSh7p59J9Pj8d3q
	JTg79U8MLK+wYL08mP7kGaadLrVbPtZuk7uabYkoV5QHsTz5rogVDCiKUY7GytHiTQDkJd+B56P71
	VHwvb2OC7X2VmtIOVhR7GoydpMlpajWdWDDMCgpboHmx7CMFREA8wAXV4LkZYD07a8ojm2J922Qxe
	mYvXdxob3eh5NtRkmimTNnTDaDiYsZglK5s33uCu6YO6du+6/6Ekid/w6dIFNaCgTWM95MNnQ7/Lz
	RvKz3frdJZW3J+516H/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNkBr-00021q-AL; Mon, 06 May 2019 20:26:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNkBn-00021W-JK
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 20:26:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DFA576083241;
 Mon,  6 May 2019 22:26:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lwEPYNwBIfEO; Mon,  6 May 2019 22:26:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5F0576083257;
 Mon,  6 May 2019 22:26:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id e1-5pSfTGscs; Mon,  6 May 2019 22:26:13 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2930A6083241;
 Mon,  6 May 2019 22:26:13 +0200 (CEST)
Date: Mon, 6 May 2019 22:26:13 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Message-ID: <267229343.47524.1557174373101.JavaMail.zimbra@nod.at>
In-Reply-To: <ab707a79-10e1-6c72-d255-70437995b4f4@microchip.com>
References: <ab707a79-10e1-6c72-d255-70437995b4f4@microchip.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: spi-nor: Changes for 5.2
Thread-Index: AQHVA+/61qY+FTnJlkShb3blTj5aROvVaXNU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_132619_780199_5ED35340 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlR1ZG9yIEFtYmFydXMiIDxU
dWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2Qu
YXQ+LCAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+LCAi
TWlxdWVsIFJheW5hbCIKPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJh
Z2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsudmFzdXRA
Z21haWwuY29tPiwgIkJyaWFuCj4gTm9ycmlzIiA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29t
PiwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4gQ0M6ICJsaW51eC1t
dGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCA2
LiBNYWkgMjAxOSAxMTo0MjoxMAo+IEJldHJlZmY6IFtHSVQgUFVMTF0gbXRkOiBzcGktbm9yOiBD
aGFuZ2VzIGZvciA1LjIKCj4gSGksCj4gCj4gVGhpcyBpcyB0aGUgU1BJLU5PUiBQUiBmb3IgNS4y
Lgo+IAo+IENoZWVycywKPiB0YQo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgOWU5OGM2NzhjMmQ2YWUzYTE3Y2IyZGU1NWQxN2Y2OWRkZGFhMjMxYjoKPiAKPiAgTGludXgg
NS4xLXJjMSAoMjAxOS0wMy0xNyAxNDoyMjoyNiAtMDcwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBnaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgc3NoOi8vZ2l0QGdpdG9saXRlLmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKPiB0YWdzL3NwaS1ub3Iv
Zm9yLTUuMgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlNDNmNTNjMjJhOTM3
ZDAyNGYwNzA5MDdkMDI1MzllNDEzZjIwYzE1Ogo+IAo+ICBzcGktbm9yOiBpbnRlbC1zcGk6IEFk
ZCBzdXBwb3J0IGZvciBJbnRlbCBDb21ldCBMYWtlIFNQSSBzZXJpYWwgZmxhc2gKPiAoMjAxOS0w
NS0wNiAxMToxODowMiArMDMwMCkKClB1bGxlZCEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
