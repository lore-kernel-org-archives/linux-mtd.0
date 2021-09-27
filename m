Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3963C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE706103B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FE706103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhlYyWuaaH1kWiu/AUHBD4LoqWl3XCLBugXk4lq3Amo=; b=PEfV04t21NwnHB
	uqrKbtpmZdj31VGQwPYz+bbFkrWdQEYTQ8QyYoeGTHgSnzIL9KEN5KIdRXm/sSziCmtHXHEC/tVIL
	KBKOPcsNsbiIHMkxATj6kBHY1+/XPdnOk1eoljuH1kaG981mVOuQ/mGK1BEQJLa6sSFcsPn03t2ae
	jNwJ3sW+jTLaM8RiJwmlQfGav08dkMUDdjkYasNij1Xy7FWKH5Bwth8QOThbrnQxtwlSbJvcQJFA8
	aS0u/h/Z6J09C//hEtWcrtroo+jNHmRXs9JVaKS0aIUbLGXqWObJZtsG0vArtldNBrvPw+UTB7H47
	E6d1CS/zwL3IsuGeVD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzFN-004hYh-KQ; Mon, 27 Sep 2021 22:37:17 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUyr2-004YqX-6t
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 22:12:09 +0000
Received: by mail-qt1-x82b.google.com with SMTP id c20so18162068qtb.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Sep 2021 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AMu3KVG+C0neN9ZsGUlhnRWwKA7gUbler+qvelz4lhU=;
 b=ogMu5s1N93CRy1dt+p6ROJIIYW/1wEnTMSxjhExVqTohrpuPjQqjHLiFATIaty2PbT
 hvkqionemXt585mjBKDk8n5vtTqbBBOooEnXYS4SUHQpE4iiR7YXeMHLlwUiQDqkCxUq
 +5vyP8EjGPgXySM4t4hRK77M/rKxeGS4Tur2b6WqtvQ6n7/lfaJCStUks+6NLUHxByp4
 GpBh3FKijpfHLhFUDljHY0HCJ4JnFdBUMOW77NtumgKRxWE91EBLv3Qfew1F+Uwdd+oU
 MWIH9GYFqzGOpDeDzZ8jLjL72zT3zZIGJPBuEkwUmXaEgTTLV2uplB/wIDwftnrX8FTY
 3DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AMu3KVG+C0neN9ZsGUlhnRWwKA7gUbler+qvelz4lhU=;
 b=lXdJGEzuxLnUXveW6AGSsdM+E5hGLSHlTXUAjIDuRyvh96HAoDnVyNEn5mydD33NkO
 QiRnQh8ngTfqzHjvdGcHItSUbbDCFgBD5S2QXJyzTK9lY+vRESSqU9uz9PtHxnlKWtEj
 6u1N88JJUrNWrVCMm5/rIBiyeNKPX+Z8S6gwpZJt9R8G9ZeyXLXdq9/PGCS+Tb2nsmsv
 PR0pDKz2jMIPTmNJImWxCRtemTMKz8k6PlOBl6nDkYdkmrmJgrmsFitQy5oy0PrRPbLA
 c1b6kMy2/wxUXiGFI1DdHlz7wW+ZiX7lJ+UOI8AO8gkAEGpZmcESJ+jYYNmA7rKEK2yO
 JZmg==
X-Gm-Message-State: AOAM533rG6xWGFwO/jseU4Rfeh7xnStg6+AziEjhKI+obq/9rBI3SnV4
 Xaclx8y/yIXxsEBDCetXmjz6z/ID2jwLkOlKp10=
X-Google-Smtp-Source: ABdhPJzkBoZ12zOPElu8xM5aqGrEkr50S/pufi7WdQQNSQig5ur26Kqh75bX5YQEBWB/Wp2LIiAFExDRn9fzRPsBYz4=
X-Received: by 2002:a05:622a:1712:: with SMTP id
 h18mr2270159qtk.389.1632780726284; 
 Mon, 27 Sep 2021 15:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <17c04b2db3f.11955d8ed102190.1977520078612166881@kubicz.engineer>
In-Reply-To: <17c04b2db3f.11955d8ed102190.1977520078612166881@kubicz.engineer>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 28 Sep 2021 00:11:55 +0200
Message-ID: <CAFLxGvxKhKjgqO=_6dgTHcnGpkaapeyvOO6zmGvHLwo6X+-aHw@mail.gmail.com>
Subject: Re:  MLC NAND support in ubifs
To: Filip Kubicz <filip@kubicz.engineer>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_151208_318079_F86F0AB4 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, Sep 20, 2021 at 9:39 PM Filip Kubicz <filip@kubicz.engineer> wrote:
>
> Hi All,
>
> I'm bumping up the question about NAND support since it looks like it slipped unnoticed between emails with patches. Does anyone know the answer?
>
> Thank you in advance,
> Filip
>
> filip@kubicz.engineer
> tel. (+48) 697 088 078
>
>
> ---- On Thu, 09 Sep 2021 18:41:24 +0200 filip@kubicz.engineer  wrote ----
>
>  > Hi!
>  >
>  > I would like to ask about MLC NAND support in UBIFS.
>  >
>  > I was recently bringing up a device with IMX6ULL and raw MLC NAND flash. I have built Linux 5.4 kernel, u-boot and rootfs (using buildroot), flashed them to my device with MLC NAND flash, and learned from dmesg error that MLC is unsupported by ubifs. Support removed in this commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5094b7f135be
>  >
>  > Then I followed the story from Richard and Boris and watched the talk where they explain the issues with MLC, and propose an alternative: https://www.youtube.com/watch?v=9j2pOIiJqYw&ab_channel=TheLinuxFoundation
>  > Alternative available since Linux 5.8: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.8-NAND-MLC-SLC-Emulate
>  >
>  > My questions:
>  > 1. Is NAND MLC (+ubifs) reliable to use with SLC emulate mode introduced in kernel 5.8? Or should I rather switch to eMMC for this design? SLC NAND is too costly at my required size.

SLC emulation solves only the paired pages problem. You still get all
other downsides of MLC. I'd not use it unless I'm forced to.

>  > 2. If the MLC NAND is not supported, can you update these pages:
>  > - http://www.linux-mtd.infradead.org/doc/ubifs.html
>  > - https://www.kernel.org/doc/html/latest/filesystems/ubifs.html
>  > - http://www.linux-mtd.infradead.org/faq/ubifs.html
>  > Each of the documentation pages mention MLC, so you can get an idea that it is supported. But it looks like the MLC NAND flash is not supported by UBIFS.

Good point!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
