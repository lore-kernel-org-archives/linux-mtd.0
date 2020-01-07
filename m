Return-Path: <SRS0=PPpL=24=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EA7C33C9B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 19:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F982206DB
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2020 19:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkjyzvW4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6vp9J20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F982206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTpPDuVG3XPSOLjJAPNuuNodq98Dk2A13wqNc5Z7aRA=; b=dkjyzvW4UgMO5d
	2eqJ8dY0nHVXRNKty862jvCnr3tnq+QCXntvtOGmAITi3jfHtRA1VSVpTjpts8j31ARk2LA4CKaC/
	3tU0zlOAyppgo2R2Kp4iRnc3GtUBl6uajofa9/Ga9LurxK+GDZRq1HfAg7f0j8GUREydNFCBqRZl6
	OTBjx7ffcoOFH8J7wREI2rHvVOTtSi1oCAGbHt+AePDpULWlQjFKH1yEP/DVDJJ5fRgj4rya/tSML
	TKKY1OqQWWw6IF+/luPtLpjwa0+EpvMcdvtBuezy8qRbMasYTXeOP+0MJLdpowmt7ix/Um80hFQlj
	+hOlyXL9XLdnigxENCIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iouZq-0002e3-7L; Tue, 07 Jan 2020 19:31:42 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iouZn-0002di-ML
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2020 19:31:41 +0000
Received: by mail-il1-x144.google.com with SMTP id t2so563707ilq.9
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2020 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDeHYwcMj26udJGnPyH//IEVTc2ptJtpLMJq2njPdtQ=;
 b=c6vp9J20U4kYvyl4b8b7xy9/deyTcXXWHujzhQ96f0m0pYIE8VWpky02DhWa8tJEER
 YBccX0OvgJQ0O7U+IiW33zmlVykrkpf6S6Ur/K5Bd6NDIkAyB2qpR/xGMpS78/bGPwv1
 q6tD1jTLNP19RNT73KZgbzhfLIi44+p3fxx3rDaiYSnDoKej1fJ9n+rD9qwkcCYay7Q8
 3avkE3Xu8EUI56w8ix3GQLYkT0HvbaoZ2U04I6b/FkZ0Sn/eFcvT/SYSO7dbKgfwAJ3e
 b2BcZVNOWZUtN6Ns1ZUOujemeuYRZBO076TY2Wu0JLizB7949sv+/j//pau3Ys6cODV1
 Hweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDeHYwcMj26udJGnPyH//IEVTc2ptJtpLMJq2njPdtQ=;
 b=q4YdkTEMB+gMr9CIi3QrEpEV4c+zdwmIvekC4P+nLdtUIq7bPPtiEnPZuinJeXopP7
 qDjU2VKM86a4e/uKOlkfGy/+OJ8ntfTZ/RnRyYkB0q8fQW9DsVd83TCAkC2hGMtrSmW9
 p+YLJ7Aou+OQyHHIfQZKgnKszxrIiqy6yohs7GhlUw26eMt7l6ZoaoC6aBsDCm+Xbror
 VwAwXhZqBOK0yicj1jVezkuVVTe1NoB+mugCIAZP86ehDoo3ahI70ZrSYzS0hvT0z6IZ
 JruJFUxXMPTL8hhbWSAKXJRXFRZU946Vx3d/97S5HLfMVMt+vEepiJ7TpZi1XHoqvNwF
 LDWw==
X-Gm-Message-State: APjAAAWwrY3FjKeeD3R3YvwozUrNvArgBpsk2nRSDg/9OyFzG65lJU2c
 weuxKQ/hjOswmnaJbyiN0roRBJvJ3MRWeDByue8=
X-Google-Smtp-Source: APXvYqwwpdft0uwddR654fxlpykUDmqY3GAmy+9mXwDRdzdwJMHLyjT5p5HDn53V7hG/Gp6PKeYuJmt3v5GAwueHciA=
X-Received: by 2002:a92:d7c6:: with SMTP id g6mr639959ilq.282.1578425498736;
 Tue, 07 Jan 2020 11:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20200102130826.170647-1-esben@geanix.com>
In-Reply-To: <20200102130826.170647-1-esben@geanix.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Tue, 7 Jan 2020 13:31:27 -0600
Message-ID: <CA+EcR21F1u4dX6NEO9Zfur=ZA7btr51EthZurEjzPHSuWu-0PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
To: Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_113139_729483_B4B9FE93 
X-CRM114-Status: GOOD (  15.43  )
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
 Sascha Hauer <s.hauer@pengutronix.de>, sean@geanix.com, martin@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 2, 2020 at 7:09 AM Esben Haabendal <esben@geanix.com> wrote:
>
> On system resume, the gpmi clock must be enabled before accessing gpmi
> block.  Without this, resume causes something like
>
> [  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
> [  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
> [  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 returns -110
> [  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 334fe3130285..7ac8c8b95afc 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -148,6 +148,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
>         struct resources *r = &this->resources;
>         int ret;
>
> +       ret = pm_runtime_get_sync(this->dev);
> +       if (ret < 0)
> +               return ret;
> +
>         ret = gpmi_reset_block(r->gpmi_regs, false);
>         if (ret)
>                 goto err_out;
> @@ -181,6 +185,8 @@ static int gpmi_init(struct gpmi_nand_data *this)
>
>         return 0;
>  err_out:
> +       pm_runtime_mark_last_busy(this->dev);
> +       pm_runtime_put_autosuspend(this->dev);
>         return ret;
>  }

I have a similar patch with more fixes, will send out tonight for review.

>
> --
> 2.24.1
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
