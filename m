Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAABCA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 19:04:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBBA2070B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 19:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgvrW3zc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBBA2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/IIP2ycRRE6B1lAhRildvtTAxpOio9Gl3+yXtzkVKw=; b=fgvrW3zcqqDdpR
	dLUgzfYF97p6FgWq6f7nZVa8GSEninKNPsIOl/hnnRuLKMzjnUw8c9KRhOplUqfkugnq4/N2BUtnn
	NQtor1f/OKPXbF+Xtx/hj9c7tJBJqWJjTDxlEZ+NbpvJGD46EJQliudPGS0zFJeZ84CkMNAFEgRnT
	gPoUnlmuSNRe89d8NB9NKiQQQGyRCTg/CunR72KOFzFWmsbr0Ey6FFAdnja8MemA+dUljW4NzXOFE
	L5f3Qx0kfz1TrEOFHcwo0EQEEQE0iYADea6Hc9bQBz+6DXWYf/y72Pr+fJQQC7gTv3V501kgHzfWC
	/VpAguUgJxmyzJKj2m1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLXY1-0006XZ-7m; Fri, 18 Oct 2019 19:04:25 +0000
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLXXq-0006Mm-60
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2019 19:04:16 +0000
Received: from belgarion ([90.76.41.223]) by mwinf5d27 with ME
 id F73v210054otT8A03743BP; Fri, 18 Oct 2019 21:04:09 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Fri, 18 Oct 2019 21:04:09 +0200
X-ME-IP: 90.76.41.223
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/46] ARM: pxa: towards multiplatform support
References: <20191018154052.1276506-1-arnd@arndb.de>
X-URL: http://belgarath.falguerolles.org/
Date: Fri, 18 Oct 2019 21:03:54 +0200
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de> (Arnd Bergmann's message
 of "Fri, 18 Oct 2019 17:40:52 +0200")
Message-ID: <87v9slg9k5.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_120414_518278_07E1950E 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@arndb.de> writes:

> Hi PXA maintainers,
>
> I'm in the process of getting the old ARM platforms to all build
> in a single kernel. The largest part of that work is changing all
> the device drivers to no longer require mach/*.h header files.
>
> This series does it for arch/pxa/.
>
> As with the omap1 and s3c24xx series I sent before, I don't
> expect this all to be correct in the first version, though
> a lot of the patches are fairly simple and I did exhaustive
> compile-time testing on them.
>
> Please test if you have the hardware, or review!

Hi Arnd,

Would you have a git tree I can pull from ?
That would make my life easier than applying manually 46 patches...

Cheers.

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
