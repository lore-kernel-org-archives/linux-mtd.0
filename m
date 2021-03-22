Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF07CC433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 12:44:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37CB8619D3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37CB8619D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QOWysYU7LecPIcF8L8ZxqhDnmGBPCUzqnJYuOat6T38=; b=IbAjjyxlWevD2ALoiGWn3bMM3
	UpVYdyiyA+AxENiPFgnO8I1cO89N/AoL+eIxiXUHTEDwgBIzGuHE1519JYFKnpcgAhNa+KhkmoYcn
	4kO+7Oi4jdWv0RGatFDwqufbWXtjwLrsQXoRiowdSvTZQxKjTKpfzE1TP/x3BbHdSglHIlkHvbU9+
	Zvuz3R6faPtSwQyPjFMTMXkFN9W5QkYc18iaIwojTw/CxNOfycWvFvBoBxV+6qBFEj2lpdcE8+tiv
	DPcC6M9L80ECgl5xxJiwPmR9LMZLdu3Yjo6IpoUbhp2nD/mm4ApY3A0RaSlZO5bqZ97T1als1XOBL
	YjSmOm3Yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJu4-00Bc8v-TR; Mon, 22 Mar 2021 12:43:29 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJty-00Bc86-EU
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 12:43:26 +0000
Received: by mail-qt1-x832.google.com with SMTP id m7so12107931qtq.11
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=arydSfNJdOno8g+YOjFb3gBNmyUnmYwfHcSK+u9v6E0=;
 b=pvfz1nRDKM+5JSmPf5O61eb8JVdXAor769fw2vp17sNl/zTPQqdHlvp9FM/wReYvxT
 IrFZMfN+HbSqU1k08wYwvc42oC04BNOz21jTf2NAumCQg5gLKZgY6Z7EUGXB4DhoDTmh
 ubvevCPpw+vY/CWR+di+hulwZRFTje64QOKkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=arydSfNJdOno8g+YOjFb3gBNmyUnmYwfHcSK+u9v6E0=;
 b=Mkk/DdJk6DKngqehFVnbEC4NBTQtaE6SPBhg0Faji5nDLFtNTLqVrmOxsGgweebQFO
 z/w3wYnCPWfXi2hTedaVLQWT2p/FMDk/FgEeF2PXve2hPuJGXNIhBZXLYwBq3BXBWGVN
 G8VpYsNOAZlNmaaLRaYpso7WN+yhVPaP0Bd+sY95rNMnsw8hPTwRzdy+Z+HYv9ld4VdR
 tBAeM+8p2N6effijv2Xog4fo4W46GXFBSkgvIo8Ivlmz2whC2ZkhHIN4n2kT68pk3rR1
 dhJoJgHWPhwU9MvB1Jc6PJlrleUGab51vqNaZy91fPgsOv8jFbCPjphwb2IirV5rLm2X
 D/gw==
X-Gm-Message-State: AOAM531uNDrRlDFKSph1QJfhyyMmhIC7GLnQIQiLk1r2bgEwSXfgaxtS
 56aIpsapgEprAtMINTt4Tb5F3Frkue36qPeVweG5AQ==
X-Google-Smtp-Source: ABdhPJyw8gIStBNrRZHMMvHuRzb/Apf44gmOg1kbj31cZd/bXDI+mQRHLdAEkxp7QvDhMsWmZcrEhpSPyTLQSliM8yI=
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr9464586qtk.249.1616416999595; 
 Mon, 22 Mar 2021 05:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
In-Reply-To: <20210215121653.4edd86c4@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 22 Mar 2021 21:44:40 +0900
Message-ID: <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_124322_995033_F27D15A9 
X-CRM114-Status: GOOD (  26.77  )
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

Hi Miquel,

Sorry for the resend. Gmail randomly switched to HTML email so the
original version seems to have bounced.

On Mon, 15 Feb 2021 at 20:16, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > "2. Spare area 800H to 83FH is all available for user.
> >  ECC parity codes are programmed in
> > additional space and not user accessible."
> >
> > It would seem that the pages are actually bigger than 2K + 64 or there
> > is some other place they keep the ECC.
> > Or both datasheets are lying. Somewhere else in the datasheets it says
> > that writes to the ECC area will be ignored but that doesn't make a
> > lot of sense if the ECC area isn't user accessible in the first place.
> >
> > I didn't think about it at the time but I can take a dump of the OOB
> > area of my FS35ND01G-S1Y2 to confirm it's all 0xff except for any
> > factory marked bad blocks.
>
> I see. Can you please try the following:
>
> nandwrite -o /dev/mtdx /dev/zero
> nanddump -ol1 /dev/mtdx
> If the entire area is effectively free to be used, you should see 0's
> everywhere. Otherwise you should have ff's somewhere.

Sorry I didn't follow up sooner on this. I needed to order another of
this flash chip to test with as I couldn't destroy the data on the one
I have.

Anyhow:

Erased the page with flash erase (I'm forcing it to erase bad blocks
here as I mess up the marker, I have a hack to allow erasing bad
blocks..)
Everything is 0xFF for that page.

# flash_erase -N /dev/mtd1 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
# nanddump --bb=dumpbad -n -l2048 -o -c -s 0x0 /dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
....
0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|

Write zeros into the page and OOB.
Get all zeros back including the OOB.

# nandwrite -o /dev/mtd1 /dev/zero
Writing data to block 0 at offset 0x0
Bad block at 0, 1 block(s) will be skipped
Writing data to block 1 at offset 0x20000
# nandwrite -N -o /dev/mtd1 /dev/zero
Writing data to block 0 at offset 0x0
# nanddump --bb=dumpbad -n -l2048 -o -c -s 0x0 /dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
0x00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
...
0x000007f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
  OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
|................|

Erase the page again and writing random junk into it.
Seeing random junk everywhere including the OOB.

# flash_erase -N /dev/mtd1 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
# nandwrite -N -o /dev/mtd1 /dev/urandom
Writing data to [  230.506260] random: nandwrite: uninitialized
urandom read (2048 bytes read)
block 0 at offse[  230.514705] random: nandwrite: uninitialized
urandom read (64 bytes read)
t 0x0
# nanddump --bb=dumpbad -n -l2048 -o -c -s 0x0 /dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
0x00000000: 5e 24 bd 5f d9 c6 ce c5 b1 85 52 4d 27 94 c9 98  |^$._......RM'...|
...
0x000007f0: fa 9f 7f 7d ce 99 33 88 d6 9f 99 7d 84 e7 0c 4d  |...}..3....}...M|
  OOB Data: b1 81 07 6a 8d 47 8b ed 89 88 ac 62 e8 ae 48 54  |...j.G.....b..HT|
  OOB Data: 7d b2 ea 73 f3 29 ba 65 e6 45 cb 8b 1a c6 5b dc  |}..s.).e.E....[.|
  OOB Data: b2 2e 77 56 e0 e1 04 59 86 31 7a e5 bd 43 f9 48  |..wV...Y.1z..C.H|
  OOB Data: 52 05 b2 f1 65 64 59 22 79 50 ec 89 55 6b 6e 23  |R...edY"yP..Ukn#|

I think this shows that the datasheet is right in that the complete 64
bytes of "spare area" is usable.
I have no idea where it puts the ECC though. :)

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
