Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EE9C352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 14:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE90206A2
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 14:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCoLMUPn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpXBeRuM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE90206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDgsyM3R0tM7hYHgp37QCOEiJkg2KKogD1+92gc9Feg=; b=fCoLMUPniWuSTy
	fneqEuaMAIJ86GwRE4P7X4oLdPkRtYCm96Pack5UMw4HVVwZVUzHNuiwn1QF8KqyB++j8IiTUzjwF
	aW25RET+yED1YyMtid4t54vzxcXmBzClbM0pfQieb+mYSQyxLiuU8MFgrZjigpAw5+n9Oqa3Xhm84
	PPDplU+9Z5Zct0Qi10lGncre0Dhy8kIxJZYzl1FC0d7nnaWgd7cRWjQauiq/kOVO1vT/PnRWP4yIF
	CpfDlJaMlWakmvyyvlwsSUwe55Lr/fNGbR/H1fVMw9zELRK9tm9+8fS1TbEYX+onTHGrTm1TZFbSp
	W3wa7f+6l00wjhYOJtOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP5vD-0000Ek-Nb; Thu, 16 Apr 2020 14:55:19 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP5v9-0008BA-Ri
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 14:55:17 +0000
Received: by mail-oi1-x241.google.com with SMTP id k133so16062366oih.12
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ApXDAryjVZ1NhYOMhZ0mJPFGTTxjNrpKZ3hMH5Wk1rI=;
 b=kpXBeRuMgKb9LePzXmq5+Q2/HlepHeCz+xauCU2QEg6c2e/xDJcEUohgjmYjscEq1J
 XKWfkcaXqYCvVdTswUZjrfdAcu8Kcxm7Hpgxdwuw+TsstUrs8lJHeSWA1OvS6ZGmMueo
 WHEia2smDdJ3WMRRjy0tsJP47OYlOKiFxEPNMJOoKKOifDUiB7fT72vxt9O8YR2W4sxL
 2YpZhvGh+Gu1yJXf9iA1Oj2Z4Ethgac1sdAND647J6BbqvIwoACZQDi9IKZkhRLblixF
 XfiFDU6+x3BDGPfNrEjWEXBOZ+ndTFzmE0U5E9NQl+TosuHwYdlqAFg/+rII+3Qs1M4Y
 NMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ApXDAryjVZ1NhYOMhZ0mJPFGTTxjNrpKZ3hMH5Wk1rI=;
 b=lnRlD477oKsv3lAM0yX7jypqVzeaSNQgykdBgZlU7Pss8GdfySw2zMwGzmnrDwziUQ
 zr+cs0Jiw6E204f8vfPy70T3PKbLs6rao83dLqXFlfnvWwEmkOsXeT6B4yiDpRFDEHgL
 ah3aqZEpRT6Exx36LMLbmI5r+QReWnhLYLdIOyd3IOOFnKToWLwqOqkfU5VqPGT8ihBZ
 7pWx1xbIarUxsqRTH7t0ju283Y+Y7B4RSuBj9QmzSdAJuaLUqbLODugLrRX5Z/F4Gpfd
 oTJWNwZChhpIF1DTcn9dG/2A+x4EB0uwF1zHrHXaGnL4u61sCJSFR1J3nGQPB8Cyc2j9
 6ypQ==
X-Gm-Message-State: AGi0Pub6yL98TmxZKrs0k2WnHRCf2h5b92AJ+mwmZrnCUwH1cNrk0nNx
 EVzEd5cElKkuF2JawpsJh/IcqmEE61gXmLmrYsE=
X-Google-Smtp-Source: APiQypLCtSncMsxPH2cCTJRXm5LeJw8H8IJylLVXO7vXh/4Tfb4DcpcxBoTRyE5JutCoMEGfnxOSoxdCQWnhPttFh2I=
X-Received: by 2002:aca:f1c6:: with SMTP id p189mr3237696oih.5.1587048913230; 
 Thu, 16 Apr 2020 07:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200406160914.14698-1-rminnich@google.com>
 <CACRpkdYVwFiCf5MJGLEyhxL8omxr9Tav=8Le_zEX-D89SXjV1Q@mail.gmail.com>
In-Reply-To: <CACRpkdYVwFiCf5MJGLEyhxL8omxr9Tav=8Le_zEX-D89SXjV1Q@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Thu, 16 Apr 2020 07:55:01 -0700
Message-ID: <CAP6exY+pDg8rAi4RZw5s5jZh1awtWg6_Q5=tm6RYC4c+XZz+cQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: parsers: Support '[]' for id in mtdparts
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_075515_988223_F281C97A 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Ronald Minnich <rminnich@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> I suppose the use case is using PCI-based MTD devices for testing
> something android images on desktops? I'm surprised it didn't
> come up earlier.

Thanks. In this case it's for systems that companies are deploying
into their data centers, using linuxboot (linuxboot.org) and Intel
chipsets. On Intel  chipsets, there is a 64 MiB SPI part, but only 16
MiB is directly addressable.

Linux goes in the memory-addressable part of the SPI, and UEFI loads
it into RAM, since to UEFI the kernel is just another UEFI driver --
in fact in most cases we replace the UEFI shell with Linux.

But we need a file system, and with the huge amount of drivers that
come with UEFI there's not much room in the top 16M. (we're working to
fix that glitch, a process we call DXE-ectomy, but it takes time).

We wish to place a file system in the low 48 MiB -- lots of room there.

So what one can do is put a squashfs-formatted file system in that low
part of SPI, and, using this mtdparts capability, point the kernel at
it ("root=/dev/mtd1 mtdparts=[a:b.c]etc.etc"). It's a lifesaver for
those of us using u-root for our userland.

ron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
