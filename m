Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF5CD1288
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2024 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6P8veaHvbHUdRZuwubQMM1+r6sYt6fpoA35UOA0ADk4=; b=pzcZuIZwrs3nlRJESXki4QTpQZ
	zdHDUQa521kGsWSr4vn0eSf9LaYsUJcX/34yi2Xl5JDQR9WhAmcyWVxFJoB+/yOzfC0+ymm6CN5Kg
	u/pivJm3cO3GKRNVLaGqPHFlsJHR83laXP36zVhQjeX3SbeQODwMZ7dGXHw1QzRgdh+bdW+/8uPYk
	gM+7NV0KAHHvc5E3yMT20mjM87vSlMqK/nBGwSb4nYDvDo/Kguvvbz7CEzMKVSttOD1rw65AtZJBd
	3txaQZ8xbWYMV3X874aAULEc1lNOvulpcJERrOYMSwQpMAimLUc4WTk9vDpRGnivdyPgnsATR6GlQ
	VAMuM/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqZ64-00000003a1H-24to;
	Sat, 30 Mar 2024 13:50:12 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqZ60-00000003a0F-2DD9
	for linux-mtd@lists.infradead.org;
	Sat, 30 Mar 2024 13:50:10 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4V6JYd3SBdz9sd5;
	Sat, 30 Mar 2024 14:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1711806597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QBITO0QHOJI7RWnxD7EVnkWW9XcuiIgw2NIbh4lFNZ0=;
	b=Ff2rF0HLOA0deDYzV3OqpFnuhRdgLXjkonwAhJB01LzYmDfXDLjvAZV/epJtzKWxB8Q9Ch
	TEuB+HeXQB47XWO+Tu4Scx/DaErDXm/q2rjeBlqon3mrxi5iHsglSSrGAKpb6wC1ImSTgK
	ySCtz4LMSGxcY3EeQ1WU6WsjoTvo3u6m+I3o9E5y6nHIxBCcXKsnYzmUyDMrKaftOxYDEI
	AMxR5E7c5mdHMhhyoBFEXChyuWMEL6UuTo2fMo8gl1Ufolu8+ndOAd8dC1waIBmudMQ239
	sT0dyuBY6UdtISdoZ9BsiXrNjKTcAW6nCRVbuoNthyPJh/Nkvgfo7vMwb/P+Jw==
Message-ID: <de171eb5-3e95-4529-9228-9a4ed526ed46@hauke-m.de>
Date: Sat, 30 Mar 2024 14:49:56 +0100
MIME-Version: 1.0
Content-Language: en-US
To: stable@vger.kernel.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Backport "mtd: spinand: Add support for 5-byte IDs" to 6.6, 6.7 and
 6.8
Cc: John Audia <therealgraysky@proton.me>,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Rspamd-Queue-Id: 4V6JYd3SBdz9sd5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_065008_760220_248EABA2 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Please backport the following commit back to the Linux stable kernels 
6.6, 6.7 and 6.8:

commit 34a956739d295de6010cdaafeed698ccbba87ea4
Author: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Date:   Thu Jan 25 22:01:07 2024 +0200

     mtd: spinand: Add support for 5-byte IDs

     E.g. ESMT chips will return an identification code with a length of 5
     bytes. In order to prevent ambiguity, flash chips would actually 
need to
     return IDs that are up to 17 or more bytes long due to JEDEC's
     continuation scheme. I understand that if a manufacturer ID is located
     in bank N of JEDEC's database (there are currently 16 banks), N - 1
     continuation codes (7Fh) need to be added to the identification code
     (comprising of manufacturer ID and device ID). However, most flash chip
     manufacturers don't seem to implement this (correctly).

     Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
     Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
     Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
     Link: 
https://lore.kernel.org/linux-mtd/20240125200108.24374-2-ezra@easyb.ch


This will fix a regression introduced between Linux kernel 6.6.22 and 
6.6.23 in OpenWrt. The esmt NAND flash is not detected any more:
<3>[    0.885607] spi-nand spi0.0: unknown raw ID c8017f7f
<4>[    0.890852] spi-nand: probe of spi0.0 failed with error -524
See: https://github.com/openwrt/openwrt/pull/14992


The following commit was backported to 6.6.22, but the commit it depends 
on was not backported.
commit 4bd14b2fd8a83a2f5220ba4ef323f741e11bfdfd
Author: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Date:   Thu Jan 25 22:01:08 2024 +0200

     mtd: spinand: esmt: Extend IDs to 5 bytes


Hauke

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
