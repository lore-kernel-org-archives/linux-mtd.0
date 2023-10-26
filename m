Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC9C25B67
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nq+2CLZphgH8bfFIbMoXjkdYRjazWknjAJmDfEDu5zQ=; b=UVMIcXNXPW2RoX
	uUcWP0EMkKqgfV0n/QVDGP4PNOaiLHYLkJRHcYWOJ679YkgFeSfq8TWxgJbwloYsoiJEMW2aX9V+O
	Xn4Ltd8bCBGIX07zsM+Hn6njabDjMH0jkv1+ILul14C6bcK7YboGWye9hcV79nhlt6FkmkVFj3uMN
	Dn2mPkhFfEzgfoMjfnjoBSO1s69F2XQXsRBnVWPP+n5Qx4OkFNZgjdXcffx4fzn8bBhmVmKQA+oKM
	/FLQhXyASY8hcNdvSJeInOneyYDWxCQUfrpV4NuotAQ8GO/q0dii0tHDMchZO12D0doMKuaPNr2Eu
	/CpnUP9HHiFHyPrB2KbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DN-00EnN9-0t;
	Thu, 26 Oct 2023 15:24:05 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DK-00EnLa-0e
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 15:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1698333835; x=1698938635; i=estl@gmx.net;
	bh=r1iP9dd5b2jv9LDWP7GApzM3qBAtB031NBx6H4WJIhc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=fyYI1W9Oc5Dgp/JLCYx4TwSwASLh+YIc9N9DFGJ2jtpkiZWOaNFVlvUjuojauz/4
	 GpdGXW6O1VcWpuCmUI2v5T4lkm+4k6gDQBssjKz1upg4qZcqdqvRmQ51dexAp8fIq
	 PDyKLsKtCSa2D+pmNmDzCYzQ2mKjSyXcN/GrTE8cqUykHaEJ0UvTMH4P8kfUs65EW
	 kSPRaJVT4A5dQxKuyxGXFXkIr8t5648TyLgktDjnEu5x3O/u7oUjABxwitdfbCnMQ
	 sEKg//jcp7UVcD1byJ/g1sAcoI9uW6eINV/XYWPi9H7YZKtdiMPo759Int8CbUYSR
	 1uaL3YB55Vfd24zCnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([77.246.119.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MBm1e-1qmAr83m6G-00CEYy; Thu, 26 Oct 2023 17:23:54 +0200
From: Eberhard Stoll <estl@gmx.net>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Olivier Maignial <olivier.maignial@hotmail.fr>
Subject: [PATCH 3/4] mtd: spinand: winbond: Add rx sample delay for W25N02KV
Date: Thu, 26 Oct 2023 17:23:04 +0200
Message-Id: <20231026152316.2729575-4-estl@gmx.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026152316.2729575-1-estl@gmx.net>
References: <20231026152316.2729575-1-estl@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qm3+qc73Q0d80VwPrFMC83h5AQZ8g3IptaI4EvmqqgEU2Q7lfO8
 G+kRCWG2eJD1c/iumZEjS6hUJnBOOyFvBm9w5N7XX3MwWx5xKhfcBu0j5+p9b4GcFKjnPnE
 Wzoq+KHSbFZix7Bt03NNM9orfgpAX72C7zLtoaLO4qB1wnjIKjLLieEu8G2LwRo0blSDUlz
 21etO6tuCVelWpB6l9IBw==
UI-OutboundReport: notjunk:1;M01:P0:DcYq5BOIkhw=;kN1FsiKQrrH87SmU9yWD44Pjp+Y
 okYva25ZFWAkFn4fHz1azeio9Xu9owYEA4r5kQsVtUt65n2nrV0lleE7jkZDolGi68V75KQgR
 gnr2LktX1dBEywFjacggnjCVVP+kC0kFFdYoLSP+KPNHbK3OnMemiK2yLo2cAPGkh52jr07x/
 oEfmtLvnZ5ZcrTPLY3baLaERnSd+XfthUdogGpJ2wp95/0ib5qX0HWVMXL6tcRYsnndibQe1C
 ezOsyg+EPnQFtgvyvEaFrJRqivhJuuGPjtHQwk/hk4b4JOdrkx0N45OG0FhWyqpcQYW+K8+mF
 3n/ePuxHqWa/+7PHkAplpw1dV+ymjygR/q5HAHMOe6SDALo53wc/YRHgRSzZVwV28WnzIl61d
 Ghy620iSSTOsU4Ms5wqG3rxEjxmQDkfdXuCYWw/VrsoifFoxz+GRMdr14ua2WKpsE7Rm4+W6u
 HbEI//FNlCt/Pus2Q/A9jKM1vQyq5bc/NcMxJTQB3vqhf1f7X7pavO9D+BBHe2tjS/bbhcsfm
 w2p7j6IBmt8sWE+qKxzcaVAkP+JiGf66RGDfrQaowLHhjvV6iwQsukONQiuvQ3Z0uS3tTgOvt
 y3WuvR+2WOeIRAI3GSd0vvTCNtA15PKcR8y6lp9lqWE36uTddpnRdqeXVYpJuhg3toa2ffS3k
 lKYqF67SbpQllVSvC2uInF4cbLeaMh3f5Fy0ELM8taixcpDNIn4FnwlgddfoHgCWFIf+bcSqt
 5OFYKR7VwpqWgdUT6vDP9MIbTJiUXBCRcZbFNqkx9S3P/71e8gATzSekYKyxI33s5S0DwwYGz
 lGmigVjsNguCJGd2taMMs2xjWr/KSNeaIMXonWBmOk08DKijb1zVhGmFHPCUF1/03HBQg85BQ
 V6a9gTjeeMu1c9K4BXvU4r1dW4IkvIyp7zukFrHkmgkg0/bA6njQAz274WbMfC6TGYxFq0AZ5
 nbngCN7SiT8TK+FEU0jdLSQa3Ck=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_082402_756489_C2BDA27C 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Add tCLQV (Clock Low to Output Valid) parameter for Winbond W25N02KV
SPI NAND chip.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index f507e3759301..c0b05f5cbf1b 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -168,7 +168,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLE_DELAY(7)),
 };

 static int winbond_spinand_init(struct spinand_device *spinand)
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
