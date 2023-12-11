Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1C3C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I58pNtPqLKSOpKPM/p7TTci6EgJxEtgZNoFJ4Ssi1co=; b=eDtUm5SIz3OsaU
	J6Ro5E5hB5Yi/VRMk7BexA9tI1yB3OlXFtAuADqH/8eLShild26Zfu5KuhT6MHgNhGWmCLTNZKjDR
	MI6nwof69eiasUsROIkB5AHJfJwcuMfaK9KtTfEKRpeJHQqDOsYPINdTZAF0PetfxE1wfIbDMUY+O
	HMZtHMcDmzKD9v/wEhUsQLMaWomSv5kGok5FOVI92ouSpnmWPeeScoxCrbAqUdy6HPiy0y3hnIiSv
	ueVJPKuTL9O0MU2XnFBLsrGs9c8IY3wuZTNbKkWz8ib8O5Z7m00NqRv7I8JKoipXxqt2d6GQXUqGO
	jDs0dfvJLVabCTlplL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCj2S-005lHV-1S;
	Mon, 11 Dec 2023 16:21:48 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCj2B-005lAr-1k
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 16:21:45 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d9daa5207eso3036808a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 08:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311689; x=1702916489;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=348QJQptRlElLNB1tIjm1p1XzL85PcSJzURBK+WTJok=;
        b=E+inHCOgjfkTsk3ZP3AeAQIgXfKetxXTx/rTQSOjstTxCR0a3WAQcWwdCT0j+9hADQ
         dchPgv92zOwWtny+cFs28U3GcYmrEOFafndE3IsVwEM1OeLHSXULPTP0jwcq0OStmcFe
         wQJvuClCx9pLWOVGBp4RaJOU0JBmTGbRrIfLL8+5idDyOiWTr91MFlHISqgbJBhtj1jJ
         nqxQ+dVjncSIp9kkdW6odb8BIeQ3HBDhheIrMV26Y7uF3+q+/SLMH5herM7Qzgmz3URA
         lppVhKmgMGCehILdLsMMHT0HUttAAEK4sHbAgVJW5dlkIg9cVlXBioUDcJ1k3Qo1tXTh
         oUFQ==
X-Gm-Message-State: AOJu0YypMJfeH9rdhuXaSlBxWQjWg9NlgcypqX0oNBkySjfBm2q181iZ
	zZNv4hZ8z2MUuL1fYzbdEw==
X-Google-Smtp-Source: AGHT+IG4LPuDJKeXoC293asrqjuZQ2jvok4fn8Mx9ppkj4Ewou+tIJ9vo6O+pLBKP5opTLtBKO0hng==
X-Received: by 2002:a05:6870:82a0:b0:1fb:75b:99a4 with SMTP id q32-20020a05687082a000b001fb075b99a4mr6481626oae.83.1702311688423;
        Mon, 11 Dec 2023 08:21:28 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fw25-20020a056870081900b001fadabf6626sm2507717oab.23.2023.12.11.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:21:27 -0800 (PST)
Received: (nullmailer pid 2365869 invoked by uid 1000);
	Mon, 11 Dec 2023 16:21:26 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Davidlohr Bueso <dave@stgolabs.net>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-block@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, Jens Axboe <axboe@kernel.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-efi@vger.kernel.org, Richard Weinberger <richard@nod.at>
In-Reply-To: <20231211151244.289349-7-romain.gantois@bootlin.com>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
 <20231211151244.289349-7-romain.gantois@bootlin.com>
Message-Id: <170231168656.2365852.16098091734582168376.robh@kernel.org>
Subject: Re: [RFC PATCH 6/6] dt-bindings: mtd: add GPT partition bindings
Date: Mon, 11 Dec 2023 10:21:26 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_082132_190105_FEFCEFBB 
X-CRM114-Status: GOOD (  14.06  )
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


On Mon, 11 Dec 2023 16:12:42 +0100, Romain Gantois wrote:
> Allow parsing GPT layouts on MTD devices.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../bindings/mtd/partitions/gpt.yaml          | 41 +++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml   |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/gpt.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/partitions/gpt.yaml:11:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/mtd/partitions/gpt.example.dts'
Documentation/devicetree/bindings/mtd/partitions/gpt.yaml:11:1: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/mtd/partitions/gpt.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml:
while scanning a simple key
  in "<unicode string>", line 10, column 1
could not find expected ':'
  in "<unicode string>", line 11, column 1
./Documentation/devicetree/bindings/mtd/partitions/gpt.yaml:11:1: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/gpt.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231211151244.289349-7-romain.gantois@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
