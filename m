Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F261BC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJwQQulXD2c/zW0dCnWDcsWjWEiTDFZlcFDOyYPyves=; b=NxYefweZQoWD9c
	KF0N+r5eOt0Z2+yzIqwxsdOOFAQ3J4i7wfc82ijLZGsaomIFBSx4jWB/j3R8jGG95YUS7JnAB1Btn
	s/3SngVtWS1TtZ6Oi6+67DBwqchv4UkpLtFMp58zLoPllzQ1PrlwTcpMp/cQBq+TLfcPb68DRq8G9
	ztjqX3xw5sHwtcpF8CK0dcvSdXiWmKhJ3pSnStBLdGyzHfxtam16VfuK9IzLeViCODW2UurLE3lYJ
	lTL8jK/dTmG21NtKg2jbFXfAUFFLQiu/upBD9MnILcWFBzgxQdVARpnZ9+eZIKXd1skGuZ+AL2Gor
	XUxD0pdJkcjy++7fpnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGYC-001X4O-L0; Fri, 13 Jan 2023 09:40:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGYA-001X3M-Bq
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 09:40:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id vm8so50977122ejc.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hC9HEjzcXeU38jBnMA4OTOYS/MiZjNhem7YnIhwAh7s=;
        b=Q5Zk3S36YShgqdL+3yUXsNOacKVIrqq04rYu4yNXXokQ8yGkMtwqPcaO2OSOmP0eKv
         eNBSBR2iu0EM4xVPyiHWQ8oRhFTqBPPPLINf36ekOOvhaoLTHr2yXQdPtxE4UtTOIOqS
         3MNsu1z/mjVmUVZVaPtoCgz1SZbJqt7/36acQN8ATMcSCIQxSPAhI4HAmcgbcFAIwnWd
         5+CNMPFYM1ox7q6K7WibuYST3Ei1kOOQ/Xz5XC65LQnG/5ov8aXfPRetbOB5GpFQE3I9
         jqQRxOx58QUAvp+VC/5+gagtR+Xfa+UEFz126c0ANeNSFrlJxfTaUTBqHcEvOhZxM/p0
         WblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hC9HEjzcXeU38jBnMA4OTOYS/MiZjNhem7YnIhwAh7s=;
        b=iO+fQLbEeOOJ9SiAscQBMIUbSGj7xi7zRI1deLNdk2TwlyXSooPaXPukJOSO8XaH7F
         AJ72iDClwX4Z5YiiEOGsXHWaEbhIUzl4HRrZjK7dXaQjpgCsb1O4um+yzAvYK4bWg/RD
         VLGMKoQgagmpdjutEnSocOvWtLzCD3li96qDqQYuxD8EtpH30qnTnD60PtaliK1IYsNF
         HE91twzOevtV0IbEpyb1RQWBGHXhx2DHR58h8HWIMiAcWNkNzgStWGMBb0yYOiiMa5dI
         7ALIWTR67il3B+QhnmBVtmSIGJbnmSUhsWrWxLlKNDwuJIg4z+SNo1Lrs4ZCHk3QJ56A
         SMDQ==
X-Gm-Message-State: AFqh2krXG3DPP1xb8Mddeg/Fh5XgUrwBBdmcmJLbOYS3fwv29F5SCdjN
	8xizd4O66zeq/17Ry0n0iRvg+O3ZFkymXuV1S6c=
X-Google-Smtp-Source: AMrXdXufU1OhlckllATLjWDVALvXEx0rW/mRsVEl4pI+agb63em+RGzaFRYt3c87JUfNpw/XmRJslOQ3sEKUiblbb+A=
X-Received: by 2002:a17:906:3918:b0:7c0:b3a1:2caf with SMTP id
 f24-20020a170906391800b007c0b3a12cafmr7916322eje.443.1673602830180; Fri, 13
 Jan 2023 01:40:30 -0800 (PST)
MIME-Version: 1.0
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 13 Jan 2023 17:40:19 +0800
Message-ID: <CAAQoYRkBHV296oXOVWUh7dSJXS5CQYeMdpQc78ZZVRU+hhmSmw@mail.gmail.com>
Subject: [PATCH v2 2/3] mtd: rawnand: Prepare the late addition of supported
 operation checks
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_014038_440344_598E4B41 
X-CRM114-Status: GOOD (  16.90  )
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

> Add an empty envelope just to show how to add additional checks for new
> operations. This is going to be used for sequential cached reads, which
> require the page size to be known (and the discovery to be over), hence
> the "late" designation.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 83bfb1ba2fa3..34395d5d3a47 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5009,6 +5009,14 @@ static void rawnand_early_check_supported_ops(struct nand_chip *chip)
>   rawnand_check_data_only_read_support(chip);
>  }

> +static void rawnand_late_check_supported_ops(struct nand_chip *chip)
> +{
> + /* The supported_op fields should not be set by individual drivers */
> +
> + if (!nand_has_exec_op(chip))
> + return;
> +}
> +
> /*
>  * Get the flash and manufacturer id and lookup if the type is supported.
>  */
> @@ -6345,6 +6353,8 @@ static int nand_scan_tail(struct nand_chip *chip)
>     goto err_free_interface_config;
>   }
>
> + rawnand_late_check_supported_ops(chip);
> +
>   /*
>    * Look for secure regions in the NAND chip. These regions are supposed
>    * to be protected by a secure element like Trustzone. So the read/write
> --
> 2.34.1

Tested-by: Liao Jaime <jaimeliao.tw@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
