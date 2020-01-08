Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427F3C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF3620705
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rs3bw1Sy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUum7dHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF3620705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSpYzequDMs1RCnT0eyWhSzIxUDoUiAUJGBpW6GooRc=; b=Rs3bw1SycQFU9Z
	QntK163URzP7r+EyZyFh5IdZjma4i2b7ojgo9jwb1bkRRKZ1RQTebnY2NzkzIczNfsouqGT1I/wzs
	qrjtlNP+ygkg+QNVyrCWW6MgULNU4GsKeodigPUaCRG7/jSgJXUSC1+Gshb0IlPfHoXmBhGk6zuWK
	yWDYwQQZr1qL+1BwJC5zyM4p+4gEkIF3c4E8oz676EWRCVyFIX4LsloOYwrbsyklMQnY6eA5a6szT
	3E+F6zgkKSViFBDZNDn6ZQodBHsigGKd/HfmEFLIUcJyYrVRQlhIDJ0cCwOdI8ojzbu3z2SfKkARK
	FgSVpgrUPc5SaKhvkbxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipJmv-0005vZ-RJ; Wed, 08 Jan 2020 22:26:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipJmt-0005uS-3H
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 22:26:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id p9so683521wmc.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2020 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR8J64IqyQncvqOtd/yZ29cmXT7Fd/GhQofRmUNnP6E=;
 b=gUum7dHDz2Si3vc831dY3sr9xegNRQtI4RV1eoNLF/eTP1L/XokLAc6CbmBXYdtnkC
 E4pc67Ea81q6ch2DSqnVkBE5Aj3l0+eLIoNkxma0OJCQqkepi3/lCjwqTFCzmUNbwDMf
 ZX48hW/6fsKyFZ4q9uY0+QV3B+SIpB/mv+/Zjk6ExDybNrNtZxfQN94u8KJE2HUrwefX
 HBZ26jnngI8vND0NYkTfv6jaKcE7D6ycFgPDokGLkGUQnmoRgdXfaX8XPFBn1oK4FD0W
 2G7XDp3/kg/cp1Jmxh4GoQD+0ilwMBtXC5AZmEfO2au6fJWf84+AF6gB5WIozl/8eAy0
 k8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR8J64IqyQncvqOtd/yZ29cmXT7Fd/GhQofRmUNnP6E=;
 b=dv2cQlnJI97r1xYAkR13qCHvljwymPNXS5zEsiZFfgnRi7Lxs0i7NLMadHj1zm4mPD
 IjZl7je29BjXPdAXSD5EO6hQTXyltpIjznpPHcvRVEdDTaqx9Qt7hKGcY4/GIEJCQU6c
 PrtI9OwBbGl+MDnG9NZPbh6rbFr1b5MwTcUAv2DNfS48Bp7fDm0wqxIdYiJZeB7CumYT
 o52HUSDCYJASSUYMq3dLXlugDsuF/2gGzaQOdTu3T2rmrYoSvo4rf7FCoy0PWo8/CI8W
 Zslqo1SJbc2++LQcoTeEJkYI8+GWnUEfaS/Xynj8kyJhZ5QcsCvKFDtRaHEgYXEX55Rc
 h0dg==
X-Gm-Message-State: APjAAAV4LY+KofKH5phT1EqEGPR2/erNxruUyUKNV+5emoMeBElfuwUo
 nv+kxs3O93tpNB0fsDNsp+r0O0kiIzY1u8dqXto=
X-Google-Smtp-Source: APXvYqyzMe1+wQgQxXxKQtQ6a89rjjGSXn5ASgBlF9xEs3Nx304WhHyfMRRyqTZzzz3VN3S7ebSySKDRKipG3PbsffU=
X-Received: by 2002:a1c:184:: with SMTP id 126mr866374wmb.127.1578522407365;
 Wed, 08 Jan 2020 14:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20200106192815.8902-1-ceggers@arri.de>
In-Reply-To: <20200106192815.8902-1-ceggers@arri.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 8 Jan 2020 23:26:36 +0100
Message-ID: <CAFLxGvx9V4OXXLgNvFNHVSB72FvW7sbsin3TpG+68vXA8-56Ag@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: Also encrypt multi linked files
To: Christian Eggers <ceggers@arri.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_142651_163581_7DBF1369 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 6, 2020 at 8:28 PM Christian Eggers <ceggers@arri.de> wrote:
>
> Up to now, no fscrypt context has been passed when calling add_non_dir()
> from add_multi_linked_files(). In consequence, files with multiple links
> were not encrypted all.
>
> The Linux ubifs file system detects this situation (file not encrypted,
> but parent directory is) and refuses to open such files. Nevertheless,
> these files are stored unencrypted in flash and could be accessed by
> reading directly from the flash.

Thanks for pointing this out!

> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> index 4247270..519c982 100644
> --- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> +++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> @@ -2228,7 +2228,7 @@ out_free:
>  /**
>   * add_multi_linked_files - write all the files for which we counted links.
>   */
> -static int add_multi_linked_files(void)
> +static int add_multi_linked_files(struct fscrypt_context *fctx)
>  {
>         int i, err;
>
> @@ -2237,11 +2237,16 @@ static int add_multi_linked_files(void)
>                 unsigned char type = 0;
>
>                 for (im = hash_table[i]; im; im = im->next) {
> +                       struct fscrypt_context *new_fctx = inherit_fscrypt_context(fctx);
> +
>                         dbg_msg(2, "%s", im->path_name);
>                         err = add_non_dir(im->path_name, &im->use_inum,
> -                                         im->use_nlink, &type, &im->st, NULL);
> -                       if (err)
> +                                         im->use_nlink, &type, &im->st, new_fctx);
> +                       if (err) {
> +                               free_fscrypt_context(new_fctx);
>                                 return err;
> +                       }
> +                       free_fscrypt_context(new_fctx);
>                 }
>         }
>         return 0;
> @@ -2290,7 +2295,7 @@ static int write_data(void)
>         err = add_directory(root, UBIFS_ROOT_INO, &root_st, !!root, root_fctx);
>         if (err)
>                 return err;
> -       err = add_multi_linked_files();
> +       err = add_multi_linked_files(root_fctx);

Hmm, maybe I don't read the patch correctly but doesn't this
always inherit the the context from root?

This may work by chance right now but AFAICT the fscrypt model wants us
to inherit from the parent directory.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
