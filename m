Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FECC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TKkw2ULt7EYOljUr8Dv/3uAgycdYKFJdn6Fb8zZeYFA=; b=JxM5g105eBvjdt
	qyccUeVGHDrYRKSPjhN90XBHnQBEAv4BL87XYMzvseox5kvV0hRk6RzGVDosgJxSDkM0QTZZsYw5X
	i7S2B0QdXny1gN/YKYKIdf1JKvbU9mGmYI+C4Nhy3T0vhFoWfQytK+93Zp9lzuBTeN5pRtpyHvLh3
	P3Uxp+7W6YHVZHY90qHhzFAG46V3RwH2/iVG0hTGsMXDmDLLFqwxmEBlAwt3JmWPUag2BMXpbx2st
	LeS1pYrUf+eh/z+jVqO3hOgudl003mpwZVenGjKGDdNPQE8e3FBrcT8tM5bIEHoMFPFKM7q0dSO2r
	LS2nGRtKo5BMjv8X3yMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o68ln-005lku-DP; Tue, 28 Jun 2022 10:48:35 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o68lk-005ljX-RX
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 10:48:34 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31772f8495fso112487827b3.4
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TvBS1CPFquLgQjmgRqByyxoMhBcAVYRHfsLh3BdY+Qc=;
        b=Usi9eQgoxV7bgqYNBQghlN4B0qR2V5V6rfjC3rcXPHyRJY455nOK4mgUlYshwVDkQN
         EG3uH3o9eVxTXkOtSt0y27JvcJUQMpMwiC4WkSab7BKyEwO97j0QXk79yFtdMXKbyoZK
         Q+eVjFMtJpS/fppaCQyOeRfYI4f0oQn9Lgwb28bltlR580sV4dNmYHXoshSw0yYGEIC/
         4sBI5vKdlrVswrAOY/D73Vse9YcpvIcJhZjX27L9MNvf5Bu0oRjrtSbxODEx12V7+avB
         NVp88Xm6kHcPhmvlHIRnmdMR5kNV8SXbHaVO1OTghnduETMbaAprYyzk8BfzdLePYYfF
         +ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TvBS1CPFquLgQjmgRqByyxoMhBcAVYRHfsLh3BdY+Qc=;
        b=6M8pypddoNBdjap6HX1nu2mnfm9NzgCrZcKF3+E45vvLn0+mGEd4pSvHYfRNOgNa6Q
         eXQ7cp1l1Guz8ELx8AYu4pDM6hse8CDWu8j0qZTyntrvMGgX5FERTyILpsrlxPx7RvMt
         fErX5GO6LVzRwj7y2zbaVBtSaNZ60xwxG6nmtfJCDh1Zu/cG/RPrxbvYBsxVMgojMNiU
         HKuNR80/9YCvvzP6ltQL0Z/LERJE8PAM/iLczXrDa1Phl21FXVypXI296DtR7HF42sWL
         BtVrEPPOKOG/oPruAOgf/dU+gFdZqt9lAKi1wn0GsHtQBgZ6tnAQY89kBs9GDGRzQv1J
         JBNw==
X-Gm-Message-State: AJIora/ZpN3kLv8eZFkcpe1Fl/dyRgoYCQ4fpKKU9gQoPLeLaM4lMp+J
	Qc93RPAbOiQp4VKV3OPedFvxq8KJezRr7tNmyATpztwbymOboA==
X-Google-Smtp-Source: AGRyM1veEJ+dHNxzAaiO9kYPPy/eRNb0nxNDX23qqgEyPM648hNmewsEY0QJNth2cRVFOgXERKFTcmvAQ2D2MRsSc7s=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr20507253ywb.153.1656413309834; Tue, 28
 Jun 2022 03:48:29 -0700 (PDT)
MIME-Version: 1.0
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Jun 2022 12:48:18 +0200
Message-ID: <CAGm1_ktXBp-sz3Dud_G0iqOG=vA=Xp-bj-icwNLVgq-AMqKO7A@mail.gmail.com>
Subject: raw/omap2: erasing issue
To: linux-mtd@lists.infradead.org
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, rogerq@kernel.org, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_034832_948610_2A0BDC16 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

Since linux 5.17 I get the following issue when doing ubiformat:

