Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A495DC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702F020850
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 16:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PgCjwXTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="QRJdZDNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702F020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3A/Dt7ASKBMvlrf0aMl59cM8WDLo7m+uzPX4/9occU=; b=PgCjwXTifY6j3M
	tSJ7n5sXUTg+z5o3ywMn0tYVj4AWEkFfvWH5dXJExvaoZKI5jEi+tD5UqNYm10Jv+ncBBwlZ6sShV
	oN0NGxMt4vJ9TNc/nkYeol5PSuJhmYcdYBTzQ27UFlrTdd9W5/QnobJACkE/Uofs7U6Wf00cml2+Y
	gk4cBCqmuxicLHM+pFuFWsWHunB9fYgKPy0CXRVgwQeRmUYjSrz66Vczx6wbm/aVmK2qM7tvYiiNs
	PzKN4/PoMTlQdIhLmrFrTjVS3U9UcOG0EeuQtNAaPCGZFbof92u/VIWycT+/7JQf5N33+9HUt+04B
	H4Gbb42N7RhLv0OrNikA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzlDu-0002Ic-Cf; Fri, 01 Mar 2019 16:41:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzlDr-0002I8-4G
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 16:41:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w2so26548251wrt.11
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2019 08:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+EmBwRCkceIJ84Go1Di5qNY/bQO17px/t/gjv8o4AqY=;
 b=QRJdZDNq5SulEtsCHR4rCoGx7O4GJiVOQAss9rno/CTmLGnqOOTWErIUwaIAVJ0HPV
 CzKmsz8isbAC0dMygW1X72m1eo9No8K/7d7rlj+A40jijoUSciLn5dPuE4PwNBGA+tCi
 C6log8UtDi1iv+VOSVVHcgKT88eHOUweUdrZU03guKPaRbHbZUE3QZKATHcb28lC+L2x
 TXD+8E9O1oOpIEf9KxoeUbNrG+M7RET8XgZkFbCvIcdgElJNhjQ+X9UKU9LgTkeHxjFc
 mlypnGsH4oV1s6ANC/mVDPnnrjwozxVXLH7TV+87Jgclh/+PX94adTEu/7aM89GQFaEx
 pTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EmBwRCkceIJ84Go1Di5qNY/bQO17px/t/gjv8o4AqY=;
 b=EAA2q7LJh3aFzip4Jbu3WzIOrpBb7yzkaQUuby5VpCZocdGK9UqvnAayw69PlgnP9m
 PDzgJiwnAEqnx7L7FhHiRoXWdQDz252ErE5UfBnj7hFdsAF9+YWLFJ4fWwpva2GcLThQ
 1QJ9RNNM4AW0FBUK1+ZQ43+lVlitIyTKP6TNY+xb17QYRHc5hzgDTjT+8KtwYgsQAsko
 IBNf5lQ0TGMyepRNEYGHiAa/bPkHoZmri8ZfxKwb3ZSiZUUjT2PKKVGZhkEViWvjGmRY
 nZkmoLZO3OD/i2Wg3cwINol04Icuh2vWKVu63WQpPo1hU7zE1j2m4vnfSNf21NC3+B70
 l7Dw==
X-Gm-Message-State: APjAAAUZzSnPnBogfP6N42FW2QJefTI9GIJZefRHje/MQgefQfXQjTsH
 ss92YS52SUnS/bXssx04OiBbw+boV3iBadBwBNIq/g==
X-Google-Smtp-Source: APXvYqyouivHBeNGZkfAAgdGIjt+DtByoiBnydgDWWq97TYuXZMbenCJk/A95h26PAoEP1czsApm5fqaMUEeaAVSxEI=
X-Received: by 2002:adf:eb85:: with SMTP id t5mr4140293wrn.168.1551458477246; 
 Fri, 01 Mar 2019 08:41:17 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
 <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
 <1778492.l5RC12KMDO@blindfold>
 <CAJ+vNU3VuR_VeN8WsPRBgyvW43UJnEMDKkPzkZEjnvH6TFZ02w@mail.gmail.com>
 <CALLGbRL6m1P8uoWVrAzfKzqem-pL6q5bbwhEWyHS0iCiuSLyQQ@mail.gmail.com>
