Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B2BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsZKRjeHoWzmhL2GLU4a+JXpAYuyOgD8TQnT4vUqnu0=; b=1t+skRFrhkPnOQ
	w/TbeKpboEs8BiyuO/4C5ZClVoDNofnVOzTwFwG/YtbyuRuFGoZzlA2bbnAOmREd5+MZKiShrqL5J
	LPSgugM1H9Bl/211uOko9l750bqC3zHr3zOfCim4Bes49tvtKIYIk9At7x/5bwURw7pXeE5AsL5WW
	60LTq5w9YFMJVcQLMtwCEkKJfGdl/EjNqnySYuJdiTzIwC+v9d0f63hy4YfMeeDwfUrUqaPZmMp+j
	3I2HK/5WUV3ZC2UjNpg5jmWSP8b+c6Oatd0hCl3lcvsfScBo3Wvv0+fr5dKRVAJwVSqwMcGYMxXH0
	BVef9lYuiZFZSwuawjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8hU8-0005t0-ML; Tue, 05 Jul 2022 12:16:56 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8hU4-0005pv-Ph
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 12:16:55 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id c143so12918325ybf.3
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dm/rnI8zxHCVMBAA3pANOHcsAC5gI6T+vkCslv4yZQs=;
        b=WfkOT+aNHWhGSp0Ifmx3kFAMvu6iKVcZhWlz1DXn7AQyhPDTHgJoWmZM675PDYIAdd
         LRUYYro0Y1bzlsyNYmRElPGhIMkalSOjQ5FGHjY+gzsy55qK8sky0IepMSKAZjp/KPB2
         VkQyrgWeohR4X8zgDM76tMwWgaW1SeWh9VUo8BI2ZOo5npsYdscTfZd+pOmRpmZOHkS3
         VuAFxXxXPd+EDWnYQYt+YMBCQ7+a5GWkBcdI7fxWgi5v51JR4TagQhM/cSJrQWlNWCgn
         RxNetKiySX96om19/xAD8c7vm4jKn0q2bRkUv2LcXG7JP0vUl6dbTdJ5mdH6e4h0HOaY
         QZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dm/rnI8zxHCVMBAA3pANOHcsAC5gI6T+vkCslv4yZQs=;
        b=0PL2C58acKdU8YICKKoJyttjKPshdSl78DcTs6J40rP/sRdzVKV1DGNCsrHnoAI/Gc
         6WpVqEKZZYJckixcIlka+NGGSmuRnAeMjn3G9z/IK7X8ca9KnaP+ettU32b3jNMVjb7h
         wTWZ3cqu0jXZER7PTjc+k976vlMQ0PR34HEQMYSC/rZbTydlVvQCW8X4ITbnIjVTcnMh
         4rKMv+VjGBHfpgKVO51VqAn2cwQNlyW731AgcCrYFXxlPgo914CezOF3sHcHMeJkzFUr
         DpHEjy1KMQzO8ESDP378NEmR+cMG2zVU7JLcFKcwdDH7fDFlheHfj1jl3OCPt+kJRhSF
         W7IQ==
X-Gm-Message-State: AJIora/Cy0jqdeMRIT7S8hXxU58xkLllJG4aPjdt6Cxck1YkWq1pQPpw
	c14/JGKFgw0csZjDa9vMjevnpgSRudIUE7V4/8A=
X-Google-Smtp-Source: AGRyM1t3HFI1Or/ZQ12dMxcQ6TJU/AXAYwtazLcOiEBqPB2+XZv9fSyEmOlXtK3Zdle5Nn4IW9pBlvLUeluT6QmGEdQ=
X-Received: by 2002:a25:2182:0:b0:66e:2a27:7d30 with SMTP id
 h124-20020a252182000000b0066e2a277d30mr18246147ybh.491.1657023409065; Tue, 05
 Jul 2022 05:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
 <72686231-c372-a4fe-347e-39470790fa65@kernel.org> <CAGm1_kvRuWY7t2d_BtuSLGEL1u4njRqha=D0f7eN9F5XG8GrLQ@mail.gmail.com>
 <CAGm1_kuucv71AdPkSW8Eog2T9rZRA3uiL4+ok-aWCVsj-z2eew@mail.gmail.com>
 <5a36197d-7ed5-c06a-0a7e-73b808526dcd@kernel.org> <feff53c6-a38c-1592-b3ef-1ff236da17f9@kernel.org>
 <CAGm1_kvQ-NA4topLTu2hrQqx6picci8d+AeMVBtw44nJ7mYVow@mail.gmail.com>
 <25109f4c-110f-b534-1c5a-c571b5c70333@kernel.org> <CAGm1_ku0pGqfi8a++jNYeYNk1Hv9QgxsjKqOtetk8QzrTcFtPg@mail.gmail.com>
 <981dfc27-cbe5-9672-3647-397e6416578b@kernel.org> <CAGm1_kuXTuhoB1-K=_bFLBicWi5PWuejwO0yhPC6E41RZxe10w@mail.gmail.com>
