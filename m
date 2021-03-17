Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9076DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 05:57:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C4064F8B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 05:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C4064F8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0f9RyVqtvBm0tTCfKUz/IDvX+TEGYNp2zgT7ISgmU7E=; b=rG6EJn+YEgUJojK0WZFPyBR/M
	HGo8SphxjtTKIuoWPjZ7I/8EPs0u80J96Zo7EyxfVA+7IcGBW/FKbwsFOWYGYHmEfp9loNZuRoerp
	BOUCG4tWqCP1VfRphNRjkqi1F7ygUkFA3m/gmmPr4eRc778+ZrP9nB6MZlY0GjHrG5zWp7x+z2tDe
	H63KpHHsAln7El5VsO3W7XBytG1hZCpoVP8XVxYvEhPeDevKm2oA8eBzZ5nwk4Vf5eJCf3NgtU0ia
	31taoPn4todROZ1AbKv8lW1Pkr/Tuhj9RJ9ClLectLX18d9UB5GsK164AJEhoEmlc+VsZPjhbhyxg
	yOGRsN0XA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPAG-002W0G-0v; Wed, 17 Mar 2021 05:56:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPA5-002Vz7-Ly
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 05:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615960565; x=1647496565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtH/Vke6rlwhX4iJALrlQLEMGo2Eixa4niPS9z2+t/E=;
 b=izJR41OuZWR9EU1KFuot0VGmq55B5XIHBb89TxnSiJsiyKkKcgR3Tcd/
 a/+RYFgPvLuJsPe0zk3KEN44EHIPDf2/e4N22dUDfJCaqlUCFfVgznGip
 I2nVFwAmi/y2JS+7h45heYvyGUnm+iEZVzkp9rovm9tZB0XLAUj605B/N
 qlHHamQTRctttD7ZGHVj4eKrnBZW698+vol6/j+wsoeCLjnwtv9JMrsmC
 MEMeeILR60ZSpSH8x6YBYpdQEIzwYbieFY0TEjmn4YWAyaqeMFMVeWaB8
 tD1K4cf+eBKHfodx4UDNTe9hRTUaf3Q7sXxUAnqnFzHuzv4gMMWG/tQOV Q==;
IronPort-SDR: zoQySQZEoaRMODehS1QEKQAuR+s+Jv/7L51HS+gpcv0COzXRNhmgjczYjJk5Q6Jgu+jXn5OXk7
 N+CoDZqNc/LzCfhlCHvlovGIEqIUxRIreZwwmReR59KQPl8QNVPn0RPQPtJhOLM2Uf82g1BS+y
 9qUPE7MWCv0slakoaVZve2IJU0W2o8tItg4+u0pdyB5XFbOQNzn5xwdvKeQKXV7k2/T2ViadC+
 t2IQxsaAFojjrF6LUeqHNPU2sx/cFaKJOItnpU0Fypt7S7zTMQPpr819V9v0yNDe7W9edho+gA
 RpY=
X-IronPort-AV: E=Sophos;i="5.81,254,1610434800"; d="scan'208";a="113527771"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2021 22:56:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 16 Mar 2021 22:56:01 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 16 Mar 2021 22:55:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>
Subject: Re: (subset) [PATCH v2 0/5] mtd: spi-nor: Cleanup patches
Date: Wed, 17 Mar 2021 07:55:57 +0200
Message-ID: <161596027983.9417.8628174282093170718.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306095002.22983-1-tudor.ambarus@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_055606_418991_D1B53099 
X-CRM114-Status: UNSURE (   5.50  )
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

On Sat, 6 Mar 2021 11:49:57 +0200, Tudor Ambarus wrote:
> Various cleanup patches done while reviewing contributions.
> 
> Tudor Ambarus (5):
>   mtd: spi-nor: core: Advance erase after the erase cmd has been
>     completed
>   mtd: spi-nor: core: Add vdbg msg for spi_nor_erase_multi_sectors()
>   mtd: spi-nor: Get rid of duplicated argument in spi_nor_parse_sfdp()
>   mtd: spi-nor: Move Software Write Protection logic out of the core
>   mtd: spi-nor: swp: Drop 'else' after 'return'
> 
> [...]

For 2/5: s/%d/%u and then applied to spi-nor/next 1/5, 2/5 and 3/5.

[1/5] mtd: spi-nor: core: Advance erase after the erase cmd has been completed
      https://git.kernel.org/mtd/c/786a0a75d0f3
[2/5] mtd: spi-nor: core: Add vdbg msg for spi_nor_erase_multi_sectors()
      https://git.kernel.org/mtd/c/8758888c3d78
[3/5] mtd: spi-nor: Get rid of duplicated argument in spi_nor_parse_sfdp()
      https://git.kernel.org/mtd/c/a580293a19fc

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
