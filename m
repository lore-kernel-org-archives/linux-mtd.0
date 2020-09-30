Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FFFC4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:43:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45FF20759
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9US2Jl4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="R6nUSnBm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45FF20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L288J9lDvQ3DxE5Wa26RuwO9bgdyGdPqxG4AWHYBwtw=; b=M9US2Jl4jpiBZK7W74DsQ4AN3g
	yKuNSuBJCMxA4bJY7H6H+dh9L4P7bAwMtEdXf6+C6Phb7fc6aLO+DthBYzRewyC1uwYQmOrMfPzgG
	aQoAirNtFIm1iSkdbU9/kkKY+LPf8/AuXLnkCRaagXTjewWLnmuIMn75bN4bqJLC07k26toNcKvqd
	/lWRtonPZ1LWnvJWAOQPUMOTbJPocvf8hrYEOy3uliBKpoYuDse3UZkAPpNrld5VUn4YkRZ1HSkQS
	b/NLV1aiDyplKbeKM9eSvwuu+ADbeORMu8FkSOlDW2clqvtt+2QEYivKtImJ8vY8iaTouB0ENEA2D
	Hy1dXEAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNfBs-0001p7-6e; Wed, 30 Sep 2020 16:42:52 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNfBp-0001nK-S0
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 16:42:50 +0000
Received: by mail-qt1-x842.google.com with SMTP id e7so1701065qtj.11
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lVLDUENS5HtvTi16CbvdwsaqFFfIVLSej05+iUQc+vs=;
 b=R6nUSnBm+5YV02WI9vt2g2rJwl9S/gQZByWVGatI7kdjLOVsZ1p1BEG09Z6FbbT0vy
 YIafd35emRgBE3TjkG7eTu6QtQSuPkK4WjhaMcLOkb9xt2/Lk+j8ZQAn/kcQmjwJcCmE
 NnzEsP89x6Gt/O0UsmJG3Bt1K9P360ATyxJ7D5kFxGJtWXA2SXSsoga1UQL7ptNABX2I
 rNJn+YsPgr6YYBuIfDXQ6FqxgKAOjdmWQLQflvMu3N2N8lGO628lG0HaYfFR+gMmGA2h
 i/HWNkEok+iMCaEpi4ubdQezKBdITZ1eoAX3wJaYX5ZsXoolumzUS1uKVJylTQ/9rMOb
 ctSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lVLDUENS5HtvTi16CbvdwsaqFFfIVLSej05+iUQc+vs=;
 b=uZlN0zaukn+AZyLNfHKUyLENJDnTmVPsL1+r/+UIJ5rZFTpUYyp+caCcOl43gZfTPg
 oJPWd3sWtfnlmLx58PAU3LSasVjz79VHWAc4C/WOfzK2Mdb5hzJtjWZ8zWM6RSbd9enV
 RjcJPC8gsRa2jxlEKaww1JT0VX8VADTX/5JKsBOC5xWjJJCDOz9YBXHFpl4HMhRR21zb
 GxtpFsTKPzUXwfQT2WkL2h4i98YQKJ/uSUcMXS8Gn8emkdvu+3vUP3BF6Tasp/rbTrY/
 K+M5y0m58nZxRaV3vJTQlXhEN4LnKOcFUVWajds94sA9r6f6DjFfxM/uO0jU1KeLd2sf
 sKSQ==
X-Gm-Message-State: AOAM530oGM4ciIDFc2bOWJYXV3nZvx5QhN/AG0VHzMQYM5rVXNAntiTA
 EcegSBmYx4tfb96Z2e0VPK2ckareI7LKGFJyIfwI3Q==
X-Google-Smtp-Source: ABdhPJyorcExL69VYti3el7jIkzZYoeUTzQ7ALybF4p/zwGl4AYpWHyCDapPdbeehWSDBPdirAkUuLaLCjgFWyDmY1g=
X-Received: by 2002:aed:3584:: with SMTP id c4mr3059581qte.84.1601484168220;
 Wed, 30 Sep 2020 09:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
In-Reply-To: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Wed, 30 Sep 2020 13:42:37 -0300
Message-ID: <CAFmMkTFGRM4KdV70ATu4hhk61cJ76kztvt0fww7JKcpxt_JGZQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Platform integrity information in sysfs (version 9)
To: Daniel Gutson <daniel.gutson@eclypsium.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Richard Hughes <hughsient@gmail.com>, Alex Bazhaniuk <alex@eclypsium.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_124250_002496_2006D657 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sorry, I forgot to restore
Tested-by: Richard Hughes <richard@hughsie.com>
which I removed for experimenting purposes with git-send-email.

On Wed, Sep 30, 2020 at 1:37 PM Daniel Gutson
<daniel.gutson@eclypsium.com> wrote:
>
> This patch serie adds a misc kernel module and extends the intel-spi drivers
> to publish platform integrity data in the sys-fs.
> Please check the comments in the following patches of this serie for further
> details.
>
> Daniel Gutson (2):
>   Platform integrity information in sysfs (version 9)
>   This patch exports the BIOS Write Enable (bioswe), BIOS Lock Enable
>     (biosle), and the SMM BIOS Write Protect (SMM_BIOSWP) fields of the
>     BIOS Control register using the platform-integrity misc kernel
>     module. The idea is to keep adding more flags, not only from the BC
>     but also from other registers in following versions.
>
>  .../ABI/stable/sysfs-class-platform-integrity | 23 +++++
>  MAINTAINERS                                   |  7 ++
>  drivers/misc/Kconfig                          | 11 +++
>  drivers/misc/Makefile                         |  1 +
>  drivers/misc/platform-integrity.c             | 57 ++++++++++++
>  drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
>  .../mtd/spi-nor/controllers/intel-spi-pci.c   | 75 +++++++++++++++-
>  .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
>  drivers/mtd/spi-nor/controllers/intel-spi.c   | 90 ++++++++++++++++++-
>  drivers/mtd/spi-nor/controllers/intel-spi.h   |  9 +-
>  include/linux/platform-integrity.h            | 19 ++++
>  11 files changed, 288 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-class-platform-integrity
>  create mode 100644 drivers/misc/platform-integrity.c
>  create mode 100644 include/linux/platform-integrity.h
>
> --
> 2.25.1



-- 


Daniel Gutson
Engineering Director
Eclypsium, Inc.


Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
