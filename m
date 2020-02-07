Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F91C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468072082E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/PsIF5g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYUg56BU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468072082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9pz0/Ufs2M5u1gBLfsXU4eigibsJ3AxeP5e3RBeLXI=; b=d/PsIF5gMCyYDW
	gA02luF+DPnGFjGlSKjZ2CaogMqE4Ll9EWyBE19Rvr1TH/3MCm0WjVROmKC6uJ4K+1sk7fhHtBvae
	eK/TYu8oZHLhFWbk9kXpbbG88MMqU7epNZJvJf4AgAb25sLzLl7vNYgSX/frzVS6q4fm9CVLFndDo
	2/ZDoCZI4HjHrYoMB/XaRJ9FKsYeYfkBmGiAg9VuQW3NDjB3VjGE7KCu/KyNnV63+tsoiAusjb0rJ
	iriNKGl1lJcKrRafhaBMm/Wm1xxTTr06uTOqZiOGF+FRnvhlVrALOVEoLiSZ1vYygeqRclY3SsSBQ
	GLda7i25ykSMmBW9nY7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izzNV-00029z-1Z; Fri, 07 Feb 2020 08:52:45 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izzNQ-00029T-At
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 08:52:43 +0000
Received: by mail-io1-xd44.google.com with SMTP id z193so1389440iof.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VooL6Pd2mA+l+2SGbGr/TGjaZa8f/k4d5kmOHs+73b4=;
 b=dYUg56BUnKrhz2VgoaQj7nhUg1RXG2dzUpH6N+jgj3VQTvmj2VAW81wAeXHFlHB33k
 pNJ26g+rQZra8yYmOTjpVuNGTuiMAN8XpSUr+bD1Nx1lCVY60XagOoc9n7QKBOcEes3P
 wWpI/Ts0rfjZ+q6ZBgPf2Iz03E84Fah4PZ754nkrF/b5bF8lklbPCxMLeAf5IMHD8cAn
 BAsR9iMutLs3IrEHBq0AMC313fqQOglnZQpW/TfUhvsv9f7eB0qezhDbB0MIZ28ri6YC
 hgcEAcyU5qeQPsavcEmGs8B1xnO/UNTTNmzFc8lmgpv03ziQB6TCtX074brsOQL5h4XU
 lreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VooL6Pd2mA+l+2SGbGr/TGjaZa8f/k4d5kmOHs+73b4=;
 b=sXLO9giX57GKXxuc+36Fq3Ac6B1Ez1ADL0MhujC1P+j1YFl36dX9dZgpkpej19qCrk
 mxG48afhJVY3UrB1EGx78TCf6NsYrHMyMUJRu9P/+aKBO/L8CTyAz4uoXZOy9NyMCW7d
 cn+ZXlArBcFBXbcsyiqERkh76CxOEj2kVxxLwRvxcIRlXqV4uTf0BpDk9ytalSy8Bpj3
 kn/pM2NANeqtaxM0E3YHWcIf6CdACXfkgr2zP58U9EcBk4Dgo2jVBsQ07ZjK9uZdZEJy
 ekYpOKNre/RVYoBmhbS+U6HjEBmnXePHAYI79ROIg4pHtNSKUZhU3QXnnBdVQ8xWqLGU
 a0lg==
X-Gm-Message-State: APjAAAUXChhVOtFabdJk+aLCh5uu9bjGFZOQbU/yEe6I2FrJ8KSfgHD0
 dHv2ccyt/BUxv6UiljwJSoQPo2heiwbvJ/Co58c=
X-Google-Smtp-Source: APXvYqz28UEIEC7gjGN1cfHPLJvQc2IQVb6M7HdS+fLx6vZow6+LoGqdsU+owUskFP6p05JiPUIkAKA6KOGRwsbJJq8=
X-Received: by 2002:a5d:8782:: with SMTP id f2mr2160422ion.53.1581065556415;
 Fri, 07 Feb 2020 00:52:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Fri, 7 Feb 2020 00:52:35 -0800 (PST)
In-Reply-To: <c159fe1d7cc14f5c80878fe81a957bb4@tagmaster.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
 <em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
 <CAA=hcWQsP1N58iqrxEggZBdSksgHk+gfuG7yz0+C3G7o0=DzOw@mail.gmail.com>
 <c159fe1d7cc14f5c80878fe81a957bb4@tagmaster.com>
From: JH <jupiter.hce@gmail.com>
Date: Fri, 7 Feb 2020 19:52:35 +1100
Message-ID: <CAA=hcWQPrfb3UrYsfyhs4as8wGDf5DsyEtF=cgCo4gJprx=b1Q@mail.gmail.com>
Subject: Re: [yocto] Support UBI u-boot
To: Pelle Windestam <Pelle.Windestam@tagmaster.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_005240_393694_2F6BA6AB 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
 Yocto discussion list <yocto@yoctoproject.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andy Pont <andy.pont@sdcsystems.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pelle,

Aplogize for cross posting.

On 2/7/20, Pelle Windestam <Pelle.Windestam@tagmaster.com> wrote:
> In my case u-boot uses a default config called imx8qxp_var_som_defconfig
> stored under the configs directory in u-boot (not sure if its in the
> official repositories, I use a vendor supplied u-boot repo, but the
> procedure should be the same either way), then I have created a
> .bbappend-file for the u-boot recipe, and added a patch that modifies the
> defconfig file to include the options I want to enable. Then as u-boot is
> built, it will use the patched defconfig with the appropriate options
> enabled. In the meta-freescale layer the u-boot recipes are under
> meta-freescale/recipes-bsp/u-boot.

