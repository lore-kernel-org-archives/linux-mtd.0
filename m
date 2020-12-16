Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6194C4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 11:16:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BAE23124
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 11:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62BAE23124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GycUWF9I3Tr0yNt7NPAsTiJpwLPWB41/pt5xvAkarFY=; b=iyDDI5+altdygBDq0HNB/0OvT
	CHDpdQ4/pQQSfvsIMCnCNS/17LvtVqICIRGFZ3Dhrt7JRhOHXRZousKuOkoplJSZASymF/xQtpkgv
	QRV173fGlJWfmclEnJOigqAdzIawO+LAkl0Mxlcq5YuSph4hS+MV283CBIPxyZEvn1kUL/StKXRIY
	saBufNoSiNopF8UahFuub/WkEvGx2e2+iun0TbxfX3AkzJ4eXlXNh8WQK/whWPTy4I0eUY0Ks6XwW
	y4RgDNKv/ob3GxkwFiZLOSzIKQdRHD5HGomypkjOzHpf4TLc50agCaidYQeuC4ie7dvFdo7mihpLf
	8NgwceMvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUms-0002UO-W3; Wed, 16 Dec 2020 11:16:07 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUmo-0002TG-Ak
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 11:16:05 +0000
Received: by mail-io1-xd29.google.com with SMTP id y5so23551079iow.5
 for <linux-mtd@lists.infradead.org>; Wed, 16 Dec 2020 03:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjqtyaEXagR0cdMaIV8xobKWELgO4kFZkl7p1Qxs5wY=;
 b=mfwVEMGBbhA7vaP/3oy4bPd91C/hzsUoCAhd62/nf8VXNk4EFoVn1cdWAuE1WY1891
 +CtL3xRHQr0/VciLA56p7MGGRkI8UhFq4QdrMfrC/hQlTi7eQZVVLt+zxEEHmaxnUVxy
 Fskvuydy/PvcLY8rQfoU18zJtpZDJzqx1P+Eg5VzMHuxJH21rOITNaWxWyNjt0iqWOvY
 Sqpj9VhyrH+26DaelVNjgb2jvUTwCHR94/5ucc6MNC1m07/L5asRf8G85j6djKTjG1FD
 gWFsCB1jlP7170lpiEvsVyRXNkwtetRET0jMXPSjReQcKIn7pYJ6n/MTPfy/RqE6C20F
 qW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjqtyaEXagR0cdMaIV8xobKWELgO4kFZkl7p1Qxs5wY=;
 b=pMnYiXQYUjXgGJ95gKHEzMepODbl06lBX6U8Riu21iXpYX8v2vGCeohbHcjpn2vVuQ
 EzgLQjDy3X/pRLEnu+f2E2TNSlolOXQT6gC/NXbCWj6E2dtua4Z54j1Qms9HkmtYdLEM
 71vsY5zV8pdz/FOI+P8NpXNuhpUvJRTNP8ME6i9zBViC/a4x/x13Au/Aj8YC4OOIaJ1N
 jiaN719V3OgQ0zs+xMt6lTBArq2k26fXh9az2a9yotU20eNNDCS6onnkZ7dOHMcGAdFu
 EQBu89R+Fk0S/MDlnI//uh+YwU6djO0lfj+nSVj43YehWwY+yL0DV3QXp8TmqiosHXsO
 Sbuw==
X-Gm-Message-State: AOAM531SVZXlNi2YBToS1etXGzCLX4FH67uEOZH9VN5tWgkjzU3hJONc
 YcPa00VafNeF+eu5sLFojxQr/rR2h+qJDdtN7/s=
X-Google-Smtp-Source: ABdhPJzjwmBi8CGqCr2fDXk/QakcooFgPtXbkRTLXddqhtiu+AYtAAPMcpbRAJO9akMK1mG8pb7Bk89gz/CCFvmdVGY=
X-Received: by 2002:a02:90ca:: with SMTP id c10mr42866369jag.115.1608117358941; 
 Wed, 16 Dec 2020 03:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20201215214656.649896-1-bert@biot.com>
 <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
In-Reply-To: <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 16 Dec 2020 19:15:47 +0800
Message-ID: <CAJsYDVKysjbMYrpv52WcY4Vz=Zdrp69gUwHP=VQcUq_3KpzMhQ@mail.gmail.com>
Subject: Re: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch SoCs
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_061602_400476_9E64E39A 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 john.garry@huawei.com, open list <linux-kernel@vger.kernel.org>,
 vadivel.muruganx.ramuthevar@linux.intel.com, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 bert@biot.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Dec 16, 2020 at 4:30 PM <Tudor.Ambarus@microchip.com> wrote:
>
> On 12/15/20 11:46 PM, Bert Vermeulen wrote:
> > This driver supports the spiflash core in all RTL838x/RTL839x SoCs,
> > and likely some older models as well (RTL8196C).
> >
> Can we use SPIMEM and move this under drivers/spi/ instead?
>
> Cheers,
> ta

Just took a brief look at the code, and here's my current understanding
of this controller:
1. CS is controlled separately with SFCSR_CSB* bits
2. To write 1-4 bytes, set SFCSR_LEN* and write to SFDR
2. To read 1-4 bytes, set SFCSR_LEN* and read SFDR

If that's true, this is a generic half-duplex spi controller, and the driver
should register a spi_controller with set_cs and transfer_one
implemented.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
