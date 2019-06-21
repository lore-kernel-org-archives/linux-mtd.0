Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A72C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 10:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBB8208C3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 10:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leF1eee3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="etN7QHE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBB8208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZzX9ejkpg+vK8RuMWOj2LXSJSlKRezkgZr8VCIY5NE=; b=leF1eee3XWsI/T
	c4U+uvUYDlB3PV5lnFdWq0a/+wGtyO7ffv3gxsYlfD5eQU5+rCouxfgLOMwjRxf56U1XBIrSVAmhH
	Zi1cq3BOoygiZYjNFMXuhb+qr7O9mm+GhQ6qQi5U4QwuLM3KDEMY1RNCFeotBqswNb22sgZzjZlN/
	Fa5uKLiyzHIdxMUGXLRINMPCBb5IvNNG2qe3fwfHl/n1sOu+ZtCCFrdEO7ut/edHbbWS8j3TbOj4U
	XHiVQiTz4p/oJ10A23ja4yDzUj1lXLbiJjtCKFdJcOye9zYrdoQ1iy/gG/nH6fH6F4KRVszyQS8He
	RCKhQIsdLdsNOZ+rDgKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heGn5-0006AA-5y; Fri, 21 Jun 2019 10:29:07 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heGn1-00069A-TY
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 10:29:05 +0000
Received: by mail-vs1-xe43.google.com with SMTP id h28so494709vsl.12
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENYQKCQSfeszZWYCN2yKfX/JBpyCK1CYVFLjD6oifQ0=;
 b=etN7QHE7JyTa4lpmcwrjRdg6TnTrZT71qn5QpWXhPeGHVs5LbKB7on5lmX86ologtL
 7XbiDc7JUkNc4+BQeGqzuFBGbVVr8ocD+vYfvpGft4Mc7w356kUy3V65LZHBdflyDdks
 pBnwhTO5D9DEj5J/u+iqjckNNj7Rc97GntY5i1S4zc6On50LZARTYCXQk/LRR36V2BlE
 SMgPRFHAm5TPfEKUQGV8T+s/54ZNmcHw0scr7/QgnsXjtHxX88yXLRu4TMT87r/wBFOJ
 mvAG7S8pio6EeqFl3vC68qkeAUBhNY/8eY1lWfcVTJ2jGeTtOnlK9TON7Lasld8xB/6K
 HjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENYQKCQSfeszZWYCN2yKfX/JBpyCK1CYVFLjD6oifQ0=;
 b=ZUeOGuZZv/W1TIwPBGMnFOyX5QaFcnT3LbxksdZw20W2T1TjtLDSEHCwRYEsLUVfpr
 7bGN+SL3FONhPKq5GDpkvSDHiJE7aMTHp79lXPdYLOMxUIMFsThymZiRAeCTjHSp64Sn
 /Fv/+oDm5R6JQvOAEQjVkGZ0z6n2IqkeO1hDomkswe4A1xv3EoL4DMW0n0s8MRTDNN13
 S1uDXLQDa4WskbvQf3aDdsJeJTkJS9yri+EWV+8AcKQgqf6s75GX1GhzUXdKSOuNcr/K
 LlWtDEOLAR9wXMXYxYq9BLqTDzGn9BMaznHhQ6pjXfGob29PRTDDQRtib3vUrrIsnBow
 EuZw==
X-Gm-Message-State: APjAAAVLZXl1P0SuhOSN2dCQuwPOu7RiKXniLkkPdElITyaSPq2J0mk8
 7sBuvU7saymo+4JU0d2Hmdrn78p14XWULo3Ap89f/w==
X-Google-Smtp-Source: APXvYqyXXbRJwvoUm1/ZU9MgYql7iUjK+l3n4H+mOYUP5gGfjYQ9PO1P5xFbBOShDCcwOuvRyoqJmEPbMxH/uNId6ZQ=
X-Received: by 2002:a67:7346:: with SMTP id o67mr50970360vsc.92.1561112942493; 
 Fri, 21 Jun 2019 03:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
 <1560336476-31763-2-git-send-email-sagar.kadam@sifive.com>
 <325855d0-00f9-df8a-ea57-c140d39dd6ef@ti.com>
 <CAARK3H=O=h1VDgOMxs_0ThcisrH=2tzpW5pQqt0O9oYs=MFFVw@mail.gmail.com>
 <93b9c5fd-8f59-96d7-5e40-2b9d540965dd@ti.com>
