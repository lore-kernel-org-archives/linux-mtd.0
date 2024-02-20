Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC4EC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A22j5k5g/hUwgsqNCGG6VwWUP8IGb0pfdqZvRag4dBA=; b=qgMdaFyPnrC3eM
	DqeVmupmsJ9x/Y97M3YQMhKE3k2We8v1nqRFfX8DCL5vIzGLAy0yVrGgPOEkSIOsP/HOFomTREIN0
	R6Y3Er0tOEimSVB9YATsWXs9M2++HVaJiOQFROJFmLDjSgUrFlSxiT4myWf8XwgnofdKrMGcpBoQq
	/X6Ep4IA4eg2Ma559kon8ycOA9melIJC382/shB0yNkWDXjUujDH6oPkaS08Y2rTZxI9dUG6URzf4
	qTPVUU0EkZvQncCTX6EdI59iqMRSvt21WjIwYGDLF8kgzUx1kaXZYTWAjMlf3kYG+eUrQwsLvRUaF
	CkgrJhEbARwXwkBpqBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcP5p-0000000Edwp-3Mb3;
	Tue, 20 Feb 2024 12:19:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcP5n-0000000Edvq-0XBE
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29BE8CE0EC2;
	Tue, 20 Feb 2024 12:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54431C433F1;
	Tue, 20 Feb 2024 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708431560;
	bh=GAbLAdPRT9LXNVUR3e7hM4AhNauwKmwqN8rBcjMWsOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y/fpWjMcMtcird10UlSs/QVsPZkPL/zZXCdgHDOVf1kjtFtboB/VDaV7Q8mi0qLav
	 bfNn9vBvF0NQNbC5VDgpr8l6bNuKXyCCE/Fh62SHuFOli0JUo9DWSy0cmynJDJV65Y
	 SHo0yF38FR7+jjnpnU3Bus1SaNKae03y7Mwet3JcPc4YXVm6fj8uD9Nrt2pM8Oaixu
	 zUD/2RAP24BBP2T1ON1Eo423LO2YqThAhPwLK5SUlNeDJmwuziFTaUX1QA4OZhG35w
	 KniVBrj45mSevj6hWh+5MvVNWJe7mKMk7/RwN4Wbq80w6FWjF10JNY1sv+8XTTWEts
	 yWqzNK4E7Azgw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,  Yazan Shhady
 <yazan.shhady@solid-run.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
In-Reply-To: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
	(Josua Mayer's message of "Mon, 19 Feb 2024 15:41:19 +0100")
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
Date: Tue, 20 Feb 2024 13:19:17 +0100
Message-ID: <mafs08r3f8h16.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_041923_370179_57A2A366 
X-CRM114-Status: GOOD (  17.32  )
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

On Mon, Feb 19 2024, Josua Mayer wrote:

> Some spi flash memories have an interrupt signal which can be used for
> signalling on-chip events such as busy status or ecc errors to the host.
>
> Add binding for "interrupts" property so that boards wiring this signal
> may describe the connection.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

BTW, I don't see any support in SPI NOR for handling these interrupts.
Do you plan to add them in a later patchset? If not, what do you get by
describing them?

> ---
> Changes in v7:
> - split out of original patchset because it should go via mtd tree
> - collected acked-by Rob Herring from v6
> - Link to v6: https://lore.kernel.org/r/20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 58f0cea160ef..6e3afb42926e 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -52,6 +52,9 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  interrupts:
> +    maxItems: 1
> +
>    m25p,fast-read:
>      type: boolean
>      description:
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
