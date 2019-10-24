Return-Path: <SRS0=prEm=YR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD83DCA9EAF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 20:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A34621929
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 20:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2jgbcDd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A34621929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrxMPBMK4rLJnpiiM/ZzjDClWRwZDfqyadA8ADaZIrw=; b=f2jgbcDdbp7gze
	JcJH6gBPi0WHaY8DDclLWAB1ZmqOXrbZg0cVXkUF+lPcGViNyfb1thfQVMrLVwWb9n/fFtU3qbQmj
	+EUeJggc0ZmqaIk1DHlbmUUJBalBcz+BUfqVlgOTeppESmspZFiDuui615K3ANU3uH+BIhDbkdBI6
	fS4rfFP3jm6/aG7/wVMZ2+DX9rw+Fmam5T0wbBZBrtHPXYUws1q6yx9xDL63lmqsseNz6jmq3TtBg
	sXrqGlB1O5EY+5Z5rfWiUgV6JvvGn79vU3BKRLkvFBICENdl97nhWRZdOCnCmMHMK5Xsg7m190AF8
	be6XLn55WS+eKwbDrqvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNk3s-0001dk-To; Thu, 24 Oct 2019 20:50:24 +0000
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNk3c-0000Ti-52
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2019 20:50:10 +0000
Received: from belgarion ([90.76.41.223]) by mwinf5d87 with ME
 id HYps210044otT8A03Ypz5w; Thu, 24 Oct 2019 22:50:03 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Thu, 24 Oct 2019 22:50:03 +0200
X-ME-IP: 90.76.41.223
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/46] ARM: pxa: towards multiplatform support
References: <20191018154052.1276506-1-arnd@arndb.de>
 <87v9slg9k5.fsf@belgarion.home>
 <CAK8P3a1JDtHsOW=iaxEycbJ4TBkR9MHUyDMeJnwxCtb=tefnBQ@mail.gmail.com>
 <CAK8P3a0376Anmoc8VWXcEBg+z2B+1vcxJoywYYROBQNxpVmZuA@mail.gmail.com>
 <87r239f2g8.fsf@belgarion.home>
X-URL: http://belgarath.falguerolles.org/
Date: Thu, 24 Oct 2019 22:49:51 +0200
In-Reply-To: <87r239f2g8.fsf@belgarion.home> (Robert Jarzmik's message of
 "Sat, 19 Oct 2019 12:35:03 +0200")
Message-ID: <87eez1rhqo.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_135008_500163_D9733D86 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, IDE-ML <linux-ide@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Daniel Mack <daniel@zonque.org>,
 linux-leds@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

>>> I've now pushed it to
>>>
>>> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
>>> pxa-multiplatform
>>
>> Sorry for the duplication, I had some problems with email configuration
>> so my reply got rejected, let's see if it goes through this time.
> I have it now, thanks, I'll test and review as soon as I can.
>
> Cheers.

Ok Arnd, I have a preliminary test report.

I tested only the pxa27x (mioa701), which happens to have a lot of drivers, and
only the platform_data flavor (ie. no device-tree test yet). Apart a panic in
the regulator framework (which is a known issue [1]), your version seems
equivalent so far in terms of runtime to Linux 5.4-rc3).

The sound and RTC seem broken, but not by you ...

I'll continue the test onwards for pxa3xx and pxa2xx when I'll gather a bit of
time, and try to review as well the mach-pxa part.

Cheers.

-- 
Robert

[1] https://lore.kernel.org/patchwork/patch/1130436/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
