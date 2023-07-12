Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D7EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAQgV9e7GJtYu/ttWfFMS+RR6v9h8hOqRU+jHfQtBXo=; b=VcckH2Cb6/TxVs
	ohXg2y1dqRxWWMZSXs/SiUCf+3ulyLGz6sjmwgVsXuu7M8BNgojaxsWbhxoQWvR6C7HyILkdmPKby
	D3Bl6Dkb6VEf6jPkXuMrbrL7gL66WsKAYmGvSehiF+ylh0uUImSkfyd5IGaoMlLsgQhqWMwR896qa
	s0Wfn4x26hbtDyel5rS7gLt2F+n0He5y3To/a+btZeJHLe/HmrS2nIqrCVwbN6+sJ+dNk2BMYpeRu
	eY8r7UMcjzfRBjlJ+GbCzAwfBXnZp+81Ac9PVd7mNbs1Kh3AB7XXK8IZEzj1hSat1dWBH1VJuBbzo
	11OVHBcIPCAJfWezlfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaX6-0009Vn-07;
	Wed, 12 Jul 2023 14:09:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaX2-0009Rb-2X
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:09:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79B57240003;
	Wed, 12 Jul 2023 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689170965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqMNK+Px/vbRMFAutLCP4VLsa4t9NKZfzY6xHeHvPf8=;
	b=Iq0PyvsWFNgnILfG6BEsTLr/FtmV4YrMx0JgWC1D9lqS2RAC0CoWj/23JCYCwge54DXxJ6
	AwW1r94ZMSagwNrJpqmmxIJVKj4tCsir5KzV8R4AQ2e9Nn6JG/lZM4Fd8ISOtURNGB0FIR
	Y/u6/ZkFCzuSOFi+lvlT+hWorhNWvepl+Dd+gJugwnyYO/oiY00chq0cZ9GiuOSUea1oqB
	MnNx44j0cTZQduQifSMNxBknnOzRbHo3Lo6KSrbpXnZH+CCuzfrW5vb3TFggOe8W/tTYlS
	XvK6aHR8MAQgqpfRMDGDey7hh63aERCsfFWFbJ7zs1gV1i7kseam+Ull2KSUTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olivier Maignial <olivier.maignial@hotmail.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Schrempf Frieder <frieder.schrempf@kontron.De>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2, 1/2] mtd: spinand: toshiba: Fix ecc_get_status
Date: Wed, 12 Jul 2023 16:09:22 +0200
Message-Id: <20230712140922.284272-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DB4P250MB1032553D05FBE36DEE0D311EFE23A@DB4P250MB1032.EURP250.PROD.OUTLOOK.COM>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8544cda94dae6be3f1359539079c68bb731428b1'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_070928_957525_B93EF062 
X-CRM114-Status: UNSURE (   8.16  )
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

On Fri, 2023-06-23 at 15:33:36 UTC, Olivier Maignial wrote:
> Reading ECC status is failing.
> 
> tx58cxgxsxraix_ecc_get_status() is using on-stack buffer
> for SPINAND_GET_FEATURE_OP() output. It is not suitable
> for DMA needs of spi-mem.
> 
> Fix this by using the spi-mem operations dedicated buffer
> spinand->scratchbuf.
> 
> See
> spinand->scratchbuf:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mtd/spinand.h?h=v6.3#n418
> spi_mem_check_op():
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/spi/spi-mem.c?h=v6.3#n199
> 
> Fixes: 10949af1681d ("mtd: spinand: Add initial support for Toshiba TC58CVG2S0H")
> Cc: stable@vger.kernel.org
> Signed-off-by: Olivier Maignial <olivier.maignial@hotmail.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
