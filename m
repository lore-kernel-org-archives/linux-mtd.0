Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969A2C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR6uHbKHUkW5mbsLkiDqorr/+IMh0omvMq4x/mlimrs=; b=v0HIXp7wdD+UO+
	J/f/w/q0D6pbA/L8Pix1aC0cbXdXpEoGubD55q7wUVBJ1ypgnlr0lygt+VeOzK3O7UjUIV4uldkiF
	tbbE40oq4I85X+/240ucS3dyWmQ+5WOIr4TAmC+k2BT0KgDwCYaal19E0Fqkcl1hfn/cBfwzQC66G
	5EqDGLGgQyiQGnb6HJoGeuEQFsu2YwtQO5XD2mh0nolEys/9IE6gR95uyCV+gJZsCw2yKt1AEMSiJ
	6YSJTDY9pDFwBPGScomb1AR9vEhxaskLNUK0I3FdD5Kf/sfG1zFMveBUeDf1yoxU8me5pNrdckj+Q
	9TPYL+wTnMSqruKT8/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkYSS-00CpJG-JF; Fri, 29 Apr 2022 21:47:24 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkYSE-00CpDW-U4; Fri, 29 Apr 2022 21:47:12 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4yJ8-1nsLuR35rI-010wyj; Fri, 29 Apr 2022 23:47:07 +0200
Received: by mail-yb1-f174.google.com with SMTP id w17so16691305ybh.9;
 Fri, 29 Apr 2022 14:47:07 -0700 (PDT)
X-Gm-Message-State: AOAM53289fAtS+pzoaSYuk5iI1VPmREOM29u/fSHl85JqAOsYVveKWPW
 dzAyvEV5TXNGqE5eBpvDLXv21xDeYHzgpLf9/zA=
X-Google-Smtp-Source: ABdhPJwtcBUeQCwBE/wHCTNSMt9GmZKG8b0zElf3XSRBB+ltEsvmy5fENkUQ3EnsgyBJ9WDIgobY6XmBd5vZorZaAUk=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr1535991ybf.394.1651268826333; Fri, 29
 Apr 2022 14:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
In-Reply-To: <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 29 Apr 2022 23:46:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 USB list <linux-usb@vger.kernel.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:Fc48ZHYBG2uISZppRFl/vxbG7kK5NbS2Pdg1Ttw8NUNvYSJoxrg
 5UW+jA9o+/6tASy46E8GaW5Gs9y5CU5fAOUq06bvc2YKwrPo2DPYCm72fVyOmqD3JM7Joan
 FfIdUWOKtDhuC5rIRlpCA9en3fq6LqUS2L5d62NcabuPXaT2tNwvnxn5RCHWBPA5EK4MWJM
 LRbcmoRp2XHnTuw39tXFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4USpV2TFre8=:aPKJ2S3JVlV4JZizc77uB4
 1jq5gFTMR0Qv8forxWokqDGTOgsGo6fCNRjrVFIKVnj5yMpvSSyksRQlnoxXh9x0vpmPyBeAi
 v6dhOcGFO1lrj87ze7Cbvt6M9lDbaizFOPeSrJtob2ERF7WN69TiRs2ZMsoGUKttixp9UnC18
 qv80uTkmYULUZgRGy9by0+h77J84R6j3lUW7Qnm2X7nqp9oTaI+7fDw0xEtMm5n1VhaRVHSyX
 dJj02F52NlKvfkR/tJgo3JknHnHLXTWf+ETWLn07fNA89Wmlp9v/sFn19sfgrxT1cXvRJkh/p
 m+dS85MjhAxexmZkVuln5LcbPZRDZrFwlLYgMXdcZFw/LCSvtj8MX0ngktTSW2u3Xi/FjnY1g
 PDCQ/l3cvEKHGR7NCjIZ5lVbyu8zSHaAJaAge91vBnMx1Re5wEk3cWcUs8JGrPCy3fRrKNMKR
 6ORedE2YXYUYvX1zW4BL0fqQSYY5TBbXt9s4LbCY7PJ84iRHRixXoUU4cYO/LaL/fVn3UOrb7
 bRdzeQ0WdKthWAleRnkJ0/KgaIbmktF7MYmFpZiuoCTZRdEMRoQKEyE1Mc0R0XsWXDR+E0LHb
 geFzBUIKqHgtn1WZb5rCQc3VkkDBVVkGSz8++8a00xqau8SV+7Gv7ga/wE3EonfT5aKxv9rPX
 V26oRkl0MX7hSUlenPMqojiOKwT0mUqHMcjHN6Tf5qS4yyiBANiwIkocj0TMjx2w6fh4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_144711_315699_68E07787 
X-CRM114-Status: GOOD (  13.57  )
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

On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/29/22 10:48, Guenter Roeck wrote:
> >
> > I tried the pxa-multiplatform-5.18 branch. Its failures match
> > those in v5.18-rc1.
> >
>
> Uuh, wait, the build wasn't complete. There are still some
> failures. I'll report later.

Sorry about the breakage, I got a few more reports about minor build errors
and warnings, the newly uploaded branches should address all of the ones
I got reports for.

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