In-Reply-To: <CAGm1_kuXTuhoB1-K=_bFLBicWi5PWuejwO0yhPC6E41RZxe10w@mail.gmail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 5 Jul 2022 14:16:37 +0200
Message-ID: <CAGm1_kuDRuxWGW3rZgaNMNiTm-rUuWe=-5pD0BqRJZBTYtW=EA@mail.gmail.com>
Subject: Re: raw/omap2: erasing issue
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_051652_903481_2570FCBF 
X-CRM114-Status: GOOD (  46.42  )
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

Hi Roger,

On Mon, Jul 4, 2022 at 12:31 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Roger,
>
> On Mon, Jul 4, 2022 at 12:28 PM Roger Quadros <rogerq@kernel.org> wrote:
> >
> > Hello Yegor,
> >
> > On 04/07/2022 14:28, Yegor Yefremov wrote:
> > > Hi Roger,
> > >
> > > On Thu, Jun 30, 2022 at 1:22 PM Roger Quadros <rogerq@kernel.org> wrote:
> > >>
> > >> Hi Yegor,
> > >>
> > >> On 29/06/2022 17:23, Yegor Yefremov wrote:
> > >>> Hi Roger,
> > >>>
> > >>> On Wed, Jun 29, 2022 at 3:44 PM Roger Quadros <rogerq@kernel.org> wrote:
> > >>>>
> > >>>> Hi Yegor,
> > >>>>
> > >>>> On 29/06/2022 14:33, Roger Quadros wrote:
> > >>>>> Hi Yegor,
> > >>>>>
> > >>>>> On 28/06/2022 14:59, Yegor Yefremov wrote:
> > >>>>>> On Tue, Jun 28, 2022 at 1:57 PM Yegor Yefremov
> > >>>>>> <yegorslists@googlemail.com> wrote:
> > >>>>>>>
> > >>>>>>> Hi Roger,
> > >>>>>>>
> > >>>>>>> On Tue, Jun 28, 2022 at 1:44 PM Roger Quadros <rogerq@kernel.org> wrote:
> > >>>>>>>>
> > >>>>>>>> Hi Yegor,
> > >>>>>>>>
> > >>>>>>>> On 28/06/2022 13:48, Yegor Yefremov wrote:
> > >>>>>>>>> Since linux 5.17 I get the following issue when doing ubiformat:
> > >>>>>>>>>
> > >>>>>>>>> # ubiformat -y /dev/mtd5
> > >>>>>>>>> ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
> > >>>>>>>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > >>>>>>>>> libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
> > >>>>>>>>> libscan: scanning eraseblock 2028 -- 100 % complete
> > >>>>>>>>> ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
> > >>>>>>>>> ubiformat: 2 eraseblocks are supposedly empty
> > >>>>>>>>> ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
> > >>>>>>>>> 11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
> > >>>>>>>>> 31, 32
> > >>>>>>>>
> > >>>>>>>> I'm guessing these bad blocks recently added due to the offending patch?
> > >>>>>>>
> > >>>>>>> Yes.
> > >>>>>>>
> > >>>>>>>>> ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
> > >>>>>>>>> attempt to erase a bad block at page 0x00000d40
> > >>>>>>>>> ubiformat: formatting eraseblock 28[   33.658809] nand:
> > >>>>>>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000d80
> > >>>>>>>>> ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
> > >>>>>>>>> nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
> > >>>>>>>>> ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
> > >>>>>>>>> nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
> > >>>>>>>>> ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
> > >>>>>>>>> MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
> > >>>>>>>>>         error 5 (Input/output error)
> > >>>>>>>>>
> > >>>>>>>>> ubiformat: error!: failed to erase eraseblock 34
> > >>>>>>>>>            error 5 (Input/output error)
> > >>>>>>>>> ubiformat: marking block 34 bad
> > >>>>>>>>> ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
> > >>>>>>>>> MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
> > >>>>>>>>>         error 5 (Input/output error)
> > >>>>>>>>>
> > >>>>>>>>> ubiformat: error!: failed to erase eraseblock 35
> > >>>>>>>>>            error 5 (Input/output error)
> > >>>>>>>>> ubiformat: marking block 35 bad
> > >>>>>>>>> ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
> > >>>>>>>>> MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
> > >>>>>>>>>         error 5 (Input/output error)
> > >>>>>>>>>
> > >>>>>>>>> ubiformat: error!: failed to erase eraseblock 36
> > >>>>>>>>>            error 5 (Input/output error)
> > >>>>>>>>> ubiformat: marking block 36 bad
> > >>>>>>>>> ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
> > >>>>>>>>> MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
> > >>>>>>>>>         error 5 (Input/output error)
> > >>>>>>>>>
> > >>>>>>>>> ubiformat: error!: failed to erase eraseblock 37
> > >>>>>>>>>            error 5 (Input/output error)
> > >>>>>>>>> ubiformat: marking block 37 bad
> > >>>>>>>>>
> > >>>>>>>>> ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
> > >>>>>>>>> # [   36.322563] vwl1271: disabling
> > >>>>>>>>>
> > >>>>>>>>> git bisect pointed to the following commit:
> > >>>>>>>>>
> > >>>>>>>>> a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
> > >>>>>>>>> commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> > >>>>>>>>> Author: Roger Quadros <rogerq@kernel.org>
> > >>>>>>>>> Date:   Thu Dec 9 11:04:55 2021 +0200
> > >>>>>>>>>
> > >>>>>>>>>     mtd: rawnand: omap2: move to exec_op interface
> > >>>>>>>>>
> > >>>>>>>>>     Stop using legacy interface and move to the exec_op interface.
> > >>>>>>>>>
> > >>>>>>>>>     Signed-off-by: Roger Quadros <rogerq@kernel.org>
> > >>>>>>>>>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >>>>>>>>>     Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org
> > >>>>>>>>>
> > >>>>>>>>> :040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
> > >>>>>>>>> c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers
> > >>>>>>>>>
> > >>>>>>>>> Info to my NAND flash:
> > >>>>>>>>>
> > >>>>>>>>> [    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> > >>>>>>>>> [    5.702193] nand: Micron MT29F2G08ABAEAWP
> > >>>>>>>>> [    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> > >>>>>>>>> 2048, OOB size: 64
> > >>>>>>>>> [    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
> > >>>>>>>>> [    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
> > >>>>>>>>> [    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
> > >>>>>>>>> [    5.731594] 0x000000000000-0x000000020000 : "SPL"
> > >>>>>>>>> [    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
> > >>>>>>>>> using UBI block devices instead.
> > >>>>>>>>> [    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
> > >>>>>>>>> [    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
> > >>>>>>>>> consider using UBI block devices instead.
> > >>>>>>>>> [    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
> > >>>>>>>>> [    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
> > >>>>>>>>> consider using UBI block devices instead.
> > >>>>>>>>> [    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
> > >>>>>>>>> [    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
> > >>>>>>>>> consider using UBI block devices instead.
> > >>>>>>>>> [    5.809341] 0x000000080000-0x000000260000 : "u-boot"
> > >>>>>>>>> [    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
> > >>>>>>>>> using UBI block devices instead.
> > >>>>>>>>> [    5.829189] 0x000000260000-0x000010000000 : "UBI"
> > >>>>>>>>> [    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
> > >>>>>>>>> using UBI block devices instead.
> > >>>>>>>>>
> > >>>>>>>>
> > >>>>>>>> What platform are you on?
> > >>>>>>>> I do remember testing this on omap3-beagle but it does not use BCH8 ECC scheme.
> > >>>>>>>
> > >>>>>>> I am on am335x [1]
> > >>>>>>>
> > >>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.19-rc4
> > >>>>>>
> > >>>>>> NAND node definition [1]:
> > >>>>>>
> > >>>>>> &gpmc {
> > >>>>>> pinctrl-names = "default";
> > >>>>>> pinctrl-0 = <&nandflash_pins_s0>;
> > >>>>>> ranges = <0 0 0x08000000 0x10000000>; /* CS0: NAND */
> > >>>>>> status = "okay";
> > >>>>>>
> > >>>>>> nand@0,0 {
> > >>>>>> compatible = "ti,omap2-nand";
> > >>>>>> reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
> > >>>>>> interrupt-parent = <&gpmc>;
> > >>>>>> interrupts = <0 IRQ_TYPE_NONE>, /* fifoevent */
> > >>>>>>     <1 IRQ_TYPE_NONE>; /* termcount */
> > >>>>>> rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
> > >>>>>> nand-bus-width = <8>;
> > >>>>>> ti,nand-ecc-opt = "bch8";
> > >>>>>> ti,nand-xfer-type = "polled";
> > >>>>>
> > >>>>> Could you please change this to "prefetch-polled" and see if it fixes the issue?
> > >>>>>
> > >>>>
> > >>>> I tried to set ti,nand-xfer-type to "polled" on beagle-c4 board and could not reproduce the issue
> > >>>> I will need your help please to debug this issue.
> > >>>>
> > >>>> Could you please apply the below patch on top of commit a9e849efca4f9c7732ea4a81f13ec96208994b22
> > >>>> and send me the full kernel log and output of ubiformat command?
> > >>>
> > >>> I'll post the data later.
> > >>>
> > >>> The test with the "prefetch-polled" setting looks promising:
> > >>>
> > >>> 1. ubiformat runs without issues
> > >>> 2. I can boot from NAND after "cat MLO > /dev/mtdblock0", etc.
> > >>> 3. the kernel can mount UBIFS as rootfs
> > >>>
> > >>> The only issue I have for now, is that barebox fails to correctly
> > >>> mount the first partition (the second with UBIFS rootfs - no problem).
> > >>> This is how I write to NAND:
> > >>>
> > >>> ubiformat -y /dev/mtd5
> > >>> ubiattach -p /dev/mtd5
> > >>> ubimkvol /dev/ubi0 -N kernel -s 56MiB
> > >>> mount -t ubifs ubi0:kernel /mnt
> > >>> cp kernel-fit.itb /mnt
> > >>> umount /mnt
> > >>> ubimkvol /dev/ubi0 -N rootfs -s 180MiB
> > >>> ubiupdatevol /dev/ubi0_1 rootfs.ubifs
> > >>>
> > >>> barebox log:
> > >>>
> > >>> Booting from NAND
> > >>> ubi0: scanning is finished
> > >>> ubi0: registering /dev/nand0.UBI.ubi
> > >>> ubi0: registering kernel as /dev/nand0.UBI.ubi.kernel
> > >>> ubi0: registering rootfs as /dev/nand0.UBI.ubi.rootfs
> > >>> ubi0: attached mtd0 (name "nand0.UBI", size 253 MiB) to ubi0
> > >>> ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
> > >>> ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
> > >>> ubi0: VID header offset: 512 (aligned 512), data offset: 2048
> > >>> ubi0: good PEBs: 1999, bad PEBs: 30, corrupted PEBs: 0
> > >>
> > >> Note that we now have 30 bad PEBs. I suppose these are not
> > >> really bad and we need to somehow clear bad block status for these.
> > >
> > > Do you mean using u-boot's "nand scrab"? So far, I didn't found any
> > > other option. There are numerous threads both mtd and barebox mailing
> > > lists but no implementation.
> > >
> > > Unfortunately, I don't have the initial BBT info. So let's hope the
> > > system can handle this.
> >
> >
> > "nand scrub" will mark all sectors not-bad so doesn't look like the best option.
> > I was wondering if there is a better way to selectively mark individual sectors not bad.
>
> Haven't found anything suitable so far.
>
> > >
> > > Btw, I have applied your debug patch and executed a ubiformat command
> > > but the debug messages weren't triggered.
> >
> > That is because you no longer see errors during nand erase. Did you try
> > going back to ti,nand-xfer-type = "polled" ?
>
> I have applied the patch to a9e849efca4f9c7732ea4a81f13ec96208994b22
> and at that time our DTS still has xfer type as "polled" and ubiformat
> command failed as expected.

I think the issue is solved. The bootloader was actually complaining
about the missing zstd support. I could see this with the latest
barebox version (2022.06).

I've also switched to "ti,nand-xfer-type = "prefetch-dma";" as other DTS do.

Thanks for your help.

Yegor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
