Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0015BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 06:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDEE611CE
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 06:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFDEE611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtTIBiW+4ccByULNzo+agOtHpMRPTG87gentQn4X/EA=; b=xFzi5Ac7SSeoTY
	elgZH22eSA7WVrbFL4xvJWRKsaO6PnLc+iTp3y0/NwABHd/3gw66H6/fz7S+BvUqXWB4vLNP3KLth
	GeT+T6KNW+GYUQ0H8I4JFlZKE2LS9ZlzdxpvZnWosZroKKO+hQCOXyvr/PajlerFau4Q1rv32B8zi
	EqHWm+P9cusaGVp9QFy5taa3QjCeclNq7ZDdlb51eUebZBBEEQOo4A5yKpwkCp681zfxkLAL1E4VS
	an+rQABewD14ZND3v+sFqmVNEF+TC3EYCYVwXiS7RALom2fLCD7VUzX71E9De06sotjWD16/RL0ei
	gkF1pgcOTULMd1q5JLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXHSP-005IkK-0X; Mon, 04 Oct 2021 06:28:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXHSK-005Iij-NV
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 06:28:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id t11so10374944plq.11
 for <linux-mtd@lists.infradead.org>; Sun, 03 Oct 2021 23:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYydHK1+J/jVR3W0f+wFeMm/wyoVYwiHySJjQ+9VtzQ=;
 b=QnyxRhlp2JwR0Y4KvPN7kB3cQWVmDFTV9DkE+Z4rYP/bCDPd2A+IxP7sbQOQBEocC1
 LGx+AWgjh0rn4dIPtNZPUNNHukgaIgh/GVJJ3fUhJHYkS6Y/RI8lMAhvTK8nh2IMcPxr
 Zq+Enh/bmKV6jWA+jjBnUcY1BaW/AbOvsHN3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYydHK1+J/jVR3W0f+wFeMm/wyoVYwiHySJjQ+9VtzQ=;
 b=DZEV8QnQBY6jtBhY9UotvDKhVUOvTOpBkgmcbATtBljRocwIOh9/gWjnsGK/9FU66W
 zcGtJ8Kt3q1NBIgoMRVflN1bnMrGBVn2cAt/1HicfWPaJYoHApHonV6Ik6vmB9knh8sh
 FfGVpgSf76o6dC2Pn7kooHeHz7kMhEcOCVOPN6ceDr044gpNn9jwq0w+DLUBMN7JBPUQ
 8pYYe/nAAexaxuVfwvRA5p3cZDIs2KPH9VAQz0XMYYJHfLxtT/AYBemNT/6KAF+gUryP
 O+H1GQISXJupO7WT4PB14mq4YD9Maxpq8aK0EQtdJRj1znFz4BFbz91cfhlXfsCFx5me
 AMtw==
X-Gm-Message-State: AOAM5338jY6dgZusSQ2h3GdaGjh7rJG7kPgrFlG0ZCj6JLNzHA+6MgYL
 SFgl7p4kYOTiyAIhstMr4/kPLG7e+6wOXrGNoRaQrg==
X-Google-Smtp-Source: ABdhPJxaBkDn/INVHzmBF+ztklZXJjB4W+rEDhTzW7VTNX1TsxSNefEa1Iho+HVwi/x3TDOZZ/FMQyIm92/KjDEF1pY=
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr35336798pjg.118.1633328886311; 
 Sun, 03 Oct 2021 23:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <3160469.44csPzL39Z@n95hx1g2>
In-Reply-To: <3160469.44csPzL39Z@n95hx1g2>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 4 Oct 2021 08:27:54 +0200
Message-ID: <CAOf5uwk3XLtTgoMuRU+hP29xQzPUj9NEuV58V5QdXXigQ0waVQ@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Christian Eggers <ceggers@arri.de>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Greg Ungerer <gerg@kernel.org>, Han Xu <han.xu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_232808_931061_1750228E 
X-CRM114-Status: GOOD (  27.70  )
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

Hi Christian

