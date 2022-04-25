Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8FAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbZi8OZPGDv5GyPxozOFuUO9Ppd+ezKrYxFZaYDnigc=; b=GG52Xra3wMWRDN
	Rcd2xxyh4kzYmUFnJfY1eScYKQNbwghSOKCaniHh23XZWcnrlbvEilM4N7yVNGkV8m9HD/ZNHjhcE
	vZ45UEfXRUajOoo51fGkfA3C0m5nfP6E3saA2CAZIhTk5WXVVE5RER/V3D/iy/hmAoJCAaBhGvy1G
	dNudRRIdiJgIj3jZyA8tMkCw7EX29Eznf0/WGUvrq/ejzsJZPc9FT/a7aD6RdUEMYltD8uw77j4kX
	BBEsv/ty5BR5Xh7N6VDcZcvXm8ArtkD1xrNmeQhsH2RaQaHnosh7wOblSf9jk2/UfMj8r+RUVpD78
	kYsIWv7dGGMiaFcI8Eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj1M3-00AHhX-PM; Mon, 25 Apr 2022 16:14:27 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj1M0-00AHf2-Aj
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 16:14:25 +0000
Received: by mail-io1-xd2d.google.com with SMTP id i196so16385562ioa.1
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2022 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ssvMxEnSf8Abrb4Q0sbcMxRw0VW47mziY0ir9WsjUiY=;
 b=rdSIv8F4IyCtcjNP1ZDImRtkXJpc90T6m82UbT8VJmvEHYwwMqS1YO8ja2JYfmut8q
 zgvazqVDXSKt4NozVdkoITXWFxnXxAgWlNsIw7GWWXcVuW+zGb88UZp/hPyIVOCLkV3U
 28UAN3emaodZP32790gYfTY4E/+wom8k3qDa/NZKfoM0hfTqk1QvYN2Ff5/QuXAtnLdR
 DxWDYe8QxfYphIsAWsyWzr0t9ZOY8xzf3S5QCFuM+u93x85QKF4JFu3iqyLiPahSEGU0
 UR/jXdyPM3K6Eq4sr4DGkq/qq6YUsc46pvRmlotDetdTOpI4nwAd0WoTwg63anAY7rHa
 SgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ssvMxEnSf8Abrb4Q0sbcMxRw0VW47mziY0ir9WsjUiY=;
 b=z+27mmCRl0eDZD0QueuSlJ1rG3UCeelJ4Kb8mlPrxicR07kcey8nPRPybh99uB5DHU
 MCBKCLFmcxCenqSl9KWaJ5Uyx/91Yn9+BR1FoXDd2Erp7CC7w7PnS7AX48EKTB9oxdBf
 YQ+PHmiaHIgN0gJ40ty/R0xD8uOXpmMep6wSr4k4PtS29/S04DbEej9PSLv217J6Voqb
 adBU6mWTf1FvJUH6bAr2/qjDPwtcq3E1FP/tuQwW4+Zn0ib36Ph1mQc0AH7UKxMZFefj
 vA0zJ8OgZ/NFR1H2wLn6VOpNdSnQA1MN2BwkhfoeqvT8aQ0v1AoG+dJc0mT5+iFF5TS9
 UXkA==
X-Gm-Message-State: AOAM5335Zh8qPoxIcrcHN0mG5fXZj+ZrTFEhvtAGKLckwyxduxCrVYC9
 lkM8nBnwlU5Dif6kLQc6nM8QTcHVLNcWNzUsvTltavk3EnI=
X-Google-Smtp-Source: ABdhPJwHwhHCFix6yfeXZwbsDXszZ/FXhdzTN89sEtbPiY/UyQK2PM4Z1FoeFd47bS78B8+uV6hrWZr0zMsEM/SejxY=
X-Received: by 2002:a05:6602:2e0d:b0:64f:8bfd:a83 with SMTP id
 o13-20020a0566022e0d00b0064f8bfd0a83mr7321644iow.200.1650903259819; Mon, 25
 Apr 2022 09:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220415001321.252848-1-jmeurin@google.com>
 <20220421234244.2172003-1-jmeurin@google.com>
 <20220425104201.173e65fa@xps13>
In-Reply-To: <20220425104201.173e65fa@xps13>
From: Jean-Marc Eurin <jmeurin@google.com>
Date: Mon, 25 Apr 2022 09:14:08 -0700
Message-ID: <CAL3wywVS0EyBNQ_vp+TDdxO1=x4PgTZoyzGJ8-5qXzhCd0uOcw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mtd: mtdoops: Add timestamp to the dumped oops
 header.
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_091424_427704_4B2429CE 
X-CRM114-Status: GOOD (  18.23  )
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


On Mon, Apr 25, 2022 at 1:42 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Jean-Marc,
>
> jmeurin@google.com wrote on Thu, 21 Apr 2022 16:42:41 -0700:
>
> > The current header consists of 2 32-bit values which makes it difficult
> > and error prone to expand. This creates a structure for the header.
> >
> > Some oops only have time relative to boot, this adds an absolute timestamp.
> >
> > Changelog since v3:
> >   Fix the printk format for sizeof to %zu.
> >
> > Changelog since v2:
> > - Add a timestamp to the header.
> >
> > Changelog since v1:
> > - Create a header structure to simplify code.
> > - Patches in series.
> > - Patch prefix.
> >
> > Jean-Marc Eurin (3):
> >   mtd: mtdoops: Fix the size of the header read buffer.
> >   mtd: mtdoops: Create a header structure for the saved mtdoops.
> >   mtd: mtdoops: Add a timestamp to the mtdoops header.
>
> Looks like the last patch was not sent to the list?
>

I'm not sure what happened.  I've just sent it and then noticed that
the mail threading is wrong.  Let me know if you want me to resend the
full thread.

I'm really sorry about that :-( and thanks for all your help.

Jean-Marc

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
