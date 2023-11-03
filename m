Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9ABC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zhGeBmAHHPhkoanDL6LyaRzYmwnPphL1tO40v1Uuic=; b=x7n1dbFYO5dt/v
	Gv2oW07uoIKheLqGwNN8YscLAeS2dLoBJJ7N2EAjgnWOTFtCweOEup4BMkx9UBj9fbhPLk8bMhC4M
	JCDEGVirBM6MmBslEn1sH+E19lQmdjdy+0zlhJ52xUNu/eEL9QDkyiZv+m3OKkzKCFFn4ME55IpFh
	JQWwaiDI+qcmPO2OL96zBqjCvr0TApcW+8gbPAhnjRZg0HvJqP92W8ZlkNWrRdwcgBiwB9O1d5v1M
	RwaaJSxIBHDgZoxF1cQCUug9QKKB47wmUksMyy8tgBeK9AkgAnui/W1b3MayrShb9Xs5LhIWTxEQm
	LA3KyRFM1SCu5b7rJWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qytMZ-00BPeL-0v;
	Fri, 03 Nov 2023 12:33:23 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qytMT-00BPcT-1r
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 12:33:21 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9abc069c8bso1942719276.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699014791; x=1699619591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0KSdt9VlChlmft/PeayCtTjiy1+VOgZbmeLdttQHlx4=;
        b=n+HX4EbxZaHlQOAgXwSKR3sAl9UxyaPw4eMuekfMrEYWi9ztH6c49ZzmfCTZORX5WI
         XN89wF2yGr6riG/2gdW+MaCrVcRAvr8hW+miFzdLNaOwoc0QnO4SrrUYQ2qowmYRYGe3
         xOeCfAwC1XoSalshlSOopLbegVavSjDK5/JVhILh/brVbnkUAdUHsqX7jKbcYt+6P6+R
         wveL9f0MQgYTgGRwizZHZ04dJkTZAPHWnfCO0YZwrUnMqsHEBXsiHi85eCR5T35Jvuj7
         nByEao4fOCWU0c0grzu7qNlJlKNvFMoNzCtHazexjHUfez7lG8nFRv+Qa4iWi0aGkJeU
         uoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699014791; x=1699619591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KSdt9VlChlmft/PeayCtTjiy1+VOgZbmeLdttQHlx4=;
        b=bmDNKMtcXf0r6dKjJGyrZFVkIeWHPcO5TC3H21bNECm0oAiVsMy8BRDQAfZOMmVTkC
         aHnOilaGRJ05oIqZqqskzsztBFFAqYqYH3GkceoYlAgZK+WesNNg9sMsgWf0TMM1rWYA
         3wdyLVA1xufpZVpa2ypcdPWqR/a/869bONdjh/bBDXOLaCI6tDODsaYwuI3RZ0LruKhh
         TmDG66EXVHQYxmVCT/KDlNiE/tSr/piSWrxHl+mFntLGrlulfwEI3VrNjht55H7rhxrj
         ongo2+AZG/iXq5VKPp1QC0foq10sfzHgbHhFhKBVdUzQ88kNNXWicp2G0X+Dz1MSrjDd
         CXrQ==
X-Gm-Message-State: AOJu0YziU6Twcfx4mKa8CopAVgmx1jbwQWRre8zAv8ZJdLnXnv77D8Nt
	4p/j3ygByL6NFLNaNuzw75GTI/s5YlvUmNpWWF68RQ==
X-Google-Smtp-Source: AGHT+IEXP9Sio/dbsgBAJ9ZHE9EMw/w5GSOc9qOrt8FkvsM79cuDJRSXMr28R4x61MRT2ytqfIU9jf6RzHnPqpMk19A=
X-Received: by 2002:a25:37c6:0:b0:d9c:2b72:4fa5 with SMTP id
 e189-20020a2537c6000000b00d9c2b724fa5mr15696344yba.48.1699014791460; Fri, 03
 Nov 2023 05:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-2-quic_mdalam@quicinc.com> <b9af01d2-1a86-4b41-9bd6-3bf7a0dde1c0@linaro.org>
 <553c1373-c9a0-b2af-2286-058824e31bad@quicinc.com>
