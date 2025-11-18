Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53568CED63B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlO15vjtxBRaJaeTXQQGBaU6W4Bn2Z09uzUGneenHcM=; b=174hLZXFwVnrUg
	yGQlrlBrCnv12AxAW5YHwEjhGeu2TjnDRE9ZzRDefoO/di6aWlQ5iBQttUYY60zG1+aRL5wRMWKue
	/PFvRv3e6/03Yw5zDz5F462cgBFWkeG3wnIfn1t0B5W9u0f6VroCDpQbBYxb9eTIg85EdCye0cL01
	s1coFyQEUo4xzcPhQirck8ubBbAaLH7oXi9utoKH2zdzRRwDtxi1wLP154xs2KXHEFWAQB83oXnah
	e2ZnnQ0U8cjImvrkybOizYHXKbEZnDN8eHCiUwqqjiOrVGh054lug6vcAIl8ha3NsxlNMraf+5gQy
	AOV80ogtXG54iDK4lvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKvQ-00000000QeQ-2yka;
	Tue, 18 Nov 2025 12:35:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKvO-00000000Qcm-0d3c
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 12:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8300437E8;
	Tue, 18 Nov 2025 12:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FD0C4CEF5;
	Tue, 18 Nov 2025 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763469305;
	bh=l8XQvMzxBJv2sM+3H+jof6z7a/FpO+c59Q8kSzXL/Z4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FGCNMGBhg1BBnhQX1+Wp4nJ86KmenvX/thVMsQ0uGa/Y9bZrQBf1iePShDk5E5meV
	 Za7r9npAYq5pA5N115s1sgRpH+B/BRdspykh2cE0rKtRQpAiSe6v0FcpLqc9QkjxqC
	 2KAy31O59ojoAMZRpzWocCBrH+xMEHxTILtvIxABabE5xQGdDcRe1PQrk9Pu9AlI2Y
	 WsW2Kos+gotzclxFkO0YrLP1nGbKSKQYrBFvMcNeW8Yjb/Rn8o6td+Pdcxzf1e5Azl
	 7kLMAoWYY53qbY3+rzOlNE4jWWevj3Zq3m7Vpn1Xt5v/T7r9O4NDuQc69mc0eQWl9Z
	 otPn/VE3nkGVg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Jakub Czapiga <czapiga@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Konrad Adamczyk <konrada@google.com>,
  Adeel Arshad <adeel.arshad@intel.com>,  Mika Westerberg
 <mika.westerberg@linux.intel.com>,  Kornel Duleba <korneld@google.com>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Check read CR support
In-Reply-To: <20250919181547.2172319-1-czapiga@google.com> (Jakub Czapiga's
	message of "Fri, 19 Sep 2025 18:15:47 +0000")
References: <20250919181547.2172319-1-czapiga@google.com>
Date: Tue, 18 Nov 2025 13:34:59 +0100
Message-ID: <mafs0v7j74iz0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_043510_210177_A717D70A 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, Sep 19 2025, Jakub Czapiga wrote:

> Some SPI controllers like Intel's one on the PCI bus do not support
> opcode 35h. This opcode is used to read the Configuration Register on
> SPI-NOR chips that have 16-bit Status Register configured regardless
> of the controller support for it. Adding a check call in the setup step
> allows disabling use of the 35h opcode and falling back to the manual
> Status Registers management.
>
> Before:
> openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
> ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = -1
> EOPNOTSUPP
>
> After:
> openat(AT_FDCWD, "/dev/mtd0", O_RDWR)   = 4
> ioctl(4, MIXER_WRITE(6) or MEMUNLOCK, {start=0, length=0x2000000}) = 0
> ioctl(4, MIXER_WRITE(5) or MEMLOCK, {start=0x1800000, length=0x800000}) = 0
>
> Suggested-by: Adeel Arshad <adeel.arshad@intel.com>
> Signed-off-by: Jakub Czapiga <czapiga@google.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to spi-nor/next. Thanks!

BTW, b4 complains that DKIM fails on your email. Please check.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
