Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E04C83F03
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppHwHGO27t8sX7qZgeQOBK/KS2SrGk+BPNIS+8CElok=; b=VGhNPIFZ8NE5IK
	/6swU64AUxd7H6KI6ZmmMdXSLCIxXlpsmidw3no8R02WNQHdR7GtoE5vK5F555pKiqfEDNBr3jMUg
	TgoBsoMRke6XMBvOt0DV59Dw5pTfevixRo7+zvzmdvY8pymIdPs9PG172fjLU2zRzQcGBZgBq3QYb
	XYOIWlGAr+o+BuWVYaCFGbfgmUwxW03MXj+woJV+fU3lXCIJ69yPcoEVFQAMTyNv5KLVBztdxnAqG
	yPQJFQykeLtBNXKblrKKwt7dPszma0ZZcwztWd4jqYw8UsqutXSkP/P/YY3fzCW6wCN4Bm7n1J8HE
	C4f5JZ1T9Sxh4Z0DVttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzT-0000000CTEd-3hlz;
	Thu, 03 Jul 2025 20:57:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLY0-0000000Blhf-2yS3
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 15:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB4B75C58B6;
	Thu,  3 Jul 2025 15:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F9C4CEE3;
	Thu,  3 Jul 2025 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751555303;
	bh=Gb914pc7tsoCoXqiZnvsCRpUXUTAG302g/C/bqi52gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TgHB/A2jJ95+PyjWVexyghrisZx/+KIm3popnDjXIuedv/S7mYBFEi1rPNHklq/jZ
	 OYPyLyTcQS4L1PDRdN9iEVkLRhU1D5TdnkWwR/SOuKloYIW9trutx91CQXkb9VVYLg
	 D1M72Iz5RTYNPE58xveByR6e86Zkw4Mmg6DLViWfqdVR3q6QyR+Om0/b1Js7k4BWPW
	 Trt1h2+Ik5JK8geQfanZ1jkvPL3AWzNMLk/YV3vFeKxXku8SGAgrE8+mKobDZEUasa
	 ZRp3S9TMRWjzmqxlVfOS4Urv4vW7nEC1UQsWDMSI6ZVHzUq5oIA4X3pXMdLClX8tSX
	 BGa+eiHqw3tJQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org (open list:SPI NOR
 SUBSYSTEM),  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
Date: Thu, 03 Jul 2025 17:08:20 +0200
Message-ID: <mafs0frfd1fdn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_080824_787837_0F09FC22 
X-CRM114-Status: UNSURE (   6.33  )
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

On Fri, May 23 2025, Frank Li wrote:

> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
