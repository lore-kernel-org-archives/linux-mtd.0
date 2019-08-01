Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2165C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7542A206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCZHFJ7s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7542A206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9nF+jT9FVXeDbdy/ErCl/THwYjpqu+lF62arWVJ1wA=; b=FCZHFJ7sgtiXeV
	G2xVG//swoiZBsBKb/msmJCU2ZsPNJ9iYI/zmYXPpEQrVb5fs+7EH6IZux0sTQBCpa30jEtUK9KqH
	tDsciOrWxVZWOEPpMZOQdKv4oeu/BIhrcPEm2DJi2kM5rXNFxcnq0ri/4s3gAurFRDSsytbtzCKFu
	bZBV0BMDUIU7UHJkecziMPmKw4LIsSL8SBBJTyNnBWMGEgixHnmaDKZkbC/8klgJ23gpEDZ+P1YCp
	TEWIrmE8GlIdCFQElaS7lGhwiR8wpnKV88k5cLmsHRmMQ0sfLSNccVB9cwMn/YmWwh4V4COtHLLbt
	/R+3xmK5bn1x1f9gAgKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht45l-0002Hl-MR; Thu, 01 Aug 2019 05:57:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht45i-0002Gt-59
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 05:57:31 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1155028BFD8;
 Thu,  1 Aug 2019 06:57:28 +0100 (BST)
Date: Thu, 1 Aug 2019 07:57:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Message-ID: <20190801075725.4f23e0f5@collabora.com>
In-Reply-To: <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
 <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_225730_335313_BD1C9168 
X-CRM114-Status: GOOD (  14.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, anders.roxell@linaro.org,
 vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 christophe.kerello@st.com, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 liang.yang@amlogic.com, lee.jones@linaro.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  1 Aug 2019 11:55:10 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..de37d60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,19 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> +- reg: should contain 1 entry for the registers
> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps", "send" and "send_dly"
> +- clocks: should contain 3 phandles for the "ps", "send" and
> +	 "send_dly" clocks
> +
> +Example:
> +
> +	nand: nand-controller@43c30000 {
> +		compatible = "mxicy,multi-itfc-v009-nand-morph";
> +		reg = <0x43c30000 0x10000>;
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send", "send_dly", "ps";

You should have subnodes describing the NAND connected to the
controller (see [1]).

[1]https://elixir.bootlin.com/linux/v5.3-rc2/source/Documentation/devicetree/bindings/mtd/nand-controller.yaml#L131

> +	};


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
