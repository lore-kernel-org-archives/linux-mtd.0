Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89657C4450A
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2026 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLC0kw6s+p4h2CprfFE3xzlD0V8R6acPDEndSKDU/Fk=; b=oBBLcTf+sWg4GH
	oXEco4fvdjMfM90DSyfwVPPd4Jhxot0kHf+Y+28VRhdKdhGJGIfw/P32iuOeeBBA0So1dC68T0z1N
	DFKuqQxLzAMTGud7YgPQ3jzJBDdvf5XqI6dGnY0QPX676nHzQAhLjX9oznBXzr+hKLYaO11GQD1nj
	oQJLyMLRBT57a5ix2s6aV1v7PAxyy/TDQohB/G54R76VIG5z/NO34iAXnlgSpnxelw1vgy7waQKeg
	38GPOzemn9Cyhd83DbQN43SORt/orcCVVmK5QyRp2SJQuxzjkvSYcVI4mYzzp/ld8NVgaTIbo3iox
	7zeh2FwY6Otj+fvhXZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLQV-00000004npr-49tD;
	Sun, 19 Jul 2026 06:55:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlLQU-00000004npj-3jGb
	for linux-mtd@lists.infradead.org;
	Sun, 19 Jul 2026 06:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDF3F6001A;
	Sun, 19 Jul 2026 06:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8871B1F000E9;
	Sun, 19 Jul 2026 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784444101;
	bh=ADaFNJfHwQ0Bc31gt67kjh0oWg4Lmov10eqOPdTOBW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvsQ5LmIK1ybgLBfxkagCDpx+tv8GcGrpTjH3Fp22wN57n7mSqPgZUk09JZlrZZOW
	 YPwyEfzlG6Kr0PPLkfNN5ziRcbxz1xluMJAez/2oDbwTI7qvnmDDiZGy+sldIUY1ex
	 quaUsuX1UwLO2fbpqdndYp0BUphPxOcE10aXttSwyD7aRyrzfeM2fXiOoyDUAw47Zp
	 caohHbUh3YTT06xatPkdjki9ltCl0rplW2/NHjF7ZLY8rlxKNzLbQ4Eahzw42bC5yM
	 tj2tu2x20V0faR2JA/clo3Qy7PRSbU5ZtfCMNOlZtr2fE3akRSBwI4/Y90d4vVvAIg
	 3aUwIOWzTZCRw==
Date: Sun, 19 Jul 2026 08:54:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v5 02/17] spi: dt-bindings: add spi-phy-pattern-partition
 property
Message-ID: <20260719-nonchalant-formidable-yak-7c722c@quoll>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-3-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717185116.2065505-3-s-k6@ti.com>
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

On Sat, Jul 18, 2026 at 12:21:01AM +0530, Santhosh Kumar K wrote:
> Add spi-phy-pattern-partition, a per-device phandle property on the
> flash sub-node that allows the DT author to directly reference the
> partition holding the SPI PHY tuning pattern. Used to locate the
> pattern data during PHY tuning when the device cannot load the
> pattern dynamically.
> 
> PHY tuning works by reading a known data pattern from the device
> repeatedly while sweeping controller delay parameters until the
> capture window is stable. For SPI NAND, the driver loads the pattern
> into the page cache once using write-to-cache opcodes, then reads it
> during the sweep. SPI NOR devices have no equivalent opcode, so the
> pattern must be pre-programmed in a dedicated flash partition. One
> partition per device is required to keep the procedure unambiguous
> when multiple devices share a bus.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml  | 17 +++++++++++++++++
>  .../bindings/spi/spi-peripheral-props.yaml      |  7 +++++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
