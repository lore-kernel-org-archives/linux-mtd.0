Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE255C10F29
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 09:16:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C543820848
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 09:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3RkS+1Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYzKh2vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C543820848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pojq0J5KXdT1qMXnjQMMdmJtZpx0IuprrDInpBC1pv0=; b=Y3RkS+1YtjyO3j
	WuoXVUFO5Bf6Dc4IFKo4jVjOl5wBQ5DiM16FYvWo+XxFxlWWPTTAJIWL0ZaWk2RTSst+Gfp1M0Qix
	bmA7GgeSeggVKOMJMjNtIoh6ZiZcB8/Q0pnwBmtpBRIGKFGavebLofyHG7Eqh9BRrJrF0a6zbEqs8
	m5qLrrUb6fp/9Rru0EIhbkftpM/MLfhgIWjP3Fv0nK9pFpcLYsyMrr1RJfjG2xEnhwDrN7rmKWSrt
	ky1LvJ0j6cPdtQS3hK+a3jQ3jY2E2GjMaRgJtapQPOKP/21Ce5yHuzPKw+fXiNjfVcdbvq+E1A/op
	110n1DiSu8uCRBoVpoIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBxT0-0002GE-DR; Wed, 11 Mar 2020 09:15:54 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBxSw-0002FN-RF; Wed, 11 Mar 2020 09:15:52 +0000
Received: by mail-ot1-x343.google.com with SMTP id a9so1182506otl.6;
 Wed, 11 Mar 2020 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rg5doAsxx0kDjXaq8rnpBM3DNdZiB/RASH0KhpWMeD8=;
 b=AYzKh2vvwNCxLc3OMbxf8iKz3E05gHb1UaSIkycR5Y9i3RMr4JeYG3WrTgDOlAVdVR
 vJ/uy1d66aLqcGSIMvXocK7wYYI4Da4l7qj90C5Cx/Ph18fHl5XSe7aOXL7hgk8XyDJS
 //bx91P1SSQwDPIJ/TW8tClAssVikIqKIvFMKzUrDZ+D/tOd7hf7X4IXc6EN7Qp+wcaB
 zVKNFKNT7q+S4rKZCvwyM/76yj6LyYPhVN2n+r0cuYrqVbbSmB0YG+46lWGVbsRmBEs7
 CItapMLynuNfzG6Zq3ZlWPEOTx21pzAGkuUDXJf7N4V/zkB/0cm7Li700f6icO1AX3+i
 6Omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rg5doAsxx0kDjXaq8rnpBM3DNdZiB/RASH0KhpWMeD8=;
 b=W6rOypIcc3vgSXQ3i0c2itHDkvWhXdkNTaIO5vMmXg6hnEPEFeMT9HDol89Kw5IHKz
 83frb3UwtBhfVxiGBU2FRwm+Gcl956aaxxSBF4P81toS1phq9VSBOruuDA/pjSJiQfPb
 14uaycMFpOY48wrCaeIzoF77jH89lpx2DNQWkr9Qt2Siq3DnxMroH0I/Th8zbIZGQ4U/
 zeDQIc+wOs5HTrmwo6Ytv1O8ZnXkhFmkEXAI58lnCWiQwjkFuHX0AejQyL0WqrtGIGZp
 wLyTsN+zeyx1hTbimZFHGEizmn+LfpVKPHMbarUncPEA+9HbpprvLAz2YFh9t0si7dAa
 L1fg==
X-Gm-Message-State: ANhLgQ1QnwPqAV4DBKQSE15Vkgh6z8uk254faSSQZcJ1gNSs3IzhOqX9
 N+KEAFkG/NxTmIiwQviTbXa8KdgGmvLCOQHun+Q=
X-Google-Smtp-Source: ADFU+vu9qkU+R6sJ+nc8rfdSo1TQ+UrQP1U91Y+mxOsqDCA6ehChCNtCGfDG5L00aXQdYZLb2TD7rC+bsX4mw4WaPRI=
X-Received: by 2002:a9d:6655:: with SMTP id q21mr1506463otm.70.1583918149864; 
 Wed, 11 Mar 2020 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <1536716612-24610-1-git-send-email-xiangsheng.hou@mediatek.com>
 <1536716612-24610-4-git-send-email-xiangsheng.hou@mediatek.com>
 <20181023075247.004982c9@bbrezillon> <1540532796.24602.11.camel@mhfsdcap03>
 <20181026080833.2fedbd94@bbrezillon>
 <CAJsYDV+dAikBZ4gg_3u7z_jgV2ZehhyWyRQ709dNQV0XdDOUbQ@mail.gmail.com>
 <CAJsYDV+ACknTVAhVJ-R-8p7H0B3XdP9nnrRZ+erJ=vbqt_VeKw@mail.gmail.com>
 <20200311091813.41b55a97@collabora.com>
