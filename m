Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834BEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4+GJGBr3ZVV2bltl8fjhEoo+MNk9UYaqgGxywkiBeY=; b=h1pwEqzkktDP8q
	Sk0MKtR8+mlDC2fK/0TRuL2suXGWmsCbT/zn0QL4NxDZTWzjqV38SkM5jUaK9hOXNQKpFlDtPl7PH
	VqFp67VT7tNyppb1HxNWN2WVv6J5sebn4YNB361I54u8QSwUW60EzxoaaDb7K8/vgfp0t1jUu8W4f
	NvDI4g+AQe2ps/ueg2m61b3I1Gk5bZ/zQyfOlJkK8MWn6OTjX7K4cQq+KJWs29lUpzVMJrUb4d6CQ
	M98sGVSRgDb1lUlHw2nLMKJSEKF6wmaWhyY3R+f9Nw+05F5KMeYxvBUqB/rNP1AMBdIEtijXVFF+Q
	0yd2vieyTmgN9QA+IMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69sG-0064Mg-Qz; Tue, 28 Jun 2022 11:59:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69sD-0064L4-EC
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:59:19 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-3178acf2a92so114322087b3.6
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urktvsoNnEVnDx7xaP6tHk1gInrIpPly61GP22mC1qg=;
        b=fRY95PmmWe7MIwiUdIdYi3Lw9szOK9Gbq1UJa0nv783imFShh2Vs5h500gj3IVwSsX
         lsZuZ6hzGhJuYxzI7Kb9xXbvOHC2F0cdGf8bL3/PCoOv0Xab/cZnBKrW6vCqudrj5VBB
         VR+YlnZ4wZSv5pUEcHUSTJGIZvuiO+1CSRfWOwG2AuDvOKhXv61cKk/nVHaek5CTJtTR
         LGfAkqIw2npVapsjfB54T0oRBnOGjaKdSHtvxdd2CkA8Urlp4q+HdMwEKHQLoccTYXE4
         C5aUlFkUSsPxzviQcbKH6l081+PWT36CPBa6pVbB5/niieCvohkanTH5DgzK/pdBAKvn
         zkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urktvsoNnEVnDx7xaP6tHk1gInrIpPly61GP22mC1qg=;
        b=d4nN2An+Zy+FcVIVBRA3NcYo6PFh2K5lBoqzz1ToNkVuoDJZ4v8Rii1NqiD8o2Iq2R
         JzPsMzr83odw59L1ZKquMbnw51vKg5G0dD3O4JqfjZWkFSS3m8hnlI46Cnl3bevihMEy
         5zqR93IC+iCMTtO8j4hS3xyzSUDxrWhzlCfXVucsxBwd2YdISgO0m4EtoncNy+zuULlT
         C0fUAXRJfy0ZqntUODrzmV3LmOdNnB0jvF6b5mwTew2dWKDaHyiqLMKF2n5Terhy+z/w
         1GT63ZVulSlySaPQn7rL/Fs8DlrmTUOnevaKY0bkIU0kXRMhfAOCtMMaIjQjoUhjXBEO
         PV0g==
X-Gm-Message-State: AJIora91NLoqdsCanB8eY4BhBNvPatSFSYGLnWURgz5SspGg0TAeTAa4
	wsxWHULzSUDT82LMnkkdLiQC3MChQvnlu0R0YqM=
X-Google-Smtp-Source: AGRyM1uUM8XiXqp0nPoKN6eYyG6dEL16I70UKKw3R0wyE+J78ZDNrmS2GK27qNBSxrCS/87shzyPvDxsDJlUC4vzguU=
X-Received: by 2002:a81:a212:0:b0:317:7a55:c7cb with SMTP id
 w18-20020a81a212000000b003177a55c7cbmr21066715ywg.13.1656417554364; Tue, 28
 Jun 2022 04:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org> <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
In-Reply-To: <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Jun 2022 13:59:03 +0200
Message-ID: <CAGm1_kuucv71AdPkSW8Eog2T9rZRA3uiL4+ok-aWCVsj-z2eew@mail.gmail.com>
Subject: Re: raw/omap2: erasing issue
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_045917_525604_29948C2D 
X-CRM114-Status: GOOD (  22.88  )
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

