Return-Path: <SRS0=VhFc=JI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C96FC433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 07:46:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9EF9610C8
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 07:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9EF9610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XjQDoz8MMycYRD6iE+ezKZtC7nb80+S8H5T+HnVcejk=; b=jTQPHBWAvPXv/ccebmH4eYhrz
	NccoE3k3M4CMPLRHfG+5yfLDRQUe8PpCaiIzsDBOP6HdXlLFjyEX6jOk1jLrhgtiB3vkJsUljPj9D
	qgXR2/ZcEPoqpXt7Xeek2yXOapYi/au7q1l72tNodMrQkpsHP5hYV9YuqaXMMMl+1yELNu6ZTrCeb
	SQqZIL5UvPzIYfrsuHPG6KwWnWmHbQz4qPP+VrSF68frJIbiRlpMGZiPCURasgTF/YbRzCEzbE87N
	szghuiZHFSx+Z+YglQf48HcOZcNHjHi2PAQFOjpKErUOn69Ql02mpyvsDItUX53l9rhfLE+ToTDt0
	r4BfsQPEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVUml-0047hU-6l; Sun, 11 Apr 2021 07:45:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVUmU-0047gl-Up
 for linux-mtd@desiato.infradead.org; Sun, 11 Apr 2021 07:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=sHkFbAJ1ZgBOvWSZBVJI6U6X0wHm4VDhjcl18TAxSvw=; b=zRsPQ+8FZ65vJNsuFZBICR6g5a
 QUK19OyUIG1XoO06IHZOZydX+mokHiNR1TlQZxfjZ1+7PP0OtryPzv3bwpBs4NLDytoVCwL/unvQO
 +aCuNOibybcCyaVK7I9tYTZfeACc98o32hXUBF9EdOew6cvTgdICb/iAtCTj2eAd4bAzqOqdqR5Az
 KC+mZOEEwlICEvGPvtEy43ERLL7MIL+7UkVqHb55NR82gdM7A5L/CUQj2xhm/e+PL0FBLsWaKhV9X
 RRWA66ZZPX0q014UXDhCWG3p9yqmdUg34J/M5LPTnVTR9FfcLpZOQhlj58r2KWHHERvd46E61Jip+
 Y1uCnhUQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVUmR-005Ow0-4V
 for linux-mtd@lists.infradead.org; Sun, 11 Apr 2021 07:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618127116; x=1649663116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=du2hOIdY/DM25106UypHwbEj9cpX57oIv0onX5c2tog=;
 b=w/L7ig5FAKMq0ewqkujAVfIYv0Xegdcjp9B8vlLeVXxjFB52j7zmeWBN
 54NrPXtA1+LsK1vV5C1fgjaTE8HqrDTtMkos7OFOiib7oaT1+zHQj5ZsH
 GlqeSXkjp1KE+x2N7LT4ecgMn7TV+/R81GGAfryR52NPcLNFLDrP5tilm
 WzzsBjpl14frQuXUF3m9zE5+7rKcz0Kt93G4PQuMaLwzdLuRdVmbHrZrY
 gVkXMAr130YS/66sNCUtkXwhVZTiMLuXwxyn9CMMYQY/diUxHEqSWjurm
 FmmkvKG09hbBpNLEQ/vGfCh9Eze26BoRvBth0Ie3GfPMa15FxMGXEdWLa A==;
IronPort-SDR: 3bbfwqCTArwwKVoV6Z38q56XZDI3RFSrwiBudz6ctnq1QavfkkXv92GH0jEP8gfxaG0y1z/oNW
 qcWHERzTrGbBRHcFTkc4sfeHlU9+yqKU8Mv9M4eBgNy2duTuBeOss5l/z8c6aMxq8AxUElfm5k
 5gtV5gKV7ZREPdLZfSPGBqmP1z9fIaMvAs6IC8e+rjB3Xk+/XKgtODQWeDcSwD2xxh22BOYfj9
 AVEwzUSBp02uayFsOwG51PmaFd/Hqkixu1n+BNWHY62yHcjU4HygMpORvdqddf/39hHM0wucEP
 eLg=
X-IronPort-AV: E=Sophos;i="5.82,213,1613458800"; d="scan'208";a="116020918"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2021 00:45:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 11 Apr 2021 00:45:13 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 11 Apr 2021 00:45:10 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Yicong Yang <yangyicong@hisilicon.com>, <linux-mtd@lists.infradead.org>,
 <michael@walle.cc>, <p.yadav@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <richard@nod.at>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <prime.zeng@huawei.com>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Date: Sun, 11 Apr 2021 10:45:05 +0300
Message-ID: <161812694422.37194.405254143746862508.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_004515_202792_EB957F8C 
X-CRM114-Status: UNSURE (   8.70  )
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

On Thu, 1 Apr 2021 15:34:46 +0800, Yicong Yang wrote:
> If rmmod the driver during read or write, the driver will release the
> resources which are used during read or write, so it is possible to
> refer to NULL pointer.
> 
> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
> hisi_sfc_v3xx driver.
> 
> [...]

Updated subject, added fixes tag and cc to stable.
Applied to spi-nor/next, thanks!

[1/1] mtd:spi-nor: Fix an issue of releasing resources during read/write
      https://git.kernel.org/mtd/c/be94215be1ab

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
