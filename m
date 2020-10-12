Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BDCC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:25:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FA32076E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxK4EbpA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPZ+CXo1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9FA32076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hj/3p3p+JOMJ/vLu3eCU1ZXMzRAotlbEHeIOcLydYMg=; b=uxK4EbpAZvGkuWM7C4kgOoQYb
	sLs7HOA2LmWHu6IT4cx+p3cIzfdi79SnF/CZh6IW3lnRfOc6B26amZodPoRIXHDY0FruCEap6myS5
	N3wwkGqr4Anis6UG4txM1AMtbIsyPj50eccBsfWLYfxwNSG/d/jarLyVR4ey7838Ke2Q5+WA1n1kY
	UFQrTmNrLoz5kDcPEyKtwHWuvQcnEQD/Qhz0d1/5Y7VCeU3dx1HxQ48MhDtqjXUZhVGhvBsUg22xw
	zCyZQcY4oBOJUIYetObIR7SIXXhnTl9PFYbAS1Wypjtm0YI5uuZosYe2cAg+NlW1ZRKeoVE64vn8R
	05aMO3xQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxoT-0007E7-2p; Mon, 12 Oct 2020 13:24:29 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxoI-00079R-Ff
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 13:24:24 +0000
Received: by mail-ot1-x342.google.com with SMTP id e20so15357888otj.11
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2020 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mC7xtiAV5MQw6msfzLlDYJwQehhrCEkuAMgCJCdFGcc=;
 b=UPZ+CXo1UV5jOGxJY7P+xbNAFkLhkVGYY1xnlSuZ2ChviI45NV8sb21mTxMuRgbLpB
 ZM02/KS3bX/yPLL3ql7ZQOF/PwJEqLuVbm9bojoWzDOVBBwIz4AwoqJZ7XBnN0880OZT
 IKYT72xbIrgQLGp1UPGULvPX06+wfl/Qi7isHHGJwYsglIzVBVu+9bwQdOlhFlKKgICG
 E1x2cE6wXLw6iJkRmt4Sb2ssxSFucElcyAg8tNyY9GELHk+KZyDpp9GNZ6VjY9dEW+u/
 Apz6hKqETjM6IefYaHtw2giItRk193NON9R/yY+tNP0rBFNxoQgxkaplTqUK6qPkQ6e7
 PXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mC7xtiAV5MQw6msfzLlDYJwQehhrCEkuAMgCJCdFGcc=;
 b=uXUVVuTXRvH2PidHX92FFTR82/3zfaNwAHjZsiUnak+b8ioeg+AliYF1VzxIMsvTWG
 k2+XmRqkNueUdUlgJc4LAGKhyVBGR6onF+pyV5P3pEWSvR5LL6ui1bUcFediQ7X73Rlp
 lA1lDAVBlCGnXUiziS4wHLtyzHoRGhgcpluQVrNmMG0rFJxhQ/ZTb7fmDG4+aiimhINI
 LimB/Lv9iIZDDwJ93X9uM4f41p91IyxWMnwVzlXAUzvpWSWOCEJOaWYl3rjCYzqct2Gd
 5L0GixwE8xGlyenXrN3dOeqfw6n6UETh5BK+3u2R+OyTmbR6GMWkz+w0NHTFtMTLaZPy
 gChg==
X-Gm-Message-State: AOAM5301B7odzQ05s0PKlhHwjGerhJGnAK/2MsIzdSxp0600G4zH8umd
 e2whe+DyqJOp1K4ywU+OWeg=
X-Google-Smtp-Source: ABdhPJympHYSIcwrRgVlC4dzn9r0ckdyy8oL+eOYjn08DRUgdHICzJxfdKIA24xGebtYK3RtFReRMg==
X-Received: by 2002:a05:6830:4d:: with SMTP id
 d13mr18526530otp.67.1602509055933; 
 Mon, 12 Oct 2020 06:24:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 81sm8681701oti.79.2020.10.12.06.24.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Oct 2020 06:24:15 -0700 (PDT)
Date: Mon, 12 Oct 2020 06:24:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: parsers: bcm63xx: Do not make it modular
Message-ID: <20201012132414.GB6394@roeck-us.net>
References: <20200928161617.2a1b2244@xps13>
 <20200929172726.30469-1-f.fainelli@gmail.com>
 <20201011141447.GA9215@roeck-us.net>
 <20201012090420.6a07599c@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012090420.6a07599c@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_092418_596466_1B9BE2B8 
X-CRM114-Status: GOOD (  23.50  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Oct 12, 2020 at 09:04:20AM +0200, Miquel Raynal wrote:
> Hi Guenter,
> 
> Guenter Roeck <linux@roeck-us.net> wrote on Sun, 11 Oct 2020 07:14:47
> -0700:
> 
> > On Tue, Sep 29, 2020 at 10:27:21AM -0700, Florian Fainelli wrote:
> > > With commit 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE
> > > detection"), we generate a reference to fw_arg3 which is the fourth
> > > firmware/command line argument on MIPS platforms. That symbol is not
> > > exported and would cause a linking failure.
> > > 
> > > The parser is typically necessary to boot a BCM63xx-based system anyway
> > > so having it be part of the kernel image makes sense, therefore make it
> > > 'bool' instead of 'tristate'.
> > > 
> > > Fixes: 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE detection")
> > > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>  
> > 
> > What happened with this patch ? The build failure is still seen in mainline
> > and in next-20201009.
> 
> It has been applied on mtd/next:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=mtd/next
> (I don't remember when though)

Hmm, lets see ...

Ah, I see: mips:allmodconfig now fails to build in -next for a different
reason.

Error log:
In file included from <command-line>:
arch/mips/mm/init.c: In function 'mem_init':
include/linux/compiler_types.h:319:38: error: call to '__compiletime_assert_331'
	declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)

I'll send a separate report on that (if it wasn't reported before).

Anyway, any reason for not applying this fix to mainline, ie why the
mips:allmodconfig build failure was not fixed in v5.9 ?

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
