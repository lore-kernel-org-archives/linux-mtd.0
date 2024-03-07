Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8964AC54798
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qI13VlA3yKfQH3RXZKA71Kf4j5N9Xy1deux5yWjr688=; b=BLouyfbHMjqM/W
	p4vLZQt10x0qrb1FNSxMH4D0gVoDnZJ5btoHrFAvWMM1G2Sso6SQJQsn9wDKyY29Ov0TG4cyaL6qL
	Iev1qB1jqAvPn3BSUuh9bate2jPRhKFUcOoGb1muf5awhFf+5/rwx/FY2x+Iw3wX8ZUzHKqD1XNmG
	BjgyAo24rGthLjHO3sSDd0sAhB/Il2pn6Z9e/f6iX4zZjS41MJkvFA+rbXwsSjf/XljfVJaHbr+JJ
	Muu0gr7O7bd6GOaSCYby21sCdk8lwb8KRAP1/LtqwBRu1LvcQG/W8/8iaFsysPAPCnYAeceDYr7RI
	M9AEX5GIV0XusRNZb7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQN-00000004evL-3VhT;
	Thu, 07 Mar 2024 13:04:39 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQK-00000004eu3-13uh
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 13:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709816676; x=1741352676;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N+eRZXxN2eytANgfSbyduqZhkAXglYBQyinbb8Xem8k=;
  b=FlZCWdguUaPtJ466A+iCApWO+oXFI8yNh73KbSMyhwyGHEzJTjGaEMy/
   Jl8GKGVBhh0gS2++nnSnnsiSlI/+9LgRVMxHznTiD8xDsNOuj1R03WYsc
   5WTuXuTScAJ7DaHe77C7rkkhAznoc7L7Pnw+ftIW+IJS5WdLKxPCXoqP6
   j6ZbEObukMJvtHkHWGn8vJx5kuWJBgD9GayPK5f+V5XPaB5DxERWuKu/R
   0CE5ZKyftdxmuNN6l7OijJfu78T2WIksogKML9DfdOkdFhntzAikowNCX
   C3VDGszNnbXkO6y3GBOMe+UiDOF/PB3bmLyJtAqH9OWmb3o0FrqLGhpjL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5068049"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="5068049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="14592300"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:31 -0800
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: [PATCH 0/2] mtd: core: Handle unsupported OTP operations
Date: Thu,  7 Mar 2024 15:04:16 +0200
Message-ID: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_050436_371527_830E0DF0 
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

Make MTD core tolerate SPI controllers without OTP support and report
an error from MTD core if OTP initialization fails early.

These changes address the issue that occurs when an OTP capable
SPI NOR device is initialized with the Intel SPI controller. The limited
supported opcode set of the SPI controller leads to failure in the OTP
initialization, which in turn fails the probe for the MTD device. By
allowing the MTD core to tolerate unsupported OTP, the rest of the MTD
functionality remains intact even if OTP initialization is unsupported.

Aapo Vienamo (2):
  mtd: core: Report error if first mtd_otp_size() call fails in
    mtd_otp_nvmem_add()
  mtd: core: Don't fail mtd_device_parse_register() if OTP is
    unsupported

 drivers/mtd/mtdcore.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
