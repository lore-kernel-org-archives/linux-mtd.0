Return-Path: <SRS0=FaK6=3Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909F9C3524B
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 09:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66260218AC
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2020 09:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VtTmkFkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66260218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=streamunlimited.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CynRKjH4S2hfP++GbHDCjUK2Mf+xSnjAFIFHiBtVOPI=; b=VtTmkFkQb1unzQ
	Sw46X+90F7KzmOSvPGsDzhH26C6cAt3cmGlldWnNrk/ypC8GS5ZemBUZQfyVV2OaqCKsVlIZvlozf
	muyS0hr8VXxduXCGkrlT4PVlb82xQ43XV48zNPBs7LI0DxZPWMzFdm6Rp9wJ9eFq+CqHnpmS27fXJ
	0Wc9jEvduKDc0ozU/N4eHLmNEhoHFdefU1OFKbdlF6yNrjJeL8ns7+rLMI3GRurPLC1tZx/J/jVdz
	mdRSTJFg1SZPy6y4NRQjFk+hRPj/TfMJvoY/7N1EKkJRXAZ5C4nqY2xerqr2HFkjy7prZwidAnWGv
	t/p0By+5h3nHJswGKwzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyu9r-0000ch-KS; Tue, 04 Feb 2020 09:06:11 +0000
Received: from bsmtp2.bon.at ([213.33.87.16])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyu9m-0000cD-Ux
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2020 09:06:09 +0000
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
 by bsmtp2.bon.at (Postfix) with ESMTPSA id 48Bf1T55S7z5tlL;
 Tue,  4 Feb 2020 10:05:49 +0100 (CET)
Date: Tue, 4 Feb 2020 10:05:48 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Subject: Re: [OE-core] Failed to add u-boot ubifs (not working)
Message-ID: <20200204090548.jokxe7ircypcb6co@qschulz>
References: <CAA=hcWQSba31fHCkAEdaK4+FwR_Szzs9t0fTajq4+USqnbZb1g@mail.gmail.com>
 <20200203110820.kokz6qu4l74nyhlk@qschulz>
 <CAA=hcWSa+athn4Jw_nOG3ofVEmCYpTqyJVWPGcv-kNV2FmjVeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA=hcWSa+athn4Jw_nOG3ofVEmCYpTqyJVWPGcv-kNV2FmjVeA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_010607_313619_F8C639DC 
X-CRM114-Status: GOOD (  30.40  )
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

Hi JH,

On Tue, Feb 04, 2020 at 10:00:27AM +1100, JH wrote:
> Hi Quentin,
> 
> Thanks for your response.
> 
> On 2/3/20, Quentin Schulz <quentin.schulz@streamunlimited.com> wrote:
> > Hi JH,
> >
> > On Mon, Feb 03, 2020 at 09:56:49PM +1100, JH wrote:
> >> Hi,
> >>
> >> I added my local machine to ubifs, is it correct?
> >>
> >> UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_nand_config,ubifs"
> >>
> >
> > Also, you need to select UBOOT_CONFIG somewhere, with the above line,
> > you just say "if nand is selected as an UBOOT_CONFIG, do xyz". You still
> > need to select it (with I assume, UBOOT_CONFIG += "nand" in a bbappend
> > somewhere).
> 
> Sorry for not being it clear, I indeed defined UBOOT_CONFIG = "nand"
> in the local.conf. Should I define it as UBOOT_CONFIG += "nand" or
> should I move it to a u-boot bbappend?
> 

From what you say below, it was defined in a machine configuration file,
so modify it there. It;s fine *for debugging purposes* to modify the
original file but in the case of machine configuration file, once you've
settled with some modifications, you need to create a new one in your
own layer and add the changes there so they can be shared with people
(conf/local.conf is NOT supposed to be shared).

But UBOOT_CONFIG = "nand" looks decent to me (it's a machine specific
variable, so rather set it in the machine configuration file).

> > What's in your mx6ull_14x14_evk_nand_config?
> 
> The mx6ull_14x14_evk_nand_config,ubifs was from a tip found and copied
> from Internet, but the original definition is from included
> meta-freescale/conf/machine/imx6ullevk.conf:
> 
> UBOOT_CONFIG ??= "sd"
> UBOOT_CONFIG[sd] = "mx6ull_14x14_evk_config,sdcard"
> UBOOT_CONFIG[mfgtool] = "mx6ull_14x14_evk_config"
> 
> I tried to use UBOOT_CONFIG[nand] = "mx6ull_14x14_evk_config,ubifs", no avail.
> 

I'd first have a look what this ",sdcard" thing is doing (c.f.
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-boot/u-boot.inc?h=thud).

> > I haven't used that option before but what's ,ubifs supposed to do? Are
> > you sure this nand option for UBOOT_CONFIG would actually create a .imx
> > and not a .ubifs for example or something along those lines.
> >
> > TL;DR: Make sure UBOOT_CONFIG has nand in it, check that .imx is built
> > with your defconfig and check that you're actually enabling the UBI
> > command in your defconfig.
> 
> Yes, all enabled in my kernel 4.19.75:
> 

You're mixing things up. If you want the ubi command to be present in
U-Boot, you need to put it in the U-Boot defconfig. Kernel defconfig has
nothing to do with it. Though, you might want ubi support in the kernel
but that's unrelated to your current issue.

> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> CONFIG_MTD_UBI_FASTMAP=y
> # CONFIG_MTD_UBI_GLUEBI is not set
> CONFIG_MTD_UBI_BLOCK=y
> CONFIG_DTC=y
> CONFIG_OF=y
> 
> > Also, it would be helpful if you could give links to the recipes you're
> > using. I seem to recall in some other mail it was
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recipes-bsp/u-boot/u-boot-imx_2017.03.bb?h=sumo
> > but it could be thud version as well.
> 

I've seen a few mails from you recently on the mailing list which are
more or less sequels to previous mails. FWIW, we have an IRC channel on
freenode at #yocto, that might be helpful if you have quick questions
(e.g. your "applying a patch" mail).

I find Yocto to not be the most forgiving when copy-pasting stuff from
the internet. I'd suggest to invest a little bit of time in reading the
source code of what you're trying to modify (u-boot recipes, classes,
etc.), you also have an extensive documentation here:
https://www.yoctoproject.org/docs/2.6.4/mega-manual/mega-manual.html
it is a manual containing all the other manuals you can find per topic
here: https://www.yoctoproject.org/docs/

I can also suggest Live coding sessions with Jozef on the project's YT
channel https://www.youtube.com/user/TheYoctoProject. (It's Twitch
streams uploaded to YT so if you'd rather watch when he's streaming:
https://www.twitch.tv/letoatreidesthe2nd

I want to end those recommendations on a note: sending mails is perfectly
fine :)

Have fun with Yocto,
Quentin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
