Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXSZ7ed9/9jjWEOMfifZobHrsxy9jrnsH4tN3qdXqFI=; b=DsoIsNTInVOTB5
	hyCH7eXsEoTG+Aylpvtt3UPN3zaZvp+kbi8cuQ4juvAY1pYUVudWsVeVgT+DHeAvJR5civGSXeyal
	rDFEyXD44CdXmK1HEZ5j31smgTil7ePGoR4YXIj080V+S/wKsPwZkeTCbQHCcWvSpvzxDkfQuakDK
	30fBSQs5Xnu6RGpymip0yJUvFUWLYgqgVRKe+z99AcOHjnnjrKLX71jKgu410KtbpT6XLEPIcVCfO
	/cxkldTsZ0oz8na0FFZFIAats7zgs9+NNDY6SId+VsBylMyr3ZFo1za6xo0Tjp/T+il5OFrD9uHJG
	x6RkJhb9Gd3/xxOiDj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMX-003X6S-Pb; Fri, 24 Jun 2022 18:49:01 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMV-003X58-HF
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 18:49:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A292BE0003;
	Fri, 24 Jun 2022 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656096535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OC0E38DGSJ88bMMABVq43rclBj3366a/y9FHzujzrXc=;
	b=gwbbaW1FT+HPQnB7ec4UXITIj46QVtADiUtWESYmQzeyY9RfT87ujfWoiWOaMAMFXU6WbA
	5Eon7Drs4MnSG4Xa7z26QBjx3u72J+oA463lnkYv7cQS1lqdIp0Qo0rz/hJLY4e6XgrK7A
	WzeHeJIdv41ze2DecUptKbzGk+JYWm+Ch1WraAkf2AITmVp1TjIO55Jh5FMxeqmPS3sZ+g
	sy/a/n5itcDLVKYGydFgMg6jDvEd6e5iQtFxeFDySWDoSxssVd8N9xmOsuexYJh6edoeIx
	GW5OPnvNe7IzVP3WhAwVgWmcvvkgrMD44Eqdx5+F2oVwdccjlHQSGXcp/ecexg==
From: miquel.raynal@bootlin.com
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: hyperbus: rpc-if: Fix RPM imbalance in probe error path
Date: Fri, 24 Jun 2022 20:48:53 +0200
Message-Id: <20220624184853.1888023-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f3070e1af480cb252ae183d479a593dbbf947685.1655457790.git.geert+renesas@glider.be>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c223a38d62e57aa60a890ea7247e3c58a54478e6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_114859_771118_F618A80B 
X-CRM114-Status: UNSURE (   6.28  )
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

From: Miquel Raynal <miquel.raynal@bootlin.com>

On Fri, 2022-06-17 at 09:26:51 UTC, Geert Uytterhoeven wrote:
> If rpcif_hw_init() fails, Runtime PM is left enabled.
> 
> Fixes: b04cc0d912eb80d3 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
