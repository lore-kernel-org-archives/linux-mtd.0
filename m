Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A0ACF65DB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rp78BNcSIOzHuTUtdus/lPSVlXBR1W4ccI2Hsb7eOIE=; b=bt7qR0HMEJgQAy
	G2bB72psCb0djyas066PRtQ8TcmF07DcXfa8UMpBvuCU0iV/kOTH8kKpoxpw/YdUWOIueEkTy4rHz
	4NAaI8vz24otqJoOUJisR37JX6EzBlYIpczUZrUI2536vq4WYuQ0prU8H3pkvrxNO56dCJ6s4HIkV
	wa+L4F52l0M2EzlrhZjGvWEZhG1m0ioJnpD8OBFsn9tIJRaDjx7wkIMVaD4WQiNG7NGIm8/N0gtTD
	4CBUEVuJoXra1z4R0MLtXCOm+srZM7fzLsY+5H8rAMKMjEaSZ21XZ9GBTxMVqqqgAiIw1p/IeVbIe
	g/6bQnwy+4C+Z3zj0Jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL36-0000000CRgI-3F1Q;
	Mon, 26 Jan 2026 11:46:28 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL30-0000000CR8C-1Uk6
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 11:46:26 +0000
X-QQ-mid: zesmtpgz1t1769427929t1c42b85a
X-QQ-Originating-IP: Rfa6DbbZm+1vuZAT/eJ6XIX9TSNim9BfhYRpLc/O2Js=
Received: from [127.0.1.1] ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 19:45:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6064080622083273045
EX-QQ-RecipientCnt: 10
From: Junhao Xie <bigfoot@radxa.com>
Subject: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Date: Mon, 26 Jan 2026 19:44:50 +0800
Message-Id: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMTQ6DIBBGr2Jm3WkGag105T0aFwhjZaE00BAbw
 92L7rt838/bIXH0nODR7BA5++TDWkFeGrCzWV+M3lUGSbIjITtMdsH0CdHUKksk00431kSjUlB
 P78iT307hc6g8+2P8Pf1ZHOlfVRZIqJwZ3V23TivbR+M2c7VhgaGU8gNAyoWXrAAAAA==
X-Change-ID: 20260126-scm-storage-v2-0a4f3e900b88
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>, 
 Junhao Xie <bigfoot@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769427927; l=2625;
 i=bigfoot@radxa.com; s=20251219; h=from:subject:message-id;
 bh=Ujl9YS0+fZ7IiZ9W7k222CK/XsTemUSZY78aIMY8+Tw=;
 b=eTaCv1zhLOp9/ViZssM8iZQ0NAXPcsbDsYt3CfvHBkhprUeu6zrvnS0FBXELUgVSno2YpGVCQ
 VsauMzQYCK1CVz1X4SgsZWExaspZy+rQlsWszN+lGw6mFHLIydjMBEJ