On Mon, Oct 4, 2021 at 7:54 AM Christian Eggers <ceggers@arri.de> wrote:
>
> On Monday, 29 July 2019, 08:41:51 CEST, Greg Ungerer wrote:
> > Hi Miquel,
> >
> > I am experiencing a problem with NAND flash DMA timeouts on
> > iMX6ull based boards. The problem is very similar to that
> > described in:
> >
> >    https://linux-mtd.infradead.narkive.com/JIUulfFB/gpmi-imx6ull-timeout-on-dma
> >
> > That didn't come to any specific resolution that I could see
> > in that thread.
>
> Hi all,
>
> I am joining this thread because I am also affected by this problem. I use
> kernel 5.10.65-rt53 but I have seen this issue on many previous versions. In the
> past I only recognized this on my development setup but now this has been found
> by our testing team.
>
> In our test setup we simply perform a reboot every 30s. After 5 to 200 cycles
> the test stops due to this error.
>
> The kernel version I use already includes:
>
> > Han Xu <han.xu@nxp.com>
> > mtd: rawnand: gpmi: Fix the random DMA timeout issue
>
> Additionally I tried ...
>
> > Michael Trimarchi <michael@amarulasolutions.com>
> > mtd: nand: Calculate the clock before enable it
>
> ... but the problem still persists.
>
> In my case, some registers show different values (annotated below):
>
> >
> > The boot trace on the console for me looks like this:
> >
> > nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
>   nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
> > nand: Micron MT29F2G08ABAEAWP
>   nand: Micron MT29F4G08ABADAH4
> > nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > gpmi-nand 1806000.gpmi-nand: DMA timeout, last DMA
> > gpmi-nand 1806000.gpmi-nand: Show GPMI registers :
> > gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x20830002
> > gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x01c6800c
> > gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00010101
> > gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0xe0000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x23023336
> > gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x000001ee
> > gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0xff000001
> > gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x00000001
>   gpmi-nand 1806000.nand-controller: offset 0x0c0 : 0x00000202
> > gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x05020000
> > gpmi-nand 1806000.gpmi-nand: Show BCH registers :
> > gpmi-nand 1806000.gpmi-nand: offset 0x000 : 0x00000100
>   gpmi-nand 1806000.nand-controller: offset 0x000 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x010 : 0x00000010
> > gpmi-nand 1806000.gpmi-nand: offset 0x020 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x030 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x040 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x050 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x060 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x070 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x080 : 0x030a2080
>   gpmi-nand 1806000.nand-controller: offset 0x080 : 0x070a4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x090 : 0x083e2080
>   gpmi-nand 1806000.nand-controller: offset 0x090 : 0x10da4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0a0 : 0x070a4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0b0 : 0x10da4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0c0 : 0x070a4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0d0 : 0x10da4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0e0 : 0x070a4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x0f0 : 0x10da4080
> > gpmi-nand 1806000.gpmi-nand: offset 0x100 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x110 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x120 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x130 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x140 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x150 : 0x20484342
> > gpmi-nand 1806000.gpmi-nand: offset 0x160 : 0x01000000
> > gpmi-nand 1806000.gpmi-nand: offset 0x170 : 0x00000000
> > gpmi-nand 1806000.gpmi-nand: BCH Geometry :
> > GF length              : 13
> > ECC Strength           : 8
> > Page Size in Bytes     : 2110
> > Metadata Size in Bytes : 10
> > ECC Chunk0 Size in Bytes: 512
> > ECC Chunkn Size in Bytes: 512
>   ECC Chunk Size in Bytes: 512
> > ECC Chunk Count        : 4
> > Payload Size in Bytes  : 2048
> > Auxiliary Size in Bytes: 16
> > Auxiliary Status Offset: 12
> > Block Mark Byte Offset : 1999
> > Block Mark Bit Offset  : 0
>
> Please let me know if further information is required.

I need to continue on it, during the following days. I have stopped
moving to LTS 4.19.y and with my partial revert.
The problem as usual was to go to production on some devices. Anyway I
have the device that has this problem. I can
restart next weekend. One of the thing I notice that make not work on imx28 is:

       if (sdr->tRC_min >= 30000) {
               /* ONFI non-EDO modes [0-3] */
               hw->clk_rate = 22000000;
               wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
       } else if (sdr->tRC_min >= 25000) {
               /* ONFI EDO mode 4 */
               hw->clk_rate = 80000000;
               wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
       } else {
               /* ONFI EDO mode 5 */
               hw->clk_rate = 100000000;
               wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
       }

Here there is an assumption that your clk_rate can be set to that rate
but on imx28, the parent clock of the NAND one can not
let it go to those speed. Changing it let it really set to the wrong
value, so imx28 was totally broken. The other computation was based
not on fixed clock rate but I think even on clk_get_rate

Michael

>
> regards
> Christian
>
>
>
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
