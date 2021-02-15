Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F98C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 10:52:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2403764E34
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 10:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2403764E34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ag2txpw2SE56I/xr7QaRGKncxs8PVX8pXdbK38NzvpU=; b=1/LG92GQjY0M7aGIPcmb2REIj
	3F82KS1S8nFAh6/kXt8hxPkhkzdsGw/FDBAFA6VTtFk15qUmLciu/IsWHe74EoiP2CO7e6lKOYvHW
	l460zmXgHB38fwEyowCI68Ad9d2VsGmedL1Qp+Ex8OVdzC1HhD8aPwz+9PuFjT3TnsVCdcDtRJH18
	CvHFMOtVqt2KJtixUGQanfHGQyy62rD6kT6cuTpfBGPB9JRNsd3HD9fWQOCh6DmrIk4G0vqerS5XT
	h2YcJIITJfADUyonKF0JeP8qpsIcI4L73BARaDrU5BBJNR7IE2EHynXZsjfo3DX4X0UIAtQALBgH5
	mhPXnA6mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBbUF-0007eX-RO; Mon, 15 Feb 2021 10:52:15 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBbUA-0007dp-8G
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 10:52:13 +0000
Received: by mail-qt1-x830.google.com with SMTP id e15so4512347qte.9
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCasf8LNJD3cpLAIKwcnQnDK/FG08P6hSVCIDrM0RYw=;
 b=bR3APCUVPyfLWINvrsY4rBV0tJPJ2vJxl2MMA4PfaJ9+ToWe+gmABk6gZvl30hLPiT
 Q34qAj8AovuCyXI6WNPkM8emBbiL1eVMqTYKLakHTfx7Z2S/QZ6QhkbLxpeiX3plotSj
 2RvernIzAgYaTwhQ2V1J8vPJl8dDd8BV/yiak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCasf8LNJD3cpLAIKwcnQnDK/FG08P6hSVCIDrM0RYw=;
 b=EoRtUNW6TNelPgOpioYxFGzrr3+0JXInuqCFZcyZsG7+kvG7Az70U7iFLmFtz6jMMn
 gAfMt4Uq1HAvzKmYg8ZNqRvvX1ZAiYf/PAiGywW1qB3UpbPuLOajZXBzS/BMe9waftJQ
 iI8u4Z5vBj/0oz7UUrmp3WLC2RYSq0Zt2F+ywu6W0JoxSHc6rtZG/h/plD/CjVfkQL2H
 MioMgPDffBw+LQ75L5fJy/yhFfDur0+Lsdr7BvzxG9TVzYcyPHZnIYYZa7rUvNDSQH9B
 Fs92kYr39SjmruI36Pyx09oZ0LK7J22YBwyOKPSonz0ZbeSXizw4rTyGo4YRvE5IM2Pz
 9ahQ==
X-Gm-Message-State: AOAM531Z/oP0nZFxLxwE4wbeQDCiha6g897z0P+aeMpsyXg+Fd0v8WxF
 7CeKVsBseYQd4MhXP3rU/3K+xOlwiMPPWBJl3PFgGg==
X-Google-Smtp-Source: ABdhPJxBW6NjQrjDEqO6MyiBnClPreVbGfoQc5q2VUQgBvJ8XJWDhokzI83V1C9hl0pmFiDPDXNm4SEGE/ZEEXaT0bU=
X-Received: by 2002:ac8:5dc8:: with SMTP id e8mr13664866qtx.249.1613386325969; 
 Mon, 15 Feb 2021 02:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
In-Reply-To: <20210215112409.1a755bf0@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 15 Feb 2021 19:53:13 +0900
Message-ID: <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_055210_489960_08A5D195 
X-CRM114-Status: GOOD (  29.20  )
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
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Mon, 15 Feb 2021 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Can you please add a changelog here when you send a new version of a
> patch?

Sorry, I was going to add a cover letter but elsewhere got told that
one isn't needed for a single patch..

Basically I changed FS35ND01G to FS35ND01G-S1Y2 as that's the proper
part number for the chip I have and there seem to be a few variations
of this.
Aside from that I fixed up the hex numbers to be uppercase and added
the oob layout callbacks.

> > +static int fs35nd01g_s1y2_ooblayout_free(struct mtd_info *mtd, int section,
> > +                                 struct mtd_oob_region *region)
> > +{
> > +     if (section > 3)
> > +             return -ERANGE;
> > +
> > +     /*
> > +      * No ECC data is stored in the accessible OOB so the full 16 bytes
> > +      * of each spare region is available to the user. Apparently also
> > +      * covered by the internal ECC.
>
> How is this even possible? ECC must be stored somewhere, maybe it is
> not possible to retrieve it but I guess you cannot use the 32 bytes of
> OOB for user data. Can you please verify that?

This worried me too as I could not find the OOB layout anywhere.
They simply list there being 4 512 byte main areas and then 4 16 byte
spare areas. The only other note is that the first byte of spare0 is
used for the bad block marker.

I contacted Longsys but they didn't get back to me.
So what I did here was I started googling strings within the datasheet
to find other chips that are probably the same IP inside and I found
the FM25G01.
It's datasheet shares a lot of the same text and the flash layout
diagrams etc are the same.
It has the same table for the flash layout. 4 512 byte areas and 4 16
byte spare areas. It has the same note for the bad block marker and
then one additional note:

"2. Spare area 800H to 83FH is all available for user.
 ECC parity codes are programmed in
additional space and not user accessible."

It would seem that the pages are actually bigger than 2K + 64 or there
is some other place they keep the ECC.
Or both datasheets are lying. Somewhere else in the datasheets it says
that writes to the ECC area will be ignored but that doesn't make a
lot of sense if the ECC area isn't user accessible in the first place.

I didn't think about it at the time but I can take a dump of the OOB
area of my FS35ND01G-S1Y2 to confirm it's all 0xff except for any
factory marked bad blocks.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
