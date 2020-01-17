Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A869C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC832072E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 21:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxRm4Xc4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQPtGhpC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC832072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8E+S2OG6QGvbMczoRz7ldYOV7oj3bgVFZgWV1UxLbbU=; b=YxRm4Xc40xiw2g
	uEl4/DpD1GLkV6SyIkTkV1/sdQiGm97feSXCFXBHqk24rNBlOoMjX7PzeivNbMt5LerCMBExJLqhe
	IgfytWJIocGkGcrdelVU5bHS/3H4AdjxpeN78JiOAfse/TrNIAfJ6mSAO7Z0TyLmYnos1GlKhX60/
	WfqNB11aAqckjJ3McXO422xWIPcdjLcjxixpg7bD+8sIL/B///zqUe3MO3GV43JbaFRExOs8bOwHD
	V1eiCC6u8iwIKQdKFn1VSsyKMejscIvYPbDk56XdVIyofWgoRza2z0MRcli1mKsK18F9EgExmhe5c
	hX6lmDuUe8i0pdixiITg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isZCv-0003vR-Bx; Fri, 17 Jan 2020 21:31:09 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isZCp-0003uD-U8
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 21:31:08 +0000
Received: by mail-io1-xd42.google.com with SMTP id n11so27548125iom.9
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2020 13:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCU/PYaiWyucY+/YzsxEM57VENsddFqK2SuGsLdtQgw=;
 b=YQPtGhpCgkNN818oKIS1hoUv8HqTzo1YAwSKOsFHC05vICs/mRY74WprxPz6gHurUr
 sSd9L8bRCLJU7rFZ2Ldg8tntXrNL2el3Huev/FxS8bUmFyu+NtWvDVX6ChYNy4vHkiSk
 kt8kLMLfdzsrtbfRiV1KNdpudmDSsQr0wG8nqj1So1DFtefX9Hm8I5RGArgoQF7rVrMm
 FrlAl0g7JcA5ZBclvgtROAXVV0Rd5dW1xCOIUyMCCpbFJm1z9NKC+NmdTbjqFHc+Lc5l
 6IENMfdQZ88SW+pODJBDx8Xr+cKbUN5MgwOS3WxvGRYajKzaCn2aT6Z4+vapGOwTC5/w
 W2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCU/PYaiWyucY+/YzsxEM57VENsddFqK2SuGsLdtQgw=;
 b=H18H7Ut/PI1RwjAJl2S0tlafAqIXUCxNaUgnljTlCKfYoLHRWfVesuqpffJGyBOpRn
 Roi3gKP91VidiiIg9YQZKofzgzOy0Zs57tHBQ+A898ogCEovXRs1rGcXCh1tDDx7M92/
 /InYKsqn8RV/k0B5JMyKTX4e2jyGgVIyMGr/4PwQgwe2/Vqgw1OfksuK5qZtlez6Z8/L
 mtNbP3ay+Wp6vC7m09Oq2VbsPmje1pu0pJgZVhcOUxX27YtAzWFSQyg68ME3UbRh0z/I
 GQTkArv9/t26Fk1jpOuGYTksvckwHoF49q3O1Y6qidtjoaXoXgHOA/GO4Ho9qP4jR9dV
 tFcg==
X-Gm-Message-State: APjAAAUUHXeNKYupL2KTXJUJ7vwLVc1y5DzZ+qeGwSXyq73hScz3R3yP
 LhCSsYXvS+AD/2vZ13eWw1da70amAzSWQJ/b6bA=
X-Google-Smtp-Source: APXvYqyqSodtv5T4u65HbMpSp2aZaRaEVN2DzjGYbj2pbhHclIbe1/yAZpzJDpRl5KgKexy6rPH+2SOorY0mItIkNTs=
X-Received: by 2002:a5e:8d14:: with SMTP id m20mr31162687ioj.282.1579296662919; 
 Fri, 17 Jan 2020 13:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20200117200537.9279-1-esben@geanix.com>
 <20200117200537.9279-3-esben@geanix.com>
In-Reply-To: <20200117200537.9279-3-esben@geanix.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Fri, 17 Jan 2020 15:30:51 -0600
Message-ID: <CA+EcR22w7gTtyhbaikXsEHhSUhrm2RRGBNbJWQTxF8Gsx7c4WA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: gpmi: Restore nfc timing setup after
 suspend/resume
To: Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_133103_986822_E741DF67 
X-CRM114-Status: GOOD (  15.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, stable@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 17, 2020 at 2:06 PM Esben Haabendal <esben@geanix.com> wrote:
>
> As we reset the GPMI block at resume, the timing parameters setup by a
> previous exec_op is lost.  Rewriting GPMI timing registers on first exec_op
> after resume fixes the problem.
>
> Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> Cc: stable@vger.kernel.org
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 879df8402446..b9d5d55a5edb 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2727,6 +2727,10 @@ static int gpmi_pm_resume(struct device *dev)
>                 return ret;
>         }
>
> +       /* Set flag to get timing setup restored for next exec_op */
> +       if (this->hw.clk_rate)
> +               this->hw.must_apply_timings = true;
> +

Acked-by: Han Xu <han.xu@nxp.com>

>         /* re-init the BCH registers */
>         ret = bch_set_geometry(this);
>         if (ret) {
> --
> 2.25.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
