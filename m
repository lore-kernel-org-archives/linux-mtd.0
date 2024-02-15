Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554D1C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuuGGI5gPMhu0gvObIfNlQCnPW0tDNL2mux1MNRNa/o=; b=U9+GxRPRhKCCfB
	jX6dSo8J336aaBGlcbASPE8coaEsSj4CBJmRbhRSqxQmZbhB2aGoMnAYhIquz4J1YS4QgGAMoX7uH
	yWl5rQfNko8N6Zby7FLJd3ZmMivNjWpJ/EhhXRUK0GY4qVISqyaFRmhkWOHQ3gTH5U3J0QuflYvjh
	yUgl0p6kKuM0/qdb1Q0VvAQ17cqILIH5ZkDj4jtDABW8l5oSNEncGzU5yVoBxDhk68VP41MdFHkSQ
	tHTjXByL3csGH+WuC8GM/M2HuF+90gUcRRC0/7LJf9IjIAOtRoItRnHqwhoRjg9XSW7DteM9QWQPW
	2IpIPFUk59aZT3SvL0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac3H-0000000GQxU-3U5S;
	Thu, 15 Feb 2024 13:45:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac3D-0000000GQx8-3nE3
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 13:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3139961DA6;
	Thu, 15 Feb 2024 13:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778EBC433F1;
	Thu, 15 Feb 2024 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708004718;
	bh=tfwPW1BfqUnBwuV7ndvI9kwgLvCcwttcwLBgnVwDmKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWI3RpXixCcJyvLLteIW3OOg5247DhQ3Ti8by7iDTz8kN5iRS7jpv+OnuzuqlV2w7
	 CgAi3pjaQyB5GwdSiv6CZlST3gSTM/aTrkfzZB/4FCXzJs5+BOLDVagaKWaDtdkuiQ
	 bFMdkPN0AecQvEln2yrB2BQQaUKnxsU+Oa9ynSlzoxN79ULt94K8xdavkBbzCSNp8K
	 vBmXehqIxnl+ues2Ghq+j+L/KwUhWFkqsy9X5waRncgxlUR8kwL+YXrIA4hBzYcxCg
	 Mr52olTxr1jHI1foUKnYJttry0Z1/Eqm7B6nOKQNyTiMz8qk15+e26jmsn5QT14TSL
	 0JDJIiezJcaHw==
Date: Thu, 15 Feb 2024 07:45:15 -0600
From: Rob Herring <robh@kernel.org>
To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-tegra@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>, Han Xu <han.xu@nxp.com>,
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH] dt-bindings: mtd: update references from partition.txt
 to mtd.yaml
Message-ID: <170800471457.4134974.8222118532104907656.robh@kernel.org>
References: <20240208-partition-txt-v1-1-4398af3b7bb2@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240208-partition-txt-v1-1-4398af3b7bb2@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_054520_004124_09DAA8E8 
X-CRM114-Status: UNSURE (   9.87  )
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


On Thu, 08 Feb 2024 17:12:12 +0530, Nayab Sayed wrote:
> Commit f902baa917b6 ("dt-bindings: mtd: Remove useless file about
> partitions") removed the file partition.txt. Hence, in this commit, the
> lines mentioning this file are updated to reference mtd.yaml, which now
> includes partition{,s}.yaml.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> ---
>  Documentation/devicetree/bindings/mtd/davinci-nand.txt        | 2 +-
>  Documentation/devicetree/bindings/mtd/flctl-nand.txt          | 2 +-
>  Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt        | 2 +-
>  Documentation/devicetree/bindings/mtd/gpio-control-nand.txt   | 2 +-
>  Documentation/devicetree/bindings/mtd/gpmi-nand.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/hisi504-nand.txt        | 2 +-
>  Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt | 2 +-
>  Documentation/devicetree/bindings/mtd/orion-nand.txt          | 2 +-
>  Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt     | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
