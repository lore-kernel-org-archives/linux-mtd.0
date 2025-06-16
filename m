Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD859C71136
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jun 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2tuDw2o/sNdZ4F8JmRz98JpTKdQ/e9X5Rr8m9YAPMYE=; b=0Fvu3wG/CvMzLV
	gCMjGDNiczWcWZD1N76sojf9pUAyfjqCjmd5pebfjbnmW3qnZmfuOlFVjGo8IjqQehfkeystaaF9A
	x476NHiLiw8Vpk09/qUruraw3KL3hLjukzovUm9EKXbD9poifB6eDgVJC6X7LGoiAd/6wp8b2GUVF
	hHdO6wC1zoEjiyaJl9b6/UgrF/o6VxosScKBVV9m1zu55e0nu+Qq4XuWsGDSyusgWYv0X8v68Z4+C
	8HIXEFvJiKUdI0SRpbZoVqw1APAUOUZ5raQIl4Y5+yD7uVInztzv0hli5JJOLhpruRTZ6EB8rXFUh
	PlkPnP2a6yOeHhymyZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5NA-00000003oiV-0KAt;
	Mon, 16 Jun 2025 08:39:20 +0000
Received: from mail.growdeal.pl ([141.95.55.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4jq-00000003iwA-28FG
	for linux-mtd@lists.infradead.org;
	Mon, 16 Jun 2025 07:58:44 +0000
Received: by mail.growdeal.pl (Postfix, from userid 1002)
	id DB93E24751; Mon, 16 Jun 2025 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growdeal.pl; s=mail;
	t=1750060667; bh=nU0fzD5wnLwbt9yoUSBeMInFHzMm7DGirLXtUO2ZpV8=;
	h=Date:From:To:Subject:From;
	b=KTi7QlFEoIIRvZJKqjB3g076ofV6EtucSE91r91pF6SU3HPucA4hQJHzDbQqUmxO/
	 MooUO+qSN2jQUGfyIZefxi2/5xFtmxbZFy/BfLPIscKPUIzi15Dsi5TolL2x6q3Ifq
	 JUq4KHwgG3o/Vwsvfh0Tws6WTF0EUv8ljnZzgwgc9ouC4+ROOpO0sJoowfIPPBzIqB
	 sKC80EzLIE4uHDxVL4fULrNS18Gwn11mikf8RwJi2Rya4I4kpkbz4l0FgD9CYjb4c8
	 mODjTTIs3wXecum4Bn5M3RYa6Y4k0al0aSRUnM5jZTkIoE3p896B+l6rvtUK3OPkJ9
	 VheDL4wVZCykw==
Received: by mail.growdeal.pl for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2025 07:55:41 GMT
Message-ID: <20250616064500-0.1.2y.1ektz.0.n8ocr8n81f@growdeal.pl>
Date: Mon, 16 Jun 2025 07:55:41 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Zajdlicz"?= <pawel.zajdlicz@growdeal.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.growdeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_005843_237267_380FCD4E 
X-CRM114-Status: UNSURE (   1.34  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGF3ZcWCIFphamRsaWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
