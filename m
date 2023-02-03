Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3369C05027
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSuhDoE9ADkl3fqyE0pbtEC3oo8xxCpJFeX+9pen/tQ=; b=XkhmHxmoq6s/LW
	jXGsY2QwJaU7rySLMtHoXj52SzapWm750843jGEvkgZ8dlwEBugVAj5aKR9dkcHrmVvTnrQuouv4O
	zs4HbCAqbZIMWGEKKlEbyA5iWBS/qr4DY7FSmYNHGHSIwvrnzmWk6Ssh4ZtoPb/hUO3iNwQrS/RLN
	r0o/904mJK1Zbj1VOGNpV/QKeGB2wamJBmoJiox4gJJNQLgteXKbf3n/O72tlwLuyzm1S5LTXinHO
	r41NzoTqgsiEvFfXtqheLh7huKeiHyL8FF/ILUXY3TbE6gK4pIBazvgMSY+i1sarxT8LArwWFMbNb
	HVx5MPX/zUBMsxWm92XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwur-002MHe-3M; Fri, 03 Feb 2023 14:19:49 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwVx-002Anw-7b
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 13:54:06 +0000
Received: by mail-qt1-f182.google.com with SMTP id v17so5455261qto.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 05:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbKgXRRhHOsf8b2qFYqubarXiD/2JOI3CXyxQSetlOo=;
        b=6idY8HGmBfPLnDpesRt4Ig+zEf0ffCwHZDOvirBV6G+n1EBPMXwQV2t6WCtLw2iuOE
         ReXZGFH+dK6GcmHYyFEJVopXTZVR+fvdPZllEeKG5SYWUKf2yrf5Vt9x8YBaNcejw2XZ
         iMptQLQBf2jO6QchDkX2DA4ysA85CVPvHt7qrnuGpzmH7BAzh0+Dr9pJwBed686eQAus
         2ZpsfVwgXLuNPM+OMfoPgt0Z6pdyTMW/Lf7Swsq9LSxoEjdSbRP75fvDa5gUqqNqOFOL
         goMTesvXiL9oBqTBrEUwYk9vo94glyNiYrwo+zr9lSzZBDEf8qo/g/7IePGV6piUg/1X
         PgBQ==
X-Gm-Message-State: AO0yUKVA/qePKeyXP5igea9J4NbsST/uS+LLHbrMEg0vvjzyv3vdf2Qn
	cbjPsG96t+72bLyjNh9vXrOAt+qlQSUb8w==
X-Google-Smtp-Source: AK7set+C5S+LP99hRHv/S1zyRgWmQRMW6xKk3In4FdpxIdwvpGAxDOaUdo+4BHHxkx+5g7TUM2kg5A==
X-Received: by 2002:ac8:5e4f:0:b0:3b9:a4c4:ca09 with SMTP id i15-20020ac85e4f000000b003b9a4c4ca09mr20268633qtx.10.1675432441083;
        Fri, 03 Feb 2023 05:54:01 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id d23-20020ac800d7000000b003b8238114d9sm1597319qtg.12.2023.02.03.05.54.00
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 05:54:00 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-526f0b3d8d9so3018537b3.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 05:54:00 -0800 (PST)
X-Received: by 2002:a0d:c2c4:0:b0:514:a90f:10ea with SMTP id
 e187-20020a0dc2c4000000b00514a90f10eamr1025067ywd.316.1675432440139; Fri, 03
 Feb 2023 05:54:00 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com> <20230203071506.GB24833@lst.de> <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
In-Reply-To: <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 14:53:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Message-ID: <CAMuHMdVi1DPqYNbB5xWeG+1kK4x=8zQ0y57WSJ_j2xENCjQREQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christoph Hellwig <hch@lst.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_055405_309026_BDFEA52D 
X-CRM114-Status: GOOD (  21.72  )
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

Hi Laurent,

On Fri, Feb 3, 2023 at 2:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Feb 03, 2023 at 08:15:06AM +0100, Christoph Hellwig wrote:
> > So given that the big series doesn't go in, can we get this removal
> > picked up through the drm tree?
>
> Geert has a board with an ARM-based SoC compatible with this driver, and
> he expressed interest in taking over maintainership. Geert, could you
> share your plans ? Should the shmobile_drm driver be dropped now, or
> will you revive it in a relatively near future ?

(Trying to) get it working on that board is on my list...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
