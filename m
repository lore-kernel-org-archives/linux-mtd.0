Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27152C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzoKkABr6dGlmPiEMGrzaOyBp06DizALTrydYchLOL8=; b=LnJ4O9soxMqjOP
	NkZP+2HeUF/K1gJ8ggxu8ZNwug6WiAViwRlbQW1+uX20WnNVBszFSpU5h/27UeA6EH14lIIcX2Nm3
	Kkno5d7SO5xrXEpxK2tlMWCSe+BNDDb/lP+HMAVlTIUgfxDd1FUn6qesF7LYq+F/yhAISoX3PeSDm
	mio6bbAsYh1Zj8VDInlm7wW2VO9IbqJ21c9N5DQsJmv/PNpdbE6iKTvXu6Ld8zsA0jn8yK/IsIg5u
	wMHsxWbKyXNqldMPb+E7c0pNxvZL3u1WlbbSw7qvFPxYn7qwtV8yHluT7MPJzetKiMJnQFYOvOyk+
	RXyfi3zyNC12hb2SuF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73u-00E35k-De; Mon, 21 Nov 2022 13:42:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73o-00E30k-0W
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 13:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669038128; x=1700574128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TGHa1ACMpuK7vWt6H1ZnzKaaUTeqhDv1botyjNXatr4=;
  b=WjU4OBCygOqqjH68y5PxMYTGiVIZetKnGON8NtClcivuNurHFne8Ry/7
   FD/EO1OEGF1IsngBGh5UpLbDkxbjV2W8uQVTxISpWmblo7eWbzo5IdXuP
   nJeHLdXguieDagQ43qqxxRFaIMdpjmhuP4AJ3S6v+rdx8TTnYsul+2NYh
   HBCVoB4LYTKeKHQM8FQO5dgTrM5wefgVdzlPkU0wDqH5CgLjbMFv2AKRw
   AiWWN1S7NlpYhWAKssfc8gl7YZZ0g/KpN/Z0FucAGQc1i/lTaY4elH4bh
   1QUNnlV+PXbwYTq0QsFCP/hjR23M3DmEEmmU7dkrjPpQ4D1AZMpB6Klwp
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184483609"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 06:41:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 06:41:54 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 06:41:52 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <pratyush@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v2 0/7] mtd: spi-nor: generic flash driver
Date: Mon, 21 Nov 2022 15:41:48 +0200
Message-ID: <166903807811.85501.6803386075881922742.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_054208_159621_FB86FDF1 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, 11 Aug 2022 00:06:47 +0200, Michael Walle wrote:
> Add a generic flash driver, which is used when we don't find a matching
> flash in our database. All the basic features of a flash can be discovered
> by SFDP and most (if not all) newer flashes support it.
> 
> changes since v1:
>  - fix doc prototype mistake reported by the kernel test robot
>  - preset page_size to 256 to support flashes which just have
>    SFDP data corresponding to JESD216A
>  - add new patch
>    mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
>  - add function doc to explain wanted_size=0 in
>    spi_nor_select_uniform_erase()
> 
> [...]

Applied to spi-nor/next, thanks!

[1/7] mtd: spi-nor: hide jedec_id sysfs attribute if not present
      https://git.kernel.org/mtd/c/7d388551b688
[2/7] mtd: spi-nor: sysfs: hide manufacturer if it is not set
      https://git.kernel.org/mtd/c/0d9270f2762b
[3/7] mtd: spi-nor: remember full JEDEC flash ID
      https://git.kernel.org/mtd/c/28ef7670414e
[4/7] mtd: spi-nor: move function declaration out of sfdp.h
      https://git.kernel.org/mtd/c/fa06bb26a40c
[5/7] mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
      https://git.kernel.org/mtd/c/39eece67a3cf
[6/7] mtd: spi-nor: add generic flash driver
      https://git.kernel.org/mtd/c/773bbe104497
[7/7] mtd: spi-nor: sysfs: print JEDEC ID for generic flash driver
      https://git.kernel.org/mtd/c/0a92de16b61b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