Thanks for the tip, that is quite helpful. I created bbappend file,
run the make menuconfig to enable NAND and CONFIG_CMD_UBI, but then
failed in build, missing all MTD, NAND, UBI references, the MTD, NAND,
UBI are all selected, what I could be missing?

/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:448:
undefined reference to `mtdparts_init'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:468:
undefined reference to `del_mtd_partitions'
| arm-oe-linux-gnueabi-ld.bfd: cmd/built-in.o: in function `ubi_part':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:489:
undefined reference to `find_dev_and_part'
| arm-oe-linux-gnueabi-ld.bfd: cmd/built-in.o: in function `ubi_dev_scan':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:415:
undefined reference to `find_dev_and_part'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:423:
undefined reference to `add_mtd_partitions'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:437:
undefined reference to `del_mtd_partitions'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`add_volume':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:294:
undefined reference to `rb_insert_color'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_add_to_av':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:589:
undefined reference to `rb_insert_color'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_remove_av':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:634:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:640:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:636:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`scan_all':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1265:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`self_check_ai':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1515:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1558:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`scan_all':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1266:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1265:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1266:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`self_check_ai':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1558:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1515:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1629:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1631:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1629:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1631:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1717:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1717:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1718:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/attach.c:1718:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`get_bad_peb_limit':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/build.c:623:
undefined reference to `mtd_get_device_size'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`process_lvol':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/vtbl.c:407:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/vtbl.c:407:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ltree_add_entry':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/eba.c:180:
undefined reference to `rb_insert_color'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`leb_read_unlock':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/eba.c:225:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_eba_init':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/eba.c:1423:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_move_aeb_to_list':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/include/../drivers/mtd/ubi/ubi.h:1013:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_eba_init':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/eba.c:1423:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`find_wl_entry':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:314:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`wl_tree_add':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:170:
undefined reference to `rb_insert_color'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`get_peb_for_wl':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1777:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ensure_wear_leveling':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:992:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`wear_leveling_worker':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:721:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:736:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:742:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:748:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_wl_put_peb':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1226:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1229:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_wl_scrub_peb':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1298:
undefined reference to `rb_erase'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`ubi_wl_init':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1569:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1570:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1570:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:1569:
undefined reference to `rb_next'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`find_mean_wl_entry':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:355:
undefined reference to `rb_first'
| arm-oe-linux-gnueabi-ld.bfd:
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:356:
undefined reference to `rb_last'
| arm-oe-linux-gnueabi-ld.bfd: drivers/mtd/ubi/built-in.o: in function
`wl_get_wle':
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/drivers/mtd/ubi/wl.c:395:
undefined reference to `rb_erase'
| /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/Makefile:1234:
recipe for target 'u-boot' failed
| make[1]: *** [u-boot] Error 1
| make[1]: Leaving directory
'/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/build/mx6ull_14x14_evk_config'
| Makefile:150: recipe for target 'sub-make' failed
| make: *** [sub-make] Error 2
| make: Leaving directory
'/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git'
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/temp/log.do_compile.11257)

$ cat

#
# Automatically generated file; DO NOT EDIT.
# U-Boot 2017.03 Configuration
#
CONFIG_CREATE_ARCH_SYMLINK=y
# CONFIG_ARC is not set
CONFIG_ARM=y
# CONFIG_AVR32 is not set
# CONFIG_BLACKFIN is not set
# CONFIG_M68K is not set
# CONFIG_MICROBLAZE is not set
# CONFIG_MIPS is not set
# CONFIG_NDS32 is not set
# CONFIG_NIOS2 is not set
# CONFIG_OPENRISC is not set
# CONFIG_PPC is not set
# CONFIG_SANDBOX is not set
# CONFIG_SH is not set
# CONFIG_SPARC is not set
# CONFIG_X86 is not set
# CONFIG_XTENSA is not set
CONFIG_SYS_ARCH="arm"
CONFIG_SYS_CPU="armv7"
CONFIG_SYS_SOC="mx6"
CONFIG_SYS_VENDOR="freescale"
CONFIG_SYS_BOARD="mx6ullevk"
CONFIG_SYS_CONFIG_NAME="mx6ullevk"

