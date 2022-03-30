Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB7C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHLIP3vwQBIEnUDrK6QN6E5LqF/rKecAtDt3+1JiKio=; b=KXbGWhopDUcYXl
	UKAOZ1/8g+Pb9h26AEGfOWrnxHy3OnPb56aTANq8crcEmN1AqxNWaEwJiQoo+cGsGvin4TWKT6cuv
	Fq6BYm0Uvbb5yNJGGg4rnxntnTemhnHf9JtlF9lJyIpYP6tUOx1IbKDyFS5nl1K6EbQLjoBlypHH5
	Ay+AvImqI3b0daxoae7o+dP+t4w2OWQGiOMwaMqhxqj2EviumAGod2x5Wy5WqyZOx81TkjGm7+D+D
	PQ+jOZkmC4FR8cQUBt+EErh4ZkpUOBZVhhIFcCg6xmycmwjEOISezSuCASxugi1FQYIu4yA0ISpE3
	wC5vdnkCVu07Xj54i/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZeTo-00HOE6-Rc; Wed, 30 Mar 2022 19:59:44 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZeTh-00HOBb-Aw
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 19:59:38 +0000
Received: by mail-io1-xd30.google.com with SMTP id p21so12145352ioj.4
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2022 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gC0uk57Ku0uf244iRsCcqiEQThdW6a3NXZ/6v4Rmslw=;
 b=ma04PNC7uu8gYiv38NUXP7EYl5caBKgorkoA48dW8JgXzkLJX7Vfuf2XgflqVpTpxs
 6RRV6XZrHp8mCE+PKM68b/yfYdg+FM2YLRxqB7BWpB7oHFqJDOGLBSJgFWYusBcqyuNq
 D78z7z+felPE8JjEegH+BTHnm6foOC0JbcVLmTTsqAQCRCQqaz9aLq1Qr6etLCCPNrFP
 TxADqRha/MBQ/ueTTRPc/qBuqv5mq9AQHzspNn1tfTJt2YoLTXVuCUOJS9T1qCY0Pxa8
 qmxejgtkTnXfy1GbjYzQJDLWmrnFDEaXl4bEam+GSqiWv5jLjeFXuSopWpCgZ9lOk96w
 ulCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gC0uk57Ku0uf244iRsCcqiEQThdW6a3NXZ/6v4Rmslw=;
 b=uURHdZSdsfozthWuV4IXWaJlyoP/i2jIn4znJ4J4DSnhlEZidkbYqNsjcUpNloYkgs
 0PVV+7Reo5kEcINOPVOEdCkDclnURYv0tw6Y9J1HusZ+YqTqtD4WYFA2C3qAHMTghscJ
 1UrbauHojtExh0b/yWiLMvdY9L/+iuAXbso0hVVgASYHcz0INx+hQPZmi02lKGqM6Wo7
 kq9sgs2A76zoIbj84s6wEFfTFQmEwHJcMSRB1Wm/vjnsKnVi5BOR3oINVm5j+ZnCb5rV
 8EAYQWDlxwqnFNUPD06jLg4DurdkET64Kf7zyLOn9tCfcOcNVEsJ+01JdbharpzhTvf2
 7Omw==
X-Gm-Message-State: AOAM531cyx/IsOnaXO4r2dW1NAbu6Dw/BzLWBUOyz4bZ6my3s1xjbsIy
 pFkdY6oEH48OM8Q4qHlrsJ7DFkCJwfmcJFdK69O6uQ==
X-Google-Smtp-Source: ABdhPJwUv2J6SmfQenhMgf3tkXJDaqsUVYxZOa3k+udE9+yPKzytM1W9PNBunHZXT6YsxYz87vKM4BGt3ZmgsQAF0xM=
X-Received: by 2002:a5d:9c0f:0:b0:645:bc04:fd5 with SMTP id
 15-20020a5d9c0f000000b00645bc040fd5mr12651956ioe.28.1648670372176; Wed, 30
 Mar 2022 12:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220330182816.1177341-1-jmeurin@google.com>
In-Reply-To: <20220330182816.1177341-1-jmeurin@google.com>
From: Jean-Marc Eurin <jmeurin@google.com>
Date: Wed, 30 Mar 2022 12:59:21 -0700
Message-ID: <CAL3wywXEdgL=NepfinTx_WdbKpDPowuDjuTEGSYPc6hRTLJTiw@mail.gmail.com>
Subject: Re: [PATCH] Fix the size of the header read buffer.
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_125937_408004_AAE26251 
X-CRM114-Status: GOOD (  17.53  )
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

On Wed, Mar 30, 2022 at 11:28 AM Jean-Marc Eurin <jmeurin@google.com> wrote:
>
> The read buffer size depends on the MTDOOPS_HEADER_SIZE.
>
> Tested: Changed the header size, it doesn't panic, header is still
> read/written correctly.
>
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
> ---
>  drivers/mtd/mtdoops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 227df24387df..09a26747f490 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -223,7 +223,7 @@ static void find_next_position(struct mtdoops_context *cxt)
>  {
>         struct mtd_info *mtd = cxt->mtd;
>         int ret, page, maxpos = 0;
> -       u32 count[2], maxcount = 0xffffffff;
> +       u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
>         size_t retlen;
>
>         for (page = 0; page < cxt->oops_pages; page++) {
> --
> 2.35.0.rc2.247.g8bbb082509-goog
>

Sorry, please ignore this duplicate patch/email.

Jean-Marc

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
