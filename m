Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98BDC282DE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIpnlORSpm9hTfR3gpmxmLN7MnZI49zwP2+RC7K7JDA=; b=L2y+qb2N7Xvbmd
	CXsAwZUpWaj1Tn3buvGeiefHGo3vLKIFhGm+qla5DUfkoCMe/EyQy8u9/MdjwDOxHIvP5pkU1k73q
	GznH3snUnkp5lgDuJbKfUozf20A4Shrz5T0Su166re8p/nLt+aZd27bBgTW5T3tJRGLnAUGw8bo2L
	ePwAst1P+9gFuwoJUvoV5iYj9RGpEdpdrqBg3DNEVyi28Xe54eUdziwVN7QV0YJApXbaqv0uWWU6U
	c5rrb5MkXSBXvjVOv+293is3b1VB9p9j8717yl/1eGdXecgrui7eFC4vj7zlZuNgLLYQRN3Tf7Qif
	SE0gyPdUHbhjjq7IH2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZKI-000000023tM-3Gwu;
	Mon, 10 Mar 2025 09:21:34 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZH9-000000023Nh-48EA
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 09:18:21 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 873DB832EA; Mon, 10 Mar 2025 10:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1741597589; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=12+gGm17uUFOaSCs/17sY8RB1RDjOISxhtmpU3s0HwmJGi0WL7+9+yaJ3O/6ju1DU
	 ACefBSxOWnxwOIZNj/saWAnbgwq3omtF0jHskMxYh/U/Y0vOx9jwzDll25X7BnAYmi
	 6y8fS3c+lFEt5pjsyLEzp898l5sTZdxD642yQlNqc1b9FbWhcOMUPHX1xyUohg5fS/
	 VhcoQwMjN9H3UUy2IjMKEeON6SnjGFyIfosaGBK66WIfLLDjlQ+B1VNh6eUHaUzbks
	 uc392+dki5rIQJqYVcVyq0qDHQ1S5kZ36kksA5Ud5uTePdEVcGgDTc9Wx+XFaAcaBe
	 Awx/Q3kpM2ILQ==
Received: by mail.commetro.pl for <linux-mtd@lists.infradead.org>; Mon, 10 Mar 2025 09:06:09 GMT
Message-ID: <20250310084500-0.1.1a.fbfb.0.s5wthvtymk@commetro.pl>
Date: Mon, 10 Mar 2025 09:06:09 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_021820_152523_D69BDB4E 
X-CRM114-Status: UNSURE (   2.44  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
