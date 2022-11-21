Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7F5C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TJW/1LhluXu0byRNZZRJcx4qpoCLlMKRMG0chV1DV8=; b=mVt4Rm8tCsqmO8
	9hZxC80VZesyVBkSctlzmH5ES+26LNCoofSEObby9+/n3XQBiktHTPKlv88YCnXjghGOnXwfsFAe6
	Y5N5fLaX6/9Pcn65tM1sJuwBsjUZeiZWEx0IF3bQtolKhViZLahYPVIisTM3iC+Lxke2HulPOPpiN
	oVHz90WlsGgy0m0+yTfKKQc/aCJp8EDdu29MWjmk6R2yGShQctJa5lzrZIIs1b5P42xie9HXeJjLC
	zV/2dvKheiBjoIGla6qdq4yRf1kkElw42ZPG3tv5Yysr0UaeUiEA4ndQLaQA5F2RR9HbzPCAmaMz8
	UUHiKn8QVkwVKh6NKI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8fq-00F9lN-Ab; Mon, 21 Nov 2022 15:25:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8SI-00F1qW-FO
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 15:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669043490; x=1700579490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLQDaKJTxRYcYn42c9ziV2g4j4CTk2Il5ri2fVpJBxs=;
  b=tbdRFIsWZm0bqZpv2EaBeKb2T7dICHEWA6DPBV2PiekvWCxDShaRTQUp
   XJOv0zfhbJqz/w0hbu4oleVMybk6NwjSMNz+Fm3CrAIoi3kE3EktTPOk8
   PFxh5eu+AKqdF/EWMxPdTrcXk64xKuaSq784kh+hfxOgbFu6dKbwKD5uJ
   0vZ08oWPDUAtjVNE2wXZSw25FX/CWgCsKXQZXshLNIhfyR5a8keRMafJh
   /EWWMH9RHMABiNnmAQ9WlGWur3CBzJ4vHylEPjpUcNRjIoKKAlyyhRpmV
   Cyxkmj3dZtsv9AytbiLCyIG7BDV4wPoBFBiw/Prtnf3OS679JPuvhKvDw
   w==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184495814"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 08:11:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 08:11:27 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 08:11:23 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <pratyush@kernel.org>,
	<michael@walle.cc>, <farbere@amazon.com>, <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <talel@amazon.com>,
	<shellykz@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
	<itamark@amazon.com>, <dkl@amazon.com>, <amitlavi@amazon.com>,
	<hanochu@amazon.com>
Subject: Re: [PATCH v3 1/1] mtd: spi-nor: micron-st: Enable locking for mt25qu256a
Date: Mon, 21 Nov 2022 17:11:22 +0200
Message-ID: <166904347234.110206.17589420162620604946.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020092058.33844-1-farbere@amazon.com>
References: <20221020092058.33844-1-farbere@amazon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_071130_616505_EA5FC468 
X-CRM114-Status: UNSURE (   6.80  )
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

On Thu, 20 Oct 2022 09:20:58 +0000, Eliav Farber wrote:
> mt25qu256a [1] uses the 4 bit Block Protection scheme and supports
> Top/Bottom protection via the BP and TB bits of the Status Register.
> BP3 is located in bit 6 of the Status Register.
> Tested on MT25QU256ABA8ESF-0SIT.
> 
> [1] https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: micron-st: Enable locking for mt25qu256a
      https://git.kernel.org/mtd/c/bcc0c61e6134

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
