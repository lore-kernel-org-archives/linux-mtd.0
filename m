Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CDDC5478A
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSf95loIwokGHUl45ftgXqogVEovo8KPgESf7FOyjyA=; b=I2Bma/detI3K74
	N3hbqWlIm1qPfSiKisArPWUysAfRUW8uCtJTEm0gT9LVQax1pHibIDmJCCEG/Nt3bj887VbRnTlNz
	twUbbb3i5qnjP2Jwl5NFNM5tt11ir3l6bjArth3fYEqSuNwg2TFCJc73WotkAnyLwxc8E7yLavsxM
	bYzHsq1ev7HdyJu78lOmrnnez++AAxZn/iiJoHm7Ll9A3iDlQKKh487cpqX6i47gEp9VoNM7kQ1x0
	Dq/4rBx3lrDf/r8ARGsGYg4AWRF4vND9At1JvlMkHxlw7nC+RC9T0rFAAIdoTTeWHrmlEo5r0u0rZ
	El/iy/6PSQmBnpyEA/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcSfA-0000000FNIk-2yJx;
	Tue, 20 Feb 2024 16:08:08 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcSf8-0000000FNHW-1YNi
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 16:08:07 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so5165704276.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708445282; x=1709050082; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPNuR0RFE8pSD1DrnvdZhM1blj+nttBa3INihpwmSHQ=;
        b=vTlxZ1SK5QrqhOjkws5HeDvj3NE7vOZcMAiHYhvaan789mH0I445Awk46m94hY3mOQ
         KRlYWI0Rd7oQIe5uiHeJUZ/sShqSAW4NWlW7Dx2u6PCFmQLUugV4lf0pXIqPgLfcVMzq
         udwHNRPD6+DYNrxlmpup0bgYprpK9U5McYgphwi2ffPK5g2xX0Jm3CTqmB+54DB7gDSE
         ky1In4rUUNJYgBqMc+zec5CKAE+RlxQMaiAFpkK6MqhIIrhuzBNxLlllr0SSD+agtCeP
         4SOqAXla3DGygy7d2+yO5WVAAi2yB4vjVAqAyBrvkScS70O8vbWYFTqghTJw34l9bLoL
         xlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708445282; x=1709050082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPNuR0RFE8pSD1DrnvdZhM1blj+nttBa3INihpwmSHQ=;
        b=MLpsEZumkhcYxScYXsCDUKvSfVR6Rh0NiyKpvfNzb+coszsIEVoakvDTs7CxCp8BGt
         SDhrry7BxitZLVQVvoSfH7m9cXk1c3EOkP6DCVhNxrrThYuFl70VE0zOFdsBihMBrx4+
         kB7xP4cy9a94HfqqYN1E4axh/LavQubYaRH957S6/GknEMJthcXsqYIi1z9/nQJToCdh
         epWemXzM00Trae2gVL7nXkENj/MROaoet4P/0F57o3K6mhm02pMZ1YjMbI/JwXw6KOUC
         qOPreBUGJhJ2KXKrfk4D63Q7rKQN4QN/9XSS16ipqACFdvyZJjNU989NSsRfTEAnMiH4
         wXmA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIoqYJhqRUvGNTd/Zm0X/Z1I6PtBXbxbAIrRjRukHMJh1jmmsXYykAaGNZgVTc02CPjSnvlTvwcmhZKija+P5KQAL/ib5yHU9ldXKrA==
X-Gm-Message-State: AOJu0YwROa6xRvZs2mI4pcxQrxOhYBULPFIk+mAiTG7na7ymyJPFw87p
	pQm2ha5BwatqizddQzfUcWxOlGdQyQ89f9lqmh6doxWn4EF19caW0z15xRVCAMgjWNhzc+0UhwJ
	KkhPbl3GNBqepRFLCzcZqR5gbohBILlFNqrAOIg==
X-Google-Smtp-Source: AGHT+IGJIf6HNRopOaK1bB1PZ46D49gYGhby9upA9L6LnRT4P9HNoY6jS/xmcQevNc/ziwC9Osd+/ubjfDFEw3XqTOc=
X-Received: by 2002:a25:aaa4:0:b0:dcc:b719:4e50 with SMTP id
 t33-20020a25aaa4000000b00dccb7194e50mr13951440ybi.41.1708445282330; Tue, 20
 Feb 2024 08:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-3-quic_mdalam@quicinc.com> <CAA8EJpquDwDg+OrZKeJrTWEtokCF7uyHMyzCFK2etSsDip8_6Q@mail.gmail.com>
 <c574c9ab-0a47-2dc8-9ddd-c08f1b770d7e@quicinc.com>
