Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EFFCA100B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrnEgBZeNObYNCK0Vj87V3LfqEFHmFW62j4pdF001TI=; b=HLVR2tNekMD8+c
	0XWkN7vv2t/h0KoRlwsM/Ltt+9N0qv1fmxwmzPOOjanfX6nbGskQsa9/bhmIY3eUfBWArxFlX2gZe
	7m1af//wto4v/DuLqPbNsizfl5qmE7PzNXXf6mvrb4Y/44yxthoeu5mAmfQ8BzcktA62lScX0siRk
	rV0IOCx72ZeHl0RlKdKiOwmK3S3vR52cKAgl58TPjzs6VunCZpnlRdqC5cxMr77OhTt5EwdoWHxZ5
	dRNS7yqJg6kuqKI3a+iEmlIfEsq8OiZupr2Z2Qrkf66dh5/2SYYpUrCsQRbpKP//wiZIDujRYeVm0
	WOOsLV4i76ju9yfdn8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Af-0000000CzRr-2RnC;
	Mon, 01 Sep 2025 15:10:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fN-0000000CTH2-46lG
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5FF8C8F1DE;
	Mon,  1 Sep 2025 12:29:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8158660699;
	Mon,  1 Sep 2025 12:29:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 729D61C22D87C;
	Mon,  1 Sep 2025 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hzPjYWwkBf4kBKB+qdhiUwv4m8+EB5tTZp+VN+Z62n4=;
	b=s166XnEYapxNciGn9V5rIDeHThG8ouyPX9jXbkRG54FjA2+7yjcfuJSiiHxneFGocTw2d9
	UHUsO9Co3DVK/m8BzO4d3Zc62eCActgif96/54bSTGV8r/AWslhKp2TQr6ZWbMWu5X7JBi
	79vZLgIptVKBsUCEz3lVAS9wFRcmLqJiWarzpGwrGiKURZXe9jkH+F+jPwbONl2euXZES3
	n55X6WHANTmdWcGKse/6DCHQgHyyJVaUlpA1fV0lFEFirHUv3akhVDFVF0nXF8xc2An29r
	/kyPqJWMQ+uy5POgd5irVXQzC4Z2l6oTeIfnzy5TpgcuT3wD2GuxBDwRhuQN/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250731094613.2164604-1-colin.i.king@gmail.com>
References: <20250731094613.2164604-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] mtd: jedec_probe: Remove space before newline
Message-Id: <175672978328.48892.14632603085435940884.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052946_211173_C67FAB28 
X-CRM114-Status: UNSURE (   6.46  )
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

T24gVGh1LCAzMSBKdWwgMjAyNSAxMDo0NjoxMyArMDEwMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6
Cj4gVGhlcmUgaXMgYSBleHRyYW5lb3VzIHNwYWNlIGJlZm9yZSBhIG5ld2xpbmUgaW4gYSBwcl9k
ZWJ1ZyBtZXNzYWdlLgo+IFJlbW92ZSB0aGUgc3BhY2UgYW5kIHJlbW92ZSBhIHNwYWNlIGFmdGVy
ICggYW5kIGJlZm9yZSBsaXRlcmFsIHN0cmluZwo+IHRvIGNsZWFuIHVwIGNoZWNrcGF0Y2ggd2Fy
bmluZy4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogamVk
ZWNfcHJvYmU6IFJlbW92ZSBzcGFjZSBiZWZvcmUgbmV3bGluZQogICAgICBjb21taXQ6IDEzNzFi
MTI2YWMzZDg5ZDkxMWM3Yjc1YTc1M2M3ZDE3NDU4YTQ4NTMKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
