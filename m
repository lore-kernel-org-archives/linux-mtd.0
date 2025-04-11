Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F5C369AE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Apr 2025 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/sjI9/3Racy5UyjrEUWistJuzjZAMWSSVsShSfcBM0=; b=1xe01wGklUCXa2
	UXSEVoW3BXVuITPlaBYtH5EG+2avPXk1lrvUjTmeaiJsyyc8RjiPU7A96+jWSdbgwFrT+SdTanaQZ
	WyX63NkbXrK0/x1uCW9ij3Yc/0O/B99S36IO0n+Q2wXiXlbtyWCANF2PoTuF+GzoRiIKIXUKZp/Ze
	q2gb6EmHRSgx7lyeDlIQHkMtfofO1rrzWoZAhiWgP+uxRsO7zrWVObglKQOw+YR4AfmetuLkCOyPv
	qGStbdCzs6cu3OFW8+yBh6mlRZjVwXmDoWTZWd6DeYLGSw1oXij70ZY8d6IWETgkK9n+vlImWTddp
	BENki6PWBdL7DTDcT9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Mat-0000000Eyw7-3PKl;
	Fri, 11 Apr 2025 22:11:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3MZx-0000000Eysl-01ko
	for linux-mtd@lists.infradead.org;
	Fri, 11 Apr 2025 22:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63D7E5C66DF;
	Fri, 11 Apr 2025 22:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0241C4CEE2;
	Fri, 11 Apr 2025 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744409428;
	bh=UJuUS3ZwnRhVWccPq8AGbrKlwXgGsF2aXK8qD21Xf5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7NPOfUea8jv83jq4+7z5baLlJMjCJskDikDm5NmrMSFz9Jbw8mDQyPxBpHCYTGzy
	 GRaaSishr20IB77AJbKN3Nm9mDUMNJH4boyEFR9FFgmczfAgqClNU4uFmrp47y9CI1
	 7i+fLkNWvOf9b/n0eGDJMgYXawxOh3XEPbRu2WzLGSTzWYxMy6jNgdGIo6TLGoaCuc
	 nYqxKu1TPrd9QBSr0vvNTaIveMKXvgti/t0aUKYU5Vl0wB0jk02NaTjZnowcXztdbq
	 A7rHydjbJgZjZ0dZ1CAizwIv0MfhmYSl9ow0e/BcaLyubVzY9BBexx2xT9a+P0cFBV
	 Kd1mbkhGgpfyg==
Date: Fri, 11 Apr 2025 17:10:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: masahiroy@kernel.org, vigneshr@ti.com, nicolas.schier@linux.dev,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	krzk+dt@kernel.org, nathan@kernel.org,
	linux-mtd@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert vf610-nfc to yaml format
Message-ID: <174440942625.14813.14783153638505828749.robh@kernel.org>
References: <20250411200858.3266447-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411200858.3266447-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_151029_101859_EBF789EE 
X-CRM114-Status: GOOD (  10.24  )
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


On Fri, 11 Apr 2025 16:08:58 -0400, Frank Li wrote:
> Convert binding doc vf610-nfc to yaml format.
> 
> Additional changes:
> - ref to nand-controller.yaml.
> - include arm-gic.h and vf610-clock.h in examples.
> - add clocks and clock-names description.
> - remove #address-cells, #size-cells assigned-clocks and
> assigned-clock-rates.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - add blank line
> - remove accident change makefile
> - correct head file name in commit message
> ---
>  .../bindings/mtd/fsl,vf610-nfc.yaml           | 89 +++++++++++++++++++
>  .../devicetree/bindings/mtd/vf610-nfc.txt     | 59 ------------
>  2 files changed, 89 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/fsl,vf610-nfc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
