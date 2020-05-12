Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C04C54E8F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 11:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A8B20753
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 11:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvOw1oMa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="M/W12HfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A8B20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9NU8YSadTPfU7NJBFRxr+nsdxqSS6wHhm0VcIutsZE0=; b=UvOw1oMai3g8jQ
	kv6eqSbGFc4zwEQ+QycLpzci3AhcfNm0eqEuVVQCtqIH8X7gG6+KJSlt42JUsdTULvjshyKOwTCFT
	UcJgldHyFaVhAjDqeLs+l5+Ppm89KmzDHe9WR/xJ6Flwcz2NyjQmCW8BxXduiYEDjCOUGO9xJahGF
	uuLyx4w53Pu/14XZxQuXIr8u/drU8/NYm/PIBH1+wfWH0srJ74oPADsFS4ArjVTd+CoRENQHd6s/6
	3zgjO0VucJTZ9GGVkdykjy9jBPW22aGJRSJYH+B02k/RomPUhuiZi2DbJ35yR8xFdOQhYta0VEL48
	pNHbPY3xHm3hziFE/yag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYTOl-0007D5-4q; Tue, 12 May 2020 11:48:35 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYTOh-0007CM-J9
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 11:48:33 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CBmA5T021217; Tue, 12 May 2020 13:48:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=D3pNqSIt8oGGo+ly3QButpe43l6v+9Np/M1AzLOvJCI=;
 b=M/W12HfS1hio1seh0PZLywV5bMNlbMxml6KwapJMqZmTDmQp06gXG9mC8T7ZaaV9Y5d9
 8bVSySBO1L0JN9KxGaxL1t9c8WluBbt5ypxEazZeAAbs54Mcift4KNJhYZlcz9XmAe98
 +cW/ZOKWG1VrCwWSbrIWk7iZGNgnUa1iMc37hyEixJdW98xAqkt36aKrM5eSUtikCJkL
 W4PwWmg8XxhQekfC7turFxWEd7xFTLkq6KFvcbw4EAbOh5LLQ8IlW7FzdtS1Ld5g0xJG
 jzeilpvjEyIiO0ROM3kpytRP/B4fmWYyknxAZoXc1lvktahMbYzf4YaECuXT0b0/L1ge Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj9wg9mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 13:48:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 409CE10002A;
 Tue, 12 May 2020 13:48:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D6802AC5B9;
 Tue, 12 May 2020 13:48:23 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 12 May 2020 13:48:22 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH v5 0/2] mtd: rawnand: stm32_fmc2: rebase cosmetic change on
 top of nand/next
Date: Tue, 12 May 2020 13:47:46 +0200
Message-ID: <1589284068-4079-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_03:2020-05-11,
 2020-05-12 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_044831_993048_DA68C1F3 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This set of patches is a rebase of the patches that were not applied
on nand/next.

Changes in v5:
 - rebase on top of nand/next

Changes in v3:
 - add Miquel reviewed-by tag

Christophe Kerello (2):
  mtd: rawnand: stm32_fmc2: cosmetic change to use nfc instead of    
    fmc2 where relevant
  mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 987 ++++++++++++++++-----------------
 1 file changed, 488 insertions(+), 499 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
