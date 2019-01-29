Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10D8C282C7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 19:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92AFA21848
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 19:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MndsXRdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92AFA21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKwbNhSJLioAqORvGzhHAeQVtmXUksw9OOCvdB+bjD8=; b=MndsXRdpecxeSZ
	/ACsP6xPffYGNszz3V3iU6N0DyzRfSMvc9EwzY0ooYjZzNTD4FVw5ApKGNZdihsaBeD2FvZER1wts
	Sa2GZcSiDvwjuqoTXDa+spRdGVFq9IYcktvWg7BZHicrA4C1K2j+sIpAApoxIANLPzbjzEdYSbjBG
	FgdveaDWbDREClilj4fnIZLCj08zLKk9qVsdKM2eCq/JBlR+/g0Aovn4ItVysmpOj3OI0AOnxmJT+
	0WDC79E8/2jdqUNlrjQM7rwdMJsVHfo8e2LF0AickbvQN2VfecUc4DqVSzwxCSXMgEWXnAK7c0X3S
	JEZRLT/GoB+6HRjS9eRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goYer-0001dN-Uv; Tue, 29 Jan 2019 19:02:53 +0000
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goYeo-0001cp-Nq
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 19:02:52 +0000
Received: by mail-ua1-f65.google.com with SMTP id v24so7211043uap.13
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2019 11:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGbalnbWK1BdJsVh4SfasEI2KSz1Xmm2olQ96cpZjL4=;
 b=r9SFLo/acQn4m4XpVLAIAaw6nDqnIi2NKIkizDtdfJYl0rhnzOXaLclOlK4ws3Aeda
 gp7AaG/chEar3tA2U33PMzfBBJ6h2x6H2FtmghsL9KJlqqRu5b+2bSU3Fm1wFEg13ciE
 oTnRHRDyGJgBdOuSLGT+wKCiycazEPFp751xQX5Mmuo0EOUv6HHXgRnXoWeMzpel+PvJ
 FHsbD4rnnuXSEqOtpYh72vo0WFP1oEHM26yTtOURYFxUMbNOk0fvnvQxwCSqeEga3Bml
 7BXBR59QULdWBl/HfIFoAchmsZBzpsxsYx+9NDuGGAYO/ABa8kbabvfxI0xDbFTkfr3g
 I42w==
X-Gm-Message-State: AJcUuke5QTWEHuY7AD5uoRYHFJh96MERur/vNAU5B5uWn9uFpL3nSoby
 cfRo0kb7OK/g5RFlbnxbWwUMLTEdcaiKiCN00X0=
X-Google-Smtp-Source: ALg8bN5FS3RLjkNTwLmFTA7F/tmoskPNe5LD48gPWZdscGmSAlTxrvIZagAeda33RcHwvrapJ/Opo7+7zVU+JiJhfTw=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr11815650uap.0.1548788569395; 
 Tue, 29 Jan 2019 11:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
In-Reply-To: <20190118230740.44239fcf@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jan 2019 20:02:37 +0100
Message-ID: <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_110250_770669_2FB2C09B 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> Did you consider converting this driver to spimem? Looks like the
> protocol used to communicate with the memory resembles the one used on
> SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.
>
> By doing this conversion you'd allow people to connect an AT25 EEPROM
> to an advanced SPI controller that does not support regular SPI
> transfers and you wouldn't have to forge SPI messages manually.
>
> Here is a patch (only compile tested) doing that. The diffstat is not in
> favor of this conversion, but I find the resulting code cleaner and more
> future proof.

Thanks, seems to work fine, with the 512-byte 25LC040 I have!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I did notice that the first two-byte transfer (command+offset) of each
message is now split in two one-byte transfers, though.

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
