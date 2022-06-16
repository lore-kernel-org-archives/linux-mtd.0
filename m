Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4Uq6AATsXcF6/7yaJOxEjvdzmd+3YH0O3C3VMxKn6s=; b=ginNXFAvggdbTI
	hxiYNSLOcWNpMNz2lFesp35y6YbiBGoDiITXycq3aCm78B8nBFPsPEFYD4xNq0cKEh1nxpYUaWbt7
	qwjCHexxln0AvwFMySgKlIwIVfAydOYEyBID7y2Q8SAC6gCX6JSXGB+nJQoWe6VA/TDUQTP6kAZtb
	i2O/4JZOmO6/6GdHi/klsCStVDInaQggBMKWOD9vuZ4jXaglcalZDmKuWIxfHrdHPJOhYLioy7ond
	TE1ubs5xw+N/rh7MYD5jeCAuwwc/IzE5IR9T05UWvCq6Ad5M/bXys9lFmDQdb2LykwCppNugF8BxY
	IYN13sZfkIwbGab/PPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qiv-002ygI-K3; Thu, 16 Jun 2022 14:43:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qis-002yfi-Fv
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 14:43:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n1so1920150wrg.12
        for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2022 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=985lyW+ymSN+1KX2wglPXmPrHIwR1ZNAwGozRXF+cAk=;
        b=H+MqRqIcYZJGl+fIARvDt5E+nl599ga3oyDbMLBBisOxfq/SyTCwZG0Klyezq1+CUW
         sefLQD2EeMqxqaJrfnrkNrFZhVikdu4wMrtck74oCiEmuEgiYmtNpsRIF1tZqnrkF5Mx
         NZkApEMPJNl/kDFEI1hA+Ue/R0aw1W8KZMZoedgEZYkf3svTuJogxbSWKM4crDZGxinQ
         0wFVmmTIUPwII1349fc94HNyry9a7jLBlghobSH5Kq06AzNFkA5kw6DqqFRMJMjCCq55
         jezPkDIchFIXBzf+CG7v9iTSodSWY9/lo0HS0xX3CZ2o6npEv7M2DG1DnlMLEQXeesqV
         hW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=985lyW+ymSN+1KX2wglPXmPrHIwR1ZNAwGozRXF+cAk=;
        b=tTgmYpbKkCAknnkgUz01i79RHEDk6WHZg3chGC7ft1AC+KWSOCcSFHl694cpq1n7lt
         9g0p9AYx3VUMjXzM4agz2WdCKprguxdxnK67IgQkl+pC/lrwFZ+QbCAjMbJ1FAo05UY/
         zTMSpw3nMOc4K6BI/LV7/4DtNkTjbxaufw08mgzO8/Vzz5TM4mZgUNJk5g/ocLHV0hO1
         y1K9yBvLy/kBwYAGIC3VCVSC9NcbgR3EcmtmNopY6dX+QC+MzbxIII1wPR5Azi2odRWd
         60SU9YxmA+uC31s/1XhzHInFIW6mu6uQZFer6BHJ1w/8CvUX60lDvteOFxAqryKocGGw
         Tg5Q==
X-Gm-Message-State: AJIora81V7wyYojuu2IUhBKkKS+WEst7OBnl6ukQe9z5RVY+cSJlnSrz
	Cmi+NhAuncrzvhOaGW/BFNv2BJTnT8Y=
X-Google-Smtp-Source: AGRyM1tajG3QG7/QWFCxjmxsAuXLSZv0+YuL9rwSS06bBr1D9gFyr74sDvu5dLu6L6z7sAmN/X6eBg==
X-Received: by 2002:a05:6000:186f:b0:213:4ece:4086 with SMTP id d15-20020a056000186f00b002134ece4086mr5104454wri.438.1655390626594;
        Thu, 16 Jun 2022 07:43:46 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b003942a244f40sm6815826wmq.25.2022.06.16.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 07:43:46 -0700 (PDT)
Message-ID: <62ab41a2.1c69fb81.aa33.ca40@mx.google.com>
X-Google-Original-Message-ID: <YqtAplHcHm4Copoe@Ansuel-xps.>
Date: Thu, 16 Jun 2022 16:39:34 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
 <20220615000612.3119-2-ansuelsmth@gmail.com>
 <20220615171132.GA3606@thinkpad>
 <62aa76ad.1c69fb81.7e2d3.0c8e@mx.google.com>
 <20220616163751.2b5962df@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616163751.2b5962df@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_074350_588266_0C909511 
X-CRM114-Status: GOOD (  18.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 16, 2022 at 04:37:51PM +0200, Miquel Raynal wrote:
> Hi Ansuel/Christian,
> =

> ansuelsmth@gmail.com wrote on Thu, 16 Jun 2022 02:18:08 +0200:
> =

> > On Wed, Jun 15, 2022 at 10:41:32PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Jun 15, 2022 at 02:06:10AM +0200, Ansuel Smith wrote:  =

> > > > Reorder structs in nandc driver to save holes.
> > > > =

> > > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>  =

> > > =

> > > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > > =

> > > Thanks,
> > > Mani
> > >  =

> > =

> > I'm sending v8 with a different Sob so I'm not adding the review tag (in
> > v8).
> > In short the new Sob is what I will use onwards, wanted to keep the
> > Ansuel reference but it was suggested to use Christian Marangi and
> > nothing more. It's just a name change and we are the same person and
> > nobody is stealing ownership of the patch.
> > Sorry for the mess.
> =

> Mmmh strange, but okay. You are supposed to contribute with your real
> identity, not under pseudonym anyway.
>

You are right, it's something I'm trying to fix... Fact is that the
original series was old so I didn't want to change the name.

> Also, you could have kept Mani's R-by in v8 but anyway. Mani, can
> you resend them?
> =


Didn't want to make changes to the patch with the R-by tag just to make
sure. Better safe than sorry.

> Thanks,
> Miqu=E8l

-- =

	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
