Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F71C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ii5KDU24sMYlm4HNj2usVXgBv4OJw94MJhchUMa9vCI=; b=4t+aHOtgxVUHZO
	XScybiZBETQSOmiXGZpNCPLzgG/0sMxGeImI4uK4Hz2lEXGbj1MqSFmO6PyyoPtOeMHOlBwrAqkOM
	Yf75PVDY/AjrhqYK3BouLhphqE4TTC7S/i+gBfGO/jJ+Igw5i7F3VDuFsakc4MTKUcl2eavZc2QsL
	+9ko2B/kHVsD10tjRqgXvzJQ00JU8v2oUvyvmaCp9CrceBfxXSqpXJu8KV0zb/Y/zvlJzM2OVSA9f
	6Q8ofMT1gSX8GZv8qlPh8g45Zfw+SO3LQdIYPb7ZsbwxgINuMc4OAm2rXtSrxEf9GTZQcUX3Igizs
	POyGuq3g3gPHTibly3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSUt-0000000B3lY-41qt;
	Wed, 13 Mar 2024 17:34:35 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSUq-0000000B3jp-4ARD
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 17:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710351273; x=1741887273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zZwi6ket5Bp0OVnwD8MWhyraFkgffX6f1oCYLK4Dq+Y=;
  b=a6PNaMSBiy8FumhaY6crV7fUzPphnToHl49UhI9AGFt5TxngP/RPFQCj
   7TqTZlzUvMYUb/cdnMPDOrREAaHpSZCyzgEU5QM3P4tV/rO9WJHROvz5s
   boQE6mmH3fusWiouINMfiWNOp0aETlGjEPYLOvGtyhYTu415badlGH0lb
   O02PKATwllwaxbBbOwvWRVRKjheqWlfwKiaZR9fxR0WLRVa+0/Be2F4ym
   Q5lVbN9YDhuf34KUeUKvi6Da0k1k0EiitIgZSuyxYXqqWhSoBzk9eDXvs
   WxQJSWx+Moms/b748rI4X5r1+tm1uIl6RA9a+P6QZTFQj146/NRe3jBCD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15772874"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="15772874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="35132852"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:30 -0700
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: [PATCH v2 0/2] mtd: core: Handle unsupported OTP operations
Date: Wed, 13 Mar 2024 19:34:23 +0200
Message-ID: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_103433_087597_31AC11D0 
X-CRM114-Status: UNSURE (   7.45  )
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

Make MTD core tolerate SPI controllers without OTP support.

These changes address the issue that occurs when an OTP capable
SPI NOR device is initialized with the Intel SPI controller. The limited
supported opcode set of the SPI controller leads to failure in the OTP
initialization, which in turn fails the probe for the MTD device. By
allowing the MTD core to tolerate unsupported OTP, the rest of the MTD
functionality remains intact even if OTP initialization is unsupported.

v2 changes:
 - Move handling of -EOPNOTSUPP to mtd_otp_nvmem_add()
 - Omit error message if -EOPNOTSUPP is returned 

Aapo Vienamo (2):
  mtd: core: Report error if first mtd_otp_size() call fails in
    mtd_otp_nvmem_add()
  mtd: core: Don't fail mtd_otp_nvmem_add() if OTP is unsupported

 drivers/mtd/mtdcore.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
