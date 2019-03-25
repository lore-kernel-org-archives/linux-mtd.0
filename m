Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC8C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 00:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B8921473
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 00:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzWROrnf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqAfkh5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B8921473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tnqxDqdoDseDQBOYX8Li8S0umLsV4krnqlJd/EjVhm8=; b=fzWROrnfhZxWmUlwo/035SfVfw
	VSeWZI552Pfdo4ITJp/dBCFVzA931AnpYjHj/h+lOAOfXQkhdD6nQjftauHvHMuG7FZz2DvXLRfnq
	32BxbFSm4WWfs6f962fOA5DI/ZvMnNuaJC5u7lz/g/lh/2cpmiAKoPWz0m+4Yewsp/e76rtBmJqWv
	2XcM61UtQ9w+EjJJ/OUidbPAHiZ/Gu5rj1UXTpgUwE6KTzHxJ/95t1/qhtYhpSCo98wUPmPh/2gPs
	UA6V+o8CNxPoO50xu57CiC+4ujQrRUOvanr4SGRjGJGQwUd10gxeX8qXCSNZpy2TbkFirnmAV/MPG
	dt4B6nRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8DdI-00086h-AG; Mon, 25 Mar 2019 00:38:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8DdF-000866-MI
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 00:38:30 +0000
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E32CF2133F;
 Mon, 25 Mar 2019 00:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553474307;
 bh=0B0Nx1fu+du/L5wHsmxe+/xm9sKvLvx6FMdKDAXpHNQ=;
 h=Date:From:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:From;
 b=pqAfkh5TsPueBPMvpvlizJeHoNe4wq+MbyXA3ocM1dMh0vRborC/lwJ3shH+7qeyQ
 Sf+068I6EBhcmZ8xpkqg7ClVpaRbaTquya5a/6qamDeExtxSn2EakpeYLV0jj++NC+
 nI9mFoBVphM8kpwxEzc02TQ21+dqOC06kXJXcgys=
Date: Mon, 25 Mar 2019 00:38:26 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
Subject: Re: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
In-Reply-To: <20190319165023.18828-1-alexander.sverdlin@nokia.com>
References: <20190319165023.18828-1-alexander.sverdlin@nokia.com>
Message-Id: <20190325003826.E32CF2133F@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_173829_748873_0C699ECA 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: , "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.0.3, v4.19.30, v4.14.107, v4.9.164, v4.4.176, v3.18.136.

v5.0.3: Build OK!
v4.19.30: Build OK!
v4.14.107: Build OK!
v4.9.164: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")

v4.4.176: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")

v3.18.136: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")
    f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")


How should we proceed with this patch?

--
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