#
# ARM architecture
#
CONFIG_HAS_VBAR=y
CONFIG_HAS_THUMB2=y
CONFIG_CPU_V7=y
CONFIG_SYS_ARM_ARCH=7
CONFIG_SYS_CACHE_SHIFT_6=y
CONFIG_SYS_CACHELINE_SIZE=64
# CONFIG_ARM_SMCCC is not set
# CONFIG_SEMIHOSTING is not set
CONFIG_SYS_L2CACHE_OFF=y
# CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK is not set
CONFIG_USE_ARCH_MEMCPY=y
CONFIG_SPL_USE_ARCH_MEMCPY=y
CONFIG_USE_ARCH_MEMSET=y
CONFIG_SPL_USE_ARCH_MEMSET=y
# CONFIG_ARM64_SUPPORT_AARCH32 is not set
# CONFIG_ARCH_AT91 is not set
# CONFIG_TARGET_EDB93XX is not set
# CONFIG_TARGET_ASPENITE is not set
# CONFIG_TARGET_GPLUGD is not set
# CONFIG_ARCH_DAVINCI is not set
# CONFIG_KIRKWOOD is not set
# CONFIG_ARCH_MVEBU is not set
# CONFIG_TARGET_DEVKIT3250 is not set
# CONFIG_TARGET_WORK_92105 is not set
# CONFIG_TARGET_MX25PDK is not set
# CONFIG_TARGET_ZMX25 is not set
# CONFIG_TARGET_APF27 is not set
# CONFIG_TARGET_APX4DEVKIT is not set
# CONFIG_TARGET_XFI3 is not set
# CONFIG_TARGET_M28EVK is not set
# CONFIG_TARGET_MX23EVK is not set
# CONFIG_TARGET_MX28EVK is not set
# CONFIG_TARGET_MX23_OLINUXINO is not set
# CONFIG_TARGET_BG0900 is not set
# CONFIG_TARGET_SANSA_FUZE_PLUS is not set
# CONFIG_TARGET_SC_SPS_1 is not set
# CONFIG_ORION5X is not set
# CONFIG_TARGET_SPEAR300 is not set
# CONFIG_TARGET_SPEAR310 is not set
# CONFIG_TARGET_SPEAR320 is not set
# CONFIG_TARGET_SPEAR600 is not set
# CONFIG_TARGET_STV0991 is not set
# CONFIG_TARGET_X600 is not set
# CONFIG_TARGET_IMX31_PHYCORE is not set
# CONFIG_TARGET_IMX31_PHYCORE_EET is not set
# CONFIG_TARGET_MX31ADS is not set
# CONFIG_TARGET_MX31PDK is not set
# CONFIG_TARGET_WOODBURN is not set
# CONFIG_TARGET_WOODBURN_SD is not set
# CONFIG_TARGET_FLEA3 is not set
# CONFIG_TARGET_MX35PDK is not set
# CONFIG_ARCH_BCM283X is not set
# CONFIG_TARGET_VEXPRESS_CA15_TC2 is not set
# CONFIG_TARGET_VEXPRESS_CA5X2 is not set
# CONFIG_TARGET_VEXPRESS_CA9X4 is not set
# CONFIG_TARGET_BRXRE1 is not set
# CONFIG_TARGET_BRPPT1 is not set
# CONFIG_TARGET_DRACO is not set
# CONFIG_TARGET_THUBAN is not set
# CONFIG_TARGET_RASTABAN is not set
# CONFIG_TARGET_ETAMIN is not set
# CONFIG_TARGET_PXM2 is not set
# CONFIG_TARGET_RUT is not set
# CONFIG_TARGET_TI814X_EVM is not set
# CONFIG_TARGET_TI816X_EVM is not set
# CONFIG_TARGET_BCM23550_W1D is not set
# CONFIG_TARGET_BCM28155_AP is not set
# CONFIG_TARGET_BCMCYGNUS is not set
# CONFIG_TARGET_BCMNSP is not set
# CONFIG_ARCH_EXYNOS is not set
# CONFIG_ARCH_S5PC1XX is not set
# CONFIG_ARCH_HIGHBANK is not set
# CONFIG_ARCH_INTEGRATOR is not set
# CONFIG_ARCH_KEYSTONE is not set
# CONFIG_ARCH_MESON is not set
# CONFIG_ARCH_MX7ULP is not set
# CONFIG_ARCH_MX7 is not set
CONFIG_ARCH_MX6=y
# CONFIG_ARCH_MX5 is not set
# CONFIG_TARGET_M53EVK is not set
# CONFIG_TARGET_MX51EVK is not set
# CONFIG_TARGET_MX53ARD is not set
# CONFIG_TARGET_MX53EVK is not set
# CONFIG_TARGET_MX53LOCO is not set
# CONFIG_TARGET_MX53SMD is not set
# CONFIG_OMAP34XX is not set
# CONFIG_OMAP44XX is not set
# CONFIG_OMAP54XX is not set
# CONFIG_AM43XX is not set
# CONFIG_AM33XX is not set
# CONFIG_ARCH_RMOBILE is not set
# CONFIG_TARGET_S32V234EVB is not set
# CONFIG_ARCH_SNAPDRAGON is not set
# CONFIG_ARCH_SOCFPGA is not set
# CONFIG_TARGET_CM_T43 is not set
# CONFIG_ARCH_SUNXI is not set
# CONFIG_TARGET_TS4600 is not set
# CONFIG_TARGET_TS4800 is not set
# CONFIG_TARGET_VF610TWR is not set
# CONFIG_TARGET_COLIBRI_VF is not set
# CONFIG_TARGET_PCM052 is not set
# CONFIG_TARGET_BK4R1 is not set
# CONFIG_ARCH_ZYNQ is not set
# CONFIG_ARCH_ZYNQMP is not set
# CONFIG_ARCH_IMX8 is not set
# CONFIG_ARCH_IMX8M is not set
# CONFIG_TEGRA is not set
# CONFIG_TARGET_VEXPRESS64_AEMV8A is not set
# CONFIG_TARGET_VEXPRESS64_BASE_FVP is not set
# CONFIG_TARGET_VEXPRESS64_BASE_FVP_DRAM is not set
# CONFIG_TARGET_VEXPRESS64_JUNO is not set
# CONFIG_TARGET_LS2080A_EMU is not set
# CONFIG_TARGET_LS2080A_SIMU is not set
# CONFIG_TARGET_LS2080AQDS is not set
# CONFIG_TARGET_LS2080ARDB is not set
# CONFIG_TARGET_HIKEY is not set
# CONFIG_TARGET_LS1012AQDS is not set
# CONFIG_TARGET_LS1012ARDB is not set
# CONFIG_TARGET_LS1012AFRDM is not set
# CONFIG_TARGET_LS1021AQDS is not set
# CONFIG_TARGET_LS1021ATWR is not set
# CONFIG_TARGET_LS1021AIOT is not set
# CONFIG_TARGET_LS1043AQDS is not set
# CONFIG_TARGET_LS1043ARDB is not set
# CONFIG_TARGET_LS1046AQDS is not set
# CONFIG_TARGET_LS1046ARDB is not set
# CONFIG_TARGET_H2200 is not set
# CONFIG_TARGET_ZIPITZ2 is not set
# CONFIG_TARGET_COLIBRI_PXA270 is not set
# CONFIG_ARCH_UNIPHIER is not set
# CONFIG_STM32 is not set
# CONFIG_ARCH_ROCKCHIP is not set
# CONFIG_TARGET_THUNDERX_88XX is not set
# CONFIG_ARCH_ASPEED is not set
CONFIG_SYS_MALLOC_F_LEN=0x400
# CONFIG_SECURE_BOOT is not set
CONFIG_MX6=y
CONFIG_MX6UL=y
CONFIG_MX6ULL=y
# CONFIG_LDO_BYPASS_CHECK is not set
# CONFIG_CMD_BEE is not set
# CONFIG_MODULE_FUSE is not set
# CONFIG_TARGET_ADVANTECH_DMS_BA16 is not set
# CONFIG_TARGET_APALIS_IMX6 is not set
# CONFIG_TARGET_ARISTAINETOS is not set
# CONFIG_TARGET_ARISTAINETOS2 is not set
# CONFIG_TARGET_ARISTAINETOS2B is not set
# CONFIG_TARGET_CGTQMX6EVAL is not set
# CONFIG_TARGET_CM_FX6 is not set
# CONFIG_TARGET_COLIBRI_IMX6 is not set
# CONFIG_TARGET_EMBESTMX6BOARDS is not set
# CONFIG_TARGET_GE_B450V3 is not set
# CONFIG_TARGET_GE_B650V3 is not set
# CONFIG_TARGET_GE_B850V3 is not set
# CONFIG_TARGET_GW_VENTANA is not set
# CONFIG_TARGET_KOSAGI_NOVENA is not set
# CONFIG_TARGET_MCCMON6 is not set
# CONFIG_TARGET_MX6CUBOXI is not set
# CONFIG_TARGET_MX6QARM2 is not set
# CONFIG_TARGET_MX6Q_ICORE is not set
# CONFIG_TARGET_MX6Q_ICORE_RQS is not set
# CONFIG_TARGET_MX6QSABREAUTO is not set
# CONFIG_TARGET_MX6SABRESD is not set
# CONFIG_TARGET_MX6SLEVK is not set
# CONFIG_TARGET_MX6SLLEVK is not set
# CONFIG_TARGET_MX6SLL_ARM2 is not set
# CONFIG_TARGET_MX6SXSABRESD is not set
# CONFIG_TARGET_MX6SXSABREAUTO is not set
# CONFIG_TARGET_MX6SX_14X14_ARM2 is not set
# CONFIG_TARGET_MX6SX_17X17_ARM2 is not set
# CONFIG_TARGET_MX6SX_19X19_ARM2 is not set
# CONFIG_TARGET_MX6UL_9X9_EVK is not set
# CONFIG_TARGET_MX6UL_14X14_EVK is not set
# CONFIG_TARGET_MX6UL_NXPU_IOPB is not set
# CONFIG_TARGET_MX6UL_14X14_DDR3_ARM2 is not set
# CONFIG_TARGET_MX6UL_14X14_LPDDR2_ARM2 is not set
# CONFIG_TARGET_MX6UL_GEAM is not set
# CONFIG_TARGET_MX6ULL_DDR3_ARM2 is not set
CONFIG_TARGET_MX6ULL_14X14_EVK=y
# CONFIG_TARGET_MX6ULL_9X9_EVK is not set
# CONFIG_TARGET_PICOSOM_IMX6UL is not set
# CONFIG_TARGET_PICO_IMX6DL is not set
# CONFIG_TARGET_MX6UL_SPRIOT is not set
# CONFIG_TARGET_NITROGEN6X is not set
# CONFIG_TARGET_OT1200 is not set
# CONFIG_TARGET_PICO_IMX6UL is not set
# CONFIG_TARGET_LITEBOARD is not set
# CONFIG_TARGET_PLATINUM_PICON is not set
# CONFIG_TARGET_PLATINUM_TITANIUM is not set
# CONFIG_TARGET_PCM058 is not set
# CONFIG_TARGET_SECOMX6 is not set
# CONFIG_TARGET_TBS2910 is not set
# CONFIG_TARGET_TITANIUM is not set
# CONFIG_TARGET_TQMA6 is not set
# CONFIG_TARGET_UDOO is not set
# CONFIG_TARGET_UDOO_NEO is not set
# CONFIG_TARGET_SAMTEC_VINING_2000 is not set
# CONFIG_TARGET_WANDBOARD is not set
# CONFIG_TARGET_WARP is not set
# CONFIG_TARGET_XPRESS is not set
# CONFIG_TARGET_ZC5202 is not set
# CONFIG_TARGET_ZC5601 is not set
# CONFIG_TARGET_MX6DQSCM is not set
# CONFIG_TARGET_MX6SXSCM is not set
# CONFIG_ARMV7_LPAE is not set
# CONFIG_IMX_OPTEE is not set
# CONFIG_GPT_TIMER is not set
CONFIG_ROM_UNIFIED_SECTIONS=y
# CONFIG_IMX_RDC is not set
# CONFIG_IMX_BOOTAUX is not set
# CONFIG_USE_IMXIMG_PLUGIN is not set
# CONFIG_DBG_MONITOR is not set
# CONFIG_IMX_TRUSTY_OS is not set
# CONFIG_SYS_ARM_CACHE_WRITEALLOC is not set
CONFIG_IDENT_STRING=""
# CONFIG_PRE_CONSOLE_BUFFER is not set
CONFIG_VIDEO=y

