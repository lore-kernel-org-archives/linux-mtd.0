Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12DBCA9EAF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E16A20578
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 08:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajYB2oZy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E16A20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASnqyg1mmW9/hBI1ZioVfh8jojPIAYJNvG9B526A8C4=; b=ajYB2oZyQzeRXp
	YWAiqelTgdYUQdHu7QI297btZyyHo9Vbm56gi6ALBG/hI4NcQDdlB47S/7ksowpjYqZYdXIxnalJh
	3XdCXf0FFAHOfGic7mQzSBEqExoYRApyCfUD7GROfruUEWz5nQnG+F4dmyBqlLfWdaJandjF4M2QX
	/CsMBkURKjE+8TFW2oICAtyg9vGpOaViY4EEQCc/jaR4YcP6xfSLyD8KpaHUsSiae3GxmbsSSzZXw
	K6Q+AwHP5KbfccrMZqLIgjJAXMaRlOX59A6W328iVcZdLgqE03MxuMcnFnR1l4J4WDKFGCMa8be/I
	lXohWiMofZAh+f0HLc+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjhr-0007aD-Ta; Wed, 30 Oct 2019 08:51:55 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjho-0007ZD-AR; Wed, 30 Oct 2019 08:51:53 +0000
Received: by mail-oi1-f195.google.com with SMTP id v186so1290442oie.5;
 Wed, 30 Oct 2019 01:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mziza5J/MoDupcgI0RkmxCcsKm60Et3F2KLUw+t1RqQ=;
 b=bfN2XgypiTJ7YSnMKgvXsqsoTQNtd8s8D834PllcoXOESduNRfh3ygjssfNNACcW/W
 VWOhGMRJcJKU5XvkEldxqgXO46s+Q7kTsThtOkGeqV0JcvUplnNMXVQ3Cgk4TJmCzODx
 UFdAsUvQ8Sl0LR6aom6tOt8jBs2RxXJ7c7LR8jMyfIBq3mLbWjkQwFuFJKtudSqoG7p3
 dpSx2IgID6LIDIZwJHGxGTPtIVjsZd3icgNImM1s04ldE3n1GndubWv8Hr0ItrZYn6rp
 Hb8AxkOkQqesV4j03R8iHpUt0mOU6IrdoUVVV23B5vB6DxhvlDgx2+3LT3D4gwhx+J/s
 OeKA==
X-Gm-Message-State: APjAAAVR3piavp3DgnBwIbIAiOHg0adnLN2lFikHhZlG3+QXlwi97/NC
 apsHZKBDPmB13vkN/YhBumFoebTwcdbTH3H+Zfw=
X-Google-Smtp-Source: APXvYqywm9C+CpnmelJ6SWQKVIah4mda9qPmB6OrDMq707nGOy+7YzCdX2/qccGqz5HinY9G/c8lSRqxbZE+WID7kSw=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr4822487oia.148.1572425510897; 
 Wed, 30 Oct 2019 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-14-hch@lst.de>
In-Reply-To: <20191029064834.23438-14-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2019 09:51:39 +0100
Message-ID: <CAMuHMdWGiHhSv=xCqnsUXok7wYG7Wr1EQh+yuPOZBxPCskUFVw@mail.gmail.com>
Subject: Re: [PATCH 13/21] m68k: rename __iounmap and mark it static
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_015152_361825_88944956 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 7:56 AM Christoph Hellwig <hch@lst.de> wrote:
> m68k uses __iounmap as the name for an internal helper that is only
> used for some CPU types.  Mark it static, give it a better name
> and move it around a bit to avoid a forward declaration.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
