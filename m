Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E10C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:21:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017AF61007
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 08:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017AF61007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErfhRH8SvmAYx/yeRtS0XHCZ1baZfPXijCGvJ5DJUgI=; b=L38ot/u1eD7Sr2I9toBQLQ6aQr
	+i6Z3icglybwmefSMFcKEc5jHSG2GlvKuRj5JmP0cPZ4ttdyRN2BTSH2Q5UMW7GXVEo9ii2OLvBxx
	sNzUnbVW1My0kDZN3vhFIQ0V8UqZuk+JfhkB79x4KGcuvheTVGcW1MoA9OAxzZ40sWzmRmG8pq7KZ
	vwwE4k3z7oa9GXk1sh01xCscmfpQT0Osw0wRpjYVHY06C4Zl+vzLbaYN6B9ujZKgxE87bbtxHJapr
	wLuLbm9zA99eb1e+5CwFcfqyBnRX7OSg/58vt0vmaXNkX0ZF9qFyQydg9i9nh3zVEjUj/JvAJceDv
	nBzHbr5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSF2s-00CHE3-Ut; Fri, 02 Apr 2021 08:20:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSF2m-00CHCw-2V
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 08:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617351640; x=1648887640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TWyPo3vF+CgtD3+SApEjDL8YDDwtxlPAN0yQZktdQyM=;
 b=EcaJBbzeGPRuuXezvek2GJI7wH9xbA8+2HxSY6BLL0SDU4UnBBD3DVLI
 RESOyV91nv1Icx22RvYhwMesIA0Q1cvXl1/ZQYS7WFY0Y2/lcOekvuk91
 iMfRNMbPGcJuFmnT/eNWgVtn6RTh8PjGWuX8tF47/Qbwl0ulsHz3HR7tj
 12frEoopkhgch6Vanp0uavA3fLD4ydyFvC2Dw5s3eDW98kch0dEaEQjVF
 dENlzyS5PHCJtMdN3hjSWMlgNTX0Dyur7yTMtuE75MGq/9pCyQPA3fUUe
 CRWHIwDmHDg4JfREfvMD6KHkAtGJPhj0nD/XPP9sXRgW7ytxXo4JMrMO5 g==;
IronPort-SDR: NTVQWnH0u/4LOtgRxo8oUN4t9QDWL/Y7V7dEXibvAvmRa5yT0YE2GgZdBGK2gbW/FW6WdbUYcF
 9BdYuce1ldccR9Qnmnahwq0YQYaRyFtSvXIkkFvkhPj8kvPynmwSPNjrLkND+WU7IUD/d3aIYW
 9zidqQaPVeFwvRHIDLdOX1K+7Cufp5S0qnfJHcj7eQH5IObdkEkqLX48AWgnX0Ng7Tq3em8wwD
 J8fKl/2PDKPCa8unu3uwBmNcNBqA/oJw+9VKjhH1XWWJeyZ9iceYDQ/uoPuWSbht4EnlxRu3ZM
 0qw=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="121543218"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Apr 2021 01:20:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Apr 2021 01:20:36 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Apr 2021 01:20:32 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <vigneshr@ti.com>,
 <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>, <ycllin@mxic.com.tw>,
 <juliensu@mxic.com.tw>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: spi-nor: macronix: mx25l51245g,
 mx66l51235l and mx66l51235f
Date: Fri, 2 Apr 2021 11:20:29 +0300
Message-ID: <20210402082031.19055-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_092040_891658_D4F0972E 
X-CRM114-Status: UNSURE (   8.24  )
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

mx25l51245g and mx66l51235l have the same flash ID. The flash
detection returns the first entry in the flash_info array that
matches the flash ID that was read, thus for the 0xc2201a ID,
mx25l51245g was always hit, introducing a regression for
mx66l51235l. Revert mx25l51245g addition. A solution for these
flashes to coexist was proposed.

According to macronix website, there is no mx66l51235l part number.
Rename the part to mx66l51235f.

The difference betwenn mx25l51245g and mx66l51235f flash_info entries
was that mx25l51245g also set SECT_4K. Both flashes support 4K erases,
but the 4K erase should be discovered when parsing BFPT, so there's
no need to set the explicit SECT_4K flag.

Tudor Ambarus (2):
  Revert "mtd: spi-nor: macronix: Add support for mx25l51245g"
  mtd: spi-nor: macronix: Fix name for mx66l51235f

 drivers/mtd/spi-nor/macronix.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
