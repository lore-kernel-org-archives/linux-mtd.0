Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6CDFF885E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUn2CDTnRgIXGODqfUzJ4RokJL/9nleelq1+I3BB1do=; b=VhMzPZuDKkIvTX
	LQz1hqa/DrsauSCuCZb4dY2w8euwPHD/qy7MnWqOeGuWbh0utuK5hqBIjxHKWjQpThb9LX/ZWLrD5
	HbN9OfUra4dDPFWUS2IUE+vEd6yOr1vLQSe19xia4R9jClDZLxFEtxoq/2gNflvBh57Yy7aZHSrd0
	s5DC52xyVJwajWUidg+sMxy5EkjXXMDd0ZzabfQKa9do715BQszkSe3EtMaoGGFdwX3k6hw4cbNRP
	YfPKcDey2gtTjCFukHdhVaIfucpi7QMPM64iYANKXYx7x6xJCdFMWodezzicf4NeZxqhapghMLnLd
	NRFVxqzrPFlgOiWo0qNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLjo-0000000GytH-3hbB;
	Mon, 27 Apr 2026 13:11:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLjn-0000000Gyst-0LSM
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:11:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E7721A3442;
	Mon, 27 Apr 2026 13:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CC58600D1;
	Mon, 27 Apr 2026 13:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75F73107281E7;
	Mon, 27 Apr 2026 15:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xpDUCOTuc5gf2Sxw/4nKvzo3zaGCVXqG9hue6PkGoAM=;
	b=EvV8c97/rxPSmctHOR21Cf//fWwDV/QjWeUhh4Gzy4EL8eW1bF0/YkRt0CHU3zbf9r9Lf0
	Kp/kpIcgmPX7uBsZKC8KjFAMOwafKjIn+Q1mNwKTByo9A/Is4+Nz2Rsf1VsKlufH+h1JGd
	jZN180iWZ/59LUu/PYtp8KFmKJOuB63FABlChpl8NIYN3cnXxvEzwgERoIUWf11oeR3mmh
	pNvcFhCyutwQm3hbThA2PWFfPyY47ylIu9bYM/bee3NxWkX70lWgAHYCdMtLjurn+ZOigs
	IYEm2yW1WDNni7LE4qR6QXdluF2/MsTPaVXztGcMDHgCLWOW8ckSfLvvFaXs2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] mtd: qcom: Unify user-visible "Qualcomm" name
Message-Id: <177729545696.184276.3545705253539297866.b4-ty@bootlin.com>
Date: Mon, 27 Apr 2026 15:10:56 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061059_249278_9B73D29E 
X-CRM114-Status: UNSURE (   5.74  )
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

T24gTW9uLCAyNyBBcHIgMjAyNiAwOTowMTowNSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBWYXJpb3VzIG5hbWVzIGZvciBRdWFsY29tbSBhcyBhIGNvbXBhbnkgYXJlIHVzZWQg
aW4gdXNlci12aXNpYmxlIGNvbmZpZwo+IG9wdGlvbnM6IFFDT00sIFF1YWxjb21tIGFuZCBRdWFs
Y29tbSBUZWNobm9sb2dpZXMuICBTd2l0Y2ggdG8gdW5pZmllZAo+ICJRdWFsY29tbSIgc28gaXQg
d2lsbCBiZSBlYXNpZXIgZm9yIHVzZXJzIHRvIGlkZW50aWZ5IHRoZSBvcHRpb25zIHdoZW4KPiBm
b3IgZXhhbXBsZSBydW5uaW5nIG1lbnVjb25maWcuCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHFjb206IFVuaWZ5IHVzZXItdmlzaWJsZSAiUXVhbGNvbW0i
IG5hbWUKICAgICAgY29tbWl0OiAwMWY5NTU3MjMzZTNjMDRiZTVjNjcwNTg2NGQzOTA2ODJmNWQ3
MjM2CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
