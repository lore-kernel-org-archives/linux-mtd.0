Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07651C369D5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Apr 2025 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txcY9cVYYyNna3n66zkPx1XA2cuM0K3PpF2xswfzW7s=; b=ka2CfaesqSP6Fk
	OPunCkD2ZIgAl+zGkDH8jUtWfNd7d+8kpTbKdylfo6S0wpdne6vqrqvw8vHjOJjH/Cn4IAR2GcyfB
	uQyqWhOLo43IsD64j2aWkhJNvwZczKLqpVLR0jQNopWPW7WJo6KoiuJcHVycWlIzcjwr8wktLRcCw
	lUA7HGAr23lALHGakVEo1G3UjROJMOpktHwtz/3aPPGdrxW99ZGQcfHne5Sdl720iAnQwk9c7aTP8
	ZD44xzX2C1oL94lWnqMEFb4Sn+NFQr9/jkYb+4vUkPGnRGlJRq98MgHZLsir5gNgIUYlOfrvjJYJD
	iBCwp3t/qVHsmmKsnXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vyI-00000004vM5-3oIs;
	Mon, 21 Apr 2025 18:34:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vvv-00000004v6c-00jU
	for linux-mtd@lists.infradead.org;
	Mon, 21 Apr 2025 18:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FC2A6115F;
	Mon, 21 Apr 2025 18:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFD9C4CEE4;
	Mon, 21 Apr 2025 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745260314;
	bh=wicyaJqiVMukIqnRJCiaxefV4JH/wYEBdQd4bFgOGqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdOE2mT32KAihVhmRy6GRyUIgIJ7aebHWicszH3zPESQRYtRzgOmdV4KqKNZjQJ1F
	 jM5TyjtJQjuPvcorYxregY2/NK8mrmEe0bBxeY3yNAg79WyxLgQxve7z2aStpc56gz
	 kBIoMBr8GWwTICBPOIpYLWUR3dccxgHG3hNIxQ1M3eM9TyYooXs+XjEkf4I/1a5Rxn
	 4PR+drtANHJqTo3krFEL8NhzuLZ35Nww053jwwT/sRZOWHXJq5/t+dO+EHRXOpKtXn
	 /ZvWBIKBfM4M4+e6XIZwdN3qpRFVYl785W0ko9O4Arus0DNTxRm30obkTSbJIdp6Tq
	 QxKouzf+2QRpw==
Date: Mon, 21 Apr 2025 13:31:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: vkoul@kernel.org, manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, agross@kernel.org,
	dmaengine@vger.kernel.org, andersson@kernel.org,
	conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/5] dt-bindings: mtd: qcom,nandc: Document the SDX75
 NAND controller
Message-ID: <174526031158.2584631.12243382230539274745.robh@kernel.org>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-2-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415072756.20046-2-quic_kaushalk@quicinc.com>
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


On Tue, 15 Apr 2025 12:57:52 +0530, Kaushal Kumar wrote:
> Add new compatible for the QPIC NAND controller v2.1.1 used for SDX75 SoC.
> 
> SDX75 NAND controller has iommu support so define it in the properties
> section.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 30 +++++++++++++++----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
