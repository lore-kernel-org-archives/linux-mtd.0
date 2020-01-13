Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A16C33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 08:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C3E2082E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 08:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eCnd/uuX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C3E2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eky4e/BEwzEDdKCEDCdXrw1hzs3Fj657xsW8aUOGkMo=; b=eCnd/uuXqgqPXo
	Rg29gUX3G0BcQzMCHDhl2hCq+KMqMQQj2EDNGVtXH0+kYuG5OAAdkVdiEYxCq+zJvRYK0mTIk4FVp
	bfSXIZGgm1fuykbyb3noP9j8lwkaFKEoB+Ikf3AnkkX9cYBVrlze3yBna3KUMVqJI+kZRlNcntA1v
	2y2YHjcY0VhdIyAFi1X9ftcheswYB5l8XJh3LXEDiwgz8SoH2dLIUViK6toFVONGKpjdgBlLJSOkQ
	0A0EGM2KFMJeqD7UR4nvtbwe6lO/X6fbSPgd9HF+7vY0QBqO7qDI8MQ3KRa93Pycz6XPXG/Voru6U
	Pnm59cN4JtOeWKAmDgdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iquge-0002rl-0T; Mon, 13 Jan 2020 08:03:00 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iquga-0002qz-W0
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 08:02:58 +0000
Received: by mail-ot1-f66.google.com with SMTP id 66so8126843otd.9
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 00:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X8Id6XgPA2ap+aeggUNQ70885pghkWz/XEq4dAjRKOU=;
 b=jcXYPX7ZGij2XB4MBsukk74Ax2Xc2Zqz75t2WBztb8z8Pes22PM60blc6fLsgOh0EF
 OeYGSGIRI9L9O1zbx8ip5xf+hAdN2EiT0WhDjYmE3qzWfJBNggclJHOJf6TtX6Tv+fc4
 Sj5QP7+CKdvDYUj/CzcMYr+44sn6+0eLLAz+xogK6v1NADVAp6uUi2C/aQ5Epaw6p/LI
 ErTZdULFFxp81Fqw/vGpcVJpfyPiBnopW1e/H+emTFK90DhqOvBOeHqy/l+0Ep/21keX
 58AE7raVMyJLhVjY1lRV+5GaAf0NYSGrv2iIKODPJ5jvu6U2KfLPSCmtKNCSmc4X+gS3
 MpLQ==
X-Gm-Message-State: APjAAAVvWEk8/xExsLx9yUP1arjohAEw9J40rZqD5APvVYFvGfzocMiK
 rej6Kca4OqBd+yKwz8lVQYaSYd9wki8NCxaRM0F8Ig==
X-Google-Smtp-Source: APXvYqxrTQxdCcBjcuZNb4i1DplR5hz8sBr2nJFdWUQiqpijAC8f2J0N8OKIXCudxmSmWTD9cr7n8tPRxo6bdGVvTh0=
X-Received: by 2002:a05:6830:18c6:: with SMTP id
 v6mr7330803ote.145.1578902575501; 
 Mon, 13 Jan 2020 00:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20200110154218.0b28309f@xps13>
 <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
 <CAHk-=whdsFSX0gTOiNkTANONgHHVY+8jUd1DmY2SJpdNOq5xJw@mail.gmail.com>
 <20200111145004.htnpdf6oaiksryxz@chatter.i7.local>
In-Reply-To: <20200111145004.htnpdf6oaiksryxz@chatter.i7.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jan 2020 09:02:44 +0100
Message-ID: <CAMuHMdUtk9m+BNrH1BuqGxWXR5h1DZmUasHMVKNYFxsd5wa5YA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for v5.5-rc6
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_000257_029165_9DA4E80D 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Konstantin,

On Sat, Jan 11, 2020 at 3:50 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> Things should be unstuck now, and at least this particular bug is fixed
> -- hopefully it'll be smooth and automatic the next time the epoch rolls
> over to 9.git.

Are you prepared for multi-digit epochs? ;-)
They not only contain more than one digit, but compare incorrectly
when using lexical sorting...

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
