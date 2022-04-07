Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B000DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMkIDY+WaU1ZtGIKrRDy2DgnIVG1qhKhCK0hKytjA6I=; b=KDWHOa3n00gmCz
	K5zcCC9AhBK1hNGbOpL+fXzBmdnz44Xx4JDiDIcDTo56qn/FgmBn3jbAaxxouFduMPgqRtxkk5yVo
	2MkzmGKhS4nKwuj3+AOUjaHZYFmxDYb5lBCH3kpsRQ9pB59AxN+o+eJ5eqDt21M4wq9RXJunlQqrx
	LHucoHHY7NIcar8sLAoI8B4tI7eM4X+aSks/IE/Lc/4ds3EPFQ2XzlOKuWuq0x/n3WHaSV15dg28m
	TDy4CehRU7Z2i6W/JxTsMKHqeCe9dqVrvUSSJQr24rUJztJaKxzCOqW561ee1Aiaitb/eifXGehiF
	YdfadeJD3o/mI6CVI6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncSX8-00CE2v-8F; Thu, 07 Apr 2022 13:50:46 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncSWu-00CDzf-N3
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 13:50:38 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso3929301ots.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 06:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DxCif+I+h3qUJ8PQJ1TMI3wZ+FQkVzQw6LHqikw6lm0=;
 b=fMXtC6+NtVP7SLdHZUpZkNiGDFdAaFcHZY4eNA7+3nnYNef+IMee0XYROpeb1zw8hH
 dSXfZCtMx7J+5og9+uihnil1MFL90avEDXzwgvHxxGW2MJjpls6+DnO5d6p9n/Vwyal1
 HeuIqGkLjQVmiPOBxQiEYuctJI6t01ocfHcZHISMR12DSDtWjS74FQBXcnnC/Pop3tFK
 vEBpNSwNeABl3CRkvtVQ6sDTxGFoLKoZm2gtGJFaLVr2HIxh7MjXG31yIJ29+Mo9Bk7w
 56Kq7Qv+ckkfkLvIJUWjK+80S9Yv7KUDjLwHPoLiTNWUYJERRqUwcH8Tn4OM8ko7mK96
 q5sA==
X-Gm-Message-State: AOAM532luLyGCYpbsnGPSESfeyqjXW4nojZ0K7t1miS9+tyzcfpKt8mZ
 KWGdqOEAjE1sA8XMMjtjXw==
X-Google-Smtp-Source: ABdhPJz7AbEDxicrWgNX9xYJXUZeZZWDvsq5xGhm1fr6P71xE5bIBsFHeBa6kF9+Ki73uORHgipl2Q==
X-Received: by 2002:a05:6830:4126:b0:5c9:2a3e:be43 with SMTP id
 w38-20020a056830412600b005c92a3ebe43mr4755801ott.143.1649339430608; 
 Thu, 07 Apr 2022 06:50:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056808151000b002f734da0881sm7885466oiw.57.2022.04.07.06.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:50:29 -0700 (PDT)
Received: (nullmailer pid 795408 invoked by uid 1000);
 Thu, 07 Apr 2022 13:50:27 -0000
From: Rob Herring <robh@kernel.org>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Karim <Karimdplay@gmail.com>, NOGUCHI Hiroshi <drvlabo@gmail.com>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20220406195946.2019-1-csharper2005@gmail.com>
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Date: Thu, 07 Apr 2022 08:50:27 -0500
Message-Id: <1649339427.653492.795407.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_065032_785895_7B3659EF 
X-CRM114-Status: GOOD (  11.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 06 Apr 2022 19:59:46 +0000, Mikhail Zhilkin wrote:
> Add YAML binding for Sercomm partition parser.
> 
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
> ---
>  .../mtd/partitions/sercomm,sc-partitions.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.example.dts:21.13-14 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
