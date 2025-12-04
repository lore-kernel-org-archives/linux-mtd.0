Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351DD2A545
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Dec 2025 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UESAxeQ+bFrc1zdDxHetgg6de2wHKXAeHEfZouzX8Tk=; b=bZ3nAXkqLh74I5
	Uc65bVEMMbOFzX06ZyR5gfIobb2aw5cM7zDPrY4G+VJ8tEhjkxslSpSrzX/4eOI2OrKImZXeIivf8
	eVl34naCdx5yrKAvIqQRIvtjyBVw8jj9aHVzZ/A1WbardTDD+41BMntsR5VXJn5Rw7bvbbPQ5KVw4
	ZEYm6NVH9mp4dJmSqXgcFcPfHORtGVisSjqhaDncQeliJBwh9nw45ug+iV85rm+KevBuYnblwqlaC
	4Wq33dwUMAXBqEM82/8qzBt2NFEcgBifXY4Dr64Ew3qcN3LFjk8Zx+Sg2ZvIE7yI9jF9wKVIAMr4H
	qORm2YQDH2x7Yxq97XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRH0A-00000008gRi-2oBB;
	Thu, 04 Dec 2025 21:36:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRH09-00000008gRY-0Chd
	for linux-mtd@lists.infradead.org;
	Thu, 04 Dec 2025 21:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 285A8601FF;
	Thu,  4 Dec 2025 21:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FE1C4CEFB;
	Thu,  4 Dec 2025 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764884195;
	bh=364uo4R19wBUN9DtJRd+36+KuRNDgwgor8/CpcvYBPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlPdaAfa3UGOjholSMCtQ/6wRaYnVNVJNsCyAQT60lcJbq3kf+DbkJ/3C8hOq2Uz3
	 1X6kR5poAatjS/0AVJwtbTWyoTCmGTd7w1kQUn6eX3HGYb6aLaUeLcz/quK3KBM+zW
	 PdvNZ287lYUqMxM8E5Pj3UOf8PpWO0x+/c7ZbYtvF5FEGGIkWrKFyKSH20BJh1fSyV
	 Fc482g1rp8+pJCpgl9bP6/iadbqmpsEWj8mq16YCBDGQ0ARWdINloyK5EfKp/xRgSm
	 S9u7ThvUg9hkp0rua7wovI0oBj0wKVGVRhzejeoFlPazW3/UFrS9/I5XzBwQ0otwRh
	 b/A/UrfMeEw/A==
Date: Thu, 4 Dec 2025 15:36:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent
 property
Message-ID: <176488419217.2206248.9983976146883123306.robh@kernel.org>
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
 <fa3777579d15a803c4330c2a536f0026ae6f9fd1.1764717960.git.khairul.anuar.romli@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa3777579d15a803c4330c2a536f0026ae6f9fd1.1764717960.git.khairul.anuar.romli@altera.com>
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


On Wed, 03 Dec 2025 07:47:33 +0800, Khairul Anuar Romli wrote:
> The Cadence HP NAND Flash Controller on supports DMA transactions through
> a coherent interconnect. In previous generations SoC (Stratix10 and Agilex)
> the interconnect was non-coherent, hence there is no need for dma-coherent
> property to be presence. In Agilex 5, the architecture has changed. It
> introduced a coherent interconnect that supports cache-coherent DMA.
> 
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> ---
> Changes in v2:
> 	- Rephrase commit message to describe why the property is needed now
> 	  and was not needed previously.
> 	- Remove redundant statement.
> ---
>  Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
