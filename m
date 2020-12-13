Return-Path: <SRS0=DDRD=FR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B601C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 23:27:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2807D2064C
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Dec 2020 23:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2807D2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h6v7z9AtcZI1hPxtoMbYem2T4F7HzxGlMlneJ75iChQ=; b=tBPnFRF6+JQdwCdJ1iZnGwtHf
	CVZFnXXh4BIBGntqWIa+ADJtMCp+4YnlrV+DCfW/kp6+RCKM1dCfTYvyqOx/9uU6KU781YSAB8OuX
	Be1CmsmAa4P0zfxRcps0SbX+rjzRc0PXr5Myy4DoU88ssa4TPdfrTUhWGdmR7AVFl/fTFjQChW83o
	3h6zmmWdnvx6q26pZRgKXkaQrzEWJoMuIcAd6JstB2fq4HJN6wj13K4nBijp5d5yeU2S4pWfxjqaK
	0Z1mSupHOKL1smaPfjn0ZIhHc3KKj9IGlf6n416ZYnp6k0y0459YQuRYT2UttmoC3aYtKym0nRFuV
	OSWmKVF6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koakN-0001GS-7R; Sun, 13 Dec 2020 23:25:47 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koakK-0001G8-94
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2020 23:25:45 +0000
Received: by mail-qv1-xf42.google.com with SMTP id d11so7067013qvo.11
 for <linux-mtd@lists.infradead.org>; Sun, 13 Dec 2020 15:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtQJ72HQtdfcAffC0RWWjlj3EllHxGw6h8fIo2FDXKo=;
 b=c20gFRT4k1+LbDU6DCix8rivM3H0Hven+F+jL8v26xgJLS/8Kq0bMQdJKaeXBFZeIK
 0SrgULTgkelJ9h0xkPQZ3tXqHsK2IdX9y0tHHRLu5LyzPjXRtKe3R7fEAKjpgMQhUaOT
 gqIarCWD0KOrwj/Xemc6+DPlDaKAx/sr2c0SNnSSGi0STCttOi+DaIfHAcwXyjHfeijX
 +NV8fARVH/k3DDRxjjzUazdFT+eu17cTf/Q4UrEjLJ8vaCBahqaMi9c/V9/qmAoJCmo2
 8Mp4mfTWWT1UUXx6L7oi1whCxuqwAv9RZQSBYMvdlbl5eUVuDz8ykWfWgks2epfLKmoc
 Sn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtQJ72HQtdfcAffC0RWWjlj3EllHxGw6h8fIo2FDXKo=;
 b=IAmGaJDVFSYzlCFUaOR2ZUOpj6r5WAAJHZQIquYVGLrC0kZuPQSThMcNicru+N+uQC
 ikrRm/eduQbUDRCdLX+F0bgj+Hy4szRUEVBZUUVP4R8ijyKBRaiTgmzC0Y3oe1YXFBhL
 8olvNSsU+h/Juxi5w/X+FzZsjXkPxdyMNt8jkdwBRxsrLpDdjRLQMi+/Vnl6DeiEhj/J
 JJT1VJAhDlBDIzIWOEQEAO1fh7Ac8lncW1scuf2lD6unLu7RgVeWHt/i1YInY0YAVNvq
 VQ45LDVOnFU3Z61a1VILQXNknf8wb/Wk0sXgPybUNzeSzpGvpIod1M4f3XdvRHVDNU6p
 yFcQ==
X-Gm-Message-State: AOAM533WdfkqVmZgmm32sjWP663ceRwTRFF8Pc4Ape9KJdSswViIGM1F
 gmWhOZJ/7chAU/MkaOeeXcVgkA/dTU6WNXDL9Bc=
X-Google-Smtp-Source: ABdhPJyH1OaT8lJP0r7mWKBxAGtDW5OL1rUPU//e2Go/Hk1RUMYbd7SIA0MYUoCS+yqpcQPYFHEZ6PGVacMO15N0oAQ=
X-Received: by 2002:a0c:dd85:: with SMTP id v5mr29860078qvk.60.1607901942475; 
 Sun, 13 Dec 2020 15:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20201201102711.8727-1-p.yadav@ti.com>
 <20201201102711.8727-2-p.yadav@ti.com>
 <20201208181050.z747aiiccoxj6xqz@ti.com>
In-Reply-To: <20201208181050.z747aiiccoxj6xqz@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 14 Dec 2020 00:25:30 +0100
Message-ID: <CAFLxGvz2LnHBFK61Dp7T-aSqdLY1xVLmuHQyOgxMQ9bmcZQK_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR
 flashes
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_182544_354842_B712A8ED 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 8, 2020 at 7:17 PM Pratyush Yadav <p.yadav@ti.com> wrote:
>
> Richard,
>
> On 01/12/20 03:57PM, Pratyush Yadav wrote:
> > For NOR flashes EC and VID are zeroed out before an erase is issued to
> > make sure UBI does not mistakenly treat the PEB as used and associate it
> > with an LEB.
> >
> > But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
> > multi-pass page programming is not allowed on the default ECC scheme.
> > This means zeroing out these magic numbers will result in the flash
> > throwing a page programming error.
> >
> > Do not zero out EC and VID for such flashes. A writesize > 1 is an
> > indication of an ECC-ed flash.
>
> Patches 2/3 and 3/3 have been picked up in the spi-nor tree. Can you
> please pick this patch up?

Yep, patch is in my next tree.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