#
# ARM debug
#
# CONFIG_DEBUG_LL is not set
CONFIG_DEFAULT_DEVICE_TREE="imx6ull-14x14-evk-gpmi-weim"
CONFIG_SMBIOS_PRODUCT_NAME="mx6ullevk"
# CONFIG_AHCI is not set

#
# General setup
#
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
# CONFIG_XEN is not set
# CONFIG_DISTRO_DEFAULTS is not set
CONFIG_SYS_MALLOC_F=y
CONFIG_EXPERT=y
CONFIG_SYS_MALLOC_CLEAR_ON_INIT=y
# CONFIG_TOOLS_DEBUG is not set
# CONFIG_PHYS_64BIT is not set

#
# Boot images
#
# CONFIG_FIT is not set
# CONFIG_OF_BOARD_SETUP is not set
# CONFIG_OF_SYSTEM_SETUP is not set
# CONFIG_OF_STDOUT_VIA_ALIAS is not set
CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6ullevk/imximage.cfg"
CONFIG_ARCH_FIXUP_FDT_MEMORY=y

#
# API
#
# CONFIG_API is not set

#
# Boot timing
#
# CONFIG_BOOTSTAGE is not set
CONFIG_BOOTSTAGE_USER_COUNT=20
CONFIG_BOOTSTAGE_STASH_ADDR=0
CONFIG_BOOTSTAGE_STASH_SIZE=4096

