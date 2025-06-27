Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F13C7EE30
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jun 2025 02:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJV0eHZpVmxdD75IbvA2P/s34Ay+HgEP6GSBfWKZB0Y=; b=ruNxLEiCF0lQKw
	X3yJjNsCrD89kY3PWLE7QZtADJUpqh00J+DNLHvo9x/RVBPgcKUttzBlidO1i6G8JhSK9CzUlY5X9
	eHQTIdnfRod09wUtlg7KqJQsQZfzTY9AOJ1QxO+/jgc5HDmHWN6WuQjKdmA8vrK0/QjDisCYJZH++
	2ULC+WMVTahr4X/ebyqhvYy0ZKNhWNMLWnpu4RB17cxCsV8SKj97TVrqwua7S9Hr1KVgSi7YC1VMg
	BwN68dSJ4ps3wLsm55CSlBQxUfgNixbfrJjl3ESVM1fog+8asxTWgSvtRWCVK9hmGNSa1j+PKZoNZ
	IoR4opd2JiMUlgsOQ7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUz24-0000000DMyo-16hl;
	Fri, 27 Jun 2025 02:41:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUz21-0000000DMyU-2bgt
	for linux-mtd@lists.infradead.org;
	Fri, 27 Jun 2025 02:41:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBB94A52140;
	Fri, 27 Jun 2025 02:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5433AC4CEEB;
	Fri, 27 Jun 2025 02:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992096;
	bh=bjSC1GOvCkB3dcQCEkA48aQBF8HgMA07pqD3eC+Cjm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgDrLiefS/HPpb+VmjhqWsF1t3ouj5zOZkjYUHLP+B8J2HUb/gBySwAzVAc42xaKw
	 YyYUfVbsiQREy9qluLwAfs/5IbNOKQFCw9OiG/mRW3V6ixjSPvS+ARDiYfxUlHAxd5
	 AyE5/GuwZ9VvD+2/OfNjWd8gezTvHMvNSDYlw+MK8WcCq7C8+VRI3qaIeH84gqX/pW
	 /wTIa7k/khFtDOVEBoBxMaMRZ4FLtj6wIt+Er7yPQmvzx0MX9qYRsC8rdl0hlaPajX
	 vh93FlroEXR6hjnJrR9Z12SRUzeRIWAS+1mr30IB99Ap1tdnpN0DQx2fbhfskjebJU
	 nz/XvJyHxj2rA==
Date: Thu, 26 Jun 2025 21:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	git@amd.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, krzk+dt@kernel.org, richard@nod.at,
	amitrkcian2002@gmail.com, vigneshr@ti.com
Subject: Re: [PATCH v14 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <175099209513.1650937.6817719319563715561.robh@kernel.org>
References: <20250623105445.2394825-1-amit.kumar-mahapatra@amd.com>
 <20250623105445.2394825-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623105445.2394825-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_194137_725081_DFF9F3AA 
X-CRM114-Status: GOOD (  16.99  )
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


On Mon, 23 Jun 2025 16:24:43 +0530, Amit Kumar Mahapatra wrote:
> The AMD QSPI controller supports an advanced connection modes called
> Stacked mode which allow the controller to treat two different flashes
> as one storage.
> 
> In Stacked connection mode flashes share the same SPI bus, but different CS
> line, controller driver asserts the CS of the flash to which it needs to
> communicate. Stacked mode is a software abstraction rather than a
> controller feature or capability. At any given time, the controller
> communicates with one of the two connected flash devices, as determined by
> the requested address and data length. If an operation starts on one flash
> and ends on the other, the mtd layer needs to split it into two separate
> operations and adjust the data length accordingly. For more information on
> the modes please feel free to go through the controller flash interface
> below [1].
> 
> To support stacked mode, the existing MTD concat driver has been extended
> to be more generic, enabling multiple sets of MTD partitions to be
> virtually concatenated, with each set forming a distinct logical MTD
> device.
> 
> A new Device Tree property is introduced to facilitate this, containing
> phandles of the partitions to be concatenated with the one where the
> property is defined. This approach supports multiple sets of concatenated
> partitions.
> 
> [1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface
> 
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../bindings/mtd/partitions/partition.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
