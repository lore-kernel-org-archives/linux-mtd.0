Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ABCC54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooYbOU6sci54an7y7mCzPXVAptEKTLhCmiPlEHLgerk=; b=4MYB+t/Zy1qYPh
	79p34eifa0F25GFTB0Jo+AvZat2Ggzsr6Gn/if6qFRogOU7thMBlA8qWKN55R0bIdeRAIEnMxAzHs
	90VtkiNMru79XfoR0N0r7tfCHt6LnkDC570LFlg1sKqw4bJfciHM32JlzjKjNaS38HmsKKUGu3eo1
	HiB5YNdN416Xm4b1ukZcaY5GsfldwDX3ADXyp3TVCdBiO5lgeneguq8b7ihBV9CmG4NiaU7sX+4di
	lEmmtacWhPg36Tb3rJcUVf18+3DnhuV1qPIaWCjB1SCTT/yhq3nJlw65RIOQ1DiT0S0RTx+zGiVOu
	fbTDMaodZcwScKARTR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxIt-0000000BAvz-38RP;
	Tue, 27 May 2025 16:37:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxIr-0000000BAvs-2Fgx
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 16:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 219D360EDF;
	Tue, 27 May 2025 16:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B20C4CEE9;
	Tue, 27 May 2025 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363842;
	bh=bOuwqNCVws+ynkEwst3pfMvVLelT9YmokuqZVv4qnC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZOLyXHVNe7Tbtaz55OQCEdyvibnEMG0/4WwTQrXZMPKrkLQS/I0TRpuiiAN2yHRRb
	 cRFETqTR11Vlvkge/O1pHjYhTFtv5sLDyBL3iHTMCIgKtSmXSDO6vckiG+t6vQRfdT
	 OlZ86Ioa1zCqr/WGKgjarxB2VI8ZDDG/0Ho3EU86hgM914QOspPlsc70wOW8lg9hx4
	 vSHUYRDNgVX2B1NHZX0MHO7qx+WRhQsDCKmj5g/gOsDfWociaro4bHbooftnJBeZF+
	 9hWY4jtNdyY0s8Pbk2TtTRHYP8q6jMg5NIZXhoKC49SRlSkFocIxm1qqam/Bw73d71
	 Si8jxWBp7LUyQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Ssunk <ssunkkan@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  hhlee@google.com,  roccochen@google.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Add support for XM25LU64C
In-Reply-To: <20250526121148.9417-1-ssunkkan@gmail.com>
References: <20250526121148.9417-1-ssunkkan@gmail.com>
Date: Tue, 27 May 2025 18:37:20 +0200
Message-ID: <mafs0ecwarovz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Mon, May 26 2025, Ssunk wrote:

> From: Kankan Sun <ssunkkan@gmail.com>
>
> The device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp.
> and found on some routers from Chinese manufactures.
> We need to add this chip to google's AVL
> The data sheet can be found here:
> https://www.xmcwh.com/uploads/954/XM25LU64C%20_%20Ver1.4.pdf

Please read [0] for patch requirements.

Also, does the flash support SFDP? In that case, you shouldn't need an
entry for it at all and let the generic SFDP-based driver drive the
flash instead. Can you try using the flash without add its entry and
check if it works?

[0] https://docs.kernel.org/driver-api/mtd/spi-nor.html

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
