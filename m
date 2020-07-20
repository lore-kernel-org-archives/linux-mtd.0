Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFBC433E2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:28:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40CD208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q+BZEFxc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="L9B2c7Ts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B40CD208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5q8MH7VLy5Zv3gioVtXa9YFuLyHn0iT9zCnmPagKYGI=; b=q+BZEFxcCNeJWH+TY1ozOxCmOK
	h3GmotX9SBh5hEjLd+18EAZJW8cWj4D5Y18H7tjYIYl6DzPR+NkKkYi8iHQR/vQCCQG/nuKt9Ejmc
	URCR3mkh6PGIk0Ci8z/IEa8SDxKUrFZ37nDY8XgUHMYSdjH/c1r9W1Lyp2BMTmM+xDDJXCV63sCiq
	AfglUjLC4CwSj8o+VYm5wmD738g7dJgcFU7QJyDG+ZZiJip7gjH5uPktlwxI0KqcBnMf1Dn1MjVvI
	4CPPmxe0B57RZUwR/BjrSBsaTho/nuyAP2BFXvqxBSlUL/OhyEFwyKp8fcGdt8x1gWVAZbFKwKi/S
	ThBlQNgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPO-0006LK-Vt; Mon, 20 Jul 2020 04:28:11 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPM-0006KT-7t
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219289; x=1626755289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XLqM76XPNaY65mO8tRAQYsKgsd68czi3YGNz6koS8PI=;
 b=L9B2c7TsyxHrZsShofxpgva4EFaYzDovGVAjQZX0hleJlYGpemq8RtxC
 mn+YuEjvu9YOpgDuDj38oU8qYWwMWKhzCeDce+dBSnhLd5Jhrdx340Lwz
 Zb5AfOe9bEW1ynqH82WDysXCLiFHSCz9s0JUAk0i4HEOryvcdLEKhpd0v
 NARm9fkNFCGPvNlhfGokfqSECYdZck3ZeE+22NWPhqBMWwJ/5lIEH5OJT
 UFIjwKZukd4hl3UKfASByMnrfnyBZNWs4s8kdbBRjdCAECKrqpIsGFbb2
 LDCYO97a5sZPF37GadvmKEfTHLWc2SV37OW76QR6sPSXQzzBV9E3AzH0C A==;
IronPort-SDR: n50wXSETMxRmgX/YLL/Bs7bfKP18Y/iMejsiuhdZvo+2a6BQz82b/9y2SArrr23vHvVkhViDBd
 mq7nqaQhWkAiqBzYPgvkCkopELsfJb+46+J20NtHYor1+C6uG9UpBNeT3fxPOBq1pWOHQ4Rfth
 IGu4zWVrggj7WiZcW5LLImMtSb7un8mEZ2833jQ+XDQVaksDB8UTiyo0rmuruDlQ/rc/SeVAtL
 Z95cEDhvj6B+K4yn0GNjN9IKWgfaJz6ZWPs6oUNK6qTf5DYpugREgJWFOzfz3LaWIMGs8EkqyP
 rf0=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="83812047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:28:04 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:26 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 0/6] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Mon, 20 Jul 2020 07:27:53 +0300
Message-ID: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002808_559098_2F50045D 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

v4 is just a rebase which fixes some small conflicts. There is still
a small perf degradation on the write path on sama5, but that can be
addressed separately. Below is Boris's cover letter from v3.

Cheers,
ta

Hello,

This v3 addresses a few problems reported by Tudor (one of the fix has
been sent separately [1]). There's still a perf regression on sama5
(200KB/s drop in the write path), but it seems to be related to a core
change (when switching to exec_op(), the page_prog_end() does a
read_status() which was not present in cmdfunc()) and the fact that
the NFC is bad at handling simple commands.

What's probably more worrisome is the difference between the NFC and
the !NFC case (not introduced by this series). I suspect it was to do
with HSMC specific timings, or maybe the NFC simply behaves poorly
compared to direct bus accesses. In any case, this issue is orthogonal
to the exec_op() conversion, and can, IMHO, be addressed separately.

Regards,

Boris

[1]https://patchwork.ozlabs.org/project/linux-mtd/patch/20200518155237.297549-1-boris.brezillon@collabora.com/

Boris Brezillon (6):
  mtd: rawnand: atmel: Enable the NFC controller at probe time
  mtd: rawnand: atmel: Drop redundant nand_read_page_op()
  mtd: rawnand: atmel: Use nand_{write,read}_data_op()
  mtd: rawnand: atmel: Use nand_prog_page_end_op()
  mtd: rawnand: atmel: Convert the driver to exec_op()
  mtd: rawnand: atmel: Get rid of the legacy interface implementation

 drivers/mtd/nand/raw/atmel/nand-controller.c | 412 +++++++++++--------
 1 file changed, 235 insertions(+), 177 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
