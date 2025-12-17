Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACDD6406D
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Dec 2025 03:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruKc+dzl6gqkFGwgfx9w5WqXNS+6cFPu2Tba2evcWWE=; b=415ZtbruabnSgc
	5SYQXp1s0yK06dy8XhXBbfqhuoVJb91RwFsjNjN5K63Wk1cSWK4O/0hckbPraz/MfYmq/qWnzWCQu
	+XoSSHJ9/ZlSW3uipIp3mecuRlMyjwp8x8L6wuQduGOvXfL+FKQ2qCakyaV5wgQTyjR/adTudjhSy
	WeTRW/7pDdA5wB1iYcafH5+DpFxcgdqrz3n1uq7RbKQ2XG5Dz9NHcvJCREWYPYLHmebbGMIw4seSr
	WyFF5WUVdowJzqGHRRgvQYdZ/YSsJuvpcxuhjjPAXFGQ+ZxN4i7KGMvIBf8CvJuTulB/lfmmuj0Oh
	JcjKqoFD7yeCbBUie05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVi7E-0000000673Y-29hn;
	Wed, 17 Dec 2025 03:22:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVi7A-0000000673D-3oxo
	for linux-mtd@lists.infradead.org;
	Wed, 17 Dec 2025 03:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C479140111;
	Wed, 17 Dec 2025 03:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B192DC4CEF1;
	Wed, 17 Dec 2025 03:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765941731;
	bh=u5k6aFeluCnCcU6WlyD33Z3mf/SsHRJcNakxj8G8Kdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KmFt6DCppcufCmXLZCYy1zpU0PfKyRVl4WvzV8Q59FDaaAkrolJhBqERIVfqhlLjL
	 HiYVpo9f9xVhQayfiWfgEZXpo58IAIcI2EMqGpg873P3oJGTfjtmKAUsxnluv5Hv8m
	 3kMTqIfzyr6oSIZpzMspNmpqXxIbxDY5+oX4/gshqulr+QD2RNKuXeQ07Teky9z+q4
	 QE15578lrO5ikyrCJR1/Tn8efLlQaEzBl1cz0Wgvrhl9rIhRj1XKSTHtOAB1+PMGCj
	 ITtVFwYpyE6bF/WCEUIRd5IxjvpxHYm9qfGDFMQloyXVsuOnZjfD4QKsBqJImX/D2F
	 P1UlYEFEWNTww==
Message-ID: <f1948d54-2e27-44ca-8509-ca16f9b792fd@kernel.org>
Date: Tue, 16 Dec 2025 21:22:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add dma-coherent property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
 <e1aae851-4031-4b5c-a807-7a61ecfe6af1@kernel.org>
 <877bumsv3q.fsf@bootlin.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <877bumsv3q.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_192212_980645_9B25EA82 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel

On 12/16/25 02:12, Miquel Raynal wrote:
> 
>>> Khairul Anuar Romli (3):
>>>     dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
>>>     dt-bindings: dma: snps,dw-axi-dmac: add dma-coherent property
>>>     arm64: dts: socfpga: agilex5: Add dma-coherent property
>>>    Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 2 ++
>>>    Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml      | 2 ++
>>>    arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi              | 3 +++
>>>    3 files changed, 7 insertions(+)
>>>
>>
>> Applied!
> 
> Have you applied all 3 patches? If yes, where? It happened during the
> merge window but I see nothing in v6.19-rc1. I was about to take the mtd
> binding patch, but if you took it already that's fine, I'll mark this
> series as already applied.
> 

Yes, I took all 3 and staging it in my tree for v6.20.

Thanks,
Dinh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
