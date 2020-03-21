Return-Path: <SRS0=qq/S=5G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B92C4332D
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 15:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A1420722
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Mar 2020 15:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iB0yAEHM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EClMkNOg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44A1420722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FI6UuYuuaOH882Yfs5IUGE3LuaDvHxvn3ooOj2pPJzE=; b=iB0yAEHMdE2iOnEixeVtbN1PYp
	lqt1aIpAnoJkFWqIt65XBMeYeT1YioIROyRKQKbp1v6P5/q25LLasf32jEuI7o8brq4sg3P3ONxPk
	5bz0cuNj8Nh0pMR/hsPGetg/LougOqbTVYmbja/uBYlHo5Olb7cmVTmFbpJGmSr9T61qK7ZpI0PYF
	sGgRGJGnRu6RH3ICjRHHI+357Vvw3/wUn/OGieDoVwfaUcvRUFoXFuphnZYbmKANmV90YL4FZ8dFy
	Z7KyYJtsRNXjzEImle3q5MrTFYyJ8SCIjsewkogdD97xF/dLUoa6MoJd7wFchjSm0yHtKU/JpAUAv
	Y7JHB8jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFgIZ-0003LE-0D; Sat, 21 Mar 2020 15:44:31 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFgIS-0003Kt-1H
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2020 15:44:25 +0000
Received: by mail-oi1-x243.google.com with SMTP id p125so9909731oif.10
 for <linux-mtd@lists.infradead.org>; Sat, 21 Mar 2020 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BlfYB/H07ym5NRyUBL3cN/qnvx15kq6KoW/YEMUZZAw=;
 b=EClMkNOgn5lkndsWdUqd3Plea62S9jnE24zMWhoTuc7mSp9ir1i8XPZtMLi0b10A68
 t40D3up+3i7DHjGKYqZ7s5lRrK+SuxsAiy0N+pfIB/PfIUKcTFhRPvEQBLgh5v2mqBQR
 3uuZOQBGqnEBcJRpN7ss4RrkDsREWJWOC8ubg7QK4q2FfK6vfkPMaNLFfq/Ox6EuTc6d
 cXuXxqIWAdHbfSC6yjYHwnCAjJYPrSORNiJ+5n7ghT8D3hjRUIoat2Jjmo8rJfndUPHg
 2FCL6aknUYAV+Gxp+MhTofnYwSpzCYAJBsmkQ8vNH5ACVSzLhOBctUr1iOEP9/wlGIIk
 v9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BlfYB/H07ym5NRyUBL3cN/qnvx15kq6KoW/YEMUZZAw=;
 b=odBaqu4bTyaNqeXxvLk9bCNRo8fMvJlKDiEn2ISeYwFloliDnc0m3GRqjPOZ4P5+x3
 DwWzircjiYvm3u8HOL4kKdr3oWUWYTI2032s9JbV4lDzs0+zVkUQ7gpmCn/MPLQt1Vcz
 BYIjkMyEA3d2U+5vyl5KyFde0cMGKTfpP8X0PqxD9rwgC42i8tuSMEf72utYfleTkzfZ
 ivuIYwvI91jW/vsCVM1uLaihuPkjLc39XArW2ZuqYXrzAfuQJ3GO2BoThKFNo/YX/jHN
 SiQp0/6tW+WE1RZaTF/SDNxJwxRvAiuzkuqjGqvkJl3pHF4XNyDUof97fR5iFvLv9M0F
 06mQ==
X-Gm-Message-State: ANhLgQ1+UgL/XN6HqaN/InCU4b0AYVp7gOUODtHq7kXERXFwXmV8Kj+e
 rPGuDy8CTkW1yzuJE0BqtbdFG7NNb5UzY943XPM=
X-Google-Smtp-Source: ADFU+vvjue5JkXY1FuE7loXUAG1KNrcKEtVxdvGkKNCeP8XVqW5BjhOcQ3VMln1l3nzBqH/IwviSO5qlfCknxIAAc5o=
X-Received: by 2002:a05:6808:8:: with SMTP id u8mr10635597oic.37.1584805458912; 
 Sat, 21 Mar 2020 08:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
In-Reply-To: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Sat, 21 Mar 2020 08:44:07 -0700
Message-ID: <CAP6exY+m7SGgkg1Ng7tzDU8m--vb4bg=Re_C3OX8jdPAZGn17w@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: add | as a separator after mtd-id
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_084424_102555_C385F7F1 
X-CRM114-Status: GOOD (  25.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Anyone? This will be going into use at Google internally and I'd like
to get it upstream.

The only other option that would work is to take the pci-format names
created by intel-spi-pci that have : in them and change the : to '.'.
Is that more acceptable?

On Fri, Mar 20, 2020 at 1:21 PM ron minnich <rminnich@gmail.com> wrote:
>
> The MTD subsystem can support command-line defined partitions
> for one or more MTD devices.
>
> The format is:
>  * mtdparts=<mtddef>[;<mtddef]
>  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
>
> The ':' currently separates the id from the partdef.
>
> The mtdparts can define more than one part, in which case
> there will be more than one <mtd-id>:<partdef> component.
>
> The problem comes in with newer systems which have MTDs
> attached to a PCI device, which has a PCI name including
> several :'s, e.g. 0000:00:1f.5 on an Intel chipset. Although
> this is largely an x86 problem at the moment, PCI is coming
> to newer ARM systems, and they will hit this issue in future.
>
> There are two : in the name alone. strchr is used to find
> the <mtd-id>, and in this case it will return the wrong
> result. Using strrchr is not an option, as there may
> be more than one mtddef in the argument.
>
> This patch defines a new delimiter, |, to seperate
> the <mtd-id> from the <partdef>. | is rarely used
> in device names, so seems a reasonable choice.
>
> The code first searches for | and, if that fails, searches
> for the old :. Eventually, it ought to be possible to remove
> the support for : entirely, but since mtdparts are also defined
> in FLASH in the device tree on many ARM boards, wholesale removal
> is not yet practical.
>
> This code has been used on real hardware and allowed us to use a
> squashfs in SPI-NOR flash as a root file system, with partitions
> defined on the cmdline.
>
> Signed-off-by: Ronald G. Minnich <rminnich@google.com>
> Change-Id: Ifce3627cb03247bf9e54c8b19d24b60baeed2ec3
> ---
>  drivers/mtd/parsers/cmdlinepart.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/parsers/cmdlinepart.c
> b/drivers/mtd/parsers/cmdlinepart.c
> index c86f2db8c882..eca8ec026d89 100644
> --- a/drivers/mtd/parsers/cmdlinepart.c
> +++ b/drivers/mtd/parsers/cmdlinepart.c
> @@ -223,7 +223,14 @@ static int mtdpart_setup_real(char *s)
>          mtd_id = s;
>
>          /* fetch <mtd-id> */
> -        p = strchr(s, ':');
> +        p = strchr(s, '|');
> +        if (!p) {
> +            /*
> +             * ':' is the older separator, which conflicts
> +             * with PCI IDs T:B:D.F; too many  :'s!
> +             */
> +            p = strchr(s, ':');
> +        }
>          if (!p) {
>              pr_err("no mtd-id\n");
>              return -EINVAL;
> --
> 2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