In-Reply-To: <20200311091813.41b55a97@collabora.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 11 Mar 2020 17:15:38 +0800
Message-ID: <CAJsYDVJeZGpz6K2w1JuBVXM+zdFca9qp3+=PERTE2avehw6LXg@mail.gmail.com>
Subject: Re: [PATCH 3/3] spi: spi-mem: MediaTek: Add SPI NAND Flash interface
 driver for MediaTek MT7622
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_021550_909566_8429D8D7 
X-CRM114-Status: GOOD (  35.79  )
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
Cc: ryder.lee@mediatek.com, Boris Brezillon <bbrezillon@kernel.org>,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?QmF5aSBDaGVuZyAo56iL5YWr5oSPKQ==?= <bayi.cheng@mediatek.com>,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?= <benliang.zhao@mediatek.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Mar 11, 2020 at 4:18 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> +Miquel who worked on the ECC engine abstraction [3] recently.
>
> Hello Chuanhong,
>
> On Wed, 11 Mar 2020 15:35:43 +0800
> Chuanhong Guo <gch981213@gmail.com> wrote:
>
> > Hi Boris!
> >
> > [resend to you because of the wrong mail address in previous one.]
> >
> > I'm about to pick this driver up and start upstream it in the future.
> > So I'm answering
> > your questions below and would like to get your further suggestions.
> >
> > On Fri, Oct 26, 2018 at 2:09 PM Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> > > > > There's a fundamental issue with this driver: spi-mem was designed to be
> > > > > memory agnostic, and you seem to have a SPI controller that supports
> > > > > only SPI NANDs. Is that correct, or is it just that you developed the
> > > > > driver with SPI NANDs in  mind?
> > > > >
> > > > Yes, this driver supports only SPI NANDs.
> > > > Actually, Mediatek's controller is designed for NAND specifically, which
> > > > can support SPI NANDs and PARALLEL NANDs,and this driver is just for SPI
> > > > NANDs.
> > >
> > > Hm, I'm not so sure about that (I might be wrong though), it seems you
> > > can send any command you want, not only SPI NAND related ones. Maybe the
> > > controller is optimized for SPI NANDs but can do all kind of SPI
> > > transfers.
> >
> > You are correct here. This controller can perform generic spi-mem operations,
> > and it has special routines for page cache R/W that utilize controller's ECC
> > functionality.
>
> Sounds similar to the way the MXIC controller works, and that's
> actually what Miquel is trying to support with his ECC engine
> abstraction series [3].
>
> > I think the purpose of this is to provide better ECC capability
> > for some SPI NANDs with worse ECC algorithm on chip.
>
> Yep, or make it faster. Actually the reason doesn't matter, I think
> we all agree that we'll have to support external ECC for SPI NANDs at
> some point, hence the work Miquel has been doing.
>
> >
> > > > > Don't know what's possible to do with your controller, and maybe it's
> > > > > not able to execute random SPI memory operations, but in this case we
> > > > > should consider a different solution to support this driver.
> > > > >
> > > > > Do you have a public datasheet I can look at?
> > > > >
> > > > We do not have a public datasheet for Mediatek controller currently.
> > >
> > > Unfortunately, there's not much I can do without a clear understanding
> > > of how the controller works.
> > >
> >
> > I found a public datasheet [0] on wiki page for Banana Pi R64 [1].
> > Register description is available under "NAND flash interface" section
> > starting at page 592.
> > There's a hackier version of this driver in OpenWrt [2] which checks
> > opcode and use controller routine for page cache R/W.
> >
> > ECC part of this controller can also be used as a standalone ECC
> > algorithm and perform ECC operations on data provided by CPU.

The solution I'm referring to here is:
1. read uncorrected data to host directly from SPI NAND
2. start an ECC correction separately

> > But I think if it's implement this way, we wasted the page cache
> > R/W routines in this controller.
>
> Oh, you probably don't want the page cache to be active anyway. When
> the framework reads a NAND page, it also checks the number of ECC
> errors, if the page is held in some internal cache, you won't see
> the evolution of this number. Note that the FS should do some caching,
> so caching things at the HW level is probably useless.

It doesn't cache anything in controller. The R/W routine I refer to is:
When we issue a request to read page cache on SPI NAND:
1. host programs a DMA-able memory area for receiving data.
2. controller reads the page cache from SPI NAND
3. controller get the data and start ECC correction
4. corrected data will be sent back to host via DMA
5. host could check ECC status

writing of page cache goes similarly.
There's no need for a separated ECC request comparing to previous
one.

>
> >
> > I have two other initial thoughts:
> > 1. abstract some kind of ECC functionality in spi-mem interface
> >     I haven't really learned ECC stuff so I don't know whether this is
> >     possible and what kind of argument we needs for it.
>
> Nope, spi-mem should stay focused on SPI transfers, nothing
> memory-specific should leak there.
>
> > 2. modify SPI-NAND core to add support for special SPI-NAND controller.
> >     This limits controller's ability and adds extra burden for future extention
> >     of SPI-NAND framework.
>
> That doesn't work either as some ECC engines are shared between the
> raw NAND and spi-mem IPs.
>
> >
> > Which way would you prefer and do you have other suggestions?
>
> See [3]. I think you can already base your work on Miquel's series, but
> maybe he has a more up-to-date version to share. I'll let you sync with
> him.

Thanks. I'll check it out.

>
> Regards,
>
> Boris
>
> P.S.: the discussion should probably happen in the open. There's
> nothing confidential here, so I'd recommend continuing the discussion
> on [3] or creating a new thread with the MTD ML in Cc.

I did send it to the public list by replying to that 2-year-old email. It has
your old bootlin address and was rejected so I send it again to you
only :)

>
> >
> > [0] https://drive.google.com/file/d/1cW8KQmmVpwDGmBd48KNQes9CRn7FEgBb/view?usp=sharing
> > [1] http://wiki.banana-pi.org/Banana_Pi_BPI-R64#Documents
> > [2] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/patches-4.19/0306-spi-spi-mem-MediaTek-Add-SPI-NAND-Flash-interface-dr.patch;h=2370925372f69aed0566339a4808056580e88837;hb=HEAD
>
> [3]https://lore.kernel.org/linux-mtd/20190919193141.7865-1-miquel.raynal@bootlin.com/
>

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