#
# Boot media
#
CONFIG_NAND_BOOT=y
# CONFIG_ONENAND_BOOT is not set
# CONFIG_QSPI_BOOT is not set
# CONFIG_SATA_BOOT is not set
# CONFIG_SD_BOOT is not set
# CONFIG_SPI_BOOT is not set
CONFIG_BOOTDELAY=3

#
# Console
#
# CONFIG_CONSOLE_RECORD is not set
# CONFIG_SILENT_CONSOLE is not set
CONFIG_CONSOLE_MUX=y
CONFIG_SYS_CONSOLE_IS_IN_ENV=y
# CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE is not set
# CONFIG_SYS_CONSOLE_ENV_OVERWRITE is not set
# CONFIG_SYS_CONSOLE_INFO_QUIET is not set
# CONFIG_SYS_STDIO_DEREGISTER is not set
CONFIG_DEFAULT_FDT_FILE=""
# CONFIG_VERSION_VARIABLE is not set
CONFIG_BOARD_LATE_INIT=y
CONFIG_DISPLAY_CPUINFO=y
CONFIG_DISPLAY_BOARDINFO=y

#
# Start-up hooks
#
# CONFIG_ARCH_EARLY_INIT_R is not set
# CONFIG_ARCH_MISC_INIT is not set
CONFIG_BOARD_EARLY_INIT_F=y

#
# SPL / TPL
#

#
# Command line interface
#
CONFIG_CMDLINE=y
CONFIG_HUSH_PARSER=y
CONFIG_SYS_PROMPT="=> "

#
# Autoboot options
#
CONFIG_AUTOBOOT=y
# CONFIG_AUTOBOOT_KEYED is not set

#
# FASTBOOT
#
# CONFIG_FASTBOOT is not set

#
# Commands
#

#
# Info commands
#
CONFIG_CMD_BDI=y
# CONFIG_CMD_CONFIG is not set
CONFIG_CMD_CONSOLE=y
# CONFIG_CMD_CPU is not set
# CONFIG_CMD_LICENSE is not set

#
# Boot commands
#
CONFIG_CMD_BOOTD=y
CONFIG_CMD_BOOTM=y
CONFIG_CMD_BOOTZ=y
CONFIG_CMD_BOOTEFI=y
CONFIG_CMD_BOOTEFI_HELLO_COMPILE=y
# CONFIG_CMD_BOOTEFI_HELLO is not set
# CONFIG_CMD_BOOTMENU is not set
CONFIG_CMD_ELF=y
CONFIG_CMD_FDT=y
CONFIG_CMD_GO=y
CONFIG_CMD_RUN=y
CONFIG_CMD_IMI=y
# CONFIG_CMD_IMLS is not set
CONFIG_CMD_XIMG=y

#
# Environment commands
#
# CONFIG_CMD_ASKENV is not set
CONFIG_CMD_EXPORTENV=y
CONFIG_CMD_IMPORTENV=y
CONFIG_CMD_EDITENV=y
# CONFIG_CMD_GREPENV is not set
CONFIG_CMD_SAVEENV=y
CONFIG_CMD_ENV_EXISTS=y

#
# Memory commands
#
CONFIG_CMD_MEMORY=y
CONFIG_CMD_CRC32=y
# CONFIG_LOOPW is not set
CONFIG_CMD_MEMTEST=y
# CONFIG_CMD_MX_CYCLIC is not set
# CONFIG_CMD_MEMINFO is not set
# CONFIG_CMD_UNZIP is not set
# CONFIG_CMD_ZIP is not set

