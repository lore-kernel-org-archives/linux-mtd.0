Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55584C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:39:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC829600EF
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC829600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hgU2KmBmQCwR/idaFLnW+ezgrlkPXUmQgwfW/TWvSFM=; b=MNhHWL2x+kBsl3galzDa1HmIg
	EKqsTZ+ChywgOLrDs6Osd0rZ/6+32Y58OtzxuMSXzHismdtT6feVdiVyR+NMIjb1aDwKJXDPjl6zE
	PCcJtOFfIdHiob7/cfThQ/GsBIS3UKcyxktBIRsoQyQIo/wzNmxyjJ9LkD+Z/UqA+ZxF4KMxUd9KT
	34yLjg/p6njA7Ks5Y6P/ajdJZ6rWbScW649U95lsheTQdrRcL/aob73wcG2SvTE69em3xVy1dyxtf
	OhBQlqnBvfSsG1JC9XrOlzqLWsUML+7RChWnk93ejRNr7LaFp3PpCtWlzRLE7NPgS/xrFEQNEmkky
	0Vn6/Epyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDSA-00C7H6-Ib; Fri, 02 Apr 2021 06:38:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDS1-00C7CW-7Z
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617345516; x=1648881516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OoX4cNeKEIkkiFfvhPIvQVOX3Xtu6YxWKxsj4cFR3BA=;
 b=fOGLraIvm+B+ZeTcN6urYEzyYCg5ZZIB/DEY67zCTi9yBdrERoiO3Mjq
 HJm1/1rgVRBKNa3wclleUOGDgZG0OC32sEfeqV/nuLW0WxyWNKQBDkfqG
 6ZVwdKb7UU+pmueHZkMMCP65HKUj6MMIftSagHKTiqhaXO40/aZg4N3h9
 LsOaEqZAfG4dMlcLj9ftOcyfYXUkKeC/8FeE4gqAM+/KiQn7i6gL3VWnp
 H1cX2/6WcXb4/2FIDOQuundJAMrFY5tDtOiROCAecer4SgoIATEis8MUd
 BNYJCl4hZFlBje2L7QPH/ijW2dVNdMrA5/nJkTeoazzzyLPRnGqnWmURr g==;
IronPort-SDR: jdxJBQSii9C3nvRn0FXiC8+fWtAILLvX9RCn0YS/e585v9+w0qGtZzhlNtvx36R/jGAHk1UsZ2
 5O0HJ8RQkcYmY0IBlVdGD0qPRaJyYFNbvm9X8Zhdm+wOqXrzYifB2aVMP1lJFStyhEVzCuQO2a
 WDPFpy1uEMFQFqwK7TrsE8TEcsEtctrB4m6Ycs8hsAvmEWOR9niqw5QS0/8y/L80+FXhWBgcGT
 nIB3W08QK4OwrxtcL9erQ3fez0vDL3cYyJUqamIn7mfc0aUNzjmumRu9bcTVywtEb1ik53Bmde
 gS8=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="49777315"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Apr 2021 23:38:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 23:38:33 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 23:38:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: Cleanup patches
Date: Fri, 2 Apr 2021 09:38:25 +0300
Message-ID: <161734495497.5882.9424697028347909012.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322075131.45093-1-tudor.ambarus@microchip.com>
References: <20210322075131.45093-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_073837_705489_7A5625A2 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, 22 Mar 2021 09:51:29 +0200, Tudor Ambarus wrote:
> Various cleanup patches done while reviewing contributions.
> 
> Tudor Ambarus (2):
>   mtd: spi-nor: Move Software Write Protection logic out of the core
>   mtd: spi-nor: swp: Improve code around spi_nor_check_lock_status_sr()
> 
>  drivers/mtd/spi-nor/Makefile |   2 +-
>  drivers/mtd/spi-nor/core.c   | 406 +--------------------------------
>  drivers/mtd/spi-nor/core.h   |   4 +
>  drivers/mtd/spi-nor/swp.c    | 427 +++++++++++++++++++++++++++++++++++
>  4 files changed, 435 insertions(+), 404 deletions(-)
>  create mode 100644 drivers/mtd/spi-nor/swp.c

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: Move Software Write Protection logic out of the core
      https://git.kernel.org/mtd/c/c4c795105f29
[2/2] mtd: spi-nor: swp: Improve code around spi_nor_check_lock_status_sr()
      https://git.kernel.org/mtd/c/b6cbd9167d44

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
