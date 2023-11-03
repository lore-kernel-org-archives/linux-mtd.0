Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56793C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0l5lUthBWTD+ZL7kVSDOUcO5yoLNM2pARLtI3iZQqk=; b=s+xscGFIKqtjxh
	yHbK9AffzlrsgvG5pfRE4pI4UjRaeUwOoeRvsc3o6PnHfOusRVrfHyIH0J8wT69q/OxjZGJtp34Dg
	cV8HOi616J6hH8ucJs3Mne/kw8tF9AoQjhg7kjPSmeVAhP6XUjJz5p25KXxMbpEA3CQbyZaE1P832
	dZFjvZtcV4kcFPzZFEnLTGQyDMtEiA0mpQrqplDCqubyoNCLaT9Ert0IJmZ41e7pRCIT/gTtYYK1h
	Th0nXGLY1LgUliRYgTvRGiUziNRfxsPfO4bqDyvkt1f5yqjLfPRSJmrpyVN57JMzs1/TEWrh1+lJa
	EGdp4+dh7TrgrOhWxSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyud8-00BW83-0w;
	Fri, 03 Nov 2023 13:54:34 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyud2-00BW7A-0q
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 13:54:32 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7b3d33663so24958567b3.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699019667; x=1699624467; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATfkuRplpjvcZPadAGRPy0zHxih4OimRMmk8d3DvTRo=;
        b=u+iw3dVUaDgMIAxb86+z0h14MZ3KaA4KuGOpnajippBaUCk1dYBe+fTs0neftjVgeE
         har3wuZadwyS47ifEp0egBELWgDnBIOfkoRktNFwfNFiQ2330YEfTDjqymH6jPxT4HHD
         jzgjvFtya5xxLhN8HCT8DVs2lbd/ftuoAHxlheb74NZMkWz7LI1+1J/4jwxHZyrLtIvf
         ZhmwFCFqM7bL488ANYzyd1IPNFnhE3HsbXBbbrZRlKirOKoN2aDwsSIeFkwCUykqOF/b
         FcyRGvQeGA+WUDmRaoet2VlhoMebRDuH4eVK+ugg6y4S+SW/7vmDgrJK+Uteewrm+x6N
         NH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019667; x=1699624467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATfkuRplpjvcZPadAGRPy0zHxih4OimRMmk8d3DvTRo=;
        b=Gd4KFXI6WAEcqwIGI5mQSv/efO9GrD9b2o3QWD5+D6NJU2X8wF0YMxP7J4B79u97hl
         mSlwYM7jr9nbLhaRGeQ0kY22vr7TpwGNPTTGUrxXg4PavPicNtJScJVsfOT9Lv3itged
         fQRoi+C1JGFDa+5K+71nKfXb0OrjkMhhaOMQW9z+MWvUO/1filyutW45G3lMRFFaHpjo
         HgeYt6lVqz27OD/wi+uZNO38pYQqlhBv/uVOGjXacd4VtkVHycWIR+n5tc2N8WW4WfDf
         eVZmTWPv+W/ucXrOM/rTsS2cIzOGYGACPx3bmq+SZyk+MknSN3bLpgPmwVTZobkVPPdA
         KQ2g==
X-Gm-Message-State: AOJu0YxbSPg838vD4sYO5Zrg24bVxBjcbRUCEWWOITWr46ay3HFt52aG
	LnLeo9piB5e+WHMZHR741gcbDvRXyc6djw0BlBENZQ==
X-Google-Smtp-Source: AGHT+IGJhi2HD1dMqgiPCYjBW7UEdwmlVZwkFEeH+M3ISG/Orbn/Hk+wHiAAb3Dh0JFHj3sIr8CsxN9AfX+vzx7+LpA=
X-Received: by 2002:a05:690c:a:b0:59e:9a44:9db9 with SMTP id
 bc10-20020a05690c000a00b0059e9a449db9mr2829093ywb.26.1699019667155; Fri, 03
 Nov 2023 06:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-2-quic_mdalam@quicinc.com> <b9af01d2-1a86-4b41-9bd6-3bf7a0dde1c0@linaro.org>
 <553c1373-c9a0-b2af-2286-058824e31bad@quicinc.com> <CAA8EJpp-xsP1x==a5DH8pKpy7XH75UF-L8ewKWmeL8ePtxUq-A@mail.gmail.com>
 <4b911907-44b9-c164-9648-3d399e557672@quicinc.com>
In-Reply-To: <4b911907-44b9-c164-9648-3d399e557672@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 3 Nov 2023 15:54:15 +0200
Message-ID: <CAA8EJpqtKJYK92Zd0EEZFA0duDzWBp-JObh4Dv9uR_ezhgnWuQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231103_065428_299619_8A75EA0E 
X-CRM114-Status: GOOD (  34.91  )
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

