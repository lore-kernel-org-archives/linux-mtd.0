Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA323C35247
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 23:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEE020732
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 23:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bXs7O8KX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDvPHqoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEE020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TWy2fvWlDyXLfYvzqPCw4lt/DB7i+2uQlR74mgQkEc=; b=bXs7O8KXCOLIg5
	yWkaiS2ilqpNvcD9ED3SMFdxtVRRjbvHIgKsXbFb8oCUBgz/aUlOkPCYEPfoBG/KwvpbQbvC1yA3W
	yR9DSAh4ofAcoAANVjUl34o3ix5VpM1EKeM8c8xrjGJNZ1r9iIVNmFjlLK89PPRfumtetHH4KXa83
	vBTh1/izg+fP5XxESY9FT+eZZzzn99WKHaNUQONX60n4x/NZL03fF2hGMtjCKoy2sFQBPZ7C+zDFr
	qp1ICgH/Yi/NEJg4+61svY6umtA8DlBVAxwaJ9ihq/K3AwkGGshd2+CYUcwDa9HlfUpriSPDK4a1B
	M9I2W0jnRp1H5q8teg0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iykhm-0000nD-Pr; Mon, 03 Feb 2020 23:00:34 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iykhi-0000li-HF
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2020 23:00:32 +0000
Received: by mail-il1-x133.google.com with SMTP id s85so10733304ill.11
 for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2020 15:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=T+X/+Elx0aEl6HKJVJx909w/G/x0/1i0TAWRO2sOHvk=;
 b=eDvPHqoqGbf16XMMT48Q3ym/DJizW10JUlIir9GgvXVNUooDhb2H3PQDqrjZiLtwIw
 0T095htGaYaMEC7wKd+oxrkgfkivWbJ5aPmoXPXeOr0IpSI/34eFGd84OJRcUKX9hLVy
 Fjl3H5/qGl/IQgMVoXt6Vu7sOFzFrQ2rM5msh3LaSzMy4qQAboN8DEXoIN/P4Nx4uQsr
 JeKaQWD6j67vvj6RhxCiQdjBBpnsOar9sNzM2rxNeyS26yGsKQAKPTXzmMUR1Mplm27w
 nCf+Hazhv0/nHiVSG1lNf2VGLxOIEJG/2ow/pTlSjUOQbxV+0FPganSwHlS2h6fjGqu+
 XEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=T+X/+Elx0aEl6HKJVJx909w/G/x0/1i0TAWRO2sOHvk=;
 b=LajfSREbmRdn05AKgdwi9imwGvuX5fD7XxEXAWimGhzgaaLYF6mMzUMjt9tRoAqcnC
 +FwWDZIRI6IIhYUH/L+wxDl+nw4H1DEMWzyWRSgttP2EENdB4BAiBQnEtSYazB/IBuwD
 d3D2HMJNc/zdkZWmJBd0Ium/QyIGBCcDnSkbwFWtIUW31elKi2JFdUanZL8NGV3gw2P0
 4fGanUhEKkzHyqrCJuaaNibj6JlcyGwF+SUoykpzcMY+WLg+K8bvkulI8xq12Y2XAS1V
 6YMg1zLGEr1355Hwb0J+bA6+llI18jFALSDKX18ktij8AkwMaTvikJkj7XBhPcIpxVJg
 9Yqg==
X-Gm-Message-State: APjAAAW5i+6ugZdRixBnMkE8cSiVD8Zs+UN6K46UojHjF4P0Sj8nAG63
 7UeBrcvufoKbyTVZfSg+O73Z0Ltap0DVzxwvmLGMOkKejXE=
X-Google-Smtp-Source: APXvYqzouKMVE0TULYcpg0Gmv6D2HgEux+GpfvCeunOkT9at9+6O1I3j9SEKQAmLsWzsx3kY5iKbVX52vY0ydxPpIe8=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr25418134ilq.192.1580770828405; 
 Mon, 03 Feb 2020 15:00:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Mon, 3 Feb 2020 15:00:27 -0800 (PST)
In-Reply-To: <20200203110820.kokz6qu4l74nyhlk@qschulz>
References: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
 <20200203110820.kokz6qu4l74nyhlk@qschulz>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 4 Feb 2020 10:00:27 +1100
Message-ID: <CAA=hcWSa+athn4Jw_nOG3ofVEmCYpTqyJVWPGcv-kNV2FmjVeA@mail.gmail.com>
Subject: Re: [OE-core] Failed to add u-boot ubifs (not working)
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_150030_596990_0E4A1613 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Quentin,

Thanks for your response.

On 2/3/20, Quentin Schulz <quentin.schulz@streamunlimited.com> wrote:
> Hi JH,
>
> On Mon, Feb 03, 2020 at 09:56:49PM +1100, JH wrote:
>> Hi,
>>
>> I added my local machine to ubifs, is it correct?
>>
>> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
>>
>
> Also, you need to select UBOOT_CONFIG somewhere, with the above line,
> you just say "if nand is selected as an UBOOT_CONFIG, do xyz". You still
> need to select it (with I assume, UBOOT_CONFIG += "nand" in a bbappend
> somewhere).

Sorry for not being it clear, I indeed defined UBOOT_CONFIG = "nand"
in the local.conf. Should I define it as UBOOT_CONFIG += "nand" or
should I move it to a u-boot bbappend?

> What's in your mx6ull_14x14_evk_nand_config?

The mx6ull_14x14_evk_nand_config,ubifs was from a tip found and copied
from Internet, but the original definition is from included
meta-freescale/conf/machine/imx6ullevk.conf:

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "mx6ull_14x14_evk_config,sdcard"
UBOOT_CONFIG[mfgtool] = "mx6ull_14x14_evk_config"

I tried to use UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_config,ubifs", no avail.

> I haven't used that option before but what's ,ubifs supposed to do? Are
> you sure this nand option for UBOOT_CONFIG would actually create a .imx
> and not a .ubifs for example or something along those lines.
>
> TL;DR: Make sure UBOOT_CONFIG has nand in it, check that .imx is built
> with your defconfig and check that you're actually enabling the UBI
> command in your defconfig.

Yes, all enabled in my kernel 4.19.75:

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
# CONFIG_MTD_UBI_GLUEBI is not set
CONFIG_MTD_UBI_BLOCK=y
CONFIG_DTC=y
CONFIG_OF=y

> Also, it would be helpful if you could give links to the recipes you're
> using. I seem to recall in some other mail it was
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=sumo
> but it could be thud version as well.

Yes, I am using the thud, the u-boot-imx_2017.03.bb is the same, here
is the link:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=thud

Thank you very much.

Kind regards,

- jh

On 2/3/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I added my local machine to ubifs, is it correct?
>
> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
>
> I built the u-boot.imx, but the ubi was still missing in u-boot. What
> I could be missing?
>
> => run nand-boot;
> Unknown command 'ubi' - try 'help'
> Unknown command 'ubi' - try 'help'
>
> Thank you.
>
> Kind regards,
>
> - jh
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
