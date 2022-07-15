Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353B4C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EQYnY/IVd4pTKgmq3QHOaaxR2JHmcG1VNAJIOZ5qwI=; b=nPa+m9+EqVCoBw
	9Rs/0V3iqjRLAWlPgibjYvr5d7RQBCEWxxzJUYm4U1jY2GGfYRDrNLrmlK3Z2FzA1v7AgG/IhiTJL
	npYeLUA9CChJrIPSYeXB4cwHp0+2w0xv1ZcJD3ImLtfqP/RDZLDR/0rwVVW9np7ZcJYpvEUXarz7U
	6yvfkW0MdIqB/dXpL3Moqjyb1wO8uLJQ1FhiAkWOpJwWPjWgDo9oz6gmji+sKIUn1nl67sKJWbHk6
	n6GOeiwF8bF4Cut3B1+BM5ulaO22pXRHWOifjtTE92KM1t7vSjPWTPe2nnjY53d6zVdmS2lf5RqXi
	EMY11bX1uM/vkSBZDeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKIT-006sGY-78; Fri, 15 Jul 2022 12:19:53 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKIP-006sDt-2z
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 12:19:50 +0000
X-IronPort-AV: E=Sophos;i="5.92,273,1650898800"; 
   d="scan'208";a="127988338"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jul 2022 21:19:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 81666429692B;
	Fri, 15 Jul 2022 21:19:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: michael@walle.cc
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	p.yadav@ti.com,
	quic_c_sbhanu@quicinc.com,
	richard@nod.at,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Date: Fri, 15 Jul 2022 13:19:34 +0100
Message-ID: <20220712072304.icesvrfmem5lgr6i@ti.com> (raw)
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510140232.3519184-2-michael@walle.cc>
References: <20220510140232.3519184-2-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_051949_258441_6E636C7C 
X-CRM114-Status: UNSURE (   6.59  )
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
Message-ID: <20220715121934.5ZgUHBT77rYsJx0CTx_IWZaI7IBPvFynsy-xSQS8fQY@z>

On 10/05/22 04:02PM, Michael Walle wrote:
> Up until now, flashes were defined by specifying the JEDEC ID, the
> sector size and the number of sectors. This can be read by parsing the
> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
> which just takes the JEDEC ID and implicitly set .parse_sfdp = true. All
> new flashes which have SFDP should use this macro.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Tested the macro with Renesas AT25QL128A serial nor flash. So,

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