#
# Device access commands
#
CONFIG_CMD_DM=y
# CONFIG_CMD_DEMO is not set
CONFIG_CMD_LOADB=y
CONFIG_CMD_LOADS=y
CONFIG_CMD_FLASH=y
# CONFIG_CMD_GPT is not set
# CONFIG_CMD_ARMFLASH is not set
# CONFIG_CMD_MMC is not set
CONFIG_CMD_NAND=y
# CONFIG_CMD_PART is not set
# CONFIG_CMD_SF is not set
# CONFIG_CMD_SPI is not set
CONFIG_CMD_I2C=y
CONFIG_CMD_USB=y
# CONFIG_CMD_DFU is not set
# CONFIG_CMD_USB_SDP is not set
# CONFIG_CMD_USB_MASS_STORAGE is not set
CONFIG_CMD_FPGA=y
CONFIG_CMD_GPIO=y

#
# Shell scripting commands
#
CONFIG_CMD_ECHO=y
CONFIG_CMD_ITEST=y
CONFIG_CMD_SOURCE=y
CONFIG_CMD_SETEXPR=y

#
# Network commands
#
CONFIG_CMD_NET=y
# CONFIG_CMD_TFTPPUT is not set
# CONFIG_CMD_TFTPSRV is not set
# CONFIG_CMD_RARP is not set
CONFIG_CMD_DHCP=y
# CONFIG_CMD_PXE is not set
CONFIG_CMD_NFS=y
# CONFIG_CMD_MII is not set
CONFIG_CMD_PING=y
# CONFIG_CMD_CDP is not set
# CONFIG_CMD_SNTP is not set
# CONFIG_CMD_DNS is not set
# CONFIG_CMD_LINK_LOCAL is not set

#
# Misc commands
#
CONFIG_CMD_CACHE=y
# CONFIG_CMD_TIME is not set
CONFIG_CMD_MISC=y
# CONFIG_CMD_TIMER is not set
# CONFIG_CMD_QFW is not set

#
# Power commands
#
# CONFIG_CMD_REGULATOR is not set

#
# Security commands
#

#
# Firmware commands
#

#
# Filesystem commands
#
CONFIG_CMD_EXT2=y
CONFIG_CMD_EXT4=y
CONFIG_CMD_EXT4_WRITE=y
CONFIG_CMD_FAT=y
CONFIG_CMD_FS_GENERIC=y
CONFIG_CMD_UBI=y

#
# Partition Types
#
CONFIG_PARTITIONS=y
# CONFIG_MAC_PARTITION is not set
CONFIG_DOS_PARTITION=y
# CONFIG_ISO_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
# CONFIG_PARTITION_UUIDS is not set
CONFIG_SUPPORT_OF_CONTROL=y

#
# Device Tree Control
#
CONFIG_OF_CONTROL=y
CONFIG_OF_SEPARATE=y
# CONFIG_OF_EMBED is not set
CONFIG_NET=y
# CONFIG_NET_RANDOM_ETHADDR is not set
# CONFIG_NETCONSOLE is not set
CONFIG_NET_TFTP_VARS=y
CONFIG_BOOTP_PXE_CLIENTARCH=0x15
CONFIG_BOOTP_VCI_STRING="U-Boot.armv7"

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_DM=y
CONFIG_DM_WARN=y
CONFIG_DM_DEVICE_REMOVE=y
CONFIG_DM_STDIO=y
CONFIG_DM_SEQ_ALIAS=y
# CONFIG_SPL_DM_SEQ_ALIAS is not set
# CONFIG_REGMAP is not set
# CONFIG_SPL_REGMAP is not set
CONFIG_DEVRES=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_SIMPLE_BUS=y
CONFIG_OF_TRANSLATE=y
# CONFIG_ADC is not set
# CONFIG_ADC_EXYNOS is not set
# CONFIG_ADC_SANDBOX is not set
# CONFIG_BLK is not set
# CONFIG_BLOCK_CACHE is not set

#
# SATA/SCSI device support
#

#
# Clock
#
# CONFIG_CLK is not set
# CONFIG_CPU is not set

#
# Hardware crypto devices
#
# CONFIG_FSL_CAAM is not set
CONFIG_SYS_FSL_SEC_COMPAT_4=y
# CONFIG_SYS_FSL_SEC_BE is not set
CONFIG_SYS_FSL_SEC_LE=y

#
# Demo for driver model
#
# CONFIG_DM_DEMO is not set
# CONFIG_IMX8M_DRAM is not set
# CONFIG_IMX8M_LPDDR4 is not set
# CONFIG_IMX8M_DDR4 is not set
CONFIG_SAVED_DRAM_TIMING_BASE=0x180000

#
# DFU support
#

#
# DMA Support
#
# CONFIG_DMA is not set
# CONFIG_TI_EDMA3 is not set

#
# FPGA support
#
# CONFIG_FPGA_ALTERA is not set
# CONFIG_FPGA_XILINX is not set

