Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9BAC73C46
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 14:49:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BF121537
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 14:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqF8omDT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43BF121537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cSwL5F/jHUXu8/yMmefi2sbCNATvAcPUfvM2FsycXA=; b=lqF8omDTG7LQTH
	B9ecSloART22N1wrDmsAGyKneX9Nt0OcB1JIhNeBc2OwfzIXozLxaIVhKeqf5AA6ViiXS6cPOO0xZ
	dNUBClKLQsVWP9szJVYl5SCH6bp31+GXQl8K+KZ+f9lK90O30GcJwwDn3cy+VeiYeI6gVQlIf8u5+
	/bSzwMdNpL+xhxKg5iIxgkyRUf0nhA0c9L72lbEdMqq3um8j0szoToNjtQysOqs//YtsGtgpBgvzA
	U8fj5hBVC7uFF2PqHHqeBtdzU4QaEz7tNbXXHbpz7jSzWyx7hwHtz1OE5i+3SlGrFY9QAEIyBbyM2
	Wa6zkEg+0+JpCeTf/G2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkrQT-0004v9-BR; Tue, 09 Jul 2019 14:49:01 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkrQO-0004o3-S4
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 14:48:58 +0000
Received: by mail-io1-f67.google.com with SMTP id m24so34251218ioo.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2019 07:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T/Vs1PK7xFKDrlW3gYSloAnKpvLJ7R0MVGjuRw+/My8=;
 b=YDhhAqHfF8DaPxMtEvG6lvzHHpim73ssiJcg0L26eZ0YdfYc2i0NquuoqTuJnsex8s
 fwpWR8ScZ82aFvd2u8WPnJYNOJU5qDGNYOnuAVb7S+T8QA81KuSBaz1iUUjVFYYz4TBe
 7QSI01VC96RD+51j2qev8r+Fw4YzuGAyY82mNu8SZusoAnVFZ4AiB5Yk3zp47Sp8ltLT
 hG6hnjjXS8ZTiCAmNqd7AHi6q9OdCCEzs2koTarBKhVfCO1VJx1DgBiJAwH6Xj0/w/N4
 3gb3At5wWbSGinGiQyORR2P/GufNMVcscJa/Gev7iVFZDTo5q/6XrMfGh/Z8GH8+Az0O
 K7Kg==
X-Gm-Message-State: APjAAAU3I6tYpI7eVqbGbPSRs6bdWpq6J+nDuc/HZDbh/TA/38BiT3qJ
 B3EyToDhytsk+MYfix3AjA==
X-Google-Smtp-Source: APXvYqyBShhjIwHDM6V18l3Qy1+iKno11GiIPO5CJH47QkOqrUPZqlX2lx6+G0+9VhP3FVExjUBBog==
X-Received: by 2002:a02:878a:: with SMTP id t10mr28623549jai.112.1562683736075; 
 Tue, 09 Jul 2019 07:48:56 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id r7sm19309768ioa.71.2019.07.09.07.48.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:48:54 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:48:53 -0600
From: Rob Herring <robh@kernel.org>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v3 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Message-ID: <20190709144853.GA23699@bogus>
References: <20190614150956.31244-1-piotrs@cadence.com>
 <20190614151301.5371-1-piotrs@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614151301.5371-1-piotrs@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_074856_907164_BE2685B6 
X-CRM114-Status: GOOD (  23.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 14, 2019 at 04:13:01PM +0100, Piotr Sroka wrote:
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> ---
> Changes for v3:
> - add unit suffix for board_delay 
> - move child description to proper place
> - remove prefix cadence_ for reg and sdma fields
> Changes for v2:
> - remove chip dependends parameters from dts bindings
> - add names for register ranges in dts bindings
> - add generic bindings to describe NAND chip representation
> ---
>  .../bindings/mtd/cadence-nand-controller.txt       | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> new file mode 100644
> index 000000000000..e485b87075bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> @@ -0,0 +1,51 @@
> +* Cadence NAND controller
> +
> +Required properties:
> +  - compatible : "cdns,hpnfc"

Only 1 version of h/w features and bugs?

'hp-nfc' would be a bit more readable IMO.

> +  - reg : Contains two entries, each of which is a tuple consisting of a
> +	  physical address and length. The first entry is the address and
> +	  length of the controller register set. The second entry is the
> +	  address and length of the Slave DMA data port.
> +  - reg-names: should contain "reg" and "sdma"
> +  - interrupts : The interrupt number.
> +  - clocks: phandle of the controller core clock (nf_clk).
> +
> +Optional properties:
> +  - dmas: shall reference DMA channel associated to the NAND controller
> +  - cdns,board-delay_ps : Estimated Board delay. The value includes the total

s/_/-/

> +    round trip delay for the signals and is used for deciding on values
> +    associated with data read capture. The example formula for SDR mode is
> +    the following:
> +    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
> +    + DQ PAD delay
> +
> +Children nodes represent the available NAND chips.

Child nodes...

> +
> +Required properties of NAND chips:
> +  - reg: shall contain the native Chip Select ids from 0 to max supported by
> +    the cadence nand flash controller
> +
> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +Example:
> +
> +nand_controller: nand-controller @60000000 {

remove space                       ^

> +
> +	  compatible = "cdns,hpnfc";
> +	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
> +	  reg-names = "reg", "sdma";
> +	  clocks = <&nf_clk>;
> +	  cdns,board-delay_ps = <4830>;
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