On Tue, Jun 28, 2022 at 1:57 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Roger,
>
> On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
> >
> > Hi Yegor,
> >
> > On 28/06/2022 13:48, Yegor Yefremov wrote:
> > > Since linux 5.17 I get the following issue when doing ubiformat:
> > >
> > > # ubiformat -y /dev/mtd5
> > > ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> > > eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > > libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> > > libscan: scanning eraseblock 2028 -- 100 % complete
> > > ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> > > ubiformat: 2 eraseblocks are supposedly empty
> > > ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> > > 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> > > 31, 32
> >
> > I'm guessing these bad blocks recently added due to the offending patch?
>
> Yes.
>
> > > ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> > > attempt to erase a bad block at page 0x00000d40
> > > ubiformat: formatting eraseblock 28[   33.658809] nand:
> > > nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> > > ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> > > nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> > > ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> > > nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> > > ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 34
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 34 bad
> > > ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 35
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 35 bad
> > > ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 36
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 36 bad
> > > ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> > > MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
> > >         error 5 (Input/output error)
> > >
> > > ubiformat: error!: failed to erase eraseblock 37
> > >            error 5 (Input/output error)
> > > ubiformat: marking block 37 bad
> > >
> > > ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> > > # [   36.322563] vwl1271: disabling
> > >
> > > git bisect pointed to the following commit:
> > >
> > > a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> > > commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> > > Author: Roger Quadros <rogerq@kernel.org>
> > > Date:   Thu Dec 9 11:04:55 2021 +0200
> > >
> > >     mtd: rawnand: omap2: move to exec_op interface
> > >
> > >     Stop using legacy interface and move to the exec_op interface.
> > >
> > >     Signed-off-by: Roger Quadros <rogerq@kernel.org>
> > >     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> > >
> > > :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> > > c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> > >
> > > Info to my NAND flash:
> > >
> > > [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> > > [    5.702193] nand: Micron MT29F2G08ABAEAWP
> > > [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> > > 2048, OOB size: 64
> > > [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> > > [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> > > [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> > > [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> > > [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> > > using UBI block devices instead.
> > > [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> > > [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> > > [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> > > [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> > > consider using UBI block devices instead.
> > > [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> > > [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> > > using UBI block devices instead.
> > > [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> > > [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> > > using UBI block devices instead.
> > >
> >
> > What platform are you on?
> > I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.
>
> I am on am335x [1]
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4

NAND node definition [1]:

&gpmc {
pinctrl-names = "default";
pinctrl-0 = <&nandflash_pins_s0>;
ranges = <0 0 0x08000000 0x10000000>; /* CS0: NAND */
status = "okay";

nand@0,0 {
compatible = "ti,omap2-nand";
reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
interrupt-parent = <&gpmc>;
interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
    <1 IRQ_TYPE_NONE>; /* termcount */
rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
nand-bus-width = <8>;
ti,nand-ecc-opt = "bch8";
ti,nand-xfer-type = "polled";

gpmc,device-nand = "true";
gpmc,device-width = <1>;
gpmc,sync-clk-ps = <0>;
gpmc,cs-on-ns = <0>;
gpmc,cs-rd-off-ns = <44>;
gpmc,cs-wr-off-ns = <44>;
gpmc,adv-on-ns = <6>;
gpmc,adv-rd-off-ns = <34>;
gpmc,adv-wr-off-ns = <44>;
gpmc,we-on-ns = <0>;
gpmc,we-off-ns = <40>;
gpmc,oe-on-ns = <0>;
gpmc,oe-off-ns = <54>;
gpmc,access-ns = <64>;
gpmc,rd-cycle-ns = <82>;
gpmc,wr-cycle-ns = <82>;
gpmc,bus-turnaround-ns = <0>;
gpmc,cycle2cycle-delay-ns = <0>;
gpmc,clk-activation-ns = <0>;
gpmc,wr-access-ns = <40>;
gpmc,wr-data-mux-bus-ns = <0>;

#address-cells = <1>;
#size-cells = <1>;
ti,elm-id = <&elm>;
};
};

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos.dtsi?h=v5.19-rc4#n185

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
