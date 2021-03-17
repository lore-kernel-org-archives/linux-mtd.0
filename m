Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530EEC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 05:53:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5E8364F8C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 05:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5E8364F8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SEiZV5gF7FDU8ZOCOZIJ6PZke6vW3rHO3VEuCwyUDL4=; b=dhbk7luLyOPra2RlpfXgInJjt
	jH9fZk1g3UWQiRQPVUTpuGQuEGgddr0S/0Hyjdn7e0Qwfe7aaWZZy7hVNEAwKMz7lPGPVcQlsrX4Q
	fsQqXPUHNta+h5UbOpNnzCI2RnEKnUlr1sfizqh4zMUYroqQ4wXHKCeQU7/uHPmGp2SYlxCRxrwV4
	FHxzYDFQQ3x3I4ByoqsXkW1FAlmo3Q/b5rF10VRqQ2gBGU95nwxQ14rfx2rJsOt1ssI8GUfLtCEL1
	PhTRcfIYeUt4E5KfpHxDiATV8PrGQGHZZdKn7PzC57kMjGXs5s19whP0kXKOjWG8Lf533sbDM22wF
	SobgouB2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMP6Q-002VeB-UI; Wed, 17 Mar 2021 05:52:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMP6K-002VdR-Jb
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 05:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615960332; x=1647496332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2eD7CRdke6u8hS/2ch3I0JuW3C0eH1p9KrKUbzM70E=;
 b=T+6qPJNthzpp1ZCtZmqmXP1UlP/9LOBVX0Mac+UYdauTWhvnGD499I1v
 3rXZYMbQnSTeeqNNKjw0qQW0uSIxBuTtB8xoh2woWxzNZCpygLsib/bIP
 Er5dEJwk7I9m7mvamamOKx/3q6ptLw6tq58dAb33hpPlgAtIwqaxxArZp
 RAE5rTvYHReLs71X9VPk/qWpdpvcaHgKegDm43Hj8v6y2Jd5raqonsBwL
 DHFO1MoOBQr5sQrsSFW/2Ew22wKUbzxH2H/07gKjr9qx61qzg8vO4Evsr
 py4L7h9ydDJocXG4cCj5RW6Q9MGJjQ2wo2pWV7GlorxPmH1cNaA0lplaK Q==;
IronPort-SDR: G31ZsEulACHCLC2CehSTUlpNAQZ4uni1Osv2SGopHm5S2wD3AwSQduggQ5hd0I+0dkBW9epeoT
 Aq1kShzOYC1F6c8n6BU/XQxulsd/dJLBSKP0FPXoGwh3Xfrhh4cdgYpKO1ZiN3zjLuB+bpBO2N
 3/FPyscmFO+vclCSD+zJu8IHVjb31TsWQsxim+Ros9Copewr94R+PF8P4C++HNAKd4hUbIRP7y
 3neP7a8iMhp/ex68fq47GhfG+qRvbHpH0Thd9p1M2ZdWqsXoRYHN3d5GcMFhw5oLZ3XLg/cc6O
 9TI=
X-IronPort-AV: E=Sophos;i="5.81,254,1610434800"; d="scan'208";a="47820219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2021 22:52:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 16 Mar 2021 22:52:07 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 16 Mar 2021 22:52:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Update comment about the default flash
 parameters
Date: Wed, 17 Mar 2021 07:52:03 +0200
Message-ID: <161596027983.9417.17580791148510891300.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315055634.17332-1-tudor.ambarus@microchip.com>
References: <20210315055634.17332-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_055213_361610_F5F73DE2 
X-CRM114-Status: UNSURE (   6.38  )
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

On Mon, 15 Mar 2021 07:56:34 +0200, Tudor Ambarus wrote:
> s/legacy/default. spi_nor_info_init_params initializes some default
> flash parameters and settings that can be overwritten when parsing
> SFDP, or by fixup hooks. There's nothing legacy about them, they are
> just some default settings, if not otherwise discovered or specified.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Update comment about the default flash parameters
      https://git.kernel.org/mtd/c/79321e752aff

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
