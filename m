Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796F6C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 20:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468B3205C9
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 20:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQ81NVnn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qWanMLzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468B3205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ImdxgL9LZdzbvLh0WoeYIH+5AhYoI9PHg7hPN/G80E=; b=ZQ81NVnnYRIvKj
	r0UNpKkGUrBJ3TSzOISP2eGBRcEPJdbFrt1SftfoQbcCMSUKrZvvMmQ5yU0Y44Gap7/xWU0qep+wb
	u4/1sPMhJCxCijmvmLxtZcBLVf16zt0Gm4a5RWFnuvpvoNi0qqCIuNeZEIFzrSTUSFJZ5QDzYHySd
	Qcw5kHPnAgqjT3jXkp0afaTb2cTWSMf1VqHd3AdRCJV5HeHJeBMiZmxd2OU2etw084rM0iYmFmR+Q
	tUsr9Das5qxCFiJXjzcilZrG62GKEuAhN2cez5FFeyj4WoU6OTo2Svrods47mTaZYWQbSkpnycMWz
	fdgGXnnY1Dx0LJibajeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQ7Y-0003lA-4w; Mon, 09 Dec 2019 20:59:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQ7U-0003jd-8J
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 20:59:06 +0000
Received: by mail-pj1-x1044.google.com with SMTP id z21so6379000pjq.13
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 12:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IpvdFtIrHJ93xklcEdnw8CFDEly30iA3CTZfPDFPOFw=;
 b=qWanMLzRxrW3n6Fdlwrrnacj/Q+HT8Y0+06jJAxIxLn6prT1m6Tx1De+VhQ6ANZtSd
 NBqoERjy/ErMXVA8b74zcBfzHr4faMk5wWsNCRVkVXilYtViEtJHza97svQEnB+H19ck
 L+CTptX4L2LazL3QGmg/1Mp9hvzKDcNIPPlhd+nyQwrCHaMSaCUQu8aDJUyDf5/icfEP
 Dnopl1VCrlUNvBBb1jeXojEHHlG5SV04c4x//RIgRUgw6nBGVdDi7Y/q6LoypxUsyc3O
 q7RXMJ8ZvGygcodRIwnSTiREyO5Syt9q1gJBu2U6ZXUK2uRreedoNZsx6Gni/ky1qvzg
 32Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IpvdFtIrHJ93xklcEdnw8CFDEly30iA3CTZfPDFPOFw=;
 b=t9QdyE4iinjRBkkpmnnkdUup/+Msy6csW9j8OtaisiqxqSKGU2JuYA0hmhK/WpVPdT
 SvT0m7FGdTUvJsutaWZ5uy/MJ7Gn2PAEmx9BDksWgDqVlPYQZoVtNjYlg9NHx350RlOB
 vE5zBQzn0q2awA4xoFxhsbXttR8/pVWynrgl4i9EQtVyIRF0zB691YJPt+GnyXhTwKUx
 g8zMqyyGVFQbLtaEtK4hWRd3mzAU0xGBMUeTxl0P1MKTON6poDE6O7YRp2wF/Ehg3aJZ
 089oZHcLGCiskCw88gMV6//++1ppdcpSXSvXZItbd7qJv48brQXPsK7Q6pVaQyAztayh
 cjrw==
X-Gm-Message-State: APjAAAX6xsvWJzo584Wpzc1N2tR077AcpcP1q0wrfPOSHHK6mW9oxmWY
 A8kdTZKNE6CGtjVoxiT6Azwpc7qYLkLtdhLqoiNn2Q==
X-Google-Smtp-Source: APXvYqyFheMkQokdT7S76lx3rhO73BZgzMaXkYbn9bEc24l0zUWhn8sQs10dhQou/MWFZxgLNWPF4yVi1kUvKFdgtLU=
X-Received: by 2002:a17:90a:1505:: with SMTP id l5mr223430pja.73.1575925140481; 
 Mon, 09 Dec 2019 12:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20191209205010.4115-1-natechancellor@gmail.com>
