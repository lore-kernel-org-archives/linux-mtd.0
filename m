Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F85EC2BA1B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwYDfxSQ1leqtI/oiWy9vFy1v2sdp17yV+EGfq23xRc=; b=3ZZN76ZkE7dVEh
	I3WjVWbF2QqJ2d0C4M/qRA0a5XesasWzhD3rIxZugiOzuQukXFLVNl5QBKGnv2TenmKh7yPYmlVpR
	OzBlNoSfbd84RV8GrDW8QWswp+w/HlbmuWQjlpyUJEOIIeomPzDSMU21Pc05W/O3kAhusHFgbcXVo
	UyvpekOs7UaeYeCEbTx/7xqjXn6qvnt9lyrsa/6B974zzW9NVvaCg1bEbR8m22M8WXJBV/GxlJRkR
	UEpVTCiY480U9nNxGL3d950mVOdj3oNYgO40ceO1/BPj43W4KLh2+Vm9cXwRlJ2IxoGvha+Il/6Uy
	pr0vOxKl2H3rcSYZpPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyLC-00Bi9z-1P;
	Mon, 09 Oct 2023 22:03:06 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyL9-00Bi86-0n
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 22:03:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so13101664a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 15:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696888978; x=1697493778; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjq4mQ6ok9vbI4s2uRAhNlsstGCnbhA6GK5uk3ZBc6s=;
        b=WZzLViQdf6mUjANN5gifqxwLscmbeCuezWrbXjhQkTNxqCzeL+2wraSPwPT05hMkwI
         E4A6b+WZ38K+B31a84ua4AcvrRQPOmlL35A/q1K6ZQCi64VS1r0fWIldH+WeiUBQeBZR
         kfViMrzCR6q4j1i6RUHe1o6mfth++bDlfFsaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696888978; x=1697493778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rjq4mQ6ok9vbI4s2uRAhNlsstGCnbhA6GK5uk3ZBc6s=;
        b=gwTBauOTSTOOOgtS2JxBdZn6/qyb/hNSCJPgUXGuf/kwTKPlHd50bjB0bwpoUMdiAm
         OHy4xdIa1rp7LFqU+wprF1phGff0m3gho3A0xEQC4gDKpw96QYZn6gR5ckIvm89Om+Cb
         b1WeP2VxToSlb5wCi9+ddOZ8LtOCi6I3QngbqPdGslpTyJLSn3AIPnpA7qN9lMNm2jD8
         Vyp8dMFKnIYzidOM+ui1t5f4NnDaIto/2Mfh1BDRD2DQ+M18S4Ar5hbYcbVVfgApZzq8
         cxUO9q4633UOJ0QZd/GuIGl7NjvE9RDvhfnsfl8l5JgjNohcRDEuRmecj4eWISXp4bnu
         FFPw==
X-Gm-Message-State: AOJu0YwgYXx4/Ty/hB5qXdTce41toiqLlZAKex/LPsZay3C8xO+WQwP7
	kPKKHTOGhUd3P8vYHPIk8n9KVC5ovb4InwU4vAZadg==
X-Google-Smtp-Source: AGHT+IEtqWvxQ0Vgm+Jr6dpgRLt/9LzEMO9okKuLlajtYR50GrEGRE87hGyzUOZ2jPFoAGYSrwhOp2INK3c35n2NsdE=
X-Received: by 2002:a17:906:af10:b0:9ad:8a9e:23ee with SMTP id
 lx16-20020a170906af1000b009ad8a9e23eemr11254081ejb.13.1696888978460; Mon, 09
 Oct 2023 15:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231009201005.1964794-1-sjg@chromium.org> <20231009201005.1964794-2-sjg@chromium.org>
 <169688631230.3255827.3268332902446136449.robh@kernel.org>
In-Reply-To: <169688631230.3255827.3268332902446136449.robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 9 Oct 2023 16:02:40 -0600
Message-ID: <CAPnjgZ3-eX5r02K_499wz3dQOs8nOO5o16CL9w1xyNsTXL0L2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	Richard Weinberger <richard@nod.at>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tom Rini <trini@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_150303_302112_8707EF58 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Rob,

On Mon, 9 Oct 2023 at 15:18, Rob Herring <robh@kernel.org> wrote:
>
>
> On Mon, 09 Oct 2023 14:10:00 -0600, Simon Glass wrote:
> > Add two compatible for binman entries, as a starting point for the
> > schema.
> >
> > Note that, after discussion on v2, we decided to keep the existing
> > meaning of label so as not to require changes to existing userspace
> > software when moving to use binman nodes to specify the firmware
> > layout.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Drop fixed-partitions from the example
> > - Use compatible instead of label
> >
> > Changes in v2:
> > - Use plain partition@xxx for the node name
> >
> >  .../mtd/partitions/binman-partition.yaml      | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml: properties:compatible:items: {'enum': ['u-boot', 'atf-bl31']} is not of type 'array'
>         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231009201005.1964794-2-sjg@chromium.org
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

Oh dear, I didn't notice that output but I see it now. Could the check
return a non-zero exit code if something goes wrong?

Anyway, I'll send v4

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
