Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EDEC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 11:03:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2CFC206DF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 11:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFicZC4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2CFC206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuC1n/6r/mhRgLghFWkUcUwja0FevhO+1gamzMvNsI4=; b=bFicZC4NbkXJPE
	gpXXEmWDK2i8y6nCqKUTG23ZdPs0d7Urf5Kgd5rzgJxWZzIwIheevESXF/XOt17ULTu88PPhg8/FL
	40SRgt2/Sn2M+Dkap091f8vgLa0rd58awTDDDAClf3jrCJdtkCwp5P0QFXQIWLyualGFyWWWdDhrd
	+Ec0vUm/m8KeaLutcMsD2UoLzFCWwMs1ztIbewJa6HsknLydYuTNEq+fmp8MJu7Mwfz2XAx3Gcft0
	XGZhVxbqSBPF2dGV3dQ73sRZ81Q7amtw+3rLN+U7Rkf7ogvAE9Nw4keMA6srJ0hYKrDlmIbTiS91N
	aDkzGdN4+RmBSpfFsh1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3fBU-0001MH-5f; Tue, 12 Mar 2019 11:03:00 +0000
Received: from mail-vs1-f67.google.com ([209.85.217.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3fBM-0001AP-4h
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 11:02:54 +0000
Received: by mail-vs1-f67.google.com with SMTP id z18so1291552vso.7
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2019 04:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8qRV/tQgBYHVc8PSLRAylUGH7Bv0fETjpbDy/rM09o=;
 b=n/VFmRv0BqQdUt/B+eqRD1t24X6SOsuQWfdLhhic8Rl2SVCufLyQ9zvjJJsYKhZ2aU
 tmHPXKlR2b2aAOBMCTD7Y+5UVQZ3HOWvknkOZ/BfrreFjP/yM+9E4PGGNVPLLSyoumA8
 ntgYbzAd6/e5ijhd8YAzrmW/fUvTrXpusrcZkrNVK6PlXQgBG/kjp/gdyiZu0799qzhc
 9AskEI9mQdr/P4KMXHy+k9l3JvZguDg/gNjqaYh/TYl76P4ZRLfzrlt92sl6LcBAUSlm
 HDGtWfml1mWrCTNLMDkK9eeN8f7jiO79IOkRme8Jzh6n4HF+Rcmy63Bd1AW8CANNQGaL
 XNSA==
X-Gm-Message-State: APjAAAVmLQkO4R8FyxI67ep7qsOHGogY/RMr/k7uXc7Ui0IXzgS1oaH1
 0lpU8VDCJsPaZ2ftWUmA331icYQ0gC9GqW2RFKY=
X-Google-Smtp-Source: APXvYqw4geNOGk/Sk5KFPNbEntLypuplDoQVl5Zdw+m/JJIJAUVechlIwTuK1a0lFRQXisoTO2+WJF5SgEKSZP1NqLs=
X-Received: by 2002:a67:8588:: with SMTP id h130mr18575185vsd.11.1552388569717; 
 Tue, 12 Mar 2019 04:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
 <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2019 12:02:37 +0100
Message-ID: <CAMuHMdWkJi3VnNmdR_ykbUuKs4d_XT9uSYHzCed_=eJreCC2LA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_040252_286656_3B003EE3 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 5, 2019 at 3:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 16, 2019 at 6:53 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> > family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> > covering S25FS512S and now that we have added 6-byte ID for that chip, we
> > can convert S25FL512S to using a proper 6-byte ID as well...
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> This is now commit a2126b0a010905e5 ("mtd: spi-nor: refine Spansion
> S25FL512S ID"), and turns out to cause a regression on r8a7791/koelsch.
> Dmesg diff before/after:
>
>     -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>     -3 fixed-partitions partitions found on MTD device spi0.0
>     -Creating 3 MTD partitions on "spi0.0":
>     -0x000000000000-0x000000080000 : "loader"
>     -0x000000080000-0x000000600000 : "user"
>     -0x000000600000-0x000004000000 : "flash"
>     +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20
>
> As the (old) U-Boot on my Koelsch keeps many module clocks enabled, I
> typically merge in my topic/renesas-debug branch, which makes sure all
> non-critical module clocks are disabled early during boot, to catch
> drivers not properly implementing Runtime PM.
>
> However, it turns out this has some impact on JEDEC ID detection:
>   - When module clocks are left untouched, spi_nor_read_id() reads
>     0x01:0x02:0x20:0x4d:0x00:0x80.
>   - When my debug code has disabled module clocks during early boot,
>     The last byte is 0x00.
>
> Before the above commit, only the first 5 bytes were compared, and the
> last byte was ignored, thus not causing problems.
> When comparing all 6 bytes, detection fails if the last byte is 0x00.
>
> I believe mainline U-Boot for R-Car Gen2 boards doesn't keep the QSPI
> module clock enabled, so this commit may breaks those boards.
>
> To be investigated more (e.g. with a logic analyzer)...

The FLASH returns the correct data, but it is not received correctly.
When reading 16 bytes, thus including the ASCII model at offset 6/7:

  - actual:   01 02 20 4d 00 80 47 31 82 ff ff ff ff ff ff ff
  - received: 01 02 20 4d 00 00 8e 63 05 ff ff ff ff ff ff fe

When retrying the operation, data is received correctly.

This happens due to a Runtime PM related bug in the initialization code
of the spi-rspi driver: if the module clock is not running (disabled by
my debug code, the boot loader, or the clk_disable_unused late
initcall), the SPI controller is not initialized properly.  The first
transfer still manages to read some correct data, which used to be
sufficient to identify the S25FL512S FLASH chip, before the sixth byte
was also considered.

Will send a quick fix, and a proper solution requiring more refactoring
later.

Sorry for the noise...

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
