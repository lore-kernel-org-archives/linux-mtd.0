Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48503D46BFA
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 20:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xz+8y+Pq4NP1tcCnblyOJ+kwbhFCZNRWWZhVOr1o/oY=; b=s+gtXJCHoLVxKL
	si1eZR8tsJCljtm6Y/GqIuV4hqJTYF6i7qbiIicvGuO1jElEGcuVTLooPhsjcYNi2xprhLpqq/8+n
	DVH428rHXQ875lT3EOX2BI5rE+2DoMoLHuH8sswMors+ycgVImqBZzeRK3w28WzraY2kG+f5tGYvq
	J5jz42tsEqbdfIn1nPEjbFTkskJuqmRqfGZ6PtDdArCImW2VzNyEr3T3f8iZGnKGiMbPSN83tX1Gu
	Ue6kFOafPHw2rCrgGbbsDabzkBQbSHgENRUN5SzA5I/kmBiI2CF+YMRaPseBReTklrQYR7uAmtvey
	q9IlpG4g98VEC9wFbfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCNA-0000000GnHV-1bbt;
	Wed, 28 Jan 2026 20:42:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCN6-0000000GnGV-0CYr
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 20:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33BDA407B3;
	Wed, 28 Jan 2026 20:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63082C4CEF1;
	Wed, 28 Jan 2026 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632959;
	bh=3SvQmj3H6Jb62dTRhDmtM8PEjbMjvKH4NPOreMNMOnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4cVWJAdwkPn3MOumzQcjyVqc9f+Voa1lOlBE5bNijfUC6kAqYiw8IkntWpXMttBP
	 ZadO3E5v6CR4XbO/O+Vub5iLzE8bnAN/fCONMg7nPcytgGdUW4sKN4VBAwz7JfU9DY
	 FunYnre0MmowpBfiSBE5yZUzHgCyuTuQy90ZyJmqcScuusftGYA7qBitdVvYob0Uyu
	 v+IuGU6iyRdA3jWoTpG1t6jmxqc7H8optEbKe+8+TDDa6ql+4AyB7N7gWLpIvvN3jb
	 28X2pdfWNXEMY6j0ezkjo3uUFWHvPBVQmDyE9cQ1Z6XpspyKFjXeFSqx11uBT1U9sn
	 mwZDY0bDyLgAQ==
Date: Wed, 28 Jan 2026 14:42:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Message-ID: <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_124242_002661_5D04A481 
X-CRM114-Status: GOOD (  30.95  )
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

On Mon, Jan 26, 2026 at 07:44:50PM +0800, Junhao Xie wrote:
> This patch series adds support for accessing storage devices managed by
> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
> introducing a new MTD driver.
> 
> On some Qualcomm platforms, firmware or BIOS-related storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world.
> All read, write, and erase operations must be performed through SCM
> interfaces provided by the secure firmware. As a result, existing MTD
> SPI NOR drivers cannot be used directly on these systems.
> 
> This series introduces a new MTD device driver that exposes such
> firmware-managed storage as a standard MTD device in the Linux kernel.
> The driver is built on top of the existing Qualcomm SCM infrastructure
> and integrates with the MTD subsystem to provide a uniform interface to
> userspace.
> 
> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
> 
> Note that this platform previously used the standard Qualcomm Linux
> firmware, which allowed direct access to the QSPI controller without
> needing this driver. However, we plan to migrate to a Windows-compatible
> firmware which is more feature-complete but restricts direct access.
> Device tree changes for this transition will be sent separately.
> 
> If kernel boots with EL2, access to the SCM storage will be denied. This
> needs more investigation.
> 

Sorry, I missed your reply to me on v1.


You replied that this allow your users to update "BIOS" firmware
directly from Linux, which I can see being more convenient than relying
on UEFI update capsules, in particular in a development environment.

The concern I have with this is that I don't think an end-user of such
system, has a way to recover from breaking the content on their SPI-NOR.

As such, exposing such a convenient interface for the end-user to brick
their devices is probably not a good idea.

I think we should somehow lock the interface down to be read-only by
default, and perhaps have some mechanism to unlock the write mode (like
a module parameter expecting the sentence "YES, I DO HAVE THE FIREHOSE
PROGRAMMER FOR THIS BOARD").


I don't believe you answered my question regarding how to access this
interface from the kernel. On many of these devices we can find the MAC
addresses of the system in the "DPP" partition. Do you have any ideas
about how we could access this from within the kernel?

Regards,
Bjorn

> Changes in v2:
> - Convert enum qcom_scm_storage_result to macro definitions
> - Use __qcom_scm_is_call_available() instead of a machine allowlist
> - Add missing __packed annotations and endianness handling
> - Introduce struct qcom_scm_storage_payload to improve readability
> - Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
> https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/
> 
> Tested-by: Xilin Wu <sophon@radxa.com>
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> ---
> Junhao Xie (2):
>       firmware: qcom: scm: Add SCM storage interface support
>       mtd: devices: Add Qualcomm SCM storage driver
> 
>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  drivers/mtd/devices/Kconfig            |  17 +++
>  drivers/mtd/devices/Makefile           |   1 +
>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>  6 files changed, 481 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260126-scm-storage-v2-0a4f3e900b88
> 
> Best regards,
> -- 
> Junhao Xie <bigfoot@radxa.com>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
