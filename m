Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB383ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3JktEeh5usZjK8SFKpm6LOEGxdFidE3R93Pa+0RRYo=; b=HP/ZheDf4alTEx
	VGVbVmz6x53/jisxqIR3AIcyIJAVirbwtVC6cMFRUMwWOsPuV/2NxTXA52NVmBmx+o31uHf/DEL0j
	oOPzoyr3HsNJsbW/7TCU0MVP0ri7gkuw1PN5PN8qsNKD1iRwjggSKwTQYvFQOWUdR3/bv29w832p7
	rP2ZMGtTopdAsJciPNWvLVV7wDimmDXNKKF17ylXM9HM3c/5FAqDC6W7I5T624n/jc6zx0EFtzEcH
	IwyFaEucPQlYXA2ATBZjK6urP/41wJs4yMb8Jx+3hxztUzlkLiLWx4TcnVyvSbmknQnqjklvNyG3k
	Pjp8ixjXQ99etwnHtT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opajm-00EOL6-Ce; Mon, 31 Oct 2022 19:46:22 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opajb-00EOIx-8k; Mon, 31 Oct 2022 19:46:12 +0000
Received: by mail-oi1-f173.google.com with SMTP id r76so7312395oie.13;
        Mon, 31 Oct 2022 12:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqPBfh/sHLOCUkJwzrRXE8QNX4/bCsSnqwI1z6aeHg0=;
        b=ItOY7y3Jw/PHhfX+jqq0GJKnoMEvNjZyX0joN0oUjYMpJIdebZ9UYUPyJsAAsIlf6L
         RlygQ7C0yHPqN7tYXuFMDCQ6yxX8to81Hep1J39nPkaFaQuT/1fUvSE7oWqw+mLCK/n+
         R9WYAuF7hEcWt0pEFXbLpriLhSR69uH1uW32gtSFFvR4Clyw9aXWPymuWuKoIPhhwAL/
         N++/A6Vr5TFufoQ9b1y1k1584iA97DgzO3JynD/YF64eSzfjt5cKP+ToTsaND9SA9xt3
         H3gsprcav/spJUBvlfjHJjF28Dm/ZTVTG/bs0FeS96jWBqTDLTfZkRNie5CIgLeELUdv
         v4Mw==
X-Gm-Message-State: ACrzQf2vYpW4Ar4+Fl7MhgwWL5nHSRiptJnkSvWBBzOpk/B6y+8KpFcl
	3WjS8izBpymSguviS1mKWg==
X-Google-Smtp-Source: AMsMyM5DjCcuMLrtnUf3Usg92SdXXm4p/mUKMHioTXVsEWUiB+C3u5HR/ONxnbc5Kn3g5zOFM7xPVQ==
X-Received: by 2002:a05:6808:178a:b0:359:fe7a:14ac with SMTP id bg10-20020a056808178a00b00359fe7a14acmr4520490oib.34.1667245562350;
        Mon, 31 Oct 2022 12:46:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0685000000b0066c41be56e7sm2778937otx.55.2022.10.31.12.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:46:01 -0700 (PDT)
Received: (nullmailer pid 3307676 invoked by uid 1000);
	Mon, 31 Oct 2022 19:46:03 -0000
Date: Mon, 31 Oct 2022 14:46:03 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Richard Weinberger <richard@nod.at>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Message-ID: <166724556189.3307605.7479486129187361560.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_124611_326450_E0984D94 
X-CRM114-Status: GOOD (  11.54  )
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


On Sat, 29 Oct 2022 01:59:25 +0200, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
