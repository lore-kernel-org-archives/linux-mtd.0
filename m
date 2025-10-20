Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B484ACCD199
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTzvA7Uvtx59zYLV1aFMbRM0nlj0ldXfBOOb1wbNNBs=; b=yCkc5wjFPfSRLF
	m4hlBMFziBEIA7NuBeE72+CgobsXDvUKm8aOAc2PqGvZfcolCCT/z/vLeB4r1Rs+th15SbGutdt6Y
	x47Ck4fmh2KDCqp5Lhrm4h300DS6GqvkkUU6AzheZeXoOvR9yxIfBQOBDUkQR5YsJ3jT9BuEsnEWU
	tI/LqbldkYMUxGWOmRoiBDjfIM9EQ0o1z7tM/5QLpPPaY1JRF2kJqJS4s/T44UgZxDjV7xaXnBUJZ
	LQHBYLa67+c25xVaTLA3Kt6WvqxUIawBLpCiNecKkNDw0A/tzI/F8HT/rfL3qVZKolcQLgGqJdc9R
	/34VCXGVY+9NMmm3WeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnCW-0000000Cs2c-16uo;
	Mon, 20 Oct 2025 10:33:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnCT-0000000Cs0i-1UGc
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:33:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81BD341A4B;
	Mon, 20 Oct 2025 10:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3F4C4CEF9;
	Mon, 20 Oct 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760956392;
	bh=wv0DeCgmqpuaHOPBdjyj9Ov9pUIrLxPfa9Z6o8Bnxmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5B9NWyFY6Sa8DO2FQY8oGwAMfl213SXg4+DY5w00Ko+pZJdQ7ccqmm5xItLYiMFU
	 kUkty54l7NF9ve0+aqhFkDTkYzQOG6DrT4yGG1c0/8AmHF+1xdP/piDuNl0e47knb+
	 RLqlq09htt9H12w2Fcbx9FCvLzFqh4F6E4/cD+zy0zo+f0WBLwgvrhADiH9tqE72PL
	 L/Fl6Me0ewj3HP+ZYJEAMP5MViExO/x6O6NVClTZdQoZeUVA+4dned4eoGQqmRVLIw
	 +mar6yzmkN37mXBQWhXC5tdRFAZD4nPOq5kgaEDXM3hBo1bYROpxjLCRUvkKWPOK46
	 Z/fkhu8667sRg==
Date: Mon, 20 Oct 2025 12:33:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Niravkumar L Rabara <niravkumar.l.rabara@intel.com>, 
	"open list:CADENCE NAND DRIVER" <linux-mtd@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: cdns,hp-nfc: Add iommu property
Message-ID: <20251020-faithful-gray-nautilus-b9ca71@kuoka>
References: <cover.1760486497.git.khairul.anuar.romli@altera.com>
 <8f3ebbe7084c8330e9ea05e55b16af1544fa3dd8.1760486497.git.khairul.anuar.romli@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f3ebbe7084c8330e9ea05e55b16af1544fa3dd8.1760486497.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_033313_423956_0DAF334B 
X-CRM114-Status: GOOD (  17.84  )
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

On Wed, Oct 15, 2025 at 08:13:37AM +0800, Khairul Anuar Romli wrote:
> Agilex5 integrates an ARM SMMU (System Memory Management Unit) with
> Translation Buffer Units (TBUs) assigned to various peripherals,
> including the NAND controller.
> 
> The Cadence HP NAND controller ("cdns,hp-nfc") on Agilex5 is behind a
> TBU connected to the system's SMMUv3. To support this, the controller
> requires an `iommus` property in the device tree to properly configure
> address translation through the IOMMU framework.
> 
> Adding the `iommus` property to the binding schema allows the OS
> to associate the NAND controller with its corresponding SMMU stream ID.
> This enables:
> - DMA address translation between the controller and system memory
> - Memory protection for NAND operations
> - Proper functioning of the IOMMU framework in secure or virtualized
>   environments
> 
> This change documents the IOMMU integration for the NAND controller
> on platforms like Agilex5 where such hardware is present.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> ---
> Changes in v3:
> 	- Refined commit messages with detailed hardware descriptions.
> 	- Remove redundant commit message and add the hardware used for
> 	  iommu.
> Changes in v2:
> 	- Updated the commit message to clarify the need for the changes
> 	  and the hardware used of this changes.
> ---
>  Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
