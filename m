Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C016EC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADQoyzXQVcJkLWXL7oKbEvNU2VjhZ/o2LdWDKf9jAws=; b=d/M56OKYZrXnps
	AhLj6/ZL7SlHMrAfl7iz+ytXupV69CEJreSt7p7wwPg0pQ/xqorbJNP9yqvopyc/cFTX2sSzqBDh8
	JGsKbmn3wtlKK6D3HiP/GulgML5RthMAq4k4OnRrqKKMJZr5SgebFikSZGwe2zg+JkO0uJAdO8nWc
	aftJ17jxUOxTy3qCSpHHpHvYXlqI5KDz0Lp5tKDZLbgIiPuBdZ0sv4nV7k6Xin0IoRgjxz9n0kWCb
	3ecrSi+EkhliiJC6UrwkOON11jO0FMihPqJ66fk8j+tn+e7TFPxtp/1WOwOkFJ8WfPG8ubcyN4Pxa
	Mo/VrLUiDNW8K0IBdMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uL2-004jZe-2j;
	Tue, 28 Nov 2023 09:25:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7uKz-004jYa-2n
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 09:25:03 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5bd6ac9833fso3147375a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701163500; x=1701768300; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIvMM7mjQbdSWD76tI3zt2v2Np/Oon7r71veftvgKKI=;
        b=hU8eTVKtQJvvnSo5/enJ29q0Wk1wHIWcGY0goNBe9vKobomKgAJeMAzHTmd2/Wg+9j
         JOy6RrRv/ZAuHTZWmmTUE9TG8qZaUjS1c8VULGw0XFuJCXmuRVXjU4tWEgAQSVvX07Y1
         CM3/ryaaiHr5jbUma37OTtMv8Yih0eanAbp+5FVayGdsn2rDn4nheM8c9jnjCkfLNJ2c
         uWQBXWN/+JVAbxsO6o+ct1EjJKwD2xnCUYiQ15YArF7tahoZGq/sopZjbeRZCz8X90MO
         TerrJZLWYtnZiglEbo+G6D/P1MUesTwW7pAodrhD+E9RuzPL4CT9tyCE2FxxDRVv1xpE
         um6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163500; x=1701768300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIvMM7mjQbdSWD76tI3zt2v2Np/Oon7r71veftvgKKI=;
        b=Ek1CSMsb1nMOMoKGeKE7WZmJ4HgZf58wxO8tT/53ct3J1Jy2L2/MybQtZ6adnuzU6m
         V74RjJ4Ezm5ElxF8qNTlePBK76dChvjuz92oFRLnugrD5KMIw4PrrQxjDKo1brC5DisL
         00AV6Z8WcphhVcBhHlqLTVv/Fcc2aydTZ3fCOq809v6I/nlKFQR6yUTW4XdOWtqNXot6
         q1n/aMuGIH48Aoi0Lx9R9JV6rp2vxahDwdaoM3WKMKNb15pspMikrlnl2bxML3aQ6Gy4
         2AIFXS9dsYCkEFC839Hn57BB1fWVqOo6qemCHVI0IAvFTSvZxtvaqTtKxyPrvM/rKbb4
         EQ9w==
X-Gm-Message-State: AOJu0Yxn7DcQArqqV5zWMxzAvQlR2Ikgj3ShK6vRXAeCEEChpKakOwOs
	oRzFT2bIoF/rfC5p2u7vC/xnd458bSR1GaHlRsY=
X-Google-Smtp-Source: AGHT+IEGq36rOUe7b5le7iMjD2HJ/EEhduxdASKLlAWaV1gEw0963o6fSX8ebv1LJqnqSJoaTn1uwuCDLGAFBCokBtI=
X-Received: by 2002:a05:6a20:258b:b0:18c:64e0:447b with SMTP id
 k11-20020a056a20258b00b0018c64e0447bmr10422700pzd.28.1701163499911; Tue, 28
 Nov 2023 01:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20231127165908.1734951-1-tudor.ambarus@linaro.org>
 <42c96d63d1ea4f7e8f16a3c8eb0a4cf1@walle.cc> <20231128100313.3c990f69@xps-13> <18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
