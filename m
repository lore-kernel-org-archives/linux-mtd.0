Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704B6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7kiCRpmkxRwJI/Ec6pNcux4aiv+qe7D6sw8XMv24pU=; b=tVq5T0xFY9Q7aO
	x3Y+yArFg7fSGW+8jW2USQ+pk+WRT0sOJYT5bLfJV5aD8AOD9UO8S3C4fawQ4QC6opi6h/8dx4227
	4FvIDR8pMjqTnXyvAnqFu+AND/8qrUurfmXGkgFHzjiCk3xRlAnIk/CxVYMoD4PLJ32EmPgHNgBbF
	M1i131iw4tzwwmhiudLBFas+WsAMr5IcdBTzfqsm1ucGuxRGpaozTH2PwZ413c1CqP5Ig43t6iGvv
	koxmmtchcAy9e+gRYyZF541Q0yhUGOD1tL9kw+1U0da98+CTxzFQErE6fniag/P151bgypHdcrh1k
	5EbCMhEAU9x5nn+L8njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0OBh-00CoDA-9S; Thu, 23 Dec 2021 13:31:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0OBf-00CoCP-39
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 13:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640266275; x=1671802275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoDSXtV6rvarkWTyXxeMntGyoYZrqMPACoSb3VC2mL4=;
 b=DrlyF+iZ49nBT8UwFPicPRzrteZYhTYBbsA4zRJPBePnVBJjXntkVA5S
 ZF3WQvUzgTzZNz7IOPjvnt6/a2By0mLzwFnVn3MgzKm3x6pUPAhMIDfqd
 X/iI4vSG7xxHdjzjYXjbwNBzSQsUWq9GRjOTh+U2c4X4Ue872+R9F7JXd
 UBKlAzbYA3UmS4HPyw3L19oDs1nPQKO+/oDxi4UfJAqnyBZi+IzfuuVJJ
 vruKLGrGHWCFFE0Bw9qErWNRwWvU0U413zDiL86v1g0xXWngH/VtTlo75
 6G5qi7Z6zadYb4Idgbm1/jKoMIg/qSsfYVmHqDMI8w0Eebrk4rl/O+Cds A==;
IronPort-SDR: rB9GO1hyF7ANxWThvzaHFPXpcCJwHOmJl6R52U2hsKsWO8hEk7AftzCyrE+DgkMRm4tyVyuJEx
 e6llV6TsIiZNuPAB5+lDd3bLaFvslWR+qad5UbksDRIZ+aJARzN05oxrbH0DLvynjhjdH88LAi
 QoiQ4RF9pTmlg6D/liy9XjpV/y4s0ZwiPuQ3GICVAMjKINGTWL29f6pV4XokvhpwW+H2E+0kWT
 k8+73kEatNIBxFr8Y6AZgfZFIblT9kxPy15Wv8F1sXbsy0WvuRo0cLPO3thKpeFTzbZ1GZT2gx
 lCj1E/KvaIql3kLPzTgaRbjU
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="80492374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 06:31:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 06:31:12 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 23 Dec 2021 06:31:10 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>, "Richard
 Weinberger" <richard@nod.at>, <linux-spi@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: (subset) Re: [PATCH v2 0/6] Avoid odd length/address read/writes in
 8D-8D-8D mode.
Date: Thu, 23 Dec 2021 15:31:08 +0200
Message-ID: <164026605398.210110.7825546754254895590.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531181757.19458-1-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_053115_223929_9D7A696A 
X-CRM114-Status: UNSURE (   8.47  )
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

On Mon, 31 May 2021 23:47:51 +0530, Pratyush Yadav wrote:
> On Octal DTR flashes like Micron Xcella or Cypress S28 family, reads or
> writes cannot start at an odd address in 8D-8D-8D mode. Neither can they
> be odd bytes long. Upper layers like filesystems don't know what mode
> the flash is in, and hence don't know the read/write address or length
> limitations. They might issue reads or writes that leave the flash in an
> error state. In fact, using UBIFS on top of the flash was how I first
> noticed this problem.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/6] mtd: spi-nor: core: use 2 data bytes for template ops
      https://git.kernel.org/mtd/c/0d051a49829a
[2/6] mtd: spi-nor: spansion: write 2 bytes when disabling Octal DTR mode
      https://git.kernel.org/mtd/c/63017068a6d9
[3/6] mtd: spi-nor: micron-st: write 2 bytes when disabling Octal DTR mode
      https://git.kernel.org/mtd/c/9de3cb1cc95b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