In-Reply-To: <c574c9ab-0a47-2dc8-9ddd-c08f1b770d7e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 18:07:50 +0200
Message-ID: <CAA8EJprkwv0QstJTveM+06DbMjgBCEVBRhBb5i2QM6LxmmCQug@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: mtd: nand: Add qpic_common API file
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_080806_435382_2AF41C43 
X-CRM114-Status: GOOD (  29.87  )
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

On Tue, 20 Feb 2024 at 17:59, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
>
>
> On 2/15/2024 8:30 PM, Dmitry Baryshkov wrote:
> > On Thu, 15 Feb 2024 at 15:53, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
> >>
> >> Add qpic_common.c file which hold all the common
> >> qpic APIs which will be used by both qpic raw nand
> >> driver and qpic spi nand driver.
> >>
> >> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> >> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> >> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> >> ---
> >>   drivers/mtd/nand/Makefile            |    1 +
> >>   drivers/mtd/nand/qpic_common.c       |  786 +++++++++++++++++
> >>   drivers/mtd/nand/raw/qcom_nandc.c    | 1226 +-------------------------
> >>   include/linux/mtd/nand-qpic-common.h |  488 ++++++++++
> >>   4 files changed, 1291 insertions(+), 1210 deletions(-)
> >>   create mode 100644 drivers/mtd/nand/qpic_common.c
> >>   create mode 100644 include/linux/mtd/nand-qpic-common.h
> >>
> >> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> >> index 19e1291ac4d5..131707a41293 100644
> >> --- a/drivers/mtd/nand/Makefile
> >> +++ b/drivers/mtd/nand/Makefile
> >> @@ -12,3 +12,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
> >>   nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
> >>   nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
> >>   nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
> >> +obj-y += qpic_common.o
> >> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> >> new file mode 100644
> >> index 000000000000..4d74ba888028
> >> --- /dev/null
> >> +++ b/drivers/mtd/nand/qpic_common.c
> >> @@ -0,0 +1,786 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * QPIC Controller common API file.
> >> + * Copyright (C) 2023  Qualcomm Inc.
> >> + * Authors:    Md sadre Alam           <quic_mdalam@quicinc.com>
> >> + *             Sricharan R             <quic_srichara@quicinc.com>
> >> + *             Varadarajan Narayanan   <quic_varada@quicinc.com>
> >
> > This is a bit of an exaggeration. You are moving code, not writing new
> > code. Please retain the existing copyrights for the moved code.
> Ok
> >
> >> + *
> >> + */
> >> +
> >> +#include <linux/mtd/nand-qpic-common.h>
> >> +
> >> +struct qcom_nand_controller *
> >> +get_qcom_nand_controller(struct nand_chip *chip)
> >> +{
> >> +       return container_of(chip->controller, struct qcom_nand_controller,
> >> +                           controller);
> >> +}
> >> +EXPORT_SYMBOL(get_qcom_nand_controller);
> >
> > NAK for adding functions to the global export namespace without a
> > proper driver-specific prefix.
> Ok, will fix in next patch
> >
> > Also, a bunch of the code here seems not so well thought. It was fine
> > for an internal interface, but it doesn't look so good as a common
> > wrapper. Please consider defining a sensible common code module
> > interface instead.
>
>   QPIC controller will support both raw NAND as well Serial nand interface.
>   This common API file was the part of raw NAND driver , since for serial
>   nand most of the APIs from raw nand driver will be re-used that's why i
>   have created this common API file, so that QPIC serial nand driver
>   drivers/spi/spi-qpic-snand.c and QPIC raw NAND driver
>   drivers/mtd/nand/raw/qcom_nandc.c can used these common APIs.
>
>   Could you please suggest how I should handle this in batter way.

Yes. Start by designing common accessor functions that form a
sufficient and complete API to access the hardware functionality. A
set of functions blindly moved from the existing driver usually do not
make such an API, because usually nobody cares enough about the driver
internals. It should be something that external user (NAND, SPI, etc)
can use without looking into the actual implementation of these
functions.

-- 
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