In-Reply-To: <20191209205010.4115-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Dec 2019 12:58:49 -0800
Message-ID: <CAKwvOdnNsWxY+ejhbToMqdzbWUP6dVP9=USZrW6neqHBoWA+2w@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand_base: Adjust indentation in
 onenand_read_ops_nolock
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_125904_323351_254EECBB 
X-CRM114-Status: GOOD (  25.96  )
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
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 9, 2019 at 12:50 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/mtd/nand/onenand/onenand_base.c:1269:3: warning: misleading
> indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>         while (!ret) {
>         ^
> ../drivers/mtd/nand/onenand/onenand_base.c:1266:2: note: previous
> statement is here
>         if (column + thislen > writesize)
>         ^
> 1 warning generated.
>
> This warning occurs because there is a space before the tab of the while
> loop. There are spaces at the beginning of a lot of the lines in this
> block, remove them so that the indentation is consistent with the Linux
> kernel coding style and clang no longer warns.
>
> Fixes: a8de85d55700 ("[MTD] OneNAND: Implement read-while-load")
> Link: https://github.com/ClangBuiltLinux/linux/issues/794
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/mtd/nand/onenand/onenand_base.c | 64 ++++++++++++-------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
> index 77bd32a683e1..c84ac749d70e 100644
> --- a/drivers/mtd/nand/onenand/onenand_base.c
> +++ b/drivers/mtd/nand/onenand/onenand_base.c
> @@ -1266,26 +1266,26 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,

There is more in this function before this hunk that could be cleaned
up as well.

>         if (column + thislen > writesize)
>                 thislen = writesize - column;
>
> -       while (!ret) {
> -               /* If there is more to load then start next load */
> -               from += thislen;
> -               if (read + thislen < len) {
> +       while (!ret) {
> +               /* If there is more to load then start next load */
> +               from += thislen;
> +               if (read + thislen < len) {
>                         this->command(mtd, ONENAND_CMD_READ, from, writesize);
> -                       /*
> -                        * Chip boundary handling in DDP
> -                        * Now we issued chip 1 read and pointed chip 1
> +                       /*
> +                        * Chip boundary handling in DDP
> +                        * Now we issued chip 1 read and pointed chip 1
>                          * bufferram so we have to point chip 0 bufferram.
> -                        */
> -                       if (ONENAND_IS_DDP(this) &&
> -                           unlikely(from == (this->chipsize >> 1))) {
> -                               this->write_word(ONENAND_DDP_CHIP0, this->base + ONENAND_REG_START_ADDRESS2);
> -                               boundary = 1;
> -                       } else
> -                               boundary = 0;
> -                       ONENAND_SET_PREV_BUFFERRAM(this);
> -               }
> -               /* While load is going, read from last bufferRAM */
> -               this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
> +                        */
> +                       if (ONENAND_IS_DDP(this) &&
> +                           unlikely(from == (this->chipsize >> 1))) {
> +                               this->write_word(ONENAND_DDP_CHIP0, this->base + ONENAND_REG_START_ADDRESS2);
> +                               boundary = 1;
> +                       } else
> +                               boundary = 0;
> +                       ONENAND_SET_PREV_BUFFERRAM(this);
> +               }
> +               /* While load is going, read from last bufferRAM */
> +               this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
>
>                 /* Read oob area if needed */
>                 if (oobbuf) {
> @@ -1302,23 +1302,23 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
>                 }
>
>                 /* See if we are done */
> -               read += thislen;
> -               if (read == len)
> -                       break;
> -               /* Set up for next read from bufferRAM */
> -               if (unlikely(boundary))
> -                       this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
> -               ONENAND_SET_NEXT_BUFFERRAM(this);
> -               buf += thislen;
> +               read += thislen;
> +               if (read == len)
> +                       break;
> +               /* Set up for next read from bufferRAM */
> +               if (unlikely(boundary))
> +                       this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
> +               ONENAND_SET_NEXT_BUFFERRAM(this);
> +               buf += thislen;
>                 thislen = min_t(int, writesize, len - read);
> -               column = 0;
> -               cond_resched();
> -               /* Now wait for load */
> -               ret = this->wait(mtd, FL_READING);
> -               onenand_update_bufferram(mtd, from, !ret);
> +               column = 0;
> +               cond_resched();
> +               /* Now wait for load */
> +               ret = this->wait(mtd, FL_READING);
> +               onenand_update_bufferram(mtd, from, !ret);
>                 if (mtd_is_eccerr(ret))
>                         ret = 0;
> -       }
> +       }
>
>         /*
>          * Return success, if no ECC failures, else -EBADMSG
> --
> 2.24.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191209205010.4115-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
