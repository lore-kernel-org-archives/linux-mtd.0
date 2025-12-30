Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16C2E95A77
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Dec 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk4lOIqjr+mg2ztXr12Y0L7CojVmO9qoW1eQQ6QRZ3s=; b=WjLv+ht0X70s57
	LifzB6fea5lsuHpBo/8ZfbjV5lpoGNdW501Jw4SbXzJUY4KRp0DS/dbwIS0aURZS+hTXY2/7Q2Gi9
	YexWL7eb6luu4YTYwl8OaYbTn/kAWwFyNmYrUq319vFoGU7jP1BTigAIwkCzF5hw+oYxXfLmozgla
	dGXKEwsRTUza2QPvSl1523OkFAXSH9cWPKxKQM4sKk5l9u6L6GNje65T35CRT1xD4vif8VKFHfMxV
	VLAqP3mHrEvNZ7U2yrV6vYx0Fo2HuLao5JfMpxrdRoHtr13OZ3DSJf7E56l+ue5aTbTa2yZtuxhaZ
	1h8Rtyrq3RwT9RrxjgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXh9-00000004kex-15Xf;
	Tue, 30 Dec 2025 11:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXh7-00000004kep-19Lo
	for linux-mtd@lists.infradead.org;
	Tue, 30 Dec 2025 11:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E5EC60018;
	Tue, 30 Dec 2025 11:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CB4C4CEFB;
	Tue, 30 Dec 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093316;
	bh=6XXs1Ij3JW13h4+nLNLkR/17LPtoGVAMzCvaZFHlxKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtCO8kYNJW5RfkfkcDsCqJkgRG0uoJVSm6aHkbcNw23KzVAZ6iVLxMvr7TaeQpGt+
	 5HmDZp1+npop1hue9R5PQg6tkl1V1b86xgllo9DcqxaX8nPX0WrdzBt6dnZHYWoVDI
	 8YgsM+J9A3KYyiDvudvErjYTQhQUxyazuz2CSRqLYOsXJErDoomMEmygjoAUmx1jHB
	 LrTXTZVHiRixgZj+PKl3YRb7HUfLczTVKVYEyTW9ZPA44qIWlgtJ3Q+ITIR/jYO7AQ
	 Dhb20wQmF9JsdRCOJZ0dfeVPLco4QBxz67y2pydkU1Wq99KJBInaRIg+iwwJCKQGWx
	 mxFrN7LfmyJvA==
Date: Tue, 30 Dec 2025 12:15:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <20251230-pug-of-sudden-pleasure-f6d1d1@quoll>
References: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
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

On Mon, Dec 29, 2025 at 02:31:12PM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
>  2 files changed, 107 insertions(+), 64 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
