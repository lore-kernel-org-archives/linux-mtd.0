Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75955C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 05:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA16206E6
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 05:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNy2jgUB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FQ18p5YP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA16206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeGVkTL9egDd1B8PpgF6WSOtnL0xohpWcts8p9E8Jkc=; b=cNy2jgUBTNeGRg
	HU+kbw9S6GY4tnJCiPxfApkKvf9VrkReuZgb37qk3vB17PdLEn6mGmrOOgrEJozJ1bmQeblBjvSya
	05DCjh2TgQvEuE4E3r1pekjfkaaL6pNDs4YlMGlqbCOfWd5brkUHQWUVFxeQMGTu+QYRCcOW2PUt/
	pDglJDCGeH8u1K2GOG4YYrUKtx7vIJ4xHqUwTUwFb81ML525hxdgEt2k0AUJSckRsZZjhSxbWTNdE
	gmZShSVEBPUf9Vv4ocQz2HNUIq2RbRt8WNLQEDQ5/i9Z8RKyO7fGe8volz7XtWp1E+E03PvPIth8a
	zc2P8Lyj0tQVwjTy1KNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCJh-0001V1-F6; Wed, 06 May 2020 05:09:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCJe-0001UI-KK
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 05:09:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id k1so533141wro.12
 for <linux-mtd@lists.infradead.org>; Tue, 05 May 2020 22:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KONjtN1d3tvLqOY/wlrmm4pE107x+jxzOGMlbDSUVz0=;
 b=FQ18p5YPTcGlRz3bil64DOWyaUFNzUGsMcJEieNlyq0+xx1A/HZ5dCilifPHh9/fk3
 PUNP3u8BMuh6N1x98sX7bB/gVTH9YZdwASkZZzw4yQ3w+SGIHydcApzO7g1SgaW+lPFh
 KVQMIPqAEJhOhdnT2oide6UFBbaqSudSAhIWAvzlyDpbs2Abhr3Oh6vQzsDLw70A4pUC
 P+l/+ZvVJgadmYYTiIUpgzvmdT1P3bteDki0zL8RkCix1p/Gv+NyYXbeBD5lZ0ksgPwS
 sKf9021GOW2ZOmI6409KCg2WvlycsflKN1GgzOx8y816x4GLBen2u764lGkUpuoVLJmR
 BhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KONjtN1d3tvLqOY/wlrmm4pE107x+jxzOGMlbDSUVz0=;
 b=UltbZxjFIY9OCu5WvEvpQx98wF8Mgr64LdYNwCQVHOLeDT/nYe4xXkgGcRqq040zwG
 PG86TrztEKoPAXYrbqrhjZ89+Mklp2kNm+Dis3btELOU9lYe9wv6DQmxT5PhF0tERQ68
 mN0NIl5jxjilifNhvO7O+is1yLdL9nQP9c/4d/MOifbkH1S6HOsFF6AvkaFipGAaMNi9
 dCCJ+y9+CqhqdAn5X1MmSotqFZogRn7LSBsPO/zoH5WGvfCvZy2Xe3vPhdf0YzIsn9RW
 5eAFlcDefTtmjjJEkuJ621+SEX0YmIihbMgtyg/f1Xyi1QBMVj0aSWzG0hiq6CKYfCll
 Z1PQ==
X-Gm-Message-State: AGi0PubjOkVpJY0ZzbITOGXXgQTU9mvVyq9TbJpofQbx1SryMl6+05Mq
 20T/TxF8PsCY3fyqW6JLbqr2B1oCj5rTWy1YLNUIRw==
