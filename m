Return-Path: <SRS0=NuVS=VL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8E6C742D2
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 15:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41FEC20820
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jul 2019 15:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EuoudHiW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbTQ+Azt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41FEC20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOg+1gENwQh7i26NstgYVHCCyLik1tjea1QG1ovhdyM=; b=EuoudHiWVRDBqJ
	oVBVvtAwd2Y6FTHrT2LFjjJ9rSe0X7MHcwV0AkPYYHcTRkU9RSwICymDoaVJz5NxBZvwJPY4hUW83
	vbzBfwdeKmKFk/OUCWjAdZ0awUfs8XRYF6ZZKqnTXHLx0BzyDALTlzfZ5E29+l3MNOy0Yh7InB1nQ
	lDfLnvAO0tQv5lXiGoZuuzox1Cz7iGTrsNuN8wmzeUPPiVdr2WsNDbDKary4VkhNLdeC1GQ6w3dIR
	k1e1CpuFgMjSz27UU3Z2Ktzoby513/9uFuvyYenHpfEruvFXvS6hjJh58GbH2zps9eyDEaBdH18VM
	29O82JPX2zXa/uY5MmFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmgbo-0006Am-R1; Sun, 14 Jul 2019 15:40:16 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmgbk-0006AL-Jb
 for linux-mtd@lists.infradead.org; Sun, 14 Jul 2019 15:40:14 +0000
Received: by mail-io1-xd43.google.com with SMTP id m24so30374699ioo.2
 for <linux-mtd@lists.infradead.org>; Sun, 14 Jul 2019 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4bHQ1Jc5WTGlqwv+kn8JJgmRRoI96dt/IgZ72rjGBA=;
 b=EbTQ+Aztyq+1j51yJyaXlSrersnYBW/r0zoiVuDyu0dByJxIupmw500q+tV1XItn3f
 fGPvHEoox/Z2H3e03WWBHc79byethRqRi+k9uixTxTuO23jbUomxPKTd6GvYAtaiPQ/i
 BsMn4aPMKMHujUFkvPFJLSBEmaL9p1TQgxkZAySXVbi7K49mzgSmmLNPnEmwk6SQ5yEb
 RPT1qxMUSl+rvW9rcrl0PnK4LG/WCY1Agi8HMWmiSVUYe1jxwuT9MAvWrBkS6TR8+nnb
 Yt/QsX/b/hRkM9trNmZDyCSaOIFJGcWZzCLVA70oHtdzYR+04HE81/hQddh/Kfp2ap6x
 5wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4bHQ1Jc5WTGlqwv+kn8JJgmRRoI96dt/IgZ72rjGBA=;
 b=LJ74eTck8kjtUKfEVCYRByw0YmKLJOwwVXK4AO0UvUnRfdWsaSLohlCoO91XIso7j1
 kAiBwGCq3VVhobDWPXnOw5AlBhhic/79wIIMahPRllhg/qvudTN6ZOR5GWJ+x07bbewP
 ohUeX1JZ0GUrMRuQT34hL3+FikpimmwEO4e2Fjw/nbVGP2OnKZQ33dDgWJkoLAARBnKg
 IvR+w10XRva6zf3TNxJpcKeYxNPFMijj1no05r9jO1iyId1lFyTnJh/ZDzqdXnK9Jr+d
 /hsva6R2LHDZjM83XFt5lIXMVyiQfuF9DKbx8+RlTG4mJJNG6Jm98FT59Vx4vHS7Q1n3
 ZgXA==
X-Gm-Message-State: APjAAAUCKAyQ5gJin42V/PhHsXIq6ZlPSq4k+y/+hoAjKihneOeLn54x
 3MhW9KWqztAKYVZb1007ac1mc3mAaQaMhGF69g==
X-Google-Smtp-Source: APXvYqz5e0ZMsmxeq3BvuV3Veo7tfSZ2IU3WmhirYiJwumXbxG0Wrfs4Jq9gZf52yJ643RUwyL5TZQdr1Y9XVtHMokQ=
X-Received: by 2002:a02:b90e:: with SMTP id v14mr22926814jan.122.1563118811187; 
 Sun, 14 Jul 2019 08:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190702133444.444440-1-avifishman70@gmail.com>
In-Reply-To: <20190702133444.444440-1-avifishman70@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 14 Jul 2019 18:39:29 +0300
Message-ID: <CAKKbWA7ZLLp4nmcG+rFQbc=f5GWSThoghgF=B5CiunDczYAz3w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add Winbond w25q256jvm
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, 
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, 
 boris.brezillon@bootlin.com, robimarko@gmail.com, 
 Willis Chai <WillisC@supermicro.com.tw>,
 Jerry Wang <Jerry_Wang@supermicro.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190714_084012_673520_6F76F12F 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor, Boris & Tudor,

I see that you pushed this kind of commit of Winbond chip previously,
can you please approve also this?

On Tue, Jul 2, 2019 at 5:23 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Similar to w25q256 (besides not supporting QPI mode) but with different ID.
> The "JVM" suffix is in the datasheet.
> The datasheet indicates DUAL and QUAD are supported.
> https://www.winbond.com/resource-files/w25q256jv%20spi%20revi%2010232018%20plus.pdf
>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0c2ec1c21434..ccb217a24404 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2120,6 +2120,8 @@ static const struct flash_info spi_nor_ids[] = {
>         { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>         { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>         { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +       { "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                         SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>
> --
> 2.18.0
>


-- 
Regards,
Avi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