In-Reply-To: <18ba4126dbd9e49846344b517ad2fbdd@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 28 Nov 2023 17:24:42 +0800
Message-ID: <CAAQoYR=ZAEVeoCwkRmky2CHVeKGX55JijM8Q6D5msz_5iW+jtw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: stop printing superfluous debug info
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	jaimeliao@mxic.com.tw, pratyush@kernel.org, richard@nod.at, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_012501_908319_AEE0526C 
X-CRM114-Status: GOOD (  30.58  )
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

Hi


>
> Hi,
>
> >> > The mtd data can be obtain with the mtd ioctls and the SPI NOR
> >> > flash name can be determined interrogating the sysfs entries.
> >> > Stop polluting the kernel log.
> >> >
> >> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> >
> >> > ---
> >> >  drivers/mtd/spi-nor/core.c | 19 -------------------
> >> >  1 file changed, 19 deletions(-)
> >> >
> >> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> > index 25a64c65717d..6de76fd009d1 100644
> >> > --- a/drivers/mtd/spi-nor/core.c
> >> > +++ b/drivers/mtd/spi-nor/core.c
> >> > @@ -3517,25 +3517,6 @@ int spi_nor_scan(struct spi_nor *nor, const char > *name,
> >> >    /* No mtd_info fields should be used up to this point. */
> >> >    spi_nor_set_mtd_info(nor);
> >> >
> >> > -  dev_info(dev, "%s (%lld Kbytes)\n", info->name,
> >> > -                  (long long)mtd->size >> 10);
> >>
> >> I'd lower this to dev_dbg() and print the jedec id. It might come in
> >> handy for a quick glance during bootup if debug is enabled.
> >
> > Ack. Although, your boot time will almost be unaffected if you don't
> > print the info messages to the console. What takes the most time is not
> > writing to the kernel buffer, it's to display the lines on a serial
> > console, and dev_info() are by default discarded, you need to select a
> > lower log level manually, and if you do that it means you're not
> > looking for quick boot times but rather more for additional
> > information.
>
> Also with recent (or planned, dunno the current state) printk won't wait
> anymore for the slowest console. I really don't have a strong opinion,
> either dev_info(jedec_id) or dev_dbg(jedec_id). Whatever Tudor prefers.
>
> >> > -  dev_dbg(dev,
> >> > -          "mtd .name = %s, .size = 0x%llx (%lldMiB), "
> >> > -          ".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
> >> > -          mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
> >> > -          mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
> >> > -
> >> > -  if (mtd->numeraseregions)
> >> > -          for (i = 0; i < mtd->numeraseregions; i++)
> >> > -                  dev_dbg(dev,
> >> > -                          "mtd.eraseregions[%d] = { .offset = 0x%llx, "
> >> > -                          ".erasesize = 0x%.8x (%uKiB), "
> >> > -                          ".numblocks = %d }\n",
> >> > -                          i, (long long)mtd->eraseregions[i].offset,
> >> > -                          mtd->eraseregions[i].erasesize,
> >> > -                          mtd->eraseregions[i].erasesize / 1024,
> >> > -                          mtd->eraseregions[i].numblocks);
> >> >    return 0;
> >>
> >> Part of this is already available through the spi-nor debugfs,
> >> although not
> >> the actual mtd properties. These I think, should go into the mtdcore
> >> itself if really needed. Either through dev_dbg() or debugfs.
> >
> > Maybe we don't need this at all, as long as one message remains about
> > the JEDEC ID, but keep in mind that spi-nors are commonly storing the
> > rootfs and if your spi-nor does not boot you don't have a userspace yet
> > and all the debugfs entries are purely useless.
>
> Good point.
>
> Just curious, do you know any boards which has the rootfs writable on
> the spi-nor flash?
I am also interested.

>
> -michael
>

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
