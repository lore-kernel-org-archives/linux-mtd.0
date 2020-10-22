Return-Path: <SRS0=CH9v=D5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7EBC388F2
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 13:16:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA54024178
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 13:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gnwJ/baK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA54024178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jc5b/v4QroCIvkA1cWgpGOFm1XUNe7jlvAdu8uGA5Ao=; b=gnwJ/baKeAo+U9aSWvBIsz8JI
	/LfQ2tWmwic1SufKcdygGOF/UFNMhIHgfS6ckPgpRhtdzZPzVsKwYmGLYLLJ+FdvXOBqAOldjOmkp
	DPM+o/K6OCtAAMumKKB4WOwY0mTJ4EkbWoLT1fkH/hQ4835HNf8RxcCDGTBTjv6bUALk01HidlBki
	pXnOQX/yYZ5lpaQWkUlTxS4ziTCymJS7/XnGMilAVl7OJMnnh1xeQdWXuB8I40Ue8lVzY/UuyWIVV
	CyuG9w59Qs07Xq1fv2e+Ta8SoqiqOhxVCleJyIz4685TvIuVcEBhpZfYnzoPDzfDaYr+MK6JxSBuk
	sxATiPEOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaR0-00031V-E5; Thu, 22 Oct 2020 13:15:14 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVaQw-0002zr-Dx
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2020 13:15:11 +0000
Received: by mail-ot1-f65.google.com with SMTP id f97so595937otb.7
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2020 06:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DwNBiOfd/W1wJmAT2LUI2b+7Yl1dva8JuD4+CTDhpQ=;
 b=tQiaGmdcR3MiYYAv1IBKws/3cHtqCaUMbP8rq18i170fK7wEJ3KeET9wSAJ+hN8+xC
 6rasjjnTCZavZ4SkSIwUwDOuDVbOnIOTd4QKs3HuYy130CI/rlRBJtSJgsf4E3ESj5zS
 bDKIhJiOKfOVAwaN6C3Oyl8mdLulbk46Xt5fsvZ9CWPmKZ/bBE09m9skgpk+5O0Ke62L
 yGR5Aop0dBHu62CnUdxlqcWa+ia2UcdcsfymUBx/ct+MH4O7+JzLaF4Cq62MhcWjlVJZ
 e9HdqjnthARD/4OuU4QABljlw3hmydUfdZBTUhYib/mzAiS4FPKAyRks+ibHh9fFf3Ji
 u3Kg==
X-Gm-Message-State: AOAM530uW+PYMblJMfP3XnTttMw6Mb0piNkN6FwyXOT7bBxqdZ0w8yP8
 suE13qJvMfBBXAfRQ1gvQifg3a6ILLafI4GR0Tk=
X-Google-Smtp-Source: ABdhPJxO5jd7p0wI597lNPcO+CZVGy8EEE2WT/eF+ljkV8+bCY8q7sHDk3uEBW+i+dyZUIiDXEj9+GB5hdDClsh7ugI=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1917794otb.250.1603372509185; 
 Thu, 22 Oct 2020 06:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2020 15:14:57 +0200
Message-ID: <CAMuHMdV2HxxAijk0hd8y_Czvpkz9O2edSpx3tn0JB+Yajfk9Pg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_091510_479550_975B7C60 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 1:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This chip is (nearly) identical to the Winbond w25m512jv which is
> already supported by Linux. Compared to the w25m512jv, the 'jw'
> has a different JEDEC ID.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Datasheets available at
https://www.winbond.com/hq/product/code-storage-flash-memory/spistack-flash/?__locale=en&partNo=W25M512JV
https://www.winbond.com/hq/product/code-storage-flash-memory/spistack-flash/?__locale=en&partNo=W25M512JW

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
