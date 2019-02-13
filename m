Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3577C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28DE222BE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JIwO7ntD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/sGSM+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A28DE222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+RLtXrrfwxISZHciywiyY2ov2pIqYmLyi2Kk9U5uUrY=; b=JIwO7ntDX2ZI4jxWUnBQhTnDC5
	tqAntAHLpJgHS1scwdiL4ygGRdZcPg9vl+xs5FbrG/kZBnjQGK3UuvIeFqmJ1o9eq4wXwDgWDpDGR
	ntHcYCc+pABwDcdFmiIDOIQg6K/dqicB6yHHP2s/zZNizAkoyVz/e6yv/iTmUKzoezx8NFpFhAt5W
	RtEhnIg3d2IfGlzf5dJzmh3TiD5goXbUgdMc791/coaGwPnkQEUdmE1RO7Ph4i+15wOMmD3SpUz7S
	HMhJXuom+YDzt9ESYbDFeCA/U1TEpOShD7AEeoxm1Nh1fUQdUjv4QQKifHUt5Z/GNLH8yfzs9qUD2
	tWqNeSqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtq5k-0005ul-6X; Wed, 13 Feb 2019 08:40:28 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtq5h-0005u8-To
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 08:40:27 +0000
Received: by mail-lf1-x142.google.com with SMTP id q11so1138114lfd.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2019 00:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=prnaCpAZwvPql7fGxzEVWLU24iV8YxDBQXOSD8pY2Ec=;
 b=C/sGSM+KqNcSgVwPm+cnTk040D94WRxG8dqh1SqA/oJbSrcUKBOIWbDCY2fFK8Uag+
 B6nDtoKP2t31QyGTnSUa3BQeC/Cfru5L9wK39Il8r3Y914TBG2bnE2ZW1On8tFu4JtAb
 +ap6DlJdG/Ss1x8RlZ0mCU0In7VpItiG7ri1DbtmG6oW9+VGxGWwQpbiKyaizg38RgTk
 kOw2EC8gGygz03TVYVzejGAKoDQTMt4kHgn39rFvqEkij5qRmRzlqWbS9UNU2C5vnlC5
 6EQE1WIalerhughqckz0Tu2NPKA22YVfLQVT1WRwxrV1rYBag8qYalZiCALyuY+On4vV
 n6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=prnaCpAZwvPql7fGxzEVWLU24iV8YxDBQXOSD8pY2Ec=;
 b=UJl70hMEMlfjx6cBf2I7TwaqveBS5qGbvsy7RL+cx5szZZbixQzaDoXPChXYfwLgiz
 fHFTziF7nDQk3hZO13RqPW1RYPlc2/dTI8Xxt4b3HYER0g+XJAXheYFhrJkGBRFG+X4G
 umYetu29QGB4696u6Jm1sf+TtkcqRHz/xbtXai+z7tTPZq2njOUr0iJkeulBxwenuyQm
 g5+cTqUNEyNdXLRAz8EOXMbadAlJR6Wqp5wVEy6C6392cuYXqQtHkl+Sm3zxTphDgRqw
 vGgYiGMIw7K03fCVdfV3dqFn4UQhTBPDawz60tBc0c6yMfTzs68ukyL2LjY1AU59wl96
 BRkw==
X-Gm-Message-State: AHQUAuZ4YAeU7h9WVB1sEUPLalUTVL4NOI7z2aqlWX4XbJRg0xVCHjPI
 qG3r8mC0LYt9O38dLy+07OoxOgcaMkZxQkIt63mcqQ==
X-Google-Smtp-Source: AHgI3IZAf3M7Ne8Fzo7OYn5QuM/dPZS+rStvS4bnjGpCiSiaP0jTq/K8vxx7TrMUxM2OfHQsRrgkE1IiT1IHQJb9mcw=
X-Received: by 2002:a19:7b0e:: with SMTP id w14mr5086518lfc.8.1550047223792;
 Wed, 13 Feb 2019 00:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20190123122910.19024-1-linus.walleij@linaro.org>
 <CACRpkdY5andeJnYJdNhTfQTbwjxBbXceBnOyBk7HWdgzqN73xw@mail.gmail.com>
In-Reply-To: <CACRpkdY5andeJnYJdNhTfQTbwjxBbXceBnOyBk7HWdgzqN73xw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Feb 2019 09:40:11 +0100
Message-ID: <CACRpkdbbRsdoryeUNAnFi94qH8JaEaW=fND6Rs4C05O72XY4QA@mail.gmail.com>
Subject: Re: [PATCH 0/3] AFS move and OF support
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, 
 Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_004025_966904_0E2AEABA 
X-CRM114-Status: GOOD (  19.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Top posting to Boris' kernelorg address, sorry for using the wrong
address, maybe this is why the series was missed in the first
place :/

Yours,
Linus Walleij


On Wed, Feb 13, 2019 at 8:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jan 23, 2019 at 1:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > As a starting point to fixing up the AFS support on ARM
> > reference designs, let's move the implementation down to
> > the "parsers" subdirectory and add OF probing support.
> >
> > More refactorings will be done on top of this change.
> >
> > Linus Walleij (3):
> >   mtd: afs: Move AFS partition parser to parsers subdir
> >   mtd: partitions: Add AFS partitions DT bindings
> >   mtd: partitions: Add OF support to AFS partitions
>
> Can we merge this for v5.1?
>
> If what you're waiting for is DT binding review I am pretty
> sure they are uncontroversial and will not happen at all since
> noone responded for three weeks on that list.
>
> The follow-up AFSv2 series would be nice to get in as well
> so I can patch up the device trees to finally have all
> DT platforms detect the software binaries on the flash.
>
> Yours,
> Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
