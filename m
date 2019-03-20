Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3FAC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF46218C3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+XE/Wah";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EAOjxP6l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF46218C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmalvuGwHralvSacQCoNGAqI6ReeihBl89clMu7RpjI=; b=g+XE/WahJcn7LS
	zOLFnnbicbxgNE96jAC+FzEvt2MCKSmToXnHtjMjKWRfmtfC+nc1N8r/sql1NPzvDKm/FV+DPxdOO
	atH8Xz5Bu6urG//POfPh68IwB5fDwwUMrOdvVqM/7moQPUNnuWSEHA36JaL6Ig/IvOdUMqqKcHMdW
	CMTXxJAoxNPDOgTPTDCcHLvaQU1sXHq9TsuPNVxnfQjMjWNxNw++MiCoDkpsVmwuChLzxHuEpO2tu
	KGDjuHaiDKrMN2GbFlN7sdQijenXlJfeb17A6xwgaA2PtAP9ZtdTOQMx2Qy4n0IRDCSHH5jNohYGY
	61+osQDC9sjlzgxU/0NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6i8V-0006m1-GQ; Wed, 20 Mar 2019 20:48:31 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6i8T-0006lU-C5; Wed, 20 Mar 2019 20:48:30 +0000
Received: by mail-oi1-x242.google.com with SMTP id 3so2337147oir.7;
 Wed, 20 Mar 2019 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkf20fehmYLH1YP5jLWlVRh0irPw1QZbgsIQvR8Hnag=;
 b=EAOjxP6lykTvlsBncOWYV1Rg5YLZP0ouoSC51dlyQGcNnuhNpJpTxcxKh2vuk8OXPG
 eu5otKNktAl57mo+KsHPBrbUDtGFkkxFZs4Qiuh/49dPnefhTNV8qGTf3YE0gdpMhGMV
 LBYEKlD9M4pkm6mM0WrD2h3uuxubJldxkoYZzvpdoYRr32Ek5mWvsFgJDpwwQ+rGC8cm
 wMukqTlw1Ychw1ZeGgeKyTYLptPO70AdizUFx/hpsFI4PCYqGefIEgekcGXcameQonDg
 7qojkrJ00v/Kpk5h3TXJk71zjfrG27tEnQC4eaE6/pAEtvIgUKXPPKJrzHhF0pYlEehS
 Xvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkf20fehmYLH1YP5jLWlVRh0irPw1QZbgsIQvR8Hnag=;
 b=Igw2dRG6eNe+vBn6gcr7yOgZrMb2u/2l0w7Sqrb3DWkVd3nTcD9bppjteMMFZLU3Ts
 CGXB+BVFNzyGC4nq7uKMPPjegs0HI5S4fLL3aTmcTI7TRhsMQpE64rbgENQXRVtG2DJw
 tM7pngkMZ/U6RpkvlRHxG79Mw81aIybvaPafMtZvYFW11CURVOoTXZRFoAx3m8dHT8tq
 oe3zNuXk1CrMHOfRlkXyLz2W8bHTkjiEfVmk6pdpTFGTgwMcy9Oi6HtnYljZLViIzv2c
 BSZ+O8ipgpJIX8WNPNB2dphtPQeu3kvlwaEjoyYy0x5jp46LQHj5E8hGtpPIfQ7jn865
 TSPg==
X-Gm-Message-State: APjAAAW8GxWyBKC/+6evEEbRBbgFabmRJl45p9L95Weoti03/OWkhvAX
 uc/bF64Ov2TMQd0BY7U2mUM4vaN3bEbDCZ4Vz74=
X-Google-Smtp-Source: APXvYqzihIMVVRCn9dzb8ELnlf1ptftrwD2n1QDCQys2LFhxcidQERbvWaYi27RBN/CNc92MCTIDDz9a9IxcuBX3Z5U=
X-Received: by 2002:a54:4e02:: with SMTP id a2mr6732386oiy.140.1553114907404; 
 Wed, 20 Mar 2019 13:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com>
 <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13>
 <ccb95e75-e62f-c510-cabd-853481f77fc8@amlogic.com>
 <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
 <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com>
 <8134890a-457d-7803-01a4-1832f925f65f@amlogic.com>
