Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9289C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 09:44:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6DF2075B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 09:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6DF2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTRmSXhfJxsE0bK9m18b5gaknF2MAo/rIDD+J/9nvQY=; b=3eppznLsHU72i4j2QYq259olAv
	l3OSWhq8bcvsSkkZo5tXHruIB15GZtb7HUqIMtSTvF1MTbftI4Ov0dvSVtczw8oanHqWpxzMp6akW
	BF72VoBs5djguG7Qx7MMMukNxIOJW674Oh1CvEF3Mii1GC3jHJcdf3jsknYsFbZutqpwbAOgHQt9w
	uotRQDjBgP8tPGv9K0rxb6hF+kzHPhgpvi0AEeUiwwcy3U5Gua4R5x9B2pcFoRTZFGr40FGWZMDDq
	XwShzIbU4XDm5w7PPbp6SBUtTBTcjsrcRBn1GPhbl/rvTJbiskFUEkAlGAPVNZWn+zqC2HoEG+Nu6
	UtH+sWFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4hMC-0002pC-Vw; Wed, 27 Jan 2021 09:43:25 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4hM5-0002nB-5M
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 09:43:18 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DQdt95PtHzjCvf;
 Wed, 27 Jan 2021 17:42:09 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 17:42:59 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 0/2] Add check of 4-byte when parsing SFDP 4bait table
Date: Wed, 27 Jan 2021 17:40:48 +0800
Message-ID: <1611740450-47975-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_044317_476363_412F7D95 
X-CRM114-Status: UNSURE (   6.77  )
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
Cc: john.garry@huawei.com, linuxarm@openeuler.org, prime.zeng@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add check of 4-byte address mode support when parsing SFDP 4bait. Some
flash will provide a 4bait table and the spi-nor core will convert the
address mode to 4-byte without checking whether it's actually supported
or not by the controller. For example, the 16M s25fs128s1 provides the
4bait and will be convert to 4-byte address mode, which makes it unusable
on hisi-sfc-v3xx on hip08 platform.

Add the check before convert the address mode when parsing the 4bait will
solve this issue.

Yicong Yang (2):
  mtd: spi-nor: check 4-byte address support when parsing 4bait
  spi: hisi-sfc-v3xx: add address mode check

 drivers/mtd/spi-nor/sfdp.c      | 48 +++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi-hisi-sfc-v3xx.c | 25 ++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