In-Reply-To: <CALLGbRL6m1P8uoWVrAzfKzqem-pL6q5bbwhEWyHS0iCiuSLyQQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 1 Mar 2019 08:41:06 -0800
Message-ID: <CAJ+vNU12C4va7-cCKzxHgVftZ-omODefsnzmMMjFnQtR-+ZWbQ@mail.gmail.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
To: Steve deRosier <derosier@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_084119_172908_F634B21F 
X-CRM114-Status: GOOD (  25.28  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 28, 2019 at 9:22 AM Steve deRosier <derosier@gmail.com> wrote:
>
> On Thu, Feb 28, 2019 at 8:41 AM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Ok, thanks for the pointer. Is there a sysfs node that contains all of
> > those? I didn't see anything obvious. I can printk them for comparison
> > but I don't see this as a raw nand issue, I see it as a ubi/ubifs
> > issue. There is something going on at the ubi/ubifs layer that makes
> > the Cypress FLASH very slow for the ubi scan that occurs on attach and
> > the UBIFS resize that occurs on first mount.
>
> I don't follow your assertion. IMHO, if it were at the ubi/ubifs
> layer, the time it takes should be symmetrical for both your flashes.
> Perhaps you're saying "I don't believe it has to do with the hardware
> layer."? Maybe. Though I suggest looking at all layers and prove
> things beyond a reasonable doubt, otherwise you're going to likely
> spend an inordinate amount of time looking in the wrong place.
>
> UBIFS sits on top of UBI. Which sits on top of the raw flash driver.
> Which sits on top of whatever bus or SoC driver that may be necessary
> (maybe there, maybe not). Which then sits on the actual hardware.
> Unless you have another method of testing the raw flash driver, and
> through the exact same pathway the UBI is using, I don't think you've
> eliminated it. The most likely scenario is it is doing something
> pathological with your flash. Looking at the timing parameters it
> chooses is a good start, since IIRC, you've said you're not choosing
> them, you're letting the driver do so.
>
> Let's give an example - maybe with the new flash you've got a
> write-protect GPIO setup and that wasn't in the old configuration. And
> let's say it takes too long to toggle due to some really bad
> setup/hold times set by default because they're not configured. And
> the NAND driver writer implemented it with gpiolib, and toggles it
> even on a read, and there's some horrible timing bug in gpiolib... And
> since UBIFS touches every page during the scan...  boom - crazy extra
> time. This is a totally made up example, but it illustrates the type
> of odd non-obvious interaction that could happen even if you think
> everything is fine with the raw nand.
>
> Personally, I'd shove a bus analyzer on your NAND and take a look if
> the bus sequences it does on the "good" vs the "bad" chip case are
> similar. Likely that will tell you exactly why it takes so long which
> in turn will lead you to exactly what the problem is.
>
> If I had to guess, either there is a configuration error OR the nand
> driver you're using is choosing bad defaults OR there's a particular
> pathway in the driver that the UBI is exercising that isn't what a raw
> access would exercise and there's a funky bug there.
>
> Remember though - I'm not saying it isn't a bug in the UBI or UBIFS
> code, I just don't feel you've eliminated the more likely spot first:
> the code that actually deals with the chip in question. Go examine and
> understand the NAND driver and printk those timing parameters.
>

Steve,

I've compared erase/read/write speeds for both flashes and the Cypress
flash is 2x slower than the Micron on a 'per-byte-size' basis (which
is what I would expect as the datasheets have pretty much the same
timings per 'block' but the micron has 2x larger blocks and the chips
are the same overall size meaning the cypress would have 2x as many
'block' operations across the same size).

So, at a raw erase/read/write level the Cypress is 2x slower than
Micron, but ubi-scan is 7x slower (4s to 28s), and ubifs-space-fixup
is 100x slower (0.5s to 50s).

I guess i've made a mess of the description of the issue. I can dig in
and find the basic flash timings the kernel is using 'but' when I test
using flash_erase and dd for erase/read/write over say 60M I find the
expected 2x slower performance. I just don't understand why I see a
much slower performance at the ubi and ubifs layers.

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
