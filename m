Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF445C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 19:06:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F38C64F73
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 19:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F38C64F73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xkrfCvYcyFGm02RCnAQbNJ6YeFIl5HmVbowmGq55lJI=; b=ojM5sXL4QBr/Jhszx12/BpRKhU
	BKRVW9ERTgw2u18ynCP2oAfJlejkuWVEidvvWsZj5RgEhMMtX2hBn2kw2l0qTXLWoPJV81AnX/QX+
	L9+5W8tjP1rObZJDOiLFHlPnA3bOXFHSGwTJqoZw3/qVNJ0FgwHv8kBKvqtJtNT/3MRgvJ4zzwJ13
	vW8DGBDJAJ/iUPqQQJD9jTtL/rdhStCaKyHKlgGwvhjLnFQf6w9jfcsYGvrfuTy3FTHsfdk1+nlrK
	KmsTYTkawlqYkfZSpF1TCztAt2huviS4VNpqcaIEJU9gECX7dT96t20AQ0hVg/DzE6GesfxymxUqv
	oMr3mGUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKn6u-00CFPJ-UN; Fri, 12 Mar 2021 19:06:09 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKn6q-00CFNm-R8
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 19:06:07 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 62A1E22238;
 Fri, 12 Mar 2021 20:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615575963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=r1NUXsd8CcCDGSgN9MbS4BQVVK/eEe8OH8TuK2TBWdU=;
 b=ftGn2reIyDNiSRy7+ia+andf8S1ds8SvJzrxvkFwFQSaXCjjKQI/9IRiqmBCfT/p/yj6Br
 xdSYqzcSgqh3b5ka6GRW8WUxf7rbHiza67ONaWq8I79FWV+3uWhqHLe8Ch4maVhkdF06is
 8g+F4nnA7ZmP25uO28N/KfTQYkXhnEs=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 1/3] mtd: spi-nor: support dumping sfdp tables
Date: Fri, 12 Mar 2021 20:05:45 +0100
Message-Id: <20210312190548.6954-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_190604_999183_58F354C4 
X-CRM114-Status: GOOD (  16.24  )
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

Add the possibility to dump the SFDP data of a flash device.

More and more flash devices share the same flash ID and we need per device
fixups. Usually, these fixups differentiate flashes by looking at
differences in the SFDP data. Determining the difference is only possible
if we have the SFDP data for all the flashes which share a flash ID. This
will lay the foundation to dump the whole SFDP data of a flash device.

This is even more important, because some datasheets doesn't even contain
the SFDP data. Fixups for these kind of flashes are nearly impossible to
do.

I envision having a database of all the SFDP data for the flashes we
support and make it a requirement to submit it when a new flash is added.
This might or might not have legal implications. Thus I'd start with having
that database private to the SPI NOR maintainers.

There are two ways to provide access to the SFDP data:
 (1) We just read the SFDP data once and cache it
 (2) Any userspace access will always read the SFDP data

I choose (2) because it isn't as invasive as (1). The current SFDP code
reads the SFDP data only partially and only the part which are actually
used. Using (1) would mean to change that behavior.

Michael Walle (3):
  mtd: spi-nor: sfdp: remember sfdp_size
  mtd: spi-nor: sfdp: fix spi_nor_read_sfdp()
  mtd: spi-nor: add sysfs and SFDP support

 drivers/mtd/spi-nor/Makefile |  2 +-
 drivers/mtd/spi-nor/core.c   |  5 +++
 drivers/mtd/spi-nor/core.h   |  3 ++
 drivers/mtd/spi-nor/sfdp.c   | 24 +++++++++++-
 drivers/mtd/spi-nor/sfdp.h   |  2 +
 drivers/mtd/spi-nor/sysfs.c  | 73 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h  |  1 +
 7 files changed, 107 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
