Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF4C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLp36eHu5I4RDM4Km3Eid9CrLLDNEAd3XQMpJxeziUQ=; b=wHBaHXOmOWxUtV
	EkuE4dt9iKskkuYHsDz00sluD5L3NrNO7CEZI6BqqwhCeQQq9TpFKZf5bwBwz+P/3g115/5GtaRf8
	xccz2en8ZS+385cM7v1vSqtYM2xq0TmbXfD0s7FeA06W7YFxnF0qUPwU/vHzYftFbj5LdZBVMKBm9
	QEOzSAxhZkBnGaSwv3elsssA+HG1LA7ZMdbq21vBh1yaQ8zPGgBDjs2bZ/6sK4e/0xWhTpyMsz0qs
	xQJwERqhrMK6FZQRmk6fgJqvjKR69PObfKMXabZrB5hfrmKAzHs4hsg6nWJIibcc4mGpBISXMR/LA
	wTjWRPbCvJEvwAKfr8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi64-0066R4-Vu; Tue, 19 Jul 2022 07:56:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDi62-0066O4-1N
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658217406; x=1689753406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kPn+jVbdHDbOQa9qOPTliLwITlhniYkXD6SqjIgKME0=;
  b=fdLWrQQlMxa+RH2d7j+zYr+c9Z5vS3xVhNFUiyXcFGFYOBv4aN39bz/T
   h7NZRUXSFD1gduKbeii1NXLc/e+RVpJ0tcHUL81qhSguohq21/lfhiqad
   kmazDbXOnZKgonWYEL8nqDolRidW3Nc+6dpoeJt+77fYi37ZghOrGTU4W
   IYNyzPuB9SQr1D/80avqWfI1CEtXkzLO4D+/zKHr42ww7ILxp7Hb+j2vY
   hzB9+uKNiyK7ZOua62jFqXf1jN2huLItippnwlozIixXuRNvr/TD6dnOZ
   Uotj+zpaf9Pt6zWgWssFd1K80YceTAJ23/yrGcfB9crUSBH+GsUyQfZsv
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="165362018"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 00:56:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 00:56:42 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 00:56:39 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<linux-kernel@vger.kernel.org>, <richard@nod.at>, <michael@walle.cc>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org email
Date: Tue, 19 Jul 2022 10:56:37 +0300
Message-ID: <165821627887.113797.8074554472699520278.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718151243.1149442-1-p.yadav@ti.com>
References: <20220718151243.1149442-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_005646_161850_6083843D 
X-CRM114-Status: UNSURE (   4.76  )
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

On Mon, 18 Jul 2022 20:42:43 +0530, Pratyush Yadav wrote:
> Use the kernel.org email I have for reviewing patches.
> 
> 

Applied to spi-nor/next, thanks!

[1/1] MAINTAINERS: Use my kernel.org email
      https://git.kernel.org/mtd/c/92714596cdbe

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
