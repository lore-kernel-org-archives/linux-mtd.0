Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF38C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7R52NbA+m6bqQZ24cJV2BMm3N17nTsxBk66nOWe3+I=; b=SE82HAgRcOhGyC
	zNvgyCpBkNQYzDxhTuVoSJHelY3+H+TF2wgdUnIxHKteLfQdppWIpZxLR/velZg0/CTYkqY2yYHvp
	XZN+R61Ex3JyXu60b+G7wz1rt+M8otXsPeWYrGKTOJoNA++kExCzsOOrZ6LzYdQfaMc+Kayg63gZW
	KoGYlsCpyXvB1ZvqfyGfWlhXxdt5hQZIzECmuYPTr4XyhK+OAwrfpfBMf/972GfZwK9Qh+/lNeY77
	X8oD3g+APqy7FeqcVOdIohHzFZJM1DESGEU6Yen7v+kyWU5rZtNenASjT0pf82DL7evUCzkyWZbBh
	3Z4Jk4nQrg75t+z+XpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYmn-001vo4-H6; Tue, 20 Sep 2022 08:39:22 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhj-001rLc-GS; Tue, 20 Sep 2022 08:34:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E518240007;
	Tue, 20 Sep 2022 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNmwjDF5unVTDM5UNxn46u02tM2QIwMVA3Xc9fWBzGI=;
	b=JMBAYRZNq/7zM773ZaWmKWjTBgSbSfBfFZdMWXxN73Z0f0rg/qC/IZHCjmCXw2zJJwOZ1h
	G/uS3qFYS7vNiSAxaJqp/fpwVkG5dwXhsfGcJ6G64N9XmvJZqFZk/BOPBoOr6MCMIq97P3
	Mq7jBJ09pw6Uashme6UX0Li9Thx7vUe2Z7/Mau/PxDGwFOnKlKmuFTfn5lNVVE/HPMAuKA
	KzyzKqMPk8HDM8EQJ3Gm5ptHHh6Ptuq9hTlx3unKJf994bw6+fcxXOpTaWQ4Xu0Yesld1N
	KdBl09ApWOX7ZX3sNFNlYdWF7NGSFRAwHEXcpKaYq5QaXkPEb16L489xKC7lHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jack Wang <jinpu.wang@ionos.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 05/19] mtd: rawnand: marvell: Fix error handle regarding dma_map_sg
Date: Tue, 20 Sep 2022 10:34:02 +0200
Message-Id: <20220920083402.601149-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819060801.10443-6-jinpu.wang@ionos.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'168f05327687e9d9b8345204dd97fdb0480f99a3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013407_745701_D63BD8B0 
X-CRM114-Status: UNSURE (   6.89  )
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

On Fri, 2022-08-19 at 06:07:47 UTC, Jack Wang wrote:
> dma_map_sg return 0 on error, in case of error return -EIO,
> also add the dma_unmap_sg as rollback on the following error.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
