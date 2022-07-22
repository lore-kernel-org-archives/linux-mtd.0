Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF95C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bycMMg0qWbK1occGBN361qGlJO4M9nhn/n/QuaPAAbA=; b=p85kO2xmqJ0xgnbw6tjbD4xQx/
	qJqSV6Q5ptyDZjub6AK1/VEhbe0yWL0Tc7fDa1DJfuhM5++4EUVFi1QtqbaHTGfxuOdGOOEoJ1s1b
	2jvX3hTN1YoAMHdguYqDc8Ko62RjumWxe6vsS3hrI3kF33v6YC2bswgAHshVfzaV4kODM0CmxqLgL
	l7PeUKIRHKrk2gRYeEgorItILeLubu3S+WciD5QXqExde1tk0KSI4TSrrSYSJqj2QCrpMgG1u/ETU
	EqQVxwOWjXKABvC8sbMWSOYRkur+iK7IKu/l9tZyknYnJ8vQD3kkmbSHaFGlAerDwkJ0HxZQ0DLSj
	3VhPHETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1OF-00CFwj-T3; Fri, 22 Jul 2022 22:44:59 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1OC-00CFt3-2s
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 22:44:57 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-10dc6e9f500so2020065fac.4
        for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2022 15:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ioVQy2I3MdZUDLSAqqkpUrVLPrHTAHelafX5k6eqdBE=;
        b=p32CxmONxOe6sF5KISKwFLOYOmqXPKNcfCxR4TMZTbHkX0mMMaqZa9BFm3fSjC7MET
         jPPwa1J4V7VBvljZn1su9j4LEJYZujWm+C013cNEQq9XCLdtsf0+filxcDpP2TV1O4Ej
         8Oa/odrs9AY2Rwto/pMdMQYB2zelI866y9DJqGyGLUv0hbIDz3qucVrN3/stu9XqTDaK
         PeVoxSlmOzqIDK9Yg3/jzUn/lZBCcJ2av8xQptz+xDyRxsbOsleQo3MFNSppXzNqXFvO
         7x1R35rrh0r8ZaPTyxbRHtU39peJvnSS2mNLsAzl6HFIr7djv7DxhRMRMO7kUhzVKmZg
         5oAg==
X-Gm-Message-State: AJIora9KPDsp0Rqv/10TiWtxycRUz9WgknXfojNTCPQsy9nEvZvwusEl
	bl8wf4zciQ+ILB7Ivmgvkg==
X-Google-Smtp-Source: AGRyM1u3KIvwo/7k4pN2H7zBPDtRg3eayR02wXAeGUhiinm97BPU+V7kgU8N/QSyliNRp5lNNH2orQ==
X-Received: by 2002:a05:6870:4722:b0:10c:d04:ebcf with SMTP id b34-20020a056870472200b0010c0d04ebcfmr1124713oaq.80.1658529893918;
        Fri, 22 Jul 2022 15:44:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f97-20020a9d2c6a000000b0061c87262540sm2433071otb.65.2022.07.22.15.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 15:44:53 -0700 (PDT)
Received: (nullmailer pid 20307 invoked by uid 1000);
	Fri, 22 Jul 2022 22:44:50 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc, tmn505@gmail.com, reimu@sudomaker.com, miquel.raynal@bootlin.com, paul@crapouillou.net, rick.tyliu@ingenic.com, richard@nod.at, aric.pzqi@ingenic.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com, dongsheng.qiu@ingenic.com, vigneshr@ti.com
In-Reply-To: <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com> <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Date: Fri, 22 Jul 2022 16:44:50 -0600
Message-Id: <1658529890.261669.20305.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_154456_150925_FA2B52AF 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: multipart/mixed; boundary="===============4294814382174620556=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4294814382174620556==
Content-Type: text/plain

On Sat, 23 Jul 2022 00:48:29 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the SFC bindings for the X1000 SoC, the X1600 SoC, the X1830 SoC,
> and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  .../devicetree/bindings/spi/ingenic,sfc.yaml       | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/ingenic,sfc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/ingenic,sfc.yaml:52:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/ingenic,sfc.example.dts'
Documentation/devicetree/bindings/spi/ingenic,sfc.yaml:52:1: found a tab character where an indentation space is expected
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/spi/ingenic,sfc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/spi/ingenic,sfc.yaml:52:1: found a tab character where an indentation space is expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/ingenic,sfc.yaml: ignoring, error parsing file
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============4294814382174620556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4294814382174620556==--