X-Google-Smtp-Source: APiQypLiK8pkP0blfJITIvDGiJsn0oXglVqI5ta6/Xl1PsEi49y7oSsq6UhO9umLyTKjcm1Qj115Z0f6CpEsHoGYib4=
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr7286277wrs.230.1588741792592; 
 Tue, 05 May 2020 22:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR13MB2611968A7252308925FF18B399A70@BN8PR13MB2611.namprd13.prod.outlook.com>
 <mhng-29e22ca7-538a-4094-923f-8fbc0fd327b9@palmerdabbelt-glaptop1>
 <BYAPR13MB2614FE811C8DD83BBDD3A26599A40@BYAPR13MB2614.namprd13.prod.outlook.com>
In-Reply-To: <BYAPR13MB2614FE811C8DD83BBDD3A26599A40@BYAPR13MB2614.namprd13.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 May 2020 10:39:39 +0530
Message-ID: <CAAhSdy2-ECrOP=kZOTXxj1t+f8NrcYjbXKDRwPB3KU36mDmWWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
To: Sagar Kadam <sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_220954_730024_EDA9108D 
X-CRM114-Status: GOOD (  28.41  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 6, 2020 at 9:26 AM Sagar Kadam <sagar.kadam@sifive.com> wrote:
>
> Hi Palmer,
>
> > -----Original Message-----
> > From: Palmer Dabbelt <palmer@dabbelt.com>
> > Sent: Wednesday, May 6, 2020 4:54 AM
> > To: Sagar Kadam <sagar.kadam@sifive.com>
> > Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
> > richard@nod.at; vigneshr@ti.com; Paul Walmsley
> > <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; linux-mtd@lists.infradead.org
> > Subject: RE: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
> > A00 board.
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Tue, 05 May 2020 00:18:45 PDT (-0700), sagar.kadam@sifive.com wrote:
> > > Hello Palmer,
> > >
> > >> -----Original Message-----
> > >> From: Palmer Dabbelt <palmer@dabbelt.com>
> > >> Sent: Tuesday, May 5, 2020 3:40 AM
> > >> To: Sagar Kadam <sagar.kadam@sifive.com>
> > >> Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
> > >> richard@nod.at; vigneshr@ti.com; Paul Walmsley
> > >> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
> > >> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Sagar Kadam
> > >> <sagar.kadam@sifive.com>
> > >> Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive
> > Unleashed
> > >> A00 board.
> > >>
> > >> [External Email] Do not click links or attachments unless you recognize
> > the
> > >> sender and know the content is safe
> > >>
> > >> On Thu, 30 Apr 2020 02:58:51 PDT (-0700), sagar.kadam@sifive.com
> > wrote:
> > >> > Enable MTD based SPI-NOR framework in order to use spi flash
> > available
> > >> > on HiFive Unleashed A00 board.
> > >> >
> > >> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > >> > ---
> > >> >  arch/riscv/configs/defconfig | 2 ++
> > >> >  1 file changed, 2 insertions(+)
> > >> >
> > >> > diff --git a/arch/riscv/configs/defconfig
> > >> > b/arch/riscv/configs/defconfig index 4da4886..970580b 100644
> > >> > --- a/arch/riscv/configs/defconfig
> > >> > +++ b/arch/riscv/configs/defconfig
> > >> > @@ -80,6 +80,8 @@ CONFIG_USB_STORAGE=y  CONFIG_USB_UAS=y
> > >> CONFIG_MMC=y
> > >> > CONFIG_MMC_SPI=y
> > >> > +CONFIG_MTD=y
> > >> > +CONFIG_MTD_SPI_NOR=y
> > >> >  CONFIG_RTC_CLASS=y
> > >> >  CONFIG_VIRTIO_PCI=y
> > >> >  CONFIG_VIRTIO_BALLOON=y
> > >>
> > >> From the second patch's description I'm assuming that MTD still
> > functions
> > >> correctly without that change?
> > >
> > > Yes Palmer, the second patch is to enable QUAD write to nor flash..
> > > MTD  function's correctly without second patch.
> > >
> > > Using the character interface (/dev/mtd0) mtd_utils (mtd_debug :
> > erase/read/write) work fine.
> > > We might require CONFIG_MTD_BLOCK, CONFIG_MTD_CMDLINE_PARTS
> > in order to use MTD partitioning.
> > > IMHO it can be at user's choice weather to use flash partitions or not, so I
> > have not enabled. Please let me
> > > know if I should enable these features as well.
> >
> > Looks like arm64 has these:
> >
> > arch/arm64/configs/defconfig:CONFIG_MTD=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_BLOCK=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_CFI=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_CFI_ADV_OPTIONS=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_CFI_INTELEXT=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_CFI_AMDSTD=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_CFI_STAA=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP_OF=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_DATAFLASH=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_SST25L=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_RAW_NAND=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_NAND_DENALI_DT=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_NAND_MARVELL=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_NAND_FSL_IFC=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_NAND_QCOM=y
> > arch/arm64/configs/defconfig:CONFIG_MTD_SPI_NOR=y
> >
> > so I think we're good with just what you have here: MTD_BLOCK doesn't
> > seem that
> > useful, and the rest are drivers.  That said, these (along with SPI and
> > SPI_SIFIVE) should really be in Kconfig.socs rather than defconfig.  Can you
> > send a patch that does that?
> >
>
> Yes sure, I will send a V2 series, where SPI,  SPI_SIFIVE,  MTD,
> and MTD_SPI_NOR will be a part of Kconfig.socs.

We had build issues in past by selecting major driver subsystems
in Kconfig.socs

I suggest to select SPI_SIFIVE from Kconfig.socs and other
platform independent options should go in defconfig and
rv32_defconfig.

The general rule of thumb is to force select only required
drivers from Kconfig.socs.

Regards,
Anup

>
> Thanks & BR,
> Sagar Kadam
>
> > >
> > > To demonstrate a bit more with linux 5.7-rc3
> > >
> > > Specify on U-boot prompt:
> > > # setenv bootargs "root=/dev/ram rw console=ttySIF0
> > mtdparts=spi0.0:1024k(loader1),4096K(loader2),26M(rootfs)"
> > >
> > > After booting linux will enumerate mtd partitions:
> > > # cat /proc/mtd
> > > dev:    size   erasesize  name
> > > mtd0: 00100000 00001000 "loader1"
> > > mtd1: 00400000 00001000 "loader2"
> > > mtd2: 01a00000 00001000 "rootfs"
> > >
> > > # cat /proc/partitions
> > > major minor  #blocks  name
> > >   31        0       1024 mtdblock0
> > >   31        1       4096 mtdblock1
> > >   31        2      26624 mtdblock2
> > >
> > > #Format mtdblock2 with mkfs.ext3/4 and mount results in
> > > # mkfs.ext3 /dev/mtdblock2
> > > mke2fs 1.44.5 (15-Dec-2018)
> > > /dev/mtdblock2 contains a ext3 file system
> > >         last mounted on /mnt on Thu Jan  1 00:00:14 1970
> > > Proceed anyway? (y,N) y
> > > Creating filesystem with 26624 1k blocks and 6656 inodes
> > > Filesystem UUID: 1b09252d-e313-430c-9ecb-79b0cef003ca
> > > Superblock backups stored on blocks:
> > >         8193, 24577
> > >
> > > Allocating group tables: done
> > > Writing inode tables: done
> > > Creating journal (1024 blocks): done
> > > Writing superblocks and filesystem accounting information: done
> > >
> > > # mount
> > > none on / type rootfs (rw)
> > > proc on /proc type proc (rw,relatime)
> > > devpts on /dev/pts type devpts
> > (rw,relatime,gid=5,mode=620,ptmxmode=666)
> > > tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
> > > tmpfs on /tmp type tmpfs (rw,relatime)
> > > tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
> > > sysfs on /sys type sysfs (rw,relatime)
> > > /dev/mtdblock2 on /mnt type ext3 (rw,relatime)
> > >
> > > Thanks & BR,
> > > Sagar Kadam
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