In-Reply-To: <93b9c5fd-8f59-96d7-5e40-2b9d540965dd@ti.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Fri, 21 Jun 2019 15:58:50 +0530
Message-ID: <CAARK3H=CmxSG2srUaoxN1HF6W7CVKtpATrf89n6kuht2Paqp8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: spi-nor: add support for is25wp256
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_032903_966820_5A29E625 
X-CRM114-Status: GOOD (  20.18  )
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
Cc: aou@eecs.berkeley.edu, tudor.ambarus@microchip.com,
 Wesley Terpstra <wesley@sifive.com>, richard@nod.at,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Vignesh,

On Fri, Jun 21, 2019 at 11:33 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi,
>
> On 17/06/19 8:48 PM, Sagar Kadam wrote:
> > Hello Vignesh,
> >
> > Thanks for your review comments.
> >
> > On Sun, Jun 16, 2019 at 6:14 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >>
> >> Hi,
> >>
> >> On 12-Jun-19 4:17 PM, Sagar Shrikant Kadam wrote:
> >> [...]
> >>
> >>> @@ -4129,7 +4137,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> -     if (nor->addr_width) {
> >>> +     if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
> >>>               /* already configured from SFDP */
> >>
> >> Hmm, why would you want to ignore addr_width that's read from SFDP table?
> >
> > The SFDP table for ISSI device considered here, has addr_width set to
> > 3 byte, and the flash considered
> > here is 32MB. With 3 byte address width we won't be able to access
> > flash memories higher address range.
>
> Is it specific to a particular ISSI part as indicated here[1]? If so,
> please submit solution agreed there i.e. use spi_nor_fixups callback
>
> [1]https://patchwork.ozlabs.org/patch/1056049/
>

Thanks for sharing the link.
From what I understand here, it seems that "Address Bytes" of SFDP
table for the device under
consideration (is25lp256) supports 3 byte only Addressing mode
(DWORD1[18:17] = 0b00.
where as that of ISSI device (is25LP/WP 256Mb/512/Mb/1Gb) support 3 or
4 byte Addressing mode DWORD1[18:17] = 0b01.

> > Hence I have ignored the addr width from SFDP.  I have verified that
> > with 3 byte address width, the
> > flascp util fails while verifying the written data.  Please let me
> > know your views on this?
> >
> If this affects multiple ISSI parts then:
> Instead of checking for mfr code, look for SNOR_F_4B_OPCODES flag in
> flash_info struct of the device and let it take precedence over SFDP in
> case size is over 16MB
>

So as per your suggestion I think second approach is a better one.
I will send this in V6.

Thanks & Regards,
Sagar

> Regards
> Vignesh
>
> > BR,
> > Sagar Kadam
> >
> >> Regards
> >> Vignesh
> >>
> >>
> >>>       } else if (info->addr_width) {
> >>>               nor->addr_width = info->addr_width;
> >>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> >>> index b3d360b..ff13297 100644
> >>> --- a/include/linux/mtd/spi-nor.h
> >>> +++ b/include/linux/mtd/spi-nor.h
> >>> @@ -19,6 +19,7 @@
> >>>  #define SNOR_MFR_ATMEL               CFI_MFR_ATMEL
> >>>  #define SNOR_MFR_GIGADEVICE  0xc8
> >>>  #define SNOR_MFR_INTEL               CFI_MFR_INTEL
> >>> +#define SNOR_MFR_ISSI                0x9d            /* ISSI */
> >>>  #define SNOR_MFR_ST          CFI_MFR_ST      /* ST Micro */
> >>>  #define SNOR_MFR_MICRON              CFI_MFR_MICRON  /* Micron */
> >>>  #define SNOR_MFR_MACRONIX    CFI_MFR_MACRONIX
> >>>
>
> --
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
