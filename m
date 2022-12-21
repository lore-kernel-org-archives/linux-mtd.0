Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7044DC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 00:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rPBmrIqhdmhX6dNqHpMEiNLcSDU1Q+xzjzi7YPYGVE=; b=0lNsML+MNij62g
	1IpEWDMVrO83Ln8gxSm8mhrqaXf3ahD+pGkjc6725xitHpwGZQ8JzlDriuLDf/BkCYYo7SHwdICkA
	hg+QlxzoSssa+VaejLOExPJ+bGoURemMBDGCkZApESTfPhUbjoDbZf/HoN2B5pcPplvCOTJB2wBWc
	Xg7m2utS0BGQSUa14659sSMFv7HcM+Z8C/UjqyMK7L/GKF1tM/m8fCns5kHaGV37K2wU7TsHCADY0
	fS4NfaJ+Vhw0+8FJQrpba/H2FBgDLFmYH5ge+fubUrpiPk4NZrwVQIF3Ikqao9/1IfJpjvWE75f7N
	a0kY6mmCvviPui70qJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7mzy-006Q0f-VQ; Wed, 21 Dec 2022 00:30:19 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7mzv-006PxH-3S
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 00:30:17 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso2170404ooi.10
        for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2022 16:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQyrHAs8avSuw2RzVe3kkAfZLtEeJGUdPG7123X/iSk=;
        b=l3JvZYGLdF+uess97IA9FSkL79RRbmXrTgKp+5Mt+GbAQTntR7npqsNfXwRCQc8hNB
         wtdKg24Kp61fw0JKy1VrtZRbF1aXUKRkThke/R/AVqI2dfkrK56aWL0qDDI/HVJiu1O6
         zYhYjwvyy8bojIWAadkyMUJ6odkHLfHEs+ZKc2jFZV2Yksv1+ya5vrKfCjC13HVquzft
         scDgYLLuYZynEUJ+kpCIVf0qr+mcQ37x4Kmr2FIikYQxAiR0sXtxlOSItaQhPH962L6R
         jx7oq3l66QnBRwmO+9sKEVaeZayJowQOPFDhIrBDI30kl7f6omrAVhXmdrsO1dGVr6Eg
         bA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQyrHAs8avSuw2RzVe3kkAfZLtEeJGUdPG7123X/iSk=;
        b=ZZfqBfd1nCH62QAXz/rDf0Ms2cPIaFQqUZhzQhIvNleqm8mglD93ySZIdiVHFW3cze
         ohOU8iWo7Nr3E+Rxxghwx0ZaFLHDvLC4Z0nzBhJukem0yG2qgqfOgeD3r7Qi30i7z3ws
         zHWKhZ8PAt3jSwdi8ultMUOJdq8Td9X3hp+YJ2dTTp9+upsccefvBSG14wH4NVO8pX2n
         eN4ar576L5M3lrX+tx9rrGN9EjL69fpJQKgskLRqg5BsqDTymVwVVGXS3TpHA0w1kWNh
         9pAGi6xHXafHOfDWMpZSghjDqj7DUYWL0bebwwY3UFSWoFmfyJNn62qh+9I9v5Ni1OJk
         uoSg==
X-Gm-Message-State: AFqh2kpzgu5/Q9VN9/p7zFG8bATh6ZWbXuES43mvbnQ2yttxYOXsHcFu
	MBfkOzws1e7m3n9B9wZOJQQ=
X-Google-Smtp-Source: AMrXdXt9Rl2/cCrsNu/PcY3Hk6ryOG7w5t3xnEyQKPcLXaAekU9sfvLVc1muMLqcmajx0gmlo9U5NA==
X-Received: by 2002:a4a:97b1:0:b0:49f:dba7:5e65 with SMTP id w46-20020a4a97b1000000b0049fdba75e65mr62577ooi.3.1671582611479;
        Tue, 20 Dec 2022 16:30:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r15-20020a4acb0f000000b004a065c72a05sm5637777ooq.2.2022.12.20.16.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 16:30:10 -0800 (PST)
Date: Tue, 20 Dec 2022 16:30:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com, william.salmon@sifive.com,
	adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based
 on SFDP
Message-ID: <20221221003009.GA280250@roeck-us.net>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_163015_210246_322342EA 
X-CRM114-Status: GOOD (  13.91  )
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

Hi,

On Tue, Sep 20, 2022 at 07:48:07PM +0100, Sudip Mukherjee wrote:
> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> initialization of the flash parameters and init them when parsing SFDP.
> 
> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> After this patch, it parses the SFDP information and still uses the
> same opcodes.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>

With this patch in place, qemu emulations with is25wp256 fail to
instantiate the flash. Specifically, this affects the qemu sifive_u
emulation. The resulting error message is:

spi-nor spi0.0: BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash
spi-nor: probe of spi0.0 failed with error -22

qemu command line:

qemu-system-riscv64 -M sifive_u -m 512M \
     -no-reboot -kernel arch/riscv/boot/Image -snapshot \
     -drive file=flash.8Vtb7,format=raw,if=mtd -bios default \
     -append "root=/dev/mtdblock0 mtdparts=spi0.0:- console=ttySIF0,115200 earlycon" \
     -nographic -monitor none

Reverting this patch fixes the problem.

Guenter

---
# bad: [1e4fa020d574768445fca2d9bbfe473ec8bbd224] Merge tag 'mtd/for-6.2' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
# good: [a594533df0f6ca391da003f43d53b336a2d23ffa] Merge tag 'drm-next-2022-12-13' of git://anongit.freedesktop.org/drm/drm
git bisect start '1e4fa020d574' 'a594533df0f6'
# good: [2399401feee27c639addc5b7e6ba519d3ca341bf] mtd: maps: pxa2xx-flash: fix memory leak in probe
git bisect good 2399401feee27c639addc5b7e6ba519d3ca341bf
# good: [bcc0c61e6134066f4629845691a514ea33465653] mtd: spi-nor: micron-st: Enable locking for mt25qu256a
git bisect good bcc0c61e6134066f4629845691a514ea33465653
# good: [a50ae8c98e5766a4fcb78e76f13cc658b784eac1] mtd: nand: drop EXPORT_SYMBOL_GPL for nanddev_erase()
git bisect good a50ae8c98e5766a4fcb78e76f13cc658b784eac1
# good: [6408cc05a50aaf88074a5a31d065e5af87a456f5] mtd: rawnand: Drop obsolete dependencies on COMPILE_TEST
git bisect good 6408cc05a50aaf88074a5a31d065e5af87a456f5
# bad: [1799cd8540b67b88514c82f5fae1c75b986bcbd8] mtd: spi-nor: add SFDP fixups for Quad Page Program
git bisect bad 1799cd8540b67b88514c82f5fae1c75b986bcbd8
# bad: [a30f53d8bc0f9b55b4e8eea0e17b68cfd1f07f34] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
git bisect bad a30f53d8bc0f9b55b4e8eea0e17b68cfd1f07f34
# good: [ef434f08b0562069cf431873a052692357d325a1] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
git bisect good ef434f08b0562069cf431873a052692357d325a1
# first bad commit: [a30f53d8bc0f9b55b4e8eea0e17b68cfd1f07f34] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
