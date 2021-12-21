Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652D6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kyKHvQKHTugxl4RxvVID9nar6TtaDLhmvxdPiwCIYM=; b=C1zTWAwfqbUSxq
	0jgt4jjHPbFaK6d1YixtTH72+3Q4fiveYAChSvbO/alcZSC8WMF08+Yf8X/a0l4u7ee1fPFf2Ex4R
	b4xOEMW9RLdN7jME1n0mP7zkgLOJP7pT4dMrdFAxAUMLFraq3JuLjLQFFJXytCprXiIIUCmLthtO2
	mHqpbS+Xak20umNaZNOWaum+lGNY7RLCn6DFrb4R9i+Q9S7TT86cWpyUz8p/+5ltDjmShZud/nLpB
	UYCenPTnPqlO0BTXhIDGuoUwdlxr8JapVWbtPT+UYcowiGfJSx90G18WG6HmVSey6fap30G0h8iRs
	HflVtDEp1tryoQHarv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzkAl-008AtW-5C; Tue, 21 Dec 2021 18:47:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzkAg-008ArT-NM
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 18:47:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BLIlTYh120940;
 Tue, 21 Dec 2021 12:47:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640112449;
 bh=8jJKrDDKl8hBG7kZ8qKaV66qQOxOxFxhy6JyeYCvQec=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yk5g5cZ8QRLNpMaSar+FyNyH95/YunI6XePYJkDjRNNyzBV2PDFzZtsCU5LFlaH1m
 GPDmQCCyi7LdcwtxMMLVK28t1gE8ywSK17okC7uw6GqOaiPp83uuZUY+I6edFdEk5N
 hdWHHW9pxMHQHTdtTOD6iG2OUji6BQl3JFdhB5JI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BLIlT1B036969
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Dec 2021 12:47:29 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Dec 2021 12:47:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Dec 2021 12:47:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BLIlS4x106263;
 Tue, 21 Dec 2021 12:47:28 -0600
Date: Wed, 22 Dec 2021 00:17:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <20211221184725.46lelrdfoxeom6uc@ti.com>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221170058.18333-2-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_104734_903243_41E692D1 
X-CRM114-Status: GOOD (  25.15  )
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

On 21/12/21 06:00PM, Miquel Raynal wrote:
> The Xilinx QSPI controller has two advanced modes which allow the
> controller to behave differently and consider two flashes as one single
> storage.
> 
> One of these two modes is quite complex to support from a binding point
> of view and is the dual parallel memories. In this mode, each byte of
> data is stored in both devices: the even bits in one, the odd bits in
> the other. The split is automatically handled by the QSPI controller and
> is transparent for the user.
> 
> The other mode is simpler to support, it is called dual stacked
> memories. The controller shares the same SPI bus but each of the devices
> contain half of the data. Once in this mode, the controller does not
> follow CS requests but instead internally wires the two CS levels with
> the value of the most significant address bit.
> 
> Supporting these two modes will involve core changes which include the
> possibility of providing two CS for a single SPI device
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 39421f7233e4..4abfb4cfc157 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -47,7 +47,8 @@ properties:
>        identified by the JEDEC READ ID opcode (0x9F).
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You allow up to 4 items in stacked-memories but only allow up to 2 CS, 
which would make the other 2 memories unusable. Should also change this 
to 4.

>  
>    spi-max-frequency: true
>    spi-rx-bus-width: true
> -- 
> 2.27.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