On Fri, 3 Nov 2023 at 15:24, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
>
>
> On 11/3/2023 6:03 PM, Dmitry Baryshkov wrote:
> > On Fri, 3 Nov 2023 at 14:25, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 10/31/2023 10:41 PM, Krzysztof Kozlowski wrote:
> >>> On 31/10/2023 13:03, Md Sadre Alam wrote:
> >>>
> >>> Eh? Empty?
> >>
> >> QPIC controller has the ecc pipelined so will keep the ecc support
> >> inlined in both raw nand and serial nand driver.
> >>
> >> Droping this driver since device node was NAK-ed
> >> https://www.spinics.net/lists/linux-arm-msm/msg177596.html
> >
> > It seems, we have to repeat the same thing again and again:
> >
> > It was not the device node that was NAKed. It was the patch that was
> > NAKed. Please read the emails carefully.
> >
> > And next time please perform dtbs_check, dt_binding_check and
> > checkpatch before sending the patch.
> >
> > It is perfectly fine to ask questions 'like we are getting we are
> > getting this and that issues with the bindings, please advise'. It is
> > not fine to skip that step completely.
>
> Sorry in V1 will run all basic checks.
>
> Based on below feedback [1] and NAK on the device node patch
> got idea of having separate device node for ECC is not acceptable.
> Could you please help to clarify that.
>
> Since ECC block is inlined with QPIC controller so is the below
> device node acceptable ?

No, the node below is not acceptable. And you have already got two
reasons for that. Let me repeat them for you:

- it is "okay" not "ok"
- no underscores in node names.

If you want to have a more meaningful discussion, please provide full
ECC + NAND + SPI DT bindings, only then we can discuss them.

>     bch: qpic_ecc {
>                            compatible = "qcom,ipq9574-ecc";
>                            status = "ok";
>                    };
>
>   [1] https://www.spinics.net/lists/linux-arm-msm/msg177525.html
>
> >
> >>>
> >>>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> >>>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> >>>> ---
> >>>>    drivers/mtd/nand/Kconfig    |   7 ++
> >>>>    drivers/mtd/nand/Makefile   |   1 +
> >>>>    drivers/mtd/nand/ecc-qcom.c | 198 ++++++++++++++++++++++++++++++++++++
> >>>>    3 files changed, 206 insertions(+)
> >>>>    create mode 100644 drivers/mtd/nand/ecc-qcom.c
> >>>>
> >>>
> >>> ...
> >>>
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +EXPORT_SYMBOL(qcom_ecc_config);
> >>>> +
> >>>> +void qcom_ecc_enable(struct qcom_ecc *ecc)
> >>>> +{
> >>>> +    ecc->use_ecc = true;
> >>>> +}
> >>>> +EXPORT_SYMBOL(qcom_ecc_enable);
> >>>
> >>> Drop this and all other exports. Nothing here explains the need for them.
> >>>
> >>>> +
> >>>> +void qcom_ecc_disable(struct qcom_ecc *ecc)
> >>>> +{
> >>>> +    ecc->use_ecc = false;
> >>>> +}
> >>>> +EXPORT_SYMBOL(qcom_ecc_disable);
> >>>> +
> >>>> +static const struct of_device_id qpic_ecc_dt_match[] = {
> >>>> +    {
> >>>> +            .compatible = "qcom,ipq9574-ecc",
> >>>
> >>> Please run scripts/checkpatch.pl and fix reported warnings. Some
> >>> warnings can be ignored, but the code here looks like it needs a fix.
> >>> Feel free to get in touch if the warning is not clear.
> >>>
> >>> Checkpatch is preerquisite. Don't send patches which have obvious issues
> >>> pointed out by checkpatch. It's a waste of reviewers time.
> >>>
> >>>> +    },
> >>>> +    {},
> >>>> +};
> >>>> +
> >>>> +static int qpic_ecc_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +    struct device *dev = &pdev->dev;
> >>>> +    struct qpic_ecc *ecc;
> >>>> +    u32 max_eccdata_size;
> >>>> +
> >>>> +    ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
> >>>> +    if (!ecc)
> >>>> +            return -ENOMEM;
> >>>> +
> >>>> +    ecc->caps = of_device_get_match_data(dev);
> >>>> +
> >>>> +    ecc->dev = dev;
> >>>> +    platform_set_drvdata(pdev, ecc);
> >>>> +    dev_info(dev, "probed\n");
> >>>
> >>> No, no such messages.
> >>>
> >>>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
