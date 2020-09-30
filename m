Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D7EC4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:21:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1CC720709
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHJW2XgD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRrQFA9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1CC720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BR1yv7yJAuUzB0z4A+esq9SCMHA1WJ0BZj4fPSONk+I=; b=EHJW2XgD0gnXFyDu4yZhdLhgB
	kAsCq4Ggr4GEKuYT5nJIJm3nL5vjSS3RH2utbQacGFtdy9IutO4dn5UzwP11P783ByzzDs8qUX9DA
	D2PncT0McOTeKEXQ0diX/WPsmPR/+4n1AyXMJ8/XNyjX8YEfixgyciG2QycYzi41zhhAvam6+ncVl
	JM7nKVgi00sd94Fm2XB2ilY2TUnO3TZQCKMUc2e4vCEfqZMgR7GGPiJsLcxCb2DxiksUU4dQeT7Jb
	7cpao5TJczgoAWFG74b2L8Lh1M4toKrS4pL4x5/+DwxshVNN9Lmduz9ZcT6Ps3JXEdSDuATB4xINY
	X+j2nMCrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNcxX-000540-FN; Wed, 30 Sep 2020 14:19:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNcxU-00053L-8b
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 14:19:53 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37C0420709;
 Wed, 30 Sep 2020 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601475591;
 bh=KjqhkMSmQAqGdUf+wARySt2Y47P2sRmybBHUt8C1SO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MRrQFA9kz/xosasjCQE397D5Hia5cxV80cYVfpQobLN8R3vDQov5nLcE2Wtrwv2SN
 GHZj9f2HwdgGTsaodEXxIJvwKLpaYqlZkSBsf9QFZYMPFU67uu4O5L3cJDqr5flcfH
 4hV9YUN83JrrE7eAnkfy0w2QP1U0C2tEfIVtG+es=
Date: Wed, 30 Sep 2020 16:19:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH 0/2] Platform integrity information in sysfs (version 9)
Message-ID: <20200930141954.GC1654628@kroah.com>
References: <20200930135101.5424-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930135101.5424-1-daniel.gutson@eclypsium.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_101952_376452_0803E937 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 10:51:01AM -0300, Daniel Gutson wrote:
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

You sent 2 patches with the identical subject line, yet they do
different things, you migth want to fix that...

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