X-Developer-Key: i=bigfoot@radxa.com; a=ed25519;
 pk=aP5LX0jneuAa4pTVEww/6IbMlyp5VzzCwzcbMt1cpeI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NVi1raGH3MCScA7tli4eeDVw+6YKUdFdzzZQG+JoU8clDXJCADv2jo/x
	Ld+St6/jDBZzBrXT9qO+l11X+JAkK3BQOdyBnSi0O31YDYVwh85IuN70944uICLarikrgYU
	hbv7+GRHGCrvyitIc9Vs4+L79TpjdjtY6WjhB6JJgbLWjHO++OhZUW4L8r2S4O9p842JfnM
	/Qe+oyZMPvKCG8yEt16NWI0gcJAxmsKx2ebyQ9GnXSaW4H2+BwcsF9+5Klfs2HzjDxv009z
	5qgTcsrehcwjxkC5F63bMZSqi9Gtq5UKVdCwxSjyVT7DhpsPSFpUI6KS2RZCI5tYKa8WTqu
	CuX5umbDlWy2bkZeh/l17V60tuozUnpc9m3UE/jK4LzcmKtT3iMSimQMCxdTHeDg15ROJ77
	sz5eBnbgtYvcO2q1WOg713eFvg0DlIMt0shiKCIrsxCc2rNddxFcg2PQ0je5DZ7++yuUpsq
	eUrplPBbMp0+IwvqaOkTS2bSDGbroYacl4Oj7nj6GZfjqy8QOnMNZnA4KEeopLUzX6DjWJb
	NJD2oYS8go/tDe1XbvHUp6+NUAVwWHV/dfIU0nNJ0DVIy2rhuKBXzjM+HF0frrYUOJxANjc
	d1TdfXi9GpvlmCKvyJcbrR/THkP6o52lNOopsEmZGqlgRNphFRxrRM1ByUSZJF6LM3JRLuN
	UQb7eYZO3mZUwIP2WzTp6XLz4R1+MbjjxvwFLMYyXfKb2PSI5/1M0LdltfpZsUehRTs8+Ya
	iB6ynLnnGz463GCGIIwvNWVpZ1K3ooDGuHDiTtX7rGvYhkR53un6z3f2TQROFjC+MKz5uU/
	4CaqzUu3EztVEDyFogOaO1VvbtzuaMc199Z3HYce/gnwuBLwARKva7qOJRRxRLt8IHB6DHx
	xtDSZLJPaOswgRlPUYO0EAam20X6ToBfYsUPTMhaSqR0MKYKvf9zeIrx403AeWjkI7ZoTW/
	XYM6yRzfLd/eJnU1Ge/WC+Ox4EShWYojFCL6gLAWr9U+n+BuDcVGey0hUl1qZje6uKGD66p
	7eV8CNEp+2p3FmGu0SaoUAoc5WL5x/AmIQ1GOtzS3XgvESwzjX43Icj3HnB/GmZHpKK8KE8
	tof0/b8Ee9lV4q15S/AlW16RTgXk8tB6U6ims3O8b98U1K1JTkAIVt9D7yejCp745HcG+WU
	SAnS
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034622_976766_7CE3E56F 
X-CRM114-Status: GOOD (  13.20  )
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

This patch series adds support for accessing storage devices managed by
Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
introducing a new MTD driver.

On some Qualcomm platforms, firmware or BIOS-related storage (typically
SPI NOR flash) is not directly accessible from the non-secure world.
All read, write, and erase operations must be performed through SCM
interfaces provided by the secure firmware. As a result, existing MTD
SPI NOR drivers cannot be used directly on these systems.

This series introduces a new MTD device driver that exposes such
firmware-managed storage as a standard MTD device in the Linux kernel.
The driver is built on top of the existing Qualcomm SCM infrastructure
and integrates with the MTD subsystem to provide a uniform interface to
userspace.

This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.

Note that this platform previously used the standard Qualcomm Linux
firmware, which allowed direct access to the QSPI controller without
needing this driver. However, we plan to migrate to a Windows-compatible
firmware which is more feature-complete but restricts direct access.
Device tree changes for this transition will be sent separately.

If kernel boots with EL2, access to the SCM storage will be denied. This
needs more investigation.

Changes in v2:
- Convert enum qcom_scm_storage_result to macro definitions
- Use __qcom_scm_is_call_available() instead of a machine allowlist
- Add missing __packed annotations and endianness handling
- Introduce struct qcom_scm_storage_payload to improve readability
- Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/

Tested-by: Xilin Wu <sophon@radxa.com>
Signed-off-by: Junhao Xie <bigfoot@radxa.com>
---
Junhao Xie (2):
      firmware: qcom: scm: Add SCM storage interface support
      mtd: devices: Add Qualcomm SCM storage driver

 drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 drivers/mtd/devices/Kconfig            |  17 +++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  34 +++++
 6 files changed, 481 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260126-scm-storage-v2-0a4f3e900b88

Best regards,
-- 
Junhao Xie <bigfoot@radxa.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