# ubiformat -y /dev/mtd5
ubiformat: mtd5 (nand), size 265945088 bytes (253.6 MiB), 2029
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 1097 -- 54 % complete  eth1 timed out to bring up
libscan: scanning eraseblock 2028 -- 100 % complete
ubiformat: 2001 eraseblocks have valid erase counter, mean value is 9
ubiformat: 2 eraseblocks are supposedly empty
ubiformat: 26 bad eraseblocks found, numbers: 3, 4, 5, 6, 8, 9, 10,
11, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30,
31, 32
ubiformat: formatting eras[   33.644323] nand: nand_erase_nand:
attempt to erase a bad block at page 0x00000d40
ubiformat: formatting eraseblock 28[   33.658809] nand:
nand_erase_nand: attempt to erase a bad block at page 0x00000d80
ubiformat: formatting eraseblock 29 --  1 % [   33.674531] nand:
nand_erase_nand: attempt to erase a bad block at page 0x00000dc0
ubiformat: formatting eraseblock 30 --  1 % complete [   33.684508]
nand: nand_erase_nand: attempt to erase a bad block at page 0x00000e00
ubiformat: formatting eraseblock 34 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 34 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 34
           error 5 (Input/output error)
ubiformat: marking block 34 bad
ubiformat: formatting eraseblock 35 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 35 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 35
           error 5 (Input/output error)
ubiformat: marking block 35 bad
ubiformat: formatting eraseblock 36 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 36 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 36
           error 5 (Input/output error)
ubiformat: marking block 36 bad
ubiformat: formatting eraseblock 37 --  1 % complete  libmtd: error!:
MEMERASE64 ioctl failed for eraseblock 37 (mtd5)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 37
           error 5 (Input/output error)
ubiformat: marking block 37 bad

ubiformat: error!: consecutive bad blocks exceed limit: 4, bad flash?
# [   36.322563] vwl1271: disabling

git bisect pointed to the following commit:

a9e849efca4f9c7732ea4a81f13ec96208994b22 is the first bad commit
commit a9e849efca4f9c7732ea4a81f13ec96208994b22
Author: Roger Quadros <rogerq@kernel.org>
Date:   Thu Dec 9 11:04:55 2021 +0200

    mtd: rawnand: omap2: move to exec_op interface

    Stop using legacy interface and move to the exec_op interface.

    Signed-off-by: Roger Quadros <rogerq@kernel.org>
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
    Link: https://lore.kernel.org/linux-mtd/20211209090458.24830-4-rogerq@kernel.org

:040000 040000 2341051b8aa8e6b554b8a44d2934f76d1aa460c4
c1727080ff16c403f4ad5ed840acc90127b632f8 M      drivers

Info to my NAND flash:

[    5.695760] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    5.702193] nand: Micron MT29F2G08ABAEAWP
[    5.706356] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    5.714204] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    5.719673] 6 cmdlinepart partitions found on MTD device omap2-nand.0
[    5.726232] Creating 6 MTD partitions on "omap2-nand.0":
[    5.731594] 0x000000000000-0x000000020000 : "SPL"
[    5.737788] mtdblock: MTD device 'SPL' is NAND, please consider
using UBI block devices instead.
[    5.750113] 0x000000020000-0x000000040000 : "SPL.backup1"
[    5.756916] mtdblock: MTD device 'SPL.backup1' is NAND, please
consider using UBI block devices instead.
[    5.769870] 0x000000040000-0x000000060000 : "SPL.backup2"
[    5.776695] mtdblock: MTD device 'SPL.backup2' is NAND, please
consider using UBI block devices instead.
[    5.789559] 0x000000060000-0x000000080000 : "SPL.backup3"
[    5.796423] mtdblock: MTD device 'SPL.backup3' is NAND, please
consider using UBI block devices instead.
[    5.809341] 0x000000080000-0x000000260000 : "u-boot"
[    5.816652] mtdblock: MTD device 'u-boot' is NAND, please consider
using UBI block devices instead.
[    5.829189] 0x000000260000-0x000010000000 : "UBI"
[    5.971508] mtdblock: MTD device 'UBI' is NAND, please consider
using UBI block devices instead.


Regards,
Yegor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
