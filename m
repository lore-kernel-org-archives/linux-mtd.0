Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC96C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7CE20663
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="upLPO8Lh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ALHfeKbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7CE20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2NDIYORsZpcsrM0vNeZ1cRdBPTEKYHRi7PX7sjHdXTE=; b=upLPO8LhyrNONRX8bbLQl1KAv
	tTHEHMy+91IC0LbZd0aPmZzhklb4IMPqEJZosNUxuh1ElLcbZWsBRPbyYDsY8FYpMBGWlCW3ffLfA
	ynIwqetHLuK4NhCtJ9YnQg/XG0gc4DtqQFD4kJKJofBFPYG7XdBa6eGPrPb6meypcT0gokDjH6zmd
	4tOu6j0S0NrOOEl6LAmc0qZA34JU0by8YYMT2WfdKNoSa2wOX7P8mqalyWLyOuc2m5nbErIPONXFZ
	cYVRy/Fg+G+Pni5g5cdlNRm/G7kt6oVdj1YNsq0wh5LQMObfZ4PCcENYfQHEFlfZJL6t1A7+AVLuv
	2McY/G0mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02KR-0006Rv-4D; Mon, 27 Jul 2020 12:34:03 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02KM-0006Pz-JT
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 12:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595853238; x=1627389238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZQlZGNtosjkY1BTFF856UFpmZkCHqAhPaAMwvSuxaM=;
 b=ALHfeKbkordHVf5ew+ZpluUTrWj3DnNjDyorACA7wN3bwxdTEtebARDO
 Va7R4ze2xUpAdbwYI00+RVTSE1UjYY8N5knTqWCZUeUjkaYC0qSElyeUf
 uX3zy24OkCAZSzkRYdjCEo1dvh76XCt7nmz+n55xAsmuzTcT1Mn3VNfCh
 iOW/BIfCEnfvmRrhLybgWYLTInvCsHbsp5a/RwOo/Cpbe0xId59rHQEXI
 ffF7ZDaCF3n/QCs5ryACalS9lDNcCQDHR1rMT/mA6WMdI7SpICxDW458L
 3rbGrEDqKng+bORxrOIHx58YVh+WhtJ1PXBQpQYpYiVTyWVg2bT+M+ziE g==;
IronPort-SDR: FA8jFvW+fpnDsWy2BmShj3vdgj2KTnzFgF9zcDKJi8TTi9dPx+abSDW/160FVz5ZgPGughJHJl
 SNjc4BjzvCv2qi+hCpt65dgBEDGgLhgLuYefO0nSctBBJOoCgHCF/UNMDbnHHBEWtBa6FRdNq6
 HXnHtlRY7EQjbryYg73RMyQDV44CXmpOhaTwGNoto/r0AfkJ+X0opLLeHUWtMhzBc29e8ltjkv
 AlCrCEs1QPhdxwnwf7x2V/U4rXORtJ7oEnqJ7+WC3cA5SPqd8BZC21u6FHcxFi+PqYz7lWv9qQ
 JUw=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="81386719"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2020 05:33:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 05:33:11 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 05:33:09 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, Rayagonda Kokatanur
 <rayagonda.kokatanur@broadcom.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] drivers: mtd: spi-nor: update read capabilities
 for w25q64 and s25fl064k
Date: Mon, 27 Jul 2020 15:33:44 +0300
Message-ID: <159585278401.156466.6163208089372747874.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529071655.739-1-rayagonda.kokatanur@broadcom.com>
References: <20200529071655.739-1-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_083358_836942_F56702DA 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 12:46:55 +0530, Rayagonda Kokatanur wrote:
> Both w25q64 and s25fl064k nor flash support QUAD and DUAL read
> command, hence update the same in flash_info table.
> 
> This is tested on Broadcom Stingray SoC (bcm958742t).

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: update read capabilities for w25q64 and s25fl064k
      https://git.kernel.org/mtd/c/99eae48fd4c5

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
