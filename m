Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA68BC282C7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 17:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DCD2087E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 17:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yl/BK2OD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKYbqiFI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DCD2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/vszCB9nwuo9GN/6EPv2H1wgCY0Yt1qfX8395gaa8w=; b=Yl/BK2ODiArkdT
	spzoSuLsZuldtuOF7560ztn1Echej1luawKM0XCUo4URN3QjpaIOQ5sU9mNxSnA4NxF/xBshMzz5Z
	xLpJnhjHvl9mYIGoNTbVaTNPULctLX0Uj8Wy0IC+8vKEq5uQmKsfID+SU93mGxYXQOpirWt7WHBii
	eeJJCV6bOBWWeXQ1XFusfSf2JMO+MQxgWRMCEU24/SlGfRNMCEbc71ebDX+2pnFLKua8L3OYRthWg
	/1JEtAnIhQf7bwcSX9HxJV62Vf+oGj4+WDhP2NAWmorWftzt3OwdoMwAmWeMYXEwBvwK4MvrGoxJc
	IYcO+yPN8ugasDsBmviQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goX4V-0001Xf-DC; Tue, 29 Jan 2019 17:21:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goX4R-0001XG-Pj
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 17:21:13 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27A402087E;
 Tue, 29 Jan 2019 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548782471;
 bh=PyKtQ7qC0wxh867jSDYtEOMZFEMPUvSYGi3ho30F6nw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TKYbqiFIxy6BaIUEB492tU9Zc1c3Kt5rbDZYPNfIRtowMevK7x2MVXWJl9Dg9/cm4
 xqqDWu09wDkgzwpMxUQ6aphNy6jdbMlIg4CPwovsqjAL2DnLQM0lUCADN7P1iZvKE8
 Qr1Iw35jjnmyo7Fe+zHnTvwIwfFHNnjan5pSrp10=
Date: Tue, 29 Jan 2019 18:21:00 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Message-ID: <20190129182100.2fcb4e9f@bbrezillon>
In-Reply-To: <20190129161040.20299-1-piotrs@cadence.com>
References: <20190129160337.24350-1-piotrs@cadence.com>
 <20190129161040.20299-1-piotrs@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_092111_863846_73B12968 
X-CRM114-Status: GOOD (  22.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Piotr,

On Tue, 29 Jan 2019 16:10:40 +0000
Piotr Sroka <piotrs@cadence.com> wrote:

> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> ---
>  .../devicetree/bindings/mtd/cadence-nand.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand.txt b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
> new file mode 100644
> index 000000000000..82afa34d5652
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
> @@ -0,0 +1,35 @@
> +* Cadence NAND controller
> +
> +Required properties:
> +  - compatible : "cdns,hpnfc-nand"

"nfc" already means nand flash controller, no need to suffix it with
-nand, "cdns,hpnfc" should be enough. 

> +  - reg : Contains two entries, each of which is a tuple consisting of a
> +	  physical address and length. The first entry is the address and
> +	  length of the controller register set. The second entry is the
> +	  address and length of the Slave DMA data port.

Please name the register ranges.

> +  - interrupts : The interrupt number.
> +  - clocks: phandle of the controller core clock (nf_clk).
> +
> +Optional properties:
> +Driver calculates controller timings base on NAND flash memory timings and
> +the following delays in picoseconds.
> +  - cdns,if-skew : Skew value of the output signals of the NAND Flash interface
> +  - cdns,nand2-delay : Delay value of one NAND2 gate from which
> +    the delay element is build
> +  - cdns,board-delay : Estimated Board delay. The value includes the total
> +    round trip delay for the signals and is used for deciding on values
> +    associated with data read capture. The example formula for SDR mode is
> +    the following:
> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
> +    + DQ PAD delay

The unit of those props is not defined, and if possible I'd like to
avoid specifying custom timing adjustment values in the DT. Looks like
some of these values are SoC specific (depends on the integration of
this IP in a SoC) and others are board specific. For SoC specific
values, this should be attached to the SoC specific compatible at the
driver level. For board-specific values, I'd prefer to have a generic
way to describe boards constraints. 

Please point to the generic bindings to describe NAND chip
representation under the NAND controller node.

> +
> +Example
> +
> +nand: nand@60000000 {

nand_controller: nand-controller@60000000 { 

> +	  compatible = "cdns,hpnfc-nand";
> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> +	  clocks = <&nf_clk>;
> +	  cdns,if-skew = <50>;
> +	  cdns,nand2-delay = <37>;
> +	  cdns,board-delay = <4830>;
> +	  interrupts = <2 0>;

Add a NAND chip in the example.

> +};

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