#
# GPIO Support
#
CONFIG_DM_GPIO=y
# CONFIG_ALTERA_PIO is not set
# CONFIG_DWAPB_GPIO is not set
# CONFIG_ATMEL_PIO4 is not set
# CONFIG_INTEL_BROADWELL_GPIO is not set
# CONFIG_IMX_RGPIO2P is not set
# CONFIG_LPC32XX_GPIO is not set
# CONFIG_MSM_GPIO is not set
# CONFIG_PCF8575_GPIO is not set
# CONFIG_ROCKCHIP_GPIO is not set
# CONFIG_TEGRA_GPIO is not set
# CONFIG_TEGRA186_GPIO is not set
# CONFIG_VYBRID_GPIO is not set
CONFIG_DM_74X164=y
# CONFIG_DM_PCA953X is not set
# CONFIG_MPC85XX_GPIO is not set

#
# I2C support
#
CONFIG_DM_I2C=y
# CONFIG_DM_I2C_COMPAT is not set
# CONFIG_DM_I2C_GPIO is not set
# CONFIG_SYS_I2C_FSL is not set
# CONFIG_SYS_I2C_DW is not set
# CONFIG_SYS_I2C_INTEL is not set
# CONFIG_SYS_I2C_MXC is not set
# CONFIG_SYS_I2C_ROCKCHIP is not set
# CONFIG_SYS_I2C_MVTWSI is not set
# CONFIG_I2C_MUX is not set
# CONFIG_DM_KEYBOARD is not set
# CONFIG_CROS_EC_KEYB is not set

#
# LED Support
#
# CONFIG_LED is not set
# CONFIG_LED_STATUS is not set

#
# Mailbox Controller Support
#
# CONFIG_DM_MAILBOX is not set

#
# Memory Controller drivers
#

#
# Multifunction device drivers
#
# CONFIG_MISC is not set
# CONFIG_CROS_EC is not set
# CONFIG_FSL_SEC_MON is not set
# CONFIG_MXC_OCOTP is not set
# CONFIG_NUVOTON_NCT6102D is not set
# CONFIG_PWRSEQ is not set
# CONFIG_PCA9551_LED is not set
# CONFIG_WINBOND_W83627 is not set

#
# MMC Host controller Support
#
CONFIG_MMC=y
CONFIG_GENERIC_MMC=y
CONFIG_DM_MMC=y
# CONFIG_DM_MMC_OPS is not set
# CONFIG_SPL_MMC_TINY is not set
# CONFIG_MMC_DW is not set
# CONFIG_MMC_MXC is not set
# CONFIG_MMC_MXS is not set
# CONFIG_MMC_OMAP_HS is not set
# CONFIG_MMC_SDHCI is not set

#
# MTD Support
#
CONFIG_MTD=y
# CONFIG_MTD_NOR_FLASH is not set
# CONFIG_CFI_FLASH is not set
# CONFIG_ALTERA_QSPI is not set

#
# NAND Device Support
#
# CONFIG_NAND_DENALI is not set
# CONFIG_NAND_VF610_NFC is not set
# CONFIG_NAND_PXA3XX is not set
# CONFIG_NAND_ARASAN is not set
# CONFIG_NAND_MXS is not set
# CONFIG_NAND_ZYNQ is not set

#
# Generic NAND options
#

#
# SPI Flash Support
#
# CONFIG_DM_SPI_FLASH is not set
# CONFIG_SPI_FLASH is not set

#
# UBI support
#
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_BITBANGMII is not set
# CONFIG_MV88E6352_SWITCH is not set
# CONFIG_PHYLIB is not set
CONFIG_DM_ETH=y
CONFIG_NETDEVICES=y
# CONFIG_ALTERA_TSE is not set
# CONFIG_DWC_ETH_QOS is not set
# CONFIG_E1000 is not set
# CONFIG_ETH_DESIGNWARE is not set
# CONFIG_ETHOC is not set
# CONFIG_FEC_MXC is not set
# CONFIG_MACB is not set
# CONFIG_RTL8139 is not set
# CONFIG_RTL8169 is not set
# CONFIG_SUN8I_EMAC is not set
# CONFIG_PCI is not set
# CONFIG_MVEBU_COMPHY_SUPPORT is not set

#
# Pin controllers
#
CONFIG_PINCTRL=y
CONFIG_PINCTRL_FULL=y
CONFIG_PINCTRL_GENERIC=y
CONFIG_PINMUX=y
# CONFIG_PINCONF is not set
# CONFIG_ROCKCHIP_RK3036_PINCTRL is not set
# CONFIG_ROCKCHIP_RK3288_PINCTRL is not set
# CONFIG_PINCTRL_AT91PIO4 is not set
# CONFIG_ROCKCHIP_RK3399_PINCTRL is not set
CONFIG_PINCTRL_IMX=y
CONFIG_PINCTRL_IMX6=y

#
# Power
#

#
# Power Domain Support
#
# CONFIG_POWER_DOMAIN is not set
# CONFIG_DM_PMIC is not set
# CONFIG_POWER_MC34VR500 is not set
CONFIG_DM_REGULATOR=y
# CONFIG_SPL_DM_REGULATOR is not set
# CONFIG_REGULATOR_PWM is not set
CONFIG_DM_REGULATOR_FIXED=y
CONFIG_DM_REGULATOR_GPIO=y
# CONFIG_DM_PWM is not set
# CONFIG_RAM is not set

#
# Remote Processor drivers
#

#
# Reset Controller Support
#
# CONFIG_DM_RESET is not set

#
# Real Time Clock
#
# CONFIG_DM_RTC is not set

