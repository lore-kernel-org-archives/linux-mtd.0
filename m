Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18096C35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 02:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91582051A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 02:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxQvrxAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sns/ugFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91582051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3KKL+HAJiZkFUMJ7sa4eLe5lJzgIV4KtVbCWRUot/0=; b=VxQvrxAlzDba4F
	kkiWWVNrhTnkaEFDBS8bXbaIqQmM7EknCDADlM0vqpJMYltthbYrVhrJGfIPUW2tcWMdV7Uo25EVm
	0KwHzvtJgWlld+CEOqtmkc7YfxkPRVvIJGTpgU2ovmUy8Z7sDX6EH3zwJaIVGDspxcJ1/G0GfFCfT
	9x0EaLYor8SvZxhMEPkLpx6P95OSA77UMxE4dtAOk47kn7iS6RWrLrCC5JiekW+EsccfGAqioVkcy
	iUcg0k9aNhMXZZZG8uwvI/a5z8hYZR36OvkLc0CSntcBLxvmY/R+6CdFTlBh4jGmypK3DBVJq5emQ
	KCRmf4GntoPrXLMco5Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izAUe-0004o3-LK; Wed, 05 Feb 2020 02:32:44 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izAUb-0004ni-GC
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 02:32:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id l19so418291qtq.8
 for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2020 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qZQoN7XKSZgIcFKoe1pM/+30R5rKkDvommP9r1o/sc=;
 b=Sns/ugFb93KJbQC+eIhv4ELh6IOmgMbRxpzVPQzb2X658hLkrN36P631Pr10xwRWBD
 lB0On3V9qjvfbTMDveti2fFZpHcWrhqS4oDkx1IVdnKCFOQueFZf0ZDTsfsNwnNxhl66
 sbkinj1AnoK7ot1kURsO8bGgj3FnlNGntQKKy8FZrFt05F0pk3RB+0PvF5PtclaxtP2U
 a0iTYMTyMaxc0BnKZrsuezelTHe7QYBCRCZLOfXYTej62A4kdwlI6wy1Bxsw9MiFY0Gm
 4kNlPrt7wcpv3C9Yz0KarEpRzJ4OMQOgli7uQJalmQVr/bFjDOFU1yYV7zdGyA7GQxlA
 RAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qZQoN7XKSZgIcFKoe1pM/+30R5rKkDvommP9r1o/sc=;
 b=P/K0TfnWV6S86w/Ni60AaUuk0lg0I1tcq4R5fdGhT1V3DwsKRQXijw3OVL+7DHJedU
 os0+NDZpUz5wj/4l1lyHrNUIqT2b7yfBIFyyClkLTgqoNJcGMfO+MroWSLHhxl54hJsY
 znzHfa3Qb0wTX4ok4nOG+wJxh3MX4ILsevONcl6Vjkc/dz9hdpBG1VUUI8HSpxlC+NPF
 yHesVUxKWrY/pbEAC3CYChLuo51zJ1C0NoYt0RdeOlEWLMa2aIbA0yfh2/K9VmAJnSA7
 Mk9JAiZExAdIysNrj1t5qoCAQNKQzGQWXH7RGWaNiy5i3csAZWKb8vzCdXj7hRbkBGBL
 TFXg==
X-Gm-Message-State: APjAAAW/PuEs4GwuKuFy2GgqcSPbqxFcC7Jo3e25pH6jHWWG7IjQW7du
 hrc4BhALBna4xeQuBeVrVDODlb8BPekj013Ptbc=
X-Google-Smtp-Source: APXvYqxgSdvWA3mEl7hgGxaIEpoytOkZcysd5RRjf/B9xjBD0MyCXBhdVosIGmjYTLoKPAzaSwoHqulp0ccDoqTp4So=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr31369760qtr.7.1580869958738; 
 Tue, 04 Feb 2020 18:32:38 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
In-Reply-To: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Tue, 4 Feb 2020 18:32:00 -0800
Message-ID: <CALLGbR+8osorMEWUXW5BED=_Y1uYDDdheY+QNXp4hG_AwLgeyw@mail.gmail.com>
Subject: Re: Corruped NAND booting for all devices
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_183241_566018_D5F6D793 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi JH,

On Tue, Feb 4, 2020 at 5:43 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> It is a bad day we have 5 devices failed NAND booting all of certain
> today. The 5 devices running kernel 4.19.75 on iMX6ULL customized
> board, the devices had been running for weeks, the device DC power is
> supplied from AC via ADC and regulator, we turned power on and off
> several times when installing those test devices to test boxes in the
> last couple of days without problems, then they all failed together
> mysteriously today. It could not complete the booting to Linux user
> space, so I am not able to log into the user space to check and to
> debug it.
>
...snip...

I've been following your questions on both this list and the
linux-wireless one. May I recommend some reading:
http://www.linux-mtd.infradead.org/doc/nand.html

It isn't clear what filesystem you're using, though I recall from an
earlier email you weren't running UBIFS. But in the log I do see UBIFS
messages. In any case, based on your descriptions, I strongly suspect
NAND bitflips are causing your filesystem corruptions, and you likely
don't have the correct settings for the ECC strength as necessary for
your NAND. Or maybe you're not flashing images correctly and the ECC
info is getting lost.  Or maybe you're writing logs and such to flash
and you're filing up the filesystem. Maybe your extents aren't correct
and one filesystem overwrites another. Unfortunately, you've got your
system so cobbled up with user-space prettiness in your log output
that you're obscuring the kernel log output that would help you
diagnose the problems.

Some steps/advice to help your debugging:
* Stop making assumptions about what is or couldn't possibly be wrong.
Use evidence only. Test and validate each assumption.
* Fix your serial port logging output so you can actually see all the
kernel messages instead of the systemd messages that aren't helping
you.
* You don't need access to the user-space tools on your corrupted
filesystem. You could nfs mount a root via U-Boot and then use the
tools to analyze your flash.
* Read the schematics of your device. Understand how your NAND is
hooked up.  Is it correct?
* Read the datasheet of your NAND and your flash controller. Check
your configurations against requirements.
* Understand what your flash partitions are, where each filesystem is
in NAND, etc. Check that the extents are correct and you're not
overwriting.
* Make sure you're not writing stuff to your flash and filling it.
* Check your required ECC strength. Verify that ECC bits are actually
being written during use and are correct.
* Make sure your method of flashing images write the ECC bits correctly. Verify.
* You can use U-Boot to dump your NAND pages and verify your ECC bits
are being written how they should be.
* Enable as much kernel log output as possible so you can see the
relevant debug messages.

Also see the list here:
http://lists.infradead.org/pipermail/linux-mtd/2018-December/086331.html

I don't know what's going on with your system. You have presented a
large number of random symptoms, a lot of assumptions, but very little
real information that we can help you with. And from the information
you present, pretty much no one here is going to be able to solve it
for you - _you_ need to solve your problem. The only way you're going
to do that is to UNDERSTAND the problem first. Get the right debug
output, understand your hardware inside and out, and verify the
software matches the hardware configuration and you'll probably get a
lot closer to finding your problem.

Debugging flash corruption problems is a non-trivial activity.  Last
product I had to do it on took me 6 months of investigation before we
finally solved it. It was a combination of several errors, and fixing
each one helped, but of course made the others harder to find as the
cycle time between failures increased. Some problems were our fault
and others were caused by an undocumented silicon error that took us a
while to realize and work around. Buckle down and go step by step.
With luck you'll find the problem quickly. If not, take it as an
opportunity to become an expert in every level of your system. I wish
you luck.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
