Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4DDC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 12:16:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E65B205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 12:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJoGw6kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E65B205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6uGHZvWs8xeVg3xkvFC7Q6iDuuytJdZjssTj+konEMc=; b=ZJo
	Gw6kpJPMTYKpIqIA7gtmes+IFVk3HIw3qSiCBQ1raiEoiK+Mw+i+SYGqiSBbM/wzb8MRL51n3cPUe
	crFwviBp+yhdY6etko/AyN6w90tgy2Scl44GOxvj0Q8E76JKSW55tbCYPiWn+h8SSFpMffrDTXKkZ
	1aE5thDfvcMzrJ0PG+jcnca+qOKWpLVTHHM+tEIDAD29Po/gySsFxCDUTXcZHyq/YCEkIb5sLLrOM
	y5o9KElVPHM5kMbhUowb35hmSb9WB/Ur0Uj8DE8nx2Xh8LEbjj9ZCE0bAVIHH7WVfTo4yqEaAmM+g
	mTAS38Zysu70ZHG+o1Ggd0/xPcwZYZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNz16-0001ht-K7; Tue, 07 May 2019 12:16:16 +0000
Received: from inva020.nxp.com ([92.121.34.13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNz0x-0001ZI-SB
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 12:16:10 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 048E51A008F;
 Tue,  7 May 2019 14:16:06 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3533B1A0296;
 Tue,  7 May 2019 14:16:03 +0200 (CEST)
Received: from nxp.com (lsv03080.swis.in-blr01.nxp.com [92.120.146.77])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 74BA8402C7;
 Tue,  7 May 2019 20:15:59 +0800 (SGT)
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: defconfig: Changes because of 'make
 savedefconfig' command
Date: Tue,  7 May 2019 17:45:53 +0530
Message-Id: <1557231354-11758-1-git-send-email-jagdish.gediya@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_051608_182673_91D9C6DB 
X-CRM114-Status: UNSURE (   4.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: leoyang.li@nxp.com, Jagdish Gediya <jagdish.gediya@nxp.com>,
 prabhakar.kushwaha@nxp.com, bbrezillon@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
---
Change since v2:
 Split the defconfig changes between,
 1. Changes as a result of 'make savedefconfig' command
 2. Enablement of actually needed configs

 arch/arm64/configs/defconfig | 63 ++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c8432e2..aff014e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,15 +45,6 @@ CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_STRATIX10=y
@@ -67,25 +58,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_XGENE=y
 CONFIG_ARCH_ZX=y
 CONFIG_ARCH_ZYNQMP=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_IOV=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_ACPI=y
-CONFIG_PCI_AARDVARK=y
-CONFIG_PCI_TEGRA=y
-CONFIG_PCIE_RCAR=y
-CONFIG_PCI_HOST_GENERIC=y
-CONFIG_PCI_XGENE=y
-CONFIG_PCI_HOST_THUNDER_PEM=y
-CONFIG_PCI_HOST_THUNDER_ECAM=y
-CONFIG_PCIE_ROCKCHIP_HOST=m
-CONFIG_PCI_LAYERSCAPE=y
-CONFIG_PCI_HISI=y
-CONFIG_PCIE_QCOM=y
-CONFIG_PCIE_ARMADA_8K=y
-CONFIG_PCIE_KIRIN=y
-CONFIG_PCIE_HISI_STB=y
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_NUMA=y
@@ -193,6 +165,25 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_IOV=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_ACPI=y
+CONFIG_PCI_AARDVARK=y
+CONFIG_PCI_TEGRA=y
+CONFIG_PCIE_RCAR=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_PCI_XGENE=y
+CONFIG_PCI_HOST_THUNDER_PEM=y
+CONFIG_PCI_HOST_THUNDER_ECAM=y
+CONFIG_PCIE_ROCKCHIP_HOST=m
+CONFIG_PCI_LAYERSCAPE=y
+CONFIG_PCI_HISI=y
+CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_ARMADA_8K=y
+CONFIG_PCIE_KIRIN=y
+CONFIG_PCIE_HISI_STB=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
@@ -374,7 +365,6 @@ CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_SDM845=y
-CONFIG_PINCTRL_MTK_MOORE=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
 CONFIG_GPIO_PL061=y
@@ -502,19 +492,19 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
+CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_AK4613=m
-CONFIG_SND_SIMPLE_CARD=m
-CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_TAS571X=m
+CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_I2C_HID=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
@@ -656,6 +646,15 @@ CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
+CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774C0=y
+CONFIG_ARCH_R8A7795=y
+CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77965=y
+CONFIG_ARCH_R8A77970=y
+CONFIG_ARCH_R8A77980=y
+CONFIG_ARCH_R8A77990=y
+CONFIG_ARCH_R8A77995=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
