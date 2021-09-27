Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9C0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 14:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92C36054E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 14:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B92C36054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TETpCTb6ZdNIINkKGeRqB+yC/R85CEEijxVMMLR2x04=; b=dQs6I/EwbZIqce
	HcuSd6Fg2wBGUoz06ne+CU+XTt5pfDlhoXe9n7avuwFu45SAPtOFZesovlTkoqHNUH6p50fP9X2YV
	B6Rc7BmR51LyPAy+I3yT+yIVxuTdDZg/zPdDoLS2ViAiY8+xaIcdCzKEodbD6sHzdULgETl11qUNh
	Ey2vQBe6NY1YD27BUe0R3beW+TkxuUruu6RH65TUCPt0hetqKKB1ZNco14jSwf5t0Wl2txKdRmjV6
	BpYYTsUvS90T0ldCPAKtW3oyHdPJFldYFKHi2aOtPZy/9RtVkT45KMBptgj9U+xHsnlLCq4Em95nI
	aoeXPavFXMzVrrZcHNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUrLK-002rPd-0V; Mon, 27 Sep 2021 14:10:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUrLG-002rP0-Ng
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 14:10:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DEA760F94;
 Mon, 27 Sep 2021 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632751850;
 bh=i+bavvwQSsZR/U2SSCUdxSOShS7k+cqLTQgJdlk5IC8=;
 h=From:To:Cc:Subject:Date:From;
 b=o/pHsBWfcf3iVLu+gS9z4G9+dsiEq3G89a8BmNR1uDI5utMJLc3P+zqcY2f8K80Ga
 222m135Pjl2LSUsQE8wBNHS2Mu9Qm7UKwkKhl5g+TmAlF0QsRjwsAOl/9L8bp83fc4
 YPTstuBjtKWe7l7wnAeztelZ9JrCK2sIFeWl6/NygMTukNT4Oan0SnD0fosC0uAWn4
 vms4GHpHJj3lbF1u+rurpBhgFZxTW/5kzcDLCL0jQwEi7+1sBYhR+Swo+TpfhBa0JI
 C7AxpPH96ijl0WVt6Cxz0+nOBp7/vfv4//itZ53thmYOptaMn02kAgdKbBxZ7GpkQO
 WO/tHMDlJCZxg==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Arnd Bergmann <arnd@arndb.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC] mtd: fixup CFI on ixp4xx
Date: Mon, 27 Sep 2021 16:10:37 +0200
Message-Id: <20210927141045.1597593-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_071050_821231_20F074D8 
X-CRM114-Status: GOOD (  13.27  )
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

From: Arnd Bergmann <arnd@arndb.de>

drivers/mtd/maps/ixp4xx.c requires MTD_CFI_BE_BYTE_SWAP to be set
in order to compile.

drivers/mtd/maps/ixp4xx.c:57:4: error: #error CONFIG_MTD_CFI_BE_BYTE_SWAP required

This patch avoids the #error output by enforcing the policy in
Kconfig. Not sure if this is the right approach, but it helps doing
randconfig builds.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Any other ideas for how to address it?
---
 drivers/mtd/chips/Kconfig | 2 ++
 drivers/mtd/maps/Kconfig  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index aef14990e5f7..19726ebd973d 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -55,12 +55,14 @@ choice
 	  LITTLE_ENDIAN_BYTE, if the bytes are reversed.
 
 config MTD_CFI_NOSWAP
+	depends on !ARCH_IXP4XX || CPU_BIG_ENDIAN
 	bool "NO"
 
 config MTD_CFI_BE_BYTE_SWAP
 	bool "BIG_ENDIAN_BYTE"
 
 config MTD_CFI_LE_BYTE_SWAP
+	depends on !ARCH_IXP4XX
 	bool "LITTLE_ENDIAN_BYTE"
 
 endchoice
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index aaa164b977fe..4945caa88345 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -302,7 +302,7 @@ config MTD_DC21285
 
 config MTD_IXP4XX
 	tristate "CFI Flash device mapped on Intel IXP4xx based systems"
-	depends on MTD_CFI && MTD_COMPLEX_MAPPINGS && ARCH_IXP4XX
+	depends on MTD_CFI && MTD_COMPLEX_MAPPINGS && ARCH_IXP4XX && MTD_CFI_ADV_OPTIONS
 	help
 	  This enables MTD access to flash devices on platforms based
 	  on Intel's IXP4xx family of network processors such as the
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
