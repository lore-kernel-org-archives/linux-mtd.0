Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EF6C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6y/ke83ADTAQEUvUcDQT5riaqBywX4xgFZRuZEWb24=; b=DKnYG5/fLHo1zX
	kWiVVfvqbHNcaDtRcXVRnL9IULn9DPx8R9o+eS/V9pCvmgqMZn7x2nENzMGyqWzE4PNA/FHdsMFPN
	4TXQNLkLUezMwrIEBJ/Z0F2zeIwIyTofkjS4XePriaO2IBtZhkHX2C7YWjl5kFFbj6px1DdlzFVKk
	fWZxaU2Jw2sUaqqRCY436wCmlmkdHm/WnKeHEE+khQJCrUZreao/lNwcmnOFvv6SWQTJxW092uhze
	nYlixLpS5gUBKDwngyfOi8fBMekQZNZauQC22MPlA+KrPMTE6SJv07/xv9IqA/acDT/YV10/GVHAy
	Pqi3CPjG6e/qnW9nguCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvc-00Gr1O-10;
	Fri, 27 Oct 2023 17:47:24 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvY-00GqzD-0n;
	Fri, 27 Oct 2023 17:47:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6268040004;
	Fri, 27 Oct 2023 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3YowyYcKQA2kJ4/Lu2jWiZmyXQHU8kBUbdDWU2lbX0=;
	b=WTxLI1emVltVjtmoxLQpDlGgrv9XQcPh/cyFGZ3FHyX1J7tqTBpjIN0PvyxCZb/J7KXyvm
	UC3esRd55A+PYaWWMGILlbhE/502i5EMvE6MpgA2AXLnA8CgU6KWDGWvHNXcaU48jV1f1e
	PTXoUbYzFNc6ja2arbWjV6911rXS55MNsHWPmC6WuoXiyaz1OsBqUCzkXZbp2LlqmotIvs
	oqLBK110UE4dXOd+HIE+H9bNiG2AcTHgR6Vt/mTo1v1Fx1c98p8bbZcLM/wMvKTnWxwmzH
	ayMqMerNcvpTv9fN3arWTSvM6GKF9kkktF60fASLScEZhGcf77kfclT5FpJVBQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>,
	liang.yang@amlogic.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3] mtd: rawnand: meson: check return value of devm_kasprintf()
Date: Fri, 27 Oct 2023 19:47:16 +0200
Message-Id: <20231027174716.369998-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019065548.318443-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5a985960a4dd041c21dbe9956958c1633d2da706'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104720_425615_D1B333DF 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2023-10-19 at 06:55:48 UTC, Yi Yang wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful by
> checking the pointer validity.
> 
> Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
