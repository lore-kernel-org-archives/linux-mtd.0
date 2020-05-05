Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537A5C47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 23:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208EA206FA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 23:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A+wyhnnc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0FHfgV6Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208EA206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pONgojNKJLWbtIyBBNFnALC9t1YJLXlr7ClNC0V9Kws=; b=A+wyhnncZt9EKKAZDUFXotwQF
	HngWP7BTCE3hBnJZpZl4QLEGaTtmJFTVfKJDp/+A/iNai8xb1v4oynm4nJsoU7XJogFOSCyzMsp5f
	wZb734yX1DIKpoUUCXZFke5kcOEAPGe9fPdwbvGtsn5MZ32nawQK0k/+81Trtif7k7BPFlHwKNMKm
	AaETb3W29Xc+fTFIihBs3AvxVPpQonGPEYe++aZye0R/97+umRp4GtWWm3dJApNSlb1mfZ4gZwovS
	iibeslKO8+Fjqf/1dgOHMkLDU7yW90MItHDF15PutL/vh2DVrXVhh7rMshZw5dTcknQS3zvT673a1
	5W/hGZrRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW6v1-000618-Bc; Tue, 05 May 2020 23:24:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW6uv-0005xv-Ve
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 23:24:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x2so53041pfx.7
 for <linux-mtd@lists.infradead.org>; Tue, 05 May 2020 16:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dqVx14QgdAnzjmHvTBjkhH/YIEEcALyP3imjmrm5UUU=;
 b=0FHfgV6QxdcTNdxyIJkEfM1O9oSTCfNcf5ovpINDVYxyKyw8mQxGcGn4GGNGsFH2j3
 m5/ij3Xmr7d5hiDbbKRQz8L4Vqmw7kivDOLm2bZiaMPnspB8awFYkKFOjHiMJKvd2nqz
 G9zp0riSYN1qesIqL5dXVp19MmYFSOK2B53uZfSRz/LZgkcZM5780YfCd9+EzcZC/n8e
 1SjyM8grHSjSqP3U7FXft/4cQIXpXU0TEUj+FeVqsOzAUQFRcPqJnHW09P/MekWEy9td
 O9i6i8SKkTuBhyQhiXU88P03lFqlzUNMwsEEFi7egx5wZSChRkiqQ+unCBCHSR6P6y0Z
 6mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dqVx14QgdAnzjmHvTBjkhH/YIEEcALyP3imjmrm5UUU=;
 b=kQyDYy8qYo4gu5sS0NdzEOFYfFN9ZzacIMf19VqWelSu24h8TZrycz2z8NC96xo3X3
 rY0wBJqNgnWWDkvKDqWBXgsGA4PPvz3Xg8wj/VXHTFweAwhJjZXA1heMjf+fAApde1F9
 9CpZO/1ndiwOGAUMKJXKdzgmkBfiRkwcr4ghDB0WYEU5BVNYj1JyeZW0i2U2Wn4XjX6s
 EOUAevl28s6kOLCXuftDrTvcELpsqIumhtG2yNm6IlQJ1cfUgLglMd/MRpeuc+TuQG2s
 Zi3vJHSmbIQKQfDFpAu/U5otT3DTq98V27WNDlxQ8n3EwBHcTCoe/w40tcmg0VkqAAvV
 Qy3g==
X-Gm-Message-State: AGi0PubLssNKo/Ha+4+BPJjs3bozMSTSPM87NFpZCD17xd2PbGa2PwEA
 wzG2HUxoLkRTtd1DS3RqIXwTKg==
X-Google-Smtp-Source: APiQypJ3YLkFwDh4nhrrb5X/v9+P1AkBs5hbWFt7r25C8lC71a6KZzd0oQ1QilM9qmS7CRZ9MbYVSw==
X-Received: by 2002:a63:f605:: with SMTP id m5mr4731947pgh.223.1588721040507; 
 Tue, 05 May 2020 16:24:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b3sm172744pga.48.2020.05.05.16.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 16:23:59 -0700 (PDT)
