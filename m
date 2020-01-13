Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5D8C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5063C2081E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFzckktl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1me4Sqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5063C2081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYuQq52piBZEpw3bCGyJQzpG30X/cO+N3XEbvaYm5og=; b=hFzckktlJmXoP5
	G4lGp9rVE02KtcdCPt9PL04UFzUom2uat+miquf4h5CWxgZD0itK9UcuS2rBBo4S7y5SUbic+jNeq
	gpM39j35sjt/9lRlPtULdOrZWL5d0FhL95dHhXVJ52LmPCtmpjebvm9SY/YPpXgo+8tiC6H1wwaS3
	TBXzG/bK96GPwM6D4GUlnVULzSk8b8VQQ3ufq+yj0liqCcchXjsuHBlhqcXd2FqHce0Z6ftgVtuMc
	SO3IUYLjVP5M5GIGY8uoohmyV26JTKmRJ4EYAoqVVRGLHq0udtkhdxx4iuT1iblaQUfDehBZkqUjr
	M9fq/Csik6UcTsmj5+yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir3bZ-0007Sv-46; Mon, 13 Jan 2020 17:34:21 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir3bW-0007SY-79
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 17:34:19 +0000
Received: by mail-il1-x142.google.com with SMTP id f10so8838664ils.8
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Li+BwET+W9mVNsvKIcKZZZXIjqtuQuhpfxMM409iic=;
 b=A1me4Sqmj8NM4chg3GeEU/saQu7mNCN8XRscb/dp1SaGivLFQV5B9epn7oGe37LSiM
 m5YyGu4fdSgJbfdbLfegiY019XEAczXpV93nLBXIOX3kvRg6ShH1jM6rhLtMctj5Yzxj
 +YhicqLxvn+MiFzwHc2FG60y7KhBn40Hs42oILEyGOf1Hy3BepH5sxLazbXroMDIoAEt
 rnU+PEhRocVjVk2kgxguXo8QaCjDvzZvcBfoHhO5oHP98tAlcd6jJnv7Nk6UPO1UoPJf
 GOiBHbDGr9YzNj3CCFy7+mw+2jsLGR9SEGufqPKuVmIg7qvxx/02KB0IxV8rKmmgzulc
 48vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Li+BwET+W9mVNsvKIcKZZZXIjqtuQuhpfxMM409iic=;
 b=LlywlAbYjPrG1STFD2Ae8XNsdnMQeHmbBV1jYBJFeCYxsB7xeB4YqZrzsYlTbFf00q
 SK+09vs+sR31aTSNvZunzo2eEiuBBQjd+nVDaaVnXkghlhhb6qzhBuXpfE9D54GTayTB
 Gw+mF2nnKF0eVFhBUE6CiOtrxvNL1AzQvwwd2sjleMrNc1WVUOzDrWKKn0ycDjvCbPBD
 64Uzmpuuu0uwkXb2SeGZ1PZgzhX2CTq2/KyknL4jnjtAsLdtM9L/PvR/xwRrybi/ZmCl
 C/FluSSSIpJ3aDKKQ1Fe2DNSFUlRorHErdbolqGOToigN0klGvTE1UsLQUxY+r3pbT7P
 JBYw==
X-Gm-Message-State: APjAAAUaV9BV1EFjfVz6sqsa5ZlM97Rbe93uQTvp+6Qwj4nEZ2QWYz3y
 2v6vJm2AFHBXOVTlEFHU31Yx74QQ03IOrlaj2uA=
X-Google-Smtp-Source: APXvYqyS4SC8BdpLanh29S5llQChwmqZ9HcpGiP8oSgE2rvkF25J5ba7CyN0yau3yBOJvGQgfMwQA4EyOScnQ1DHJbk=
X-Received: by 2002:a92:d30d:: with SMTP id x13mr16695547ila.170.1578936857604; 
 Mon, 13 Jan 2020 09:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20200102130826.170647-1-esben@geanix.com>
 <20200102130826.170647-2-esben@geanix.com>
In-Reply-To: <20200102130826.170647-2-esben@geanix.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Mon, 13 Jan 2020 11:34:06 -0600
Message-ID: <CA+EcR21ZMa85XY8hBJ2c5pV5rEbKazP7AmouYcLpyhzuVSDL6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: gpmi: Restore nfc timing setup after
 suspend/resume
To: Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_093418_259607_B1F1D04A 
X-CRM114-Status: GOOD (  15.86  )
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

On Thu, Jan 2, 2020 at 7:08 AM Esben Haabendal <esben@geanix.com> wrote:
>
> As we reset the GPMI block at resume, the timing parameters setup by a
> previous exec_op is lost.  Rewriting GPMI timing registers on first exec_op
> after resume fixes the problem.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 7ac8c8b95afc..fcc7325f2a10 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2728,6 +2728,10 @@ static int gpmi_pm_resume(struct device *dev)
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
