Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AB5C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXTmmXU7o+2AA0uOemr2MeMkV4c/kq63O16OT0l3Aws=; b=UVqzTHgB+Yfnoz
	oD2iPtWVUioatP4/4rpuSrbxEKaXRdapizELWhI6Jq6pbiSbxtuq8CQMjIwgZHnu1NCe2Dm9p+k+6
	29TAeTLHMUgw1qaDdTsY27GZyS/WqifiayseYpY7YJjRzytk29kYTexdGFjXFPHCtevDRGATDPPLS
	3E4XMulz+CSb+C3/o2HKNpWPIFyYNCwoVaO8MFLZgTT8Co3UikY0XuXaeaeyiqgyaAhSoi4Tb68tf
	gPvjTZCJMqjN3OtHhBEoXy+IldQ/qEtunn0xg+XiCstsw4UoHWW26aC9Op4cPMpD5fYDbzlXsvUdT
	TrCjaHty4mQCEiunY49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt3tT-00EpSU-FV; Fri, 03 Dec 2021 08:26:11 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt3tQ-00EpRw-7k
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 08:26:09 +0000
Received: by mail-ua1-f42.google.com with SMTP id a14so4154066uak.0
 for <linux-mtd@lists.infradead.org>; Fri, 03 Dec 2021 00:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nv8Jf49U8dHM6/sJsWSvwazrQnskBUzISoulkhKft80=;
 b=0+aOP8hCJkPeaNPSbPv5951Cg4Z6bk6Z5Z8MSVdRVbZi/+aPj6nuKl2StqdpO51kjB
 w6fwHQ5hyQfQv72EMMwZDqN3W6nbbIvfaTKTSf1KSQeWZ3/KXkr+mlaCTBGEcR8TbXZ8
 aI1HP8TVSrtDN6vP9YcohSIkmVlAPeupfrhX3/CEuh/5T47EpTCUHvNMgv7d72L8l5Yq
 oOV2UmSlfrW9xXrdyjTMsi27tpSk+bC7nNsaF+eQy8jdaWQqX+ggekCvLfG5ICHALY5R
 XtUv/CZ9JI347quuwBFcM7wskjQ1hSnnA4+G5PxJxCayH9kSNywGb9E9g5uJhIinrKX1
 gViw==
X-Gm-Message-State: AOAM531BEyfjYXbMkZgDagANeJWn/CK4tS8G0RCd7EGingF80hxZ2EM+
 M2rWQ4Kw4JKl6KpMK1XaaIoJOjCcohH4t0pK
X-Google-Smtp-Source: ABdhPJyGeBPlXphKP06KRGaKC2mVpW4oZ+FbL0pQ4UisT5+R5eIWpQbSDV8XKNdopsQhMwzbychuvg==
X-Received: by 2002:a05:6102:54aa:: with SMTP id
 bk42mr20321268vsb.63.1638519966238; 
 Fri, 03 Dec 2021 00:26:06 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id p19sm389900uaq.1.2021.12.03.00.26.05
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 00:26:05 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id n6so4077625uak.1
 for <linux-mtd@lists.infradead.org>; Fri, 03 Dec 2021 00:26:05 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id
 f9mr19521165vst.68.1638519963327; 
 Fri, 03 Dec 2021 00:26:03 -0800 (PST)
MIME-Version: 1.0
References: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
 <20211203065726.GA3072@lst.de>
In-Reply-To: <20211203065726.GA3072@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Dec 2021 09:25:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWR3hwBho3wDBPjGm4q==qrQn3PLdZN9CfVwX-aOMUW0A@mail.gmail.com>
Message-ID: <CAMuHMdWR3hwBho3wDBPjGm4q==qrQn3PLdZN9CfVwX-aOMUW0A@mail.gmail.com>
Subject: Re: [PATCH/RFC -nxt] mtd_blkdevs: Set GENHD_FL_NO_PART
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, 
 Pratyush Yadav <p.yadav@ti.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 linux-block@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_002608_303402_3B5C6F1A 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Christoph,

On Fri, Dec 3, 2021 at 7:57 AM Christoph Hellwig <hch@lst.de> wrote:
> I think we need the patch below to restore the old behavior where a
> partitions scan happens only for those sub-drivers that do report a
> partition shift.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> MTD maintainers: is this intentional that raw mtdblock does not support
> partitions, but the various "FTL" modules do?
>
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 113f86df76038..57a22d2ebaeca 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -345,6 +345,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>         gd->first_minor = (new->devnum) << tr->part_bits;
>         gd->minors = 1 << tr->part_bits;
>         gd->fops = &mtd_block_ops;
> +       if (!tr->part_bits)
> +               gd->flags |= GENHD_FL_NO_PART;

Move this into the "else" branch of the test below?

>         if (tr->part_bits)
>                 if (new->devnum < 26)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
