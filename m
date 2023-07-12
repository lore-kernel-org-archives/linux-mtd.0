Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83390EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tebYumSQPEuX9Nk+JPN8zklie932BL6WfMEH1Qoo2pU=; b=TCyADbJ73SM/1l
	7hLOfDjS0IulkMtACZCu5uINoj6sEWLzG34SXEzlIRk6PiqgEnQuz/2/lTSEK7D+3bIjPQ7pF7CM4
	ZJ50Q4jrr4EQ9FhaMIppGCjlX7yLrc0d9QlDnwx+q+yoR/lUnaE5zmiJmpGD1JBELTSyk/tLnaY2i
	xQuuuKZuHhuyYi6I0OSOQUWGxFKOQ6Gcp/Q2Vsp9OsWNpQ8/zps5Pki/ZjunqcesLjvbL9UjCWzkq
	CLuqHc6Lq7eXowFciecasSJRzzFUm8FGibTH0FNgQb7t3FhKUJFor+52lHZhoemEOP3WhiK9OTqMq
	Zwe60X7U2pqHV3Es2biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWy-0009Qq-0c;
	Wed, 12 Jul 2023 14:09:24 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWv-0009PD-1d
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:09:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A7C31BF208;
	Wed, 12 Jul 2023 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689170960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aepDpfAxOFfINdI3jia3k3kNLHibllPD8E/Dp+aDfU8=;
	b=nV7PxOSauISHx1sKkpQS8lsuk5uUHXnGSLJGe86leC4yLD1evLKMBLceQJzNPbQ+j0Q8wo
	WE5I9t5gL5+xBwvMrfVQtvEyCgdwrcoIG84ehSu7GoZwUFHo4ggDuMim6YkNCIdXDUYe7n
	g3m7uG0SgAb+a3JlNXmPo+3jGDOpslIy9My74QUh3YsJjZBdeP9RTWAYVXHAk0/dvXGVv9
	U/R1lQEOgib8/x5beVVM1L/fgQNkfLgxPr9ztivg1dOkXiUwYMUaZrQM4ZYihmzY23n3YP
	OJtt4E1dFuRYVtqvq6GAi6QfKIvk5hMYueTM/O5J3STeKGUKo/m+6lPh2tOZmg==
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
Subject: Re: [v2, 2/2] mtd: spinand: winbond: Fix ecc_get_status
Date: Wed, 12 Jul 2023 16:09:17 +0200
Message-Id: <20230712140917.284243-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DB4P250MB1032EDB9E36B764A33769039FE23A@DB4P250MB1032.EURP250.PROD.OUTLOOK.COM>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f5a05060670a4d8d6523afc7963eb559c2e3615f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_070921_697405_0B6322DB 
X-CRM114-Status: UNSURE (   7.61  )
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

On Fri, 2023-06-23 at 15:33:37 UTC, Olivier Maignial wrote:
> Reading ECC status is failing.
> 
> w25n02kv_ecc_get_status() is using on-stack buffer for
> SPINAND_GET_FEATURE_OP() output. It is not suitable for
> DMA needs of spi-mem.
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
> Fixes: 6154c7a58348 ("mtd: spinand: winbond: add Winbond W25N02KV flash support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Olivier Maignial <olivier.maignial@hotmail.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
