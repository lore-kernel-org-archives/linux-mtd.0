Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D545E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fGRRXRbkU+aQwr/yA1yApx9XQd3myaoc1I17hd5sOCo=; b=ug553ssJpckD15
	Sud3wIDCPwqR0C0ajs9078E9qlyJRpCAk/PPwyEuZRjtaOcBztqcfy9Kjp3VuLu68lAw0XRVzsYmR
	Y297FJ+eufexPyFCwjED6x0IT8YmOaek8IhWyy4JN6q3d2eb+zSexV2FDADJRi/YVs24Xe6RMx2lF
	wIs1ZF5rQhXXqpR/o73tfkEZ4DdjT6CuZAE5FkqNkDnWKWFXeT1sim+feKEhjLIDUTJDkIP+42BSN
	tu+XTMD8nieOqHVyjr0eul4TRCuaORchkWdB9eWE8PnJR2R0lL97y8T/R979C0zVjiQUwCR0EIr3m
	f/5Dev2Y99UEUTRE0Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHXO-000000024BH-1JXL;
	Thu, 19 Dec 2024 14:30:02 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHTn-000000023Wi-2kld
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 14:26:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBA9524000C;
	Thu, 19 Dec 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734618375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YEA6kgJCDNwbwvuq5IIM0OIbAjCWhKgd4WmCiH53RHw=;
	b=fF3h3odkn/k3KKbV8YZ+GE1A59U/n/F8aakIMb35iqh/75czo2oHvBH+kKcHUCYv2i6q0M
	Lea1DLHvxwFvU1pB2Bgm8nlglt3iqycMtOqmeiBQXy+38eSI9aeF49tw6NRQBXHfe1zTud
	GnVueMX1JGY1Xejqoz8/biPb58c7jzJcmWn5MitXG6HrLQ5qNIhUwhO7C8jYA/dhuBEsdA
	JvD2qEgrpoMwuX4ksP63mv5QBjAX/S1EQ/eA7q85UAim1/yU8GmBE1bvTj2wSmxrLWALRZ
	PsGJalv4i67EZYo6ZQkXVTDwxiyh79gcf19LniKcQl8XBxxOBpcMU84bmyQZKA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 19 Dec 2024 15:25:15 +0100
Subject: [PATCH] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
MIME-Version: 1.0
Message-Id: <20241219-patch-nand-poll-v1-1-605e5f15f24a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMosZGcC/x3MMQqAMAxA0atIZgNt0IpeRRyiRg1ILa2IIN7d4
 viG/x9IElUSdMUDUS5NevgMWxYwbexXQZ2zgQxVlmyLgc9pQ89+xnDsO45k68Y5YcMEuQpRFr3
 /Yz+87wcr9zw/YQAAAA==
X-Change-ID: 20241219-patch-nand-poll-b215766ea0a2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Christopher Cordahi <christophercordahi@nanometrics.ca>
X-Mailer: b4 0.14.2
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_062619_846474_4ED05786 
X-CRM114-Status: GOOD (  10.63  )
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

For each NAND_OP_WAITRDY_INSTR operation, the NANDFSR register is
polled only once every 100 us to check for the EMA_WAIT pin. This
isn't frequent enough and causes delays in NAND accesses.

Set the polling interval to 0s. It increases the page read speed
reported by flash_speed by ~40% (~30% on page writes).

---
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 1f8354acfb50b2f4d155cdfc03afcf2863539f66..b3fe6f62bb3bd6a51da891c604d38142055ab1d3 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -724,7 +724,7 @@ static int davinci_nand_exec_instr(struct davinci_nand_info *info,
 	case NAND_OP_WAITRDY_INSTR:
 		timeout_us = instr->ctx.waitrdy.timeout_ms * 1000;
 		ret = readl_relaxed_poll_timeout(info->base + NANDFSR_OFFSET,
-						 status, status & BIT(0), 100,
+						 status, status & BIT(0), 0,
 						 timeout_us);
 		if (ret)
 			return ret;

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241219-patch-nand-poll-b215766ea0a2

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
