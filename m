Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F4FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 15:22:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8702086A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 15:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UwIplMst"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8702086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AEty7BmFQ/bANcAJEtEyh9g7iPHNQbP2Vmxq6/Vnt8w=; b=UwIplMstR6JcqaaIfGbEEmOlO
	ygpNn1WPrDTUWw3cNaSbSpzaqor0rM+g5V0dApvVMxvkRyKE1fZO9XSrJbn3eMMlxlamBBP8PyIn+
	31iGuXmRZSSCC8yeg0yAMv1gVZQcmlel2cvhR3X3Esx8OQghXz0VROkRQd7dcDOyG0x9Saovgp76F
	+vSSgW16OZlXsXt2wMl6WAgeqkGP7KqxYyCWe2BzYNC2JtXAVvJZS3FVv94ywVfQXEf6wa1vgrFyH
	y7nZHrZdHv6oEdrAQOaiBO5zhDlWtDwyOUmqD68XsS2Xo/F3kztOD5/9Xue68JqGnk6xsciEBXWsI
	/SW+eX9XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yl5-0005kc-R1; Tue, 04 Aug 2020 15:21:43 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yl2-0005jc-II
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 15:21:41 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N6KML-1kmuSO3wXh-016cV9 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug
 2020 17:21:30 +0200
Received: by mail-qk1-f176.google.com with SMTP id m7so6563392qki.12
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 08:21:28 -0700 (PDT)
X-Gm-Message-State: AOAM531ur5yyF7KWVsCcOG+WhAiLAkNR0fntVe1Zi3tzdBQj/qm5PpGB
 EXPC4dqD58m0jKtA5Eak+sLJxs8O2eDkWWJDHcA=
X-Google-Smtp-Source: ABdhPJyqR0JKD5WDdjJqXHl8+I3VYl4t/sxpgkVHxu1mBIUS/nvjYG2flIcP3gNxVNV1hEKxNSOlftY4i52/6nHhByE=
X-Received: by 2002:a37:b942:: with SMTP id j63mr21276071qkf.138.1596554487389; 
 Tue, 04 Aug 2020 08:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
In-Reply-To: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 Aug 2020 17:21:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
Message-ID: <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Daniel Gutson <daniel.gutson@eclypsium.com>
X-Provags-ID: V03:K1:ttJ7XkLjPqt+6cs0bBW+Lc/J4eGIO7pgPcXbhsvvn4Fte+cXBrG
 FAUbxUcT+UoeFlt+JXbapVtPBOUtNkzv3ze9FtbNcBDg7s4DfZoVtwkTWQKsnU2OahhF6NE
 lKwuZS5qVxsvUBsKRZnHevNSlcRgXBH5lt8poZYAXR23aHSpWjd5lGh8X+JbDVjxS/4o9Hw
 rYDP+QrsQKob4qbGb9+ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6+hnEZ8GkSA=:xkQlo2/tjdNwZXDQFis4mJ
 jf5Ai0YT2pCuV1U0U+ycUU53zFDJBsqVHFBxU8h/plcqgpxjk12FqK1oa0IXgJwUYQuEslsB7
 /rSK+ziViBl4dUt54cR2GnXPG5T/AXPYzQvtolueWqC8IjIdtR8PfY9yjnGyZqQ2e2NEENXeX
 8WX/4LcV+9lv9dati7bzYFYHI+6FiYS/KizZhxPyxYrP5ya805TMiopqsrGB5HoXCXvdLHyvO
 gRGs0F0+y7Q6ZK1aXxtttNXxeJ3hVphOIKflbp2y3fLEoNsvhWtAJuEW7PO3pMD2aTNiYjpPY
 yMO9W3PuN6vgfwGSVy+F+v4Q+rKRKez2nHbGVFD1PkJtz2PD7cucX/zL9huEpjxxUtcZmKKgz
 H/kDAyrgXM1i4+4mbNoYxzOBRSLSurhfXzq0m4WIB2QUpI52W7WgDVAGErJwuITHgm3ZxLDgK
 pr2cHVpAFwVrCupuFpouvyLEIDmVZvkO4hYmfTYcAD/d6fwviB/ieb6SbSznD/+blzKfFlWSD
 fTC5YoFomTooNpNgsL/L6vts9h3f9yQUHnGEHK2HrisH8OEqF5WlADICfBfG39HDe6TordZ7H
 /4ttx/BYq6UwXWoSLwm7UrNrOhSaCO/nvxvCNe91qKgfh/3GXbNh5WrMwOVp62bVzHmMPWDUB
 ALv8PyHk0srTKik7UCIIl9ggJ6C0BJcG26dHsjtovH1q+lxtI4kXNq7MJJyhcRXDICSiSWjr2
 HnbYjbj9DYUwGJpcIl+DheSyzUtj2MzLaWhN9I4QJp0TfvrJk3SwU/tyYg9tk73MJKfJzlFsg
 c4LjeSiCDYskmow1UfBXqIAd23CrLx+aWauMxMpT6gGUnSMuupL/XbYJzhJcR2VByYCEgt5VL
 KSFrI3wyujUXrQWZPTyXwzShFtqmIus11fm9N7buHQxcJ47tqTV+9U1NQfoG2Sfo7oTQwoo0d
 HKObfmAYB1QRL1QggoNzcPjg+Hi06qtAtHNnlqHshwZKYFkRo8jN1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_112140_820324_881A8F30 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
<daniel.gutson@eclypsium.com> wrote:
>
> Context, the intel-spi has a module argument that controls
> whether the driver attempts to turn the SPI flash chip writeable.
> The default value is FALSE (don't try to make it writeable).
> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.

This is still factually incorrect, as explained at least three times
now.

Please either make the same change for both the Bay Trail
platform driver and the PCI driver, or explain why you want them to
be different rather than incorrectly claiming that you change them to
be the same.

If you want the BIOS setting to always take precedence over the
module argument, logical change would be to also include
the corresponding change for bay trail and do:

--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -324,19 +324,6 @@ static int intel_spi_init(struct intel_spi *ispi)
                ispi->nregions = BYT_FREG_NUM;
                ispi->pr_num = BYT_PR_NUM;
                ispi->swseq_reg = true;
-
-               if (writeable) {
-                       /* Disable write protection */
-                       val = readl(ispi->base + BYT_BCR);
-                       if (!(val & BYT_BCR_WPD)) {
-                               val |= BYT_BCR_WPD;
-                               writel(val, ispi->base + BYT_BCR);
-                               val = readl(ispi->base + BYT_BCR);
-                       }
-
-                       ispi->writeable = !!(val & BYT_BCR_WPD);
-               }
-
                break;

        case INTEL_SPI_LPT:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
