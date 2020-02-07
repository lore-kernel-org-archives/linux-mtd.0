Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59B0C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 11:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C7620715
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 11:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDs5aE+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C7620715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=streamunlimited.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp1ogkMRmYoVRPr3dIYAd0soyL1KyhvL4lHE5k87R9o=; b=ZDs5aE+k1waYJp
	vP6a4u8UOk2BdmF8DFtr4MBlQkJmRIW+joIiGMHWA/ZB9fTVH8C7T8NmoWx9idCe5X93AyrYrZIag
	yLjv/qTWcrQRE7eZ+vRVCRLdO1T59+OeucgRXGCeYqr07Qh4zUgrlnmFls3wdHTP+Md3FS+wZtIfY
	kT+psQH5rQIevIQHE/zKxe7iYrHvqAdxT1wJbo0AV9QbhTw8UC+TpxZyi6BVPE8k1KbU7WxmHNRXE
	BTj/xPQZhAG5krug7j/3zMjogvb5C3iJLuvLphfwZQDHo49MDbgd8XXHICNthtMBjT8/e79jgiqds
	4L7p3JDy78fvRP3V2Njg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j02EW-0008WL-9E; Fri, 07 Feb 2020 11:55:40 +0000
Received: from bsmtp2.bon.at ([213.33.87.16])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j02ES-0008Vb-Sw
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 11:55:38 +0000
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
 by bsmtp2.bon.at (Postfix) with ESMTPSA id 48DYdk3dXkz5tl9;
 Fri,  7 Feb 2020 12:55:22 +0100 (CET)
Date: Fri, 7 Feb 2020 12:55:21 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: JH <jupiter.hce@gmail.com>
Subject: Re: [OE-core] [yocto] Support UBI u-boot
Message-ID: <20200207115521.i7flzwf6e24obq5r@qschulz>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
 <em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
 <CAA=hcWQsP1N58iqrxEggZBdSksgHk+gfuG7yz0+C3G7o0=DzOw@mail.gmail.com>
 <c159fe1d7cc14f5c80878fe81a957bb4@tagmaster.com>
 <CAA=hcWQPrfb3UrYsfyhs4as8wGDf5DsyEtF=cgCo4gJprx=b1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA=hcWQPrfb3UrYsfyhs4as8wGDf5DsyEtF=cgCo4gJprx=b1Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_035537_093132_3DF194E0 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Andy Pont <andy.pont@sdcsystems.com>,
 Yocto discussion list <yocto@yoctoproject.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Pelle Windestam <Pelle.Windestam@tagmaster.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Meta Freescale <meta-freescale@yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi JH,

On Fri, Feb 07, 2020 at 07:52:35PM +1100, JH wrote:
> Hi Pelle,
> 
> Aplogize for cross posting.
> 
> On 2/7/20, Pelle Windestam <Pelle.Windestam@tagmaster.com> wrote:
> > In my case u-boot uses a default config called imx8qxp_var_som_defconfig
> > stored under the configs directory in u-boot (not sure if its in the
> > official repositories, I use a vendor supplied u-boot repo, but the
> > procedure should be the same either way), then I have created a
> > .bbappend-file for the u-boot recipe, and added a patch that modifies the
> > defconfig file to include the options I want to enable. Then as u-boot is
> > built, it will use the patched defconfig with the appropriate options
> > enabled. In the meta-freescale layer the u-boot recipes are under
> > meta-freescale/recipes-bsp/u-boot.
> 
> Thanks for the tip, that is quite helpful. I created bbappend file,
> run the make menuconfig to enable NAND and CONFIG_CMD_UBI, but then
> failed in build, missing all MTD, NAND, UBI references, the MTD, NAND,
> UBI are all selected, what I could be missing?
> 
> /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:448:
> undefined reference to `mtdparts_init'

This function is not defined. So you look it up in the sources, find
where it's defined.

Is it in a file which is compiled/included somewhere?
Is it surrounded by #ifdef? And by surrounded, I mean the #ifdef can
be several thousands of lines above the function definition.

In that case, I couldn't find the sources of u-boot-imx (didn't take the
time) but from upstream:
https://elixir.bootlin.com/u-boot/v2017.03/source/cmd/nand.c#L35

It's surrounded by #if defined(CONFIG_CMD_MTDPARTS) so you need
CMD_MTDPARTS to be enabled. Do the same for all the other calls. There's
no magic thing, you thus have to look it up yourself most of the time.
Even though arguably, that's a mistake from upstream (there should be a
dependency on MTDPARTS in Kconfig, anyway...).

Quentin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
