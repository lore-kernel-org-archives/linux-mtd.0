Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E3BC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw9umLczCOF6a+PYfGIynHWGHFKldRcRAL1Nij5EawY=; b=niGWXCcTxfWXlW
	FnLjRJeDNod7Dj4GVYpCFbk9/5YeOEfK0dJpe5bhYtxcqbspvBZ6FRkyp29WgqOBtmE4crmYK5Y05
	4RJQuNB+p3arKZoZCWc14GPd2WlCC2a3xlP5Jbfuelk3XAUD3TJ2f9A2XbhuRh3VpEr2wPA7HqccJ
	vl37T8S12sYnvE7Cda13D7hO393xg6Ym7kHTXmOb0rP+bugxtUsTiZfq7lMdEkEmrREcLpLrLNGG1
	ofO1zqQcl6vCe3l87hmkG6B/0ugE0a2KtKvGLkQgMXxDPBHSMnaMUvQWxy2K8JWhrlJT/O/JbnFiL
	OPpTCwETseH5UFC3X0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMXs-0083JZ-I6; Wed, 01 Dec 2021 10:09:00 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMXp-0083IV-Aq
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 10:08:58 +0000
Received: by mail-ua1-f44.google.com with SMTP id r15so47762138uao.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 02:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPPtbzDfyTfORykbO3S8ExCZdlOUf/q6E0viO28dDok=;
 b=WOUFSHlj0SRqW8oIqdLu99bwUi4eg+60kFSw2tQaaoZz21SympyCsZLzrcEEb1MvJB
 WM4D+LibjAMVHdNLay8vXgu30uA7MDoEgC38ohnkzdPOAfN1UmGCLyR+o8i+CiUIj5Eo
 PPl/wEO6iYXSbZLuk0m0GJPhZftwskey8siR45LkFmnsKzxTFN4/lYTmIdiBDL5cYAwj
 3p4PbXPg5iRJ169mhFAhatl7vvLC7vN2p7HQ8bdumHoaeVNUJMvMi/02tibMQQxMbV59
 EdorbyVPZQLhWCU0v37oRTSpmRVOsNKFZSrE2TDDF9nnpm7dWSsE0Ee8VinPGRWsTbES
 Y54g==
X-Gm-Message-State: AOAM533zl137UzH2iQXIUg2802El0SVlwZ5tdv9QF876eXkLeJWoqttO
 Tb/KmdcfQM3tAgQv3EM0L9HwStOMLAaX8w==
X-Google-Smtp-Source: ABdhPJxsOKYaft0wk6Wj0GjFmQDlM2Mm7N/yamCIGCRTLOdyRNKZtZpaHHegoebQBV7CZpl/YN1eJQ==
X-Received: by 2002:a67:31c9:: with SMTP id x192mr6027576vsx.63.1638353334485; 
 Wed, 01 Dec 2021 02:08:54 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id l190sm11784138vsc.26.2021.12.01.02.08.53
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 02:08:53 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y5so47716513ual.7
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 02:08:53 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr5459646vsj.77.1638353333064;
 Wed, 01 Dec 2021 02:08:53 -0800 (PST)
MIME-Version: 1.0
References: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
 <20211201072328.GA31765@lst.de>
In-Reply-To: <20211201072328.GA31765@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Dec 2021 11:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7PbXwuBNBn4TtjXUvjzWiOQTYoOJTEACyN-k4DUj5-Q@mail.gmail.com>
Message-ID: <CAMuHMdV7PbXwuBNBn4TtjXUvjzWiOQTYoOJTEACyN-k4DUj5-Q@mail.gmail.com>
Subject: Re: [PATCH/RFC -nxt] mtd_blkdevs: Set GENHD_FL_NO_PART
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, 
 Pratyush Yadav <p.yadav@ti.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 linux-block@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_020857_416521_3B3F8D78 
X-CRM114-Status: GOOD (  34.83  )
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

Hi Christoph,

On Wed, Dec 1, 2021 at 8:23 AM Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Nov 30, 2021 at 05:23:46PM +0100, Geert Uytterhoeven wrote:
> > When DT declares the partitions of an spi-nor device using
> > "fixed-partitions", the individual mtdblockN partitions are now scanned
> > for partitition tables, which should not happen.
> >
> > Fix this by setting the GENHD_FL_NO_PART flag in the MTD block layer
> > interface.
> >
> > Fixes: 1ebe2e5f9d68e94c ("block: remove GENHD_FL_EXT_DEVT")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Seen with e.g. arch/arm/boot/dts/r8a7791-koelsch.dts.
> > I only noticed because I have debug code to measure QSPI performance,
> > which informed me about 8 x 512 bytes being read from each partition
> > detected.
> >
> > RFC as I'm not sure this is correct in all cases.
> > I did verify that in the absence of "fixed-partitions", the spi-nor
> > device is not scanned for partitions before and after commit
> > 1ebe2e5f9d68e94c.
>
> As far as I can tell mtd fixed partitions have nothing to do with
> the block layer concept of partitions.  What kind of behavior change
> did you see?

After the aforementioned commit, 8 x 512 bytes are being read from
the start of each partition described by "fixed-partitions".
Dmesg difference with debug print added to spi_nor_spimem_read_data():

  renesas_spi e6b10000.spi: registered master spi0
  spi spi0.0: setup mode 3, 8 bits/w, 30000000 Hz max --> 0
  spi-nor spi0.0: s25fl512s (65536 Kbytes)
  3 fixed-partitions partitions found on MTD device spi0.0
  Creating 3 MTD partitions on "spi0.0":
  0x000000000000-0x000000080000 : "loader"
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 0 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 512 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 1024 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 1536 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 2048 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 2560 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 3072 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 3584 len 512
  0x000000080000-0x000000600000 : "user"
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 524288 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 524800 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 525312 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 525824 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 526336 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 526848 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 527360 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 527872 len 512
  0x000000600000-0x000004000000 : "flash"
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6291456 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6291968 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6292480 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6292992 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6293504 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6294016 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6294528 len 512
+ spi-nor spi0.0: spi_nor_spimem_read_data: from 6295040 len 512
  renesas_spi e6b10000.spi: registered child spi0.0
  renesas_spi e6b10000.spi: probed

Thanks!

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
