Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F5DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8911A60F6B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8911A60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYb2gpUn3fC/MdyrXDgWElA1ooWN5lOX2MzGE85f0lQ=; b=rABxCGXSRQTZev
	oht9WUY2t1VS10XkV6w1rVFrvCTnUM5ew7ntnd23e8I9VOD8RE/GAEuF9w0UUa1A+uZYIrEJ+KSfq
	oSDr9upag7HYwJvR4rjCWuxoeqWFw4l8t3LPMM5wTFYKj9wimO7offS04Z09Z5/Wcj57w5Ht5mH//
	8DHTOlYBMBITojfPwMeoshgnYfDEu1L/DANTaAMF4AzqmhcZbol24hI6+qgQ7BmhPQ7dpUaq/AMwi
	v0AD1ODC95gm9EP0epfhwZnipPzLI+CnuF7TUDDFUcJAmvij8N3ZNdfKZp504GcWf6db3gKORt5Ut
	Di0wTJbb7EQMD+VSZOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKY6-0021F0-27; Mon, 20 Sep 2021 14:45:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKXp-0021A2-8f
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:45:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id i25so69470359lfg.6
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tuWyQBqXiUuLdjTaM4+1NWtk+RRPTol/u+OTKXZEEAY=;
 b=oitbjIV4r+cBWkH8uYuxmdfenP8UlTJpPo0TfTMbhgJdYc2TbwElWgAbosJI4TXzjY
 i6DaUpIqI0dSJD2+65Tpvvho3zD4Q4X0XnfqzbSOLgzuvZDHDaAgLVgGBLZ0pMCefTgZ
 Cvw6uOXrAvAfJXoxiPLvtbTfH2xrisGIA6Eh6yc393WWrwU55BPP1T2IsTGRj1opgGlA
 lEb0S2ONSc09GTiiqqCx3JPGraOGycK/D8eFVgFdiroBgBbLG9pG/sGmucWLwSFBpGTg
 HECYyVroTzhNrxzfb/poWpH1+6atchPDdA1zjySS3ohE9H8hhEAyoi7kbUrL2C4QIXjS
 9mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tuWyQBqXiUuLdjTaM4+1NWtk+RRPTol/u+OTKXZEEAY=;
 b=bvlaNBKQueaavTl5alrqlnfz1GblQqTwxMxcgntVVTb8w1tNGK7L/sZ9yk1vP4lYop
 V6oArR5iCq4Gd0/g12DkgJgNz8e6Qigopx/QAR7kFxfdD6P3Q25cbG8a9Yy3ySvuyCtX
 zEmzWlkt3F60YAb7zx5yOUlgJ8GLV2n4BOYizQnHdEM/HLwtQR3co3ojbvdEFsb/0X1t
 hrIRZ0Ibp+CylppBnEcxbWbeNUXIPv2fWMGeN2ppUUBMQ1P6bYtAWkidqfBdtgY9SNhM
 XzEF5oJ8mF9M0fzcBX028HW901PNCLdedfC5yZCgHA6cnFUsDGutG7Cy2QcTQpfbz6Tj
 j5iA==
X-Gm-Message-State: AOAM530WOuIXgTRnP++9zyuvGNy/mnw5M/ldlXwGf6KJwRJPgymSfkEN
 yB9CoHskicMI1jajPmqDABA=
X-Google-Smtp-Source: ABdhPJwK0I9hP+SKpzutXB8R+blwaxUiqjIYiFSudus+Eh+S13Gs3cj38UFOVT0hJkL6cK5oZ4MuKg==
X-Received: by 2002:ac2:4c81:: with SMTP id d1mr19042396lfl.340.1632149047925; 
 Mon, 20 Sep 2021 07:44:07 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
 by smtp.gmail.com with ESMTPSA id y17sm1286651lfh.73.2021.09.20.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:44:07 -0700 (PDT)
Date: Mon, 20 Sep 2021 17:44:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc
Subject: Re: [PATCH v2 2/2] dt-bindings: snps,dw-apb-ssi: Use 'flash' node
 name instead of 'spi-flash' in example
Message-ID: <20210920144404.5vhynfdfukabxgav@mobilestation>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-3-a-nandan@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920142713.129295-3-a-nandan@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_074521_371165_31AF5999 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, Sep 20, 2021 at 07:57:13PM +0530, Apurva Nandan wrote:
> Change the nodename in the example with spi-nand from 'spi-flash@1'
> to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
> flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
> so make the spi-nand examples in dt-bindings use it too for uniformity.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems reasonable.
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index ca91201a9926..d7e08b03e204 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -171,7 +171,7 @@ examples:
>        cs-gpios = <&gpio0 13 0>,
>                   <&gpio0 14 0>;
>        rx-sample-delay-ns = <3>;
> -      spi-flash@1 {
> +      flash@1 {
>          compatible = "spi-nand";
>          reg = <1>;
>          rx-sample-delay-ns = <7>;
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
