Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ED2C432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 08:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31642071B
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 08:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bhu0lyTI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru/B8kdy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31642071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+DfNj1hnriSMHkQre0hFcDCN5BuWMWVe+DFXMO1aYc=; b=bhu0lyTI/tcwmc
	lIFGZD8hRc+vrB0qIGWRWX251zfam6Vj40JfNBG4VNwCg3bNrSunSXirH3Zmb6G0oWnxXYxMxgJc+
	iwdyUT5BzuDkSi2KUUA8mwfar7wA2CAwfVNR3qBLSqk/PLou8u5oiUUmuW6hZTfX78K7B9IpamjqC
	3sQbsK9HB10yLCMtERv9x/GK+3G50bX38YOi9HMltSOP9+uNUll8kZ359M+b1lIOamdPBnqeTc7B7
	nixRqlqTi/hQOP1O5zQv+HsZGElsy0LVxZA9tj7NWrp7icUE8Tb3DSgxdm9v0PGWHnl8zF425s6Fe
	fUA8iaLUCSkrAWle2fMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVALl-00018B-ED; Thu, 14 Nov 2019 08:19:33 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVALi-00017b-JH; Thu, 14 Nov 2019 08:19:31 +0000
Received: by mail-oi1-x241.google.com with SMTP id 22so4498717oip.7;
 Thu, 14 Nov 2019 00:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaJ/24ug8EOdA634pqQxtCQHNaGQDoT5QO/cUZAPyN8=;
 b=ru/B8kdyEF+8X/F+RYI6XxfAscZ4dA2WpcMuSnAZQ7WAJSxwzRdMQvN0jzwHqC9gN9
 MNdMczMdLpc/WgDZiKA0LV/xvQbjtogEuJPVtriyZpBxNVtMzJlI+oRt+niwdo/rLmJq
 SQkLAyb+/Oxth0R0eRylxl43ZOHalSyElhvjecGxdIgxSnmH1HD73n0n3ItBzlLN4kzP
 8xwpxzUDXL1C1A9HfYAWkdt+JGwVSfciyg18trUIu7EJzLAzcpqQDEvqrLrwU2hKN7Zm
 0i71MX8xdta7xrSfgL1OLgWdJxIfsJyLI53J1jF2ZetcJHtkcJFN8uC5GF5LIY8Ixv2D
 NC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaJ/24ug8EOdA634pqQxtCQHNaGQDoT5QO/cUZAPyN8=;
 b=DxYWUUh5g4Dr7432UZ5UhFJKvmaW/AkKE+q5hm8r0efOaVhLEbNK1ImqS6a9f9c57g
 iC7Qv/ITJpWDOWTMfqaCdx0d30JK+TByLrvjdnWLG4pto7Zi/yNKthMvsOdGJg2LT84p
 iRI9Aj8UiEE1D0AKDxg3jPQmmMQ6BKo7MyY67IlfNClJrgSuVWC6EFJiJCkTWm7YflR/
 fBezONzC3brabMA6hqbvrTJKJXgI2PmLLZIhhx8wqj09oXc/KWeKydoZjRgC0XtVBK+5
 qq/b2K2ZO0k1eMk8KnpMp3beO+q+PJFCqjJA5AozZ3sOHMiRGkhBIDN4RxdpVE9Uww7+
 snNQ==
X-Gm-Message-State: APjAAAX+ft37cJcH/8/Q1QMli+buLy4SR/MqftkRFUdIvH9uui7j6QD5
 8XYnPelPHnoPvjKKmOZArVAT/NV0ExciDYlTy6A=
X-Google-Smtp-Source: APXvYqx8D9GlJ385oYygjCaMSvLMvmBz7OT2vUysUTVFxuEaxfasZyDjLfPaArprQ3D6hB+O99WzCUmlXvxlMWh3J2U=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr2587853oia.30.1573719569553; 
 Thu, 14 Nov 2019 00:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20191110052104.5502-1-gch981213@gmail.com>
 <201911121507.ANXNexIL%lkp@intel.com>
In-Reply-To: <201911121507.ANXNexIL%lkp@intel.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 14 Nov 2019 16:19:18 +0800
Message-ID: <CAJsYDV+nGHtvmnfY8jN+fR8E8m2vh7OTe7Y0zQvSX8HKBidszA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: mtk-quadspi: add support for DMA reading
To: kbuild test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_001930_635539_65CC7C68 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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
Cc: kbuild-all@lists.01.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all!

On Tue, Nov 12, 2019 at 3:29 PM kbuild test robot <lkp@intel.com> wrote:
> [...]
> All warnings (new ones prefixed by >>):
>
>    drivers/mtd/spi-nor/mtk-quadspi.c: In function 'mtk_nor_read_dma_bounce':
> >> drivers/mtd/spi-nor/mtk-quadspi.c:349:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>      mem_unaligned_len = (u32)buf % MTK_NOR_DMA_ALIGN;
>                          ^
>    drivers/mtd/spi-nor/mtk-quadspi.c: In function 'mtk_nor_read':
>    drivers/mtd/spi-nor/mtk-quadspi.c:369:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>          (u32)buffer % MTK_NOR_DMA_ALIGN || from % MTK_NOR_DMA_ALIGN)
>          ^
>

DMA mode on this controller requires that source address, destination
address and reading
length should all be 16-byte aligned. And because of this, I didn't
use the bounce buffer
provided by spi-nor framework and allocate its own one.
Should I just cast all these pointers to ulong or are there better
ways to check for address
alignments and/or obtain an aligned buffer?

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