In-Reply-To: <8134890a-457d-7803-01a4-1832f925f65f@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 20 Mar 2019 21:48:16 +0100
Message-ID: <CAFBinCBfkr-yyR4Vbd1HVmXVCOKuK-Kw1HKz4SMt9G3eA49HQQ@mail.gmail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_134829_415185_14455134 
X-CRM114-Status: GOOD (  27.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Wed, Mar 20, 2019 at 4:32 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Hi Martin,
>
> Thanks for your time.
> On 2019/3/20 4:27, Martin Blumenstingl wrote:
> > Hello Liang,
> >
> > On Sat, Mar 16, 2019 at 11:55 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > [...]
> >>> Martin, Now i am not sure whether NFC driver leads to kernel panic when
> >>> calling kmem_cache_alloc_trace.
> >> thank you for confirming that it works for you on GXL
> >>
> >> I'm not sure that this is a NFC driver problem.
> >> after enabling CONFIG_SLAB_FREELIST_HARDENED in my kernel config the
> >> crash moves. it's now crashing in slub.c's kfree() at
> >> BUG_ON(!PageCompound(page));
> > I added some debug prints in meson_nfc_read_buf() to get some details
> > about the info buffer before the crash,
> > format is: meson_nfc_read_buf <virtual address> <physical address>
> >
> > during my first test three different addresses are used:
> > - meson_nfc_read_buf e9e6c640 0x29e6c640 (works fine)
> > - meson_nfc_read_buf e9e6c680 0x29e6c680 (works fine)
> > - meson_nfc_read_buf ee39a34b 0x2e39a34b (crashes during kfree)
> >
> > so I tried playing around with the allocation size (see the attached
> > patch) and changed it to:
> >    kzalloc(PER_INFO_BYTE + 64, GFP_KERNEL)
> > this results in the following addresses being used:
> > - meson_nfc_read_buf e9ea4280 0x29ea4280 (works fine)
> > - meson_nfc_read_buf e9ea4300 0x29ea4300 (works fine)
> > (there is no crash anymore)
> >
> > Liang, are there any special requirements on the "info address" like
> > the alignment?
> It must be 4 bytes alignment. i have met it previously when debugging
> NFC driver on AXG platform, but it is not specified on spec. Now i am
> confused that how to get the no aligned address "xe39a34b" when using
> kmalloc; i think it should return the aligned address. doesn't it?
thank you for confirming the 4-byte alignment requirement!
I have no explanation for the unaligned address returned by kzalloc().
I'll ask on the linux-mm mailing list if they have a hint why this
happens.

> > also do you know why the PER_INFO_BYTE buffer is allocated dynamically
> > in meson_nfc_read_buf() instead of allocating it at initialization?
> > I'm not saying that it should be changed! I'm curious because there's
> > per-meson_nfc_nand_chip info and data buffers which are allocated at
> > initialization time.
> > NAND scan or initialization is divided into three stages:
> nand_scan_ident->nand_attach->nand_scan_tail. info and data buffer which
> depend on the result of nand_scan_ident are allocated on nand_attach; so
> nand_scan_ident can not use the info buffer on meson_nfc_nand_chip.
thank you for the explanation!

> Allocating a fixed size info buffer before nand_scan_ident and attach it
> on the struct meson_nfc; Or considering not use dma for reading data
> less than 8 bytes. Both can reduce kmalloc and kfree calling. Thanks.
both suggestions sound reasonable.
however, I will search for the root cause of the unaligned address
first before changing the Meson NFC driver.

[...]
> > [    2.227374] ------------[ cut here ]------------
> > [    2.231968] WARNING: CPU: 1 PID: 1 at
> > drivers/mtd/nand/raw/nand_base.c:5503 nand_scan_with_ids+0x1718/0x171c
> > [    2.241760] No oob scheme defined for oobsize 1280
> > ...
> > (the "No oob scheme defined for oobsize 1280" message is expected)
> >
> miss mtd_set_ooblayout(mtd, &meson_ooblayout_ops) on function
> meson_nand_attach_chip.
thank you for the suggestion. I didn't have time to test this on my
board yet but I'll let you know about my results during the weekend.
Does the missing mtd_set_ooblayout() call also affect GXL or AXG boards?


Regards
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