#
# Serial drivers
#
# CONFIG_DM_SERIAL is not set
# CONFIG_DEBUG_UART is not set
# CONFIG_DEBUG_UART_SKIP_INIT is not set
# CONFIG_ATMEL_USART is not set
# CONFIG_FSL_LPUART is not set
# CONFIG_MVEBU_A3700_UART is not set
# CONFIG_MXC_UART is not set
# CONFIG_SYS_NS16550 is not set
# CONFIG_PXA_SERIAL is not set

#
# Sound support
#
# CONFIG_SOUND is not set

#
# SPI Support
#
CONFIG_DM_SPI=y
# CONFIG_ALTERA_SPI is not set
# CONFIG_CADENCE_QSPI is not set
# CONFIG_DESIGNWARE_SPI is not set
# CONFIG_EXYNOS_SPI is not set
# CONFIG_FSL_DSPI is not set
# CONFIG_ICH_SPI is not set
# CONFIG_MVEBU_A3700_SPI is not set
# CONFIG_ROCKCHIP_SPI is not set
# CONFIG_TEGRA114_SPI is not set
# CONFIG_TEGRA20_SFLASH is not set
# CONFIG_TEGRA20_SLINK is not set
# CONFIG_TEGRA210_QSPI is not set
# CONFIG_XILINX_SPI is not set
# CONFIG_OMAP3_SPI is not set
# CONFIG_SOFT_SPI is not set
# CONFIG_FSL_ESPI is not set
# CONFIG_FSL_FSPI is not set
# CONFIG_FSL_QSPI is not set
# CONFIG_TI_QSPI is not set

#
# SPMI support
#
# CONFIG_SPMI is not set

#
# System reset device drivers
#
# CONFIG_SYSRESET is not set
CONFIG_DM_THERMAL=y
# CONFIG_IMX_THERMAL is not set

#
# Timer Support
#
# CONFIG_TIMER is not set

#
# TPM support
#
CONFIG_USB=y
CONFIG_DM_USB=y

#
# USB Host Controller Drivers
#
CONFIG_USB_HOST=y
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI=y
CONFIG_USB_EHCI_MX6=y
# CONFIG_MXC_USB_OTG_HACTIVE is not set
# CONFIG_USB_EHCI_MSM is not set
# CONFIG_USB_EHCI_GENERIC is not set
# CONFIG_USB_OHCI_HCD is not set
# CONFIG_USB_UHCI_HCD is not set

#
# MUSB Controller Driver
#
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
# CONFIG_USB_MUSB_TI is not set

#
# ULPI drivers
#

#
# USB peripherals
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_KEYBOARD is not set
# CONFIG_USB_GADGET is not set

#
# Graphics support
#
# CONFIG_DM_VIDEO is not set

#
# TrueType Fonts
#
# CONFIG_VIDEO_VESA is not set
# CONFIG_VIDEO_LCD_ANX9804 is not set
# CONFIG_VIDEO_LCD_SSD2828 is not set
# CONFIG_VIDEO_LCD_HITACHI_TX18D42VM is not set
# CONFIG_VIDEO_MVEBU is not set
# CONFIG_I2C_EDID is not set
# CONFIG_DISPLAY is not set
# CONFIG_VIDEO_TEGRA20 is not set
# CONFIG_VIDEO_BRIDGE is not set
# CONFIG_VIDEO_IPUV3 is not set
CONFIG_CFB_CONSOLE=y
# CONFIG_CFB_CONSOLE_ANSI is not set
CONFIG_VGA_AS_SINGLE_DEVICE=y
CONFIG_VIDEO_SW_CURSOR=y
# CONFIG_CONSOLE_EXTRA_INFO is not set
CONFIG_CONSOLE_SCROLL_LINES=1
# CONFIG_VIDEO_CT69000 is not set
CONFIG_SYS_CONSOLE_BG_COL=0x00
CONFIG_SYS_CONSOLE_FG_COL=0xa0
# CONFIG_LCD is not set

#
# WATCHDOG support
#
# CONFIG_ULP_WATCHDOG is not set
# CONFIG_PHYS_TO_BUS is not set

#
# File systems
#

#
# Library routines
#
# CONFIG_CC_OPTIMIZE_LIBS_FOR_SPEED is not set
CONFIG_HAVE_PRIVATE_LIBGCC=y
CONFIG_USE_PRIVATE_LIBGCC=y
CONFIG_SYS_HZ=1000
# CONFIG_USE_TINY_PRINTF is not set
CONFIG_REGEX=y
# CONFIG_LIB_RAND is not set
# CONFIG_AVB_ATX is not set
# CONFIG_DUAL_BOOTLOADER is not set
# CONFIG_CMD_DHRYSTONE is not set
# CONFIG_RSA is not set
# CONFIG_TPM is not set

#
# Hashing Support
#
# CONFIG_SHA1 is not set
# CONFIG_SHA256 is not set
# CONFIG_SHA_HW_ACCEL is not set

#
# Compression Support
#
# CONFIG_LZ4 is not set
# CONFIG_ERRNO_STR is not set
CONFIG_OF_LIBFDT=y
# CONFIG_LOAD_FDT_FROM_PART is not set
# CONFIG_OF_LIBFDT_OVERLAY is not set
# CONFIG_SPL_OF_LIBFDT is not set
# CONFIG_FDT_FIXUP_PARTITIONS is not set

#
# System tables
#
CONFIG_GENERATE_SMBIOS_TABLE=y
CONFIG_SMBIOS_MANUFACTURER="freescale"
CONFIG_EFI_LOADER=y
# CONFIG_UNIT_TEST is not set

Thank you.

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
