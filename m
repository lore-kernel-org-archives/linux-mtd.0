Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B172C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fS/pwaUoCOf2roiJUSuQZjNQa7SU+WzKTIbFfqvA3g=; b=v06BGiyRZg8Ple
	3Lylb5iiTdq4XJYPmd/lCVXHInzLEblR0XoQdD7KE55RFCDzKjJ2HIovN6tql6ETLSHHqwrqiRGwA
	se0Qc6t+Z0+4gy+VOg6/LO7gKil5BZP3jKNkrAaWFnqfbsaR8vEqTbmxFB3H1Jssb5cJaDq/cbuQ5
	rkG1ebrAS3ANwJ/IunOCt2mKNmZc9tJRor/v9i3rk1xIDPNnSzzUAd1Usg5kWHz0OFWLvtyLE/B7J
	ChBPzoNJTgCj8mjkHckcfs5MLHj/5EgCw/EmatFDuuyp5lNYoyK6VKhD5/4qQO4cCxnQW+x3P0vM/
	VNWCJspfCDT09Y9qK/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73p-00E33H-4o; Mon, 21 Nov 2022 13:42:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73j-00E30k-7t
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 13:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669038124; x=1700574124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WA/TZriNXCVpyXKJ9P6CH+4zm9j1q1ICmB+nOCyp11w=;
  b=mnnBNi9TLJpHnJHoXJpQypJpoEv/nom3Z0SFGMscRoUqQB7nCzty9bBx
   +6SFe9BZ62R0DNU04eXlXPyGMcK4G2zdj179mOeY/PT5mOlwDosvmatOd
   GWSGV72ZYsZaMgLUxbqekfroO3Duk2vykf/T0bd5xUxPprcWJeDwXepYf
   5Q+xXpu2ihdbHzOXA7r5fSJIglTnPVAWZmK5yyJLgKwYqj1nu4KKLcr4Y
   9ZMMa87cTZ/+T3Qv7t/Tts9qcky8YdQaojUgmgsLH5zW0A+P5Hpl7copo
   ZBDVdK2AJ9qokrC77v21BtW1gEyQkaGwo4QRQib83VDK0j3OoFsK8sP6Q
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184483608"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 06:41:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 06:41:52 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 06:41:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <stable@vger.kernel.org>, <p.yadav@ti.com>,
	<vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
Date: Mon, 21 Nov 2022 15:41:47 +0200
Message-ID: <166903807811.85501.2255834791206092904.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
References: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_054203_367569_675784F2 
X-CRM114-Status: UNSURE (   6.92  )
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

On Fri, 19 Nov 2021 09:14:12 +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Erase can be zeroed in spi_nor_parse_4bait() or
> spi_nor_init_non_uniform_erase_map(). In practice it happened with
> mt25qu256a, which supports 4K, 32K, 64K erases with 3b address commands,
> but only 4K and 64K erase with 4b address commands.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
      https://git.kernel.org/mtd/c/2ebc336be081

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
