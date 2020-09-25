Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1CAC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 07:53:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBE02084C
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 07:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QURx3ugW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El5vlfyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBE02084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fVltetrJLzvqGDNcaFCIUwYqTks5jOwl6FYQvPuSOIo=; b=QURx3ugW2567xTFMMwjbtjl6i
	fURytOxDIAyzRea+Fe7v+gT/8F/dqQwNaoArlHB2Z+ZJAlbfKZSr5McJxmWWxS6D3saNbFCT96qfG
	S7pgH3Ac9wcANHc2uq8k+Dta+j1y22+Xs3L3R1+uE5f2c+VbVrAkm09NOALzyESTPV+wrsR6LYTsF
	9dHuu+SeUrOcyWb5y+6B1erHovGZg5goEOGRp7GgOxjmsrWdkmCsNg/r2v3cuWgAOAKSXuNdeqB8Y
	4XqXv83vsPWM1coRvaYfaEwP/mciFFuvxU9zKevpFErvMw34yVm+qKL4Tj57fnuUpgoIkifyyXeWg
	mjnf8cYsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiXd-0006wg-1g; Fri, 25 Sep 2020 07:53:17 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiXb-0006vl-3G; Fri, 25 Sep 2020 07:53:15 +0000
Received: by mail-il1-x144.google.com with SMTP id f82so1481754ilh.8;
 Fri, 25 Sep 2020 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c25OWVlYr3r4Zg73+hgQ+FOM6zKBeGJ84JdXLPHXx8I=;
 b=El5vlfyFAp4rhbHtluPcO/SDAUVfZbEz0brwMeEUflGfzx/VqBAZF9s/RnrI2wdMB+
 IDMVVpmjwHdDq4hsur3vvdQZc0uyMZyvFh5tOWqznd6OtXz3gY++1691QN8iikJGcKz7
 epqpJNxrJKQ3h1sQXG9loYVOiG2kx3ng4H9oG5Nga3lXK7xbtIgJy86F4AgwHNMvLlt9
 PRV5QnZKF9wbDJTONxKE/zxHd4XNL6oT5ffF4sSmd36kuC9SEo++bJ8l0aU36ahgQe38
 +RlHD/uhUOZi7wMrZGfvCxqzv+ECiG+eOXxaCFA/g39wIJfqiNLg4eHTC8fFwkm2fs6E
 eU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c25OWVlYr3r4Zg73+hgQ+FOM6zKBeGJ84JdXLPHXx8I=;
 b=jN4I+FkJFu7/EmBcopEMao/GxkSPNowtQLxGmHuN2cPmMyWWr8yuzWbMl+pzZQcsFO
 XsutYdiC5SLWsdq+4UW1rMYfh2IbxiIVn80YON1Lz/HSBEI6bxKpDk/J8hyoLW/YOEXS
 pYyluRHSUOMUY4+bfsABy5VLFPibt5J6hMJndf2Jfdyg5iAIoof11Fjgmpm+djZG/Fqo
 bEPUbMaWgVTrIFJvSkve0EmxZxu8G78OYCRiGLNwHBwXYAXiXucNtjiM4bpibBtrNxa4
 MEGW4F7ESM+51L+COv5LbzwhzQcR3IM/EwP1d/iCFlzxHRyx7P1jgw//u0Tp4b1BYcSp
 CJAQ==
X-Gm-Message-State: AOAM53380tSqPRmwReEF1pmR4stLWrpCFZv2LH+kDJHoSCUKj5Nne4+4
 MQghPN2F5Y+rQ0doNeiCzWwuUxoUILct8fKcTQQ=
X-Google-Smtp-Source: ABdhPJxVcorRXiGmUxNix8OWbEeDvEZT9K/TbGuPqcdFB8mbYgGuy2aK6sIlGnBZMRKPFpSbkIc506QeSjw0ph33bQw=
X-Received: by 2002:a92:c10c:: with SMTP id p12mr2108245ile.274.1601020393169; 
 Fri, 25 Sep 2020 00:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
In-Reply-To: <20200925145255.v3.3.I7a3fc5678a81654574e8852d920db94bcc4d3eb8@changeid>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 25 Sep 2020 15:53:02 +0800
Message-ID: <CAJsYDVLmqCBW4OHVmKDCBb+BE=4gZeOao8khZdx77k3=V9vCgw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] spi: spi-mtk-nor: support 7 bytes transfer of
 generic spi
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_035315_164751_C836651B 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

HI!
One more comment:
On Fri, Sep 25, 2020 at 2:55 PM Ikjoon Jang <ikjn@chromium.org> wrote:
> +static bool mtk_nor_check_prg(const struct spi_mem_op *op)
> +{
> +       size_t len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +
> +       if (len > MTK_NOR_PRG_MAX_SIZE)
> +               return false;
> +
> +       if (!op->data.nbytes)
> +               return true;
> +
> +       if (op->data.dir == SPI_MEM_DATA_OUT)
> +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_SIZE);
> +       else if (op->data.dir == SPI_MEM_DATA_IN)
> +               return ((len + op->data.nbytes) <= MTK_NOR_PRG_MAX_CYCLES);

You need to consider the existence of adjust_op_size in supports_op as well.
This mtk_nor_check_prg still rejects SFDP reading command from spi-nor
driver altogether.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
