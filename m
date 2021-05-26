Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F11FC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1695C613C7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 17:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1695C613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJzhYlE58oB9uuM19Tf0W+kE9gfNzQiYdTYoIpBfxTA=; b=P3px5PYVCCevIH
	6rD3MB0vVXUqjqSCxT9R4DJGQt9GT0ivYTUs0kwX/TYv8mua1YGDPvDAr6ky2SO7YSAN1zvU8jlP/
	bfmyLoacsSJjkQJ4jW3+13fi+oo04WGCjuy5hypnmkDjN+Yst7PUetMorajcVdRmGaI/EXhFBIs04
	k2gZI0x8Cc/MSGOfIm33nmCf3rEbR3rWhGQ+8xoRyaGMH3GaUR3kIm4fa7L48KQ6Ctv5PVccebqcE
	eqYdh0xxqw0T54JNtAtTbIXizW35b0/jRS1SvR/Uz2UDnkRQ3bXpm4aICQRfsjvndjgHL7WOMTWFN
	AYhOBsL0yNNWNrVaY7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llxGV-00G5eX-SB; Wed, 26 May 2021 17:24:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llwH9-00FgnY-9W
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 16:20:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id t17so2406459ljd.9
 for <linux-mtd@lists.infradead.org>; Wed, 26 May 2021 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACs5Rl3DK1N4Ca+Pvr9cXnCEW3IY2qw+ccZrCgkzOc0=;
 b=As/2EqTLCKJ/yJKNqg6zFE3a4KWtp3I6DT9rwcOBWk0BG9M9E4AaRHfSFlFkxoPq1S
 F6X1LxGOWzW+8q5INftO97YwmeuJpMll+/kl4Y8yBLfn49m3AFnLnR3iiar+mfkrszCr
 SKydZyoiTnlmh/L9UEtI9nz9lGoeK0l1PEI6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACs5Rl3DK1N4Ca+Pvr9cXnCEW3IY2qw+ccZrCgkzOc0=;
 b=WmMbC1wjC9yCWkZYbGAuhknbBbgQAS/AKxfrkK7eMTN9RGpbOqfPoiSlrXxCa4Mszd
 o2x1B2wJ9jQoF8UXstedzeDd3l1Nl66stE3DNBINwRcYxX/ta+So7S3ySaB+D4bUNps0
 c9579f6iu/nxPsO6UQEdHQPEdy6T6BbmmrIFQVWyLmOWbZlEbU+s4cZtEtNzYnZ4uE04
 3wlAMvXIJ3I+SGxpzqz7N0VpCeYmCuAtPngeeg7FGU1+yS/t+oWy9LDjYLvrFYkDc4IX
 t70ooVNyBft9Qxh9D/R0KUrGlTbWhIbSh82Af+dtj2X1INPrwZA3b+0oJ4W52SSKxXCy
 1HGQ==
X-Gm-Message-State: AOAM530yaRNB6MjehL3i93eab/iW0tv8CVudzCcj+kKXik38GPDUOdag
 QWZu6p4jgd2PfWKSJhCbNkNJU2ezkjHVKmiS
X-Google-Smtp-Source: ABdhPJz+xnOJ9KUDMEwt64Pp0yNpHVUEZV/XCnazY6E9spKPe3hIKTNEpd3ERFtttYwu1RgZMS8bRg==
X-Received: by 2002:a2e:9787:: with SMTP id y7mr2861217lji.65.1622046052775;
 Wed, 26 May 2021 09:20:52 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id z38sm1536286lfu.142.2021.05.26.09.20.51
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 09:20:52 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id f12so2425629ljp.2
 for <linux-mtd@lists.infradead.org>; Wed, 26 May 2021 09:20:51 -0700 (PDT)
X-Received: by 2002:a2e:b04c:: with SMTP id d12mr2814321ljl.465.1622046051160; 
 Wed, 26 May 2021 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210526175924.4f9ab124@xps13>
In-Reply-To: <20210526175924.4f9ab124@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 May 2021 06:20:35 -1000
X-Gmail-Original-Message-ID: <CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com>
Message-ID: <CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for v5.13-rc4
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_092055_699277_E9279A7D 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, May 26, 2021 at 5:59 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Raw NAND:
> * txx9ndfmc, tmio, sharpsl, ndfc, lpc32xx_slc, fsmc, cs553x:
>   - Fix external use of SW Hamming ECC helper

Why are these guys all pointlessly duplicating the ecc wrapper
functions for their ecc 'correct' functions?

The whole "the Hamming software ECC engine has been updated to become
a proper and independent ECC engine" excuse makes no sense. If
multiple chips just want a basic sw hamming helper, then they should
have one. Not have to be forced to each write their own pointless
wrapper like this.

These chip drivers just want 'ecc_sw_hamming_correct()' with the
proper arguments, and it seems entirely wrong to duplicate the helper
five times or whatever. There should just be a generic helper - the
way there used to be.

In fact, I would generally strongly recommend that if there used to be
a generic helper that different chip drivers used (ie the old
rawnand_sw_hamming_correct()), then such a helper should be left alone
and not change the semantics of it.

The new "proper independent ECC engine" that had new semantics should
have been the one that got a new name, rather than breaking an old and
existing helper function and then making the chip drivers pointlessly
write their own new helper functions.

I've pulled this, but under protest. The patch honestly just looks
like mindless duplication.

               Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