Date: Tue, 05 May 2020 16:23:59 -0700 (PDT)
X-Google-Original-Date: Tue, 05 May 2020 16:23:56 PDT (-0700)
Subject: RE: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
In-Reply-To: <BN8PR13MB2611968A7252308925FF18B399A70@BN8PR13MB2611.namprd13.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sagar.kadam@sifive.com
Message-ID: <mhng-29e22ca7-538a-4094-923f-8fbc0fd327b9@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_162402_052980_C66D8A44 
X-CRM114-Status: GOOD (  21.44  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 05 May 2020 00:18:45 PDT (-0700), sagar.kadam@sifive.com wrote:
> Hello Palmer,
> 
>> -----Original Message-----
>> From: Palmer Dabbelt <palmer@dabbelt.com>
>> Sent: Tuesday, May 5, 2020 3:40 AM
>> To: Sagar Kadam <sagar.kadam@sifive.com>
>> Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; Paul Walmsley
>> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
>> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Sagar Kadam
>> <sagar.kadam@sifive.com>
>> Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
>> A00 board.
>> 
>> [External Email] Do not click links or attachments unless you recognize the
>> sender and know the content is safe
>> 
>> On Thu, 30 Apr 2020 02:58:51 PDT (-0700), sagar.kadam@sifive.com wrote:
>> > Enable MTD based SPI-NOR framework in order to use spi flash available
>> > on HiFive Unleashed A00 board.
>> >
>> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>> > ---
>> >  arch/riscv/configs/defconfig | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/arch/riscv/configs/defconfig
>> > b/arch/riscv/configs/defconfig index 4da4886..970580b 100644
>> > --- a/arch/riscv/configs/defconfig
>> > +++ b/arch/riscv/configs/defconfig
>> > @@ -80,6 +80,8 @@ CONFIG_USB_STORAGE=y  CONFIG_USB_UAS=y
>> CONFIG_MMC=y
>> > CONFIG_MMC_SPI=y
>> > +CONFIG_MTD=y
>> > +CONFIG_MTD_SPI_NOR=y
>> >  CONFIG_RTC_CLASS=y
>> >  CONFIG_VIRTIO_PCI=y
>> >  CONFIG_VIRTIO_BALLOON=y
>> 
>> From the second patch's description I'm assuming that MTD still functions
>> correctly without that change?
> 
> Yes Palmer, the second patch is to enable QUAD write to nor flash..
> MTD  function's correctly without second patch.
>
> Using the character interface (/dev/mtd0) mtd_utils (mtd_debug : erase/read/write) work fine.
> We might require CONFIG_MTD_BLOCK, CONFIG_MTD_CMDLINE_PARTS  in order to use MTD partitioning.
> IMHO it can be at user's choice weather to use flash partitions or not, so I have not enabled. Please let me 
> know if I should enable these features as well.

Looks like arm64 has these:

arch/arm64/configs/defconfig:CONFIG_MTD=y
arch/arm64/configs/defconfig:CONFIG_MTD_BLOCK=y
arch/arm64/configs/defconfig:CONFIG_MTD_CFI=y
arch/arm64/configs/defconfig:CONFIG_MTD_CFI_ADV_OPTIONS=y
arch/arm64/configs/defconfig:CONFIG_MTD_CFI_INTELEXT=y
arch/arm64/configs/defconfig:CONFIG_MTD_CFI_AMDSTD=y
arch/arm64/configs/defconfig:CONFIG_MTD_CFI_STAA=y
arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP=y
arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP_OF=y
arch/arm64/configs/defconfig:CONFIG_MTD_DATAFLASH=y
arch/arm64/configs/defconfig:CONFIG_MTD_SST25L=y
arch/arm64/configs/defconfig:CONFIG_MTD_RAW_NAND=y
arch/arm64/configs/defconfig:CONFIG_MTD_NAND_DENALI_DT=y
arch/arm64/configs/defconfig:CONFIG_MTD_NAND_MARVELL=y
arch/arm64/configs/defconfig:CONFIG_MTD_NAND_FSL_IFC=y
arch/arm64/configs/defconfig:CONFIG_MTD_NAND_QCOM=y
arch/arm64/configs/defconfig:CONFIG_MTD_SPI_NOR=y

so I think we're good with just what you have here: MTD_BLOCK doesn't seem that
useful, and the rest are drivers.  That said, these (along with SPI and
SPI_SIFIVE) should really be in Kconfig.socs rather than defconfig.  Can you
send a patch that does that?

> 
> To demonstrate a bit more with linux 5.7-rc3 
> 
> Specify on U-boot prompt:
> # setenv bootargs "root=/dev/ram rw console=ttySIF0 mtdparts=spi0.0:1024k(loader1),4096K(loader2),26M(rootfs)"
> 
> After booting linux will enumerate mtd partitions:
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00100000 00001000 "loader1"
> mtd1: 00400000 00001000 "loader2"
> mtd2: 01a00000 00001000 "rootfs"
> 
> # cat /proc/partitions
> major minor  #blocks  name
>   31        0       1024 mtdblock0
>   31        1       4096 mtdblock1
>   31        2      26624 mtdblock2
> 
> #Format mtdblock2 with mkfs.ext3/4 and mount results in
> # mkfs.ext3 /dev/mtdblock2
> mke2fs 1.44.5 (15-Dec-2018)
> /dev/mtdblock2 contains a ext3 file system
>         last mounted on /mnt on Thu Jan  1 00:00:14 1970
> Proceed anyway? (y,N) y
> Creating filesystem with 26624 1k blocks and 6656 inodes
> Filesystem UUID: 1b09252d-e313-430c-9ecb-79b0cef003ca
> Superblock backups stored on blocks:
>         8193, 24577
> 
> Allocating group tables: done
> Writing inode tables: done
> Creating journal (1024 blocks): done
> Writing superblocks and filesystem accounting information: done
> 
> # mount
> none on / type rootfs (rw)
> proc on /proc type proc (rw,relatime)
> devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=666)
> tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
> tmpfs on /tmp type tmpfs (rw,relatime)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
> sysfs on /sys type sysfs (rw,relatime)
> /dev/mtdblock2 on /mnt type ext3 (rw,relatime)
> 
> Thanks & BR,
> Sagar Kadam


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
