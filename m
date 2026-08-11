Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23515C5B572
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gE8iZI0k3A7sS2DsK5RgKqAzEytaSREiyLhPR7P298=; b=wU5dnodlgooQnQ
	47YbXaC1v5Wub5qYYqwbf0QLMZy5bb6HCh52Y8xi5v40fTmVSYK0aSf0vsyeRJQL5mc7FALLuqmtt
	Z68DBtGSJ9xSNCzks8NCTgVzDgjyYiAgFpKVwZ2XWaIUwzlCsvvOEvlVQkP7SsbQH6iVUTcn7gwgG
	N29FOIZtlFix+IdQz94MgpVDnJOUILZbnnvjHScQpl/HjDh0CPP6rAUHVaBLVWM33YAtzh13wuK7a
	y+DzX5Q7W0YptQdgSMlJDs5HOiJZIy+1LqvG3rPEckr1YE1cwWqZk2cvyslvsuwedO+MSik0alf04
	c71lnb1cXj3xIIRp/Wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoYq-0000000EM6G-0U3Y;
	Tue, 11 Aug 2026 15:38:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoYj-0000000EM5B-2Qa4
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 15:38:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDB5A4E411BA;
	Tue, 11 Aug 2026 15:38:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B83826033C;
	Tue, 11 Aug 2026 15:38:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E331211C48EB9;
	Tue, 11 Aug 2026 17:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786462704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IOFG+qVscDGAjpgzS9lVJ5+X+UGjYnG8+VuAnr3J00k=;
	b=F2qOcNcjP2jUpRcKlJ+MbJohWrSNOLsCjX95aWjjHWKwV7+ncqFqK/giuool1RXPr2Vjrn
	2+9sC1b+IV8A1sambYaOLoo9H3nEW1zyCY8jhu5VXZZEIUe3AVihVO+ZKubvIk58bBIgbl
	yQEZSEeRFR7aM8uv3cMMnVi5ddWJpKvkGqBCMT9E9o6IzPcVTqwF8JS4cOrZNd8I3dT5Fx
	u5xewfug217dMafMifypF4AS+DWGAWH05aFAq4c0762EFJJEa7Q2ty1DJdbJj1cF6tHVr8
	JlWjKPP4JnVbXQ041TWzkpL1CeuKR/7TB8i+yyIEob+L08ZvjyJh7rUImkVhlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
In-Reply-To: <87jypwoha6.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 11
	Aug 2026 16:36:49 +0200")
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
	<20260811083111.403453-1-runyu.xiao@seu.edu.cn>
	<0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
	<56991b48-cbe9-45bf-a24c-d7aa771c55d2@linaro.org>
	<87jypwoha6.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 11 Aug 2026 17:38:19 +0200
Message-ID: <878q6coefo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083833_754873_14C87F2A 
X-CRM114-Status: UNSURE (   6.85  )
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

Cj4+IEhhdmUgeW91IHNlZW4gc2FzaGlrbydzIHJldmlldyBhdCAKPj4gaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYwODExMDgzMTExLjQwMzQ1My0xLXJ1bnl1LnhpYW8lNDBzZXUu
ZWR1LmNuPwo+Pgo+PiBCb3RoIGNvbmNlcm5zIGxvb2sgdmFsaWQgdG8gbWUuIERvIHlvdSB0aGlu
ayB5b3UgY2FuIGFsbG9jYXRlIHRpbWUgdG8KPj4gZml4IHRoZW0/Cj4KPiBTYXNoaWtvIGlzIGJl
Y29taW5nIGEgbmlnaHRtYXJlLiBJJ2xsIGFkZCB0aGlzIHRvIG15IHRvZG8gbGlzdCwgYnV0IGlm
Cj4gc29tZW9uZSBpbiBsYWNrIG9mIHRlY2huaWNhbCBjaGFsbGVuZ2Ugd2FudHMgdG8gcHJvcG9z
ZSBmaXhlcywgYmUgbXkKPiBndWVzdC4KCkFjdHVhbGx5LCB0aGUgbWlnaHRfc2xlZXAoKSB3YXJu
aW5nIHNlZW1zIHRvIGJlIGFuIGhhbGx1Y2luYXRpb24uIEl0Cm1peGVzIGRpZmZlcmVudCBjb25j
ZXB0cyBpbiBpdHMgZXhwbGFuYXRpb24gKG1pZ2h0X3NsZWVwKCkgaXMgbm90IGEKcHJvYmxlbSBo
ZXJlLCB3ZSBhcmUgaW4gcHJvY2VzcyBjb250ZXh0KSBhbmQgSSBiZWxpZXZlIGl0IGdvdCBtaXNs
ZWFkIGJ5CnRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBjb2RlIHdoaWNoIGxhY2tzIGEgbXV0ZXhf
dW5sb2NrKCkuIFRoZSBzZWNvbmQKaXNzdWUgaXMgZGVmaW5pdGVseSBub3QgImhpZ2giIGFuZCBv
bmx5IHRvdWNoZXMgbGVnYWN5CnNwaS1ub3ItY29udHJvbGxlcnMuIFRoaXMgaXMgd29ydGggZml4
aW5nIHRob3VnaC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
