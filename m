Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B1CD6E2CC
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3WDNs4XhFnobOmtBrJ8kqWtHulcDfQA+DusUXeRXfOo=; b=fw1SZwv0APo/V1
	cmb2wVNtpMjaUXa0gcgV4K4cngBaYSwgtAWJYmqZR5HDegJeQ4wVZNqK9cfV1AetIGYn3eroOZ1Io
	HUlfDWMEz2VxqFwhYH62UQsxTe49eArtB5Fz2cDdQU9ZTKFndc+m2NR1rL2rigEq4PL8PFtmvVi0I
	yBcpCQtNRqAVKg5rPkNkBjwzYy3KDTHzenE8wS09sLmz6bC0CLaZAR+6yD3YLjo3MlywA65ZcsPDy
	4JOFuQ+CtX7og3z7ans7+0u89VFQfChmkxktysCx1DMoxP6y7g/ms8HR5OKKThm6YZxnGOda+eWqk
	pChyrzTtga8W3U6Z4egg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIMH-00000008yIf-3MlA;
	Thu, 18 Dec 2025 18:04:13 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIME-00000008yEX-1ZHE
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 18:04:12 +0000
X-QQ-mid: esmtpgz12t1766080953tbad004b4
X-QQ-Originating-IP: +O1L5rXCWWMLoSbBIVXoSE9cR0f/TEAYnQ+FkVGsghc=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10289529294355736162
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: devices: Qualcomm SCM storage support
Date: Fri, 19 Dec 2025 02:02:03 +0800
Message-ID: <F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NHHBtKpbeb7pMR6RXFtwgR7qFOZ0dHqj9kLkchEjyyZAerQ6bN/h3fvy
	f6tewiZb8JgO9O8tbPNTMMvvBYdR6R/ihF9er1UFoivPMmfyjEFBX5UUyoZGT4J34nEyboB
	xXDcN+KffRqI3ltwsI4XiCiTUL6hkcTBFPx4YZL9nDLy+9tHXunk9U9Z50SihNq0kmwBmKb
	m021pClo+zeUibsMn8p5MRIILY3CRmke4ViV7zjoLtpk5/taP6OzrSL4QTJRFJHTkA8QQp0
	DZ/QZHufHhj041lzLh3Z2w07pjMTwyD57jmoucXZLAFaJ2tjvHCmo6IkZCxJANvju88UBWg
	i6SWZg9e5w5D2mDFiFK6WNFaOkcGkMWPb69rlkiaUSKmmRWr+++D++BiqiSLrtBcEkaEEwq
	xx+OsAMaw2r21Yr8dr4ist50BD24eMKXXvLNXzhu2SBQOQaYcnOw/ZOe5Ua4TmBK2cMwGyJ
	u7KVFqXmmmOpg/0fCgg/JLHA3FYVUays1Z9KSH8xGT1jnY/W2IfdujS3qP0g7bXQqu/GO9g
	v5n4OagS9DBM98A3YeEXtV+xMr5xL+G1WB0wifYm/iN6RiZVmgQHkb05wD3hqi46VP2SdRT
	1sOln8yXkXuoY2mCJVOg+NALZVs9qgpxWjrvBAGYmENCO5Gcu7hcXZkkJVGRIaz2zhVp76e
	6/ZiVtyrjphIgc5JU+eeRybnIzw0YaemFaiOvMeVEjW94xyh2QlJDs/f+Umb+nsU2QNyYfp
	H8elC2IG8cD+tR+zjXZecaO5FnO7Oiwux2hmuQJGSQFqgoPgWoj5l17kfmMEbB+UDlM3a0M
	FyKAK4h08iaw87DG66xu8ADBcjK9jeZ2evKBRlYE2q8W9YRItmlismaj0EmqTDce82ivELk
	q7BQM4721nhAigZqVQQbE2Yj5VVgykPkFUcn9r3e7+/bdado0ZXEFzkJ82Kyr9PNhP78M8X
	3nGDHebBFbZZy8UDilHtzFWBrau27/ZCZcRIRQc8YqBIFcTFebljNJLAu
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_100410_790429_1C290762 
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

Note that this platform previously used the standard Qualcomm Linux firmware,
which allowed direct access to the QSPI controller without needing this
driver. However, we plan to migrate to a Windows-compatible firmware which
is more feature-complete but restricts direct access. Device tree changes
for this transition will be sent separately.

Junhao Xie (2):
  firmware: qcom: scm: Add SCM storage interface support
  mtd: devices: Add Qualcomm SCM storage driver

 drivers/firmware/qcom/qcom_scm.c       | 183 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 drivers/mtd/devices/Kconfig            |  17 ++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 256 +++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  47 +++++
 6 files changed, 507 insertions(+)
 create mode 100644 drivers/mtd/devices/qcom_scm_storage.c

-- 
2.51.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
