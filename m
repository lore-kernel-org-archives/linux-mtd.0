Return-Path: <SRS0=6jNp=Q5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2650EC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 20:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CD920700
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 20:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ijjj4YVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CD920700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBJ/L8j4hbQucO5iT26f4SsmkxHwKBPBePCNnkKjolI=; b=Ijjj4YVQTDwOYT
	retO0JMdZy1j+Ef8X74Lr5mczf/eH8q/bu5Zd6J8ea3HFJjqy0efOu7oiMdNozQcC1Cyq++f0JLtd
	HQWI+tkgm4Y44aE3J6hGTOqPTiajr5H9Kyg93FihSXUKUfDDcYV1bterRBcZ6UzEF/MfKUfMNz5q4
	+0aZakBA+HrQlpAOwPg9lJbw2sgF3Um+1F1OpSQZGj5T8kBfKRLk6oGc45d3Z4Ek7KXVKpWPplNuF
	d30c8qZmC8nEPJn0zYtt96ZnRxDaqx/wEfewumOOP2AqSXu+YXFICaPHQ5FaNxwlPjymaMab3Jh8c
	sIo1u3y+xffweLAp3fBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxHcv-0005fg-FR; Fri, 22 Feb 2019 20:40:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxHcs-0005f0-Jb
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2019 20:40:56 +0000
Received: by mail-oi1-f194.google.com with SMTP id w66so2775783oia.4
 for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2019 12:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k6Nt+rTOyhB130p46hK42kJOh3SKIT6oOPXdqmBAy3o=;
 b=cgpW60DpoChnVtSjFCDGWf2oZ1QVyA588V35qcdG9ZnPWFxdi0vlvmwW4vFpCM25tp
 JWhFMPumwnF1qvROwDjo3YqaPAWHhNPNPiba4AW9JPTZ/fzrxH+N8wTy/fnGAjMsAyQ/
 ox9b4fI8CDkgZc0mws/0DPMemrZ6srh4RkXrfQFr0EtjVWNvc4EW1Cyb2H2PGQCTI64d
 cR3iu2KUME0ZVIRElzywnoMtFo2o0GrnRiYqSJWS2qt2q3131+M0CBB23Hnyb56A3011
 41cCa9LqVMrvFw2d15UebuNKN7JPozD7kw4pIXI3Nr+sHeS1qhKzhBbxaXRKob5yBLrj
 32Tw==
X-Gm-Message-State: AHQUAuYhEMYma9gELsiG8v44Asj6xVgrsWo6eTS7qKWSub/6LUx9Oqal
 jHjBMlVEitrZhKbJRDPR6w==
X-Google-Smtp-Source: AHgI3IaqrNVvawQBQViDikdq4pTP15svOkBv9yidlw1+l3Pn8ReksMlRhHHkzfezp1KJ3TcRUheUZQ==
X-Received: by 2002:a54:4606:: with SMTP id p6mr3572245oip.162.1550868053511; 
 Fri, 22 Feb 2019 12:40:53 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n76sm1123335ota.51.2019.02.22.12.40.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Feb 2019 12:40:52 -0800 (PST)
Date: Fri, 22 Feb 2019 14:40:52 -0600
From: Rob Herring <robh@kernel.org>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: nand: Add Cadence NAND controller
 driver
Message-ID: <20190222204052.GA17855@bogus>
References: <20190219161406.4340-1-piotrs@cadence.com>
 <20190219161920.26602-1-piotrs@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219161920.26602-1-piotrs@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_124054_647195_3488FE17 
X-CRM114-Status: GOOD (  24.15  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 19, 2019 at 04:19:20PM +0000, Piotr Sroka wrote:
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> ---
> Changes for v2:
> - remove chip dependends parameters from dts bindings
> - add names for register ranges in dts bindings
> - add generic bindings to describe NAND chip representation
>   under the NAND controller node 
> ---
>  .../bindings/mtd/cadence-nand-controller.txt       | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> new file mode 100644
> index 000000000000..3d9b4decae24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> @@ -0,0 +1,48 @@
> +* Cadence NAND controller
> +
> +Required properties:
> +  - compatible : "cdns,hpnfc"

Only one version of IP or is that discoverable?

> +  - reg : Contains two entries, each of which is a tuple consisting of a
> +	  physical address and length. The first entry is the address and
> +	  length of the controller register set. The second entry is the
> +	  address and length of the Slave DMA data port.
> +  - reg-names: should contain "cadence_reg" and "cadence_sdma"

'cadence_' part is pointless.

> +  - interrupts : The interrupt number.
> +  - clocks: phandle of the controller core clock (nf_clk).
> +  - Children nodes represent the available NAND chips.

Need a blank line and remove the '-' as it's not a property.

> +
> +Required properties of NAND chips:
> +  - reg: shall contain the native Chip Select ids from 0 to max supported by
> +    the cadence nand flash controller
> +
> +Optional properties:

For child nodes? If not move before child nodes.

> +  - dmas: shall reference DMA channel associated to the NAND controller
> +  - cdns,board-delay : Estimated Board delay. The value includes the total
> +    round trip delay for the signals and is used for deciding on values
> +    associated with data read capture. The example formula for SDR mode is
> +    the following:
> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
> +    + DQ PAD delay

Units? Use unit suffix as defined in property-units.txt.

> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +Example:
> +
> +nand_controller: nand-controller @60000000 {

space                              ^

> +	  compatible = "cdns,hpnfc";
> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> +	  reg-names = "cadence_reg", "cadence_sdma";
> +	  clocks = <&nf_clk>;
> +	  cdns,board-delay = <4830>;
> +	  interrupts = <2 0>;
> +	  nand@0 {
> +	      reg = <0>;
> +	      label = "nand-1";
> +	  };
> +	  nand@1 {
> +	      reg = <1>;
> +	      label = "nand-2";
> +	  };
> +
> +};
> -- 
> 2.15.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
