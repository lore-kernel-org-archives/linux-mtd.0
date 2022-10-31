Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A8FA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8y7y+tYn21nQ54GWOfniK42zkVKqkC1Dw71KyC0vLA=; b=c7Qzymaaz05bk0
	7766rH1V2FV8MdqWhLEJzr1Wi5Ahs7OzkOlOyRJLlksRfIUKk+g+j7JUtPhbGO555o1yW+YytNd8a
	zoBJ29avuY5ZE+0KVmjjPwl9zux4qLhwMeXIPXQDrwdhewnTmi2Y26WBhZFvzbn8s+u/EGg1sFXRh
	ljzFp6Loq4fSp0TQn1aElO/oMLpyBYRmgj4sEowh6Q+jlaAP51smsNeWVCXp7lz6/EEjGxO5SU53G
	e8RS1V88s0v0daa+Tc19CcmaLoVaIiXZy34irFfpiBAvi4hP5xK0qcWEahpn5y4HWD6s0bAqwVCQx
	s9/pdricVmmLkdcHYSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaXe-00EEtG-Vk; Mon, 31 Oct 2022 19:33:51 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaXc-00EEpr-0F; Mon, 31 Oct 2022 19:33:49 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13ba9a4430cso14547165fac.11;
        Mon, 31 Oct 2022 12:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahMyyoN83BTbMMrhkPxnMNFzT+CMI4++uXPUE/MdHpM=;
        b=08/tXngfYWUDt5Bo6LWqZ8XTi6W/grYTF0ffzo9Yb5ao9PPcu4gVVlmLqCjvmyzAT/
         V0su8UhBLoVRcfhAhMGmnFxLlJAVemkGgPkiFXjRq3TCfnWH9IU5YZ31HWPqnHtstbkq
         6GeENJE+AVGPOOgZRy6MIJket5LDENpqR73/krwy+nFrrdzK+kjBH6aA+N25BzXoDxi0
         dU3RADRKFahn/HsP5b5HM1LADkjxuj3khOGadSO6R0ygMimopD1nb7Q1jXOqIzUC5MIQ
         BQv5LOl6i7eMa+zZBDF2nw+jtw46ESjXJFwMRqcts0b8GyMrufJ5QD6/NxIPXs6URtwB
         QERg==
X-Gm-Message-State: ACrzQf2pZYbI88IzCuI1IXUSEkpu9IzAZ959sxoJagoGmrNgvtgAENRt
	UgZUP3t+BaxTg9vpM1XGBg==
X-Google-Smtp-Source: AMsMyM4l+TcsCdFGnvR3QaiG9UCl2pWcUZK2fq3fnZnqeQiOFRnod/8llhOVvWw3ORc5uoJnulLmDQ==
X-Received: by 2002:a05:6870:96a7:b0:13b:ceea:baf8 with SMTP id o39-20020a05687096a700b0013bceeabaf8mr18519996oaq.88.1667244825301;
        Mon, 31 Oct 2022 12:33:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bj23-20020a056808199700b00353ef11d6c9sm2656248oib.19.2022.10.31.12.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:33:44 -0700 (PDT)
Received: (nullmailer pid 3294529 invoked by uid 1000);
	Mon, 31 Oct 2022 19:33:46 -0000
Date: Mon, 31 Oct 2022 14:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Message-ID: <20221031193346.GB3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_123348_064563_0367FA67 
X-CRM114-Status: GOOD (  15.34  )
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

On Sat, Oct 29, 2022 at 01:59:23AM +0200, Miquel Raynal wrote:
> there to avoid the need to do it in each and every file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 9fcaa61b046c..10684b233ae3 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,6 +21,9 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  '#address-cells': true
> +  '#size-cells': true
> +

These are only for 'partition' nodes, right? If so, they should be 
marked deprecated too.

>    partitions:
>      type: object
>      properties:
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
