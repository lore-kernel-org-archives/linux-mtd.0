Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47991EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=081AE3R4CRVkBjEvl2Jt+pATSwG9DlSGG69iuwOWo1k=; b=VZtGpzqMznD6c2
	RuJ8Sw5DTeLAXXuB7jq0hlTTGD3qHLbfbiYOWwETzTRwKSJEPRDmO6QPTG4VSLL1nwiziLPrqd/BI
	Sb22oF59kFb2XFVBqD3mEx3YQuGNq+t0ocW5Ve51xZK3WaRPv4O/3q/XZneQP/HyYZHAprDOnOxoC
	NW4Pvk+wC3aKWMMiZJMraRtXHws+qcf9SdPYT+cz/1DloDgHjNCqB1SAiLsSycfYt1W92K4gcknOy
	Wyyt4JuruavaxIx9ZachELL1cTPu7+Dc6nMabenDeJ2DwWK8RsTHrWom83BSMVqCFBInZ1/KI0KLg
	F4Jd8Uzg3P9ue1E9JDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQh-007r6b-0Q;
	Mon, 19 Jun 2023 08:40:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQd-007r2P-2j
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:40:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687164000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQcdAg+9N3g/DyKINT36JlTRkES83NJEq82KHSe5Lvk=;
	b=EMcXEylTKwEflbWeK+AF+2aYNmR+/NaagE5XJMsNxCohYhwczhY/bxI1SpnOHOju8qyOhb
	/l+vPaELW3N+8eoI9NnuIVGH06j+iqtRREtqLEfQObnNGF8KkaTxvMKpbsOR1t4oQ1Le6v
	XAKFhm4jfag4aTKBiODVHJPOEmFwyXOpcPDR89A4/4EUZyMSqiJCWhV0YQ1FzV/qg/8t+B
	XdK1l6UjIgwAY5i3mbkTHSYDaw6QmuW8B+B7yyd5gs9On9qnP7sB7v9kMIQD0uKdeMZeEo
	1i09QAX34SxHPODhDgCcW4bY15Tpc77qFUIp6P8qkq+4adGyTKmZu410e5if0A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9749120018;
	Mon, 19 Jun 2023 08:39:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: rawnand: add basic sandisk manufacturer ops
Date: Mon, 19 Jun 2023 10:39:59 +0200
Message-Id: <20230619083959.2943156-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaf4580a-a368-8f70-c9c4-21b5ed4dd599@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'12ac188b9355618dbaa892eb795f48845cf7b1af'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_014004_088615_43E537BB 
X-CRM114-Status: UNSURE (   5.24  )
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

On Tue, 2023-06-13 at 21:19:58 UTC, Johan Jonker wrote:
> Add basic Sandisk manufacturer ops support to get
> SDTNQGAMA timing data with the nand_get_sdr_timings()
> function.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