In-Reply-To: <553c1373-c9a0-b2af-2286-058824e31bad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 Nov 2023 14:33:00 +0200
Message-ID: <CAA8EJpp-xsP1x==a5DH8pKpy7XH75UF-L8ewKWmeL8ePtxUq-A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] mtd: nand: ecc-qcom: Add support for ECC Engine Driver
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, broonie@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	quic_srichara@quicinc.com, qpic_varada@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_053317_622368_A46F99F1 
X-CRM114-Status: GOOD (  27.41  )
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

On Fri, 3 Nov 2023 at 14:25, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
>
>
> On 10/31/2023 10:41 PM, Krzysztof Kozlowski wrote:
> > On 31/10/2023 13:03, Md Sadre Alam wrote:
> >
> > Eh? Empty?
>
> QPIC controller has the ecc pipelined so will keep the ecc support
> inlined in both raw nand and serial nand driver.
>
> Droping this driver since device node was NAK-ed
> https://www.spinics.net/lists/linux-arm-msm/msg177596.html

It seems, we have to repeat the same thing again and again:

It was not the device node that was NAKed. It was the patch that was
NAKed. Please read the emails carefully.

And next time please perform dtbs_check, dt_binding_check and
checkpatch before sending the patch.

It is perfectly fine to ask questions 'like we are getting we are
getting this and that issues with the bindings, please advise'. It is
not fine to skip that step completely.

> >
> >> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> >> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> >> ---
> >>   drivers/mtd/nand/Kconfig    |   7 ++
> >>   drivers/mtd/nand/Makefile   |   1 +
> >>   drivers/mtd/nand/ecc-qcom.c | 198 ++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 206 insertions(+)
> >>   create mode 100644 drivers/mtd/nand/ecc-qcom.c
> >>
> >
> > ...
> >
> >> +
> >> +    return 0;
> >> +}
> >> +EXPORT_SYMBOL(qcom_ecc_config);
> >> +
> >> +void qcom_ecc_enable(struct qcom_ecc *ecc)
> >> +{
> >> +    ecc->use_ecc = true;
> >> +}
> >> +EXPORT_SYMBOL(qcom_ecc_enable);
> >
> > Drop this and all other exports. Nothing here explains the need for them.
> >
> >> +
> >> +void qcom_ecc_disable(struct qcom_ecc *ecc)
> >> +{
> >> +    ecc->use_ecc = false;
> >> +}
> >> +EXPORT_SYMBOL(qcom_ecc_disable);
> >> +
> >> +static const struct of_device_id qpic_ecc_dt_match[] = {
> >> +    {
> >> +            .compatible = "qcom,ipq9574-ecc",
> >
> > Please run scripts/checkpatch.pl and fix reported warnings. Some
> > warnings can be ignored, but the code here looks like it needs a fix.
> > Feel free to get in touch if the warning is not clear.
> >
> > Checkpatch is preerquisite. Don't send patches which have obvious issues
> > pointed out by checkpatch. It's a waste of reviewers time.
> >
> >> +    },
> >> +    {},
> >> +};
> >> +
> >> +static int qpic_ecc_probe(struct platform_device *pdev)
> >> +{
> >> +    struct device *dev = &pdev->dev;
> >> +    struct qpic_ecc *ecc;
> >> +    u32 max_eccdata_size;
> >> +
> >> +    ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
> >> +    if (!ecc)
> >> +            return -ENOMEM;
> >> +
> >> +    ecc->caps = of_device_get_match_data(dev);
> >> +
> >> +    ecc->dev = dev;
> >> +    platform_set_drvdata(pdev, ecc);
> >> +    dev_info(dev, "probed\n");
> >
> > No, no such messages.
> >
> >
> >
> > Best regards,
> > Krzysztof
> >



-- 
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
