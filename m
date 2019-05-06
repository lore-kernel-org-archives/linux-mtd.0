Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71223C04A6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 16:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4413820578
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 16:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VvPwhyXR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFjOeO/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4413820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhL4xyCiDkNrLgaaH1rEpdtiTcj98Ob3cVZM3xWYIvg=; b=VvPwhyXRateY1f
	gPisIhoZj40r6oSyqvki/oqzL0Bg83/dVXBLrULSEf5yEfvWvUcaemq6fzv9G1lcIuvSy2weC01Xz
	lzzGrsLQXAdHcL4CCr7aNCFhzL/oUYJsOpH4+MuaHTOR5q9xWU4BF/b7XYIIiG9CYEqFn0wOATxFG
	2CinFpl9rPK2AG50EuAEzCIvKNl/P7iL4BlF6UaMkNjQRuuI4N6CkVPlQdfbhmoGN/48Ncgpev2WA
	6IbRwMrZQg4Evd2rY8Os+WGx7Mjl99UX8aW5gxQQxdrCdja1mR3I9PzVK3vpS26rshj55BLOrmGzo
	ejrXDEoiWyEXINGITWEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNg3U-0003GD-A7; Mon, 06 May 2019 16:01:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNg3R-0003FU-Dv
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 16:01:26 +0000
Received: by mail-wm1-x341.google.com with SMTP id y2so16140090wmi.5
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fq6Rg4IrSXPz0SMvZAQc0O8wglN6Db1bmZTbJ+slX3E=;
 b=RFjOeO/I5XhStfzmJFQYBRPDHZUykmUhET0RReJNY4I9bRGCiDw4lSDInj2U38cEzk
 7YGN88N9V+gxpa9w7vcmHKrMfiFns6uWgE87rU146nYYorCDyP7XgPszmYLCvtH7ExD0
 XHmjaJIMcfCcRajHst6iDgbtlByFQwZFpt2kWidfbFYFhOLGseFoykmBhDxSqfabZmlz
 1InpFXE+7EFtU4WWDTpA4u87IJo4ThNDSZEvCKVWIFNGBorfqHx0y/LruXmsCVq7mx37
 HApyk05SuYYF/MmTjZ2OekM06PnohPQgGbzvQyB29pQAWosqfHFFzUco3NEfoU1xpiYc
 vDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fq6Rg4IrSXPz0SMvZAQc0O8wglN6Db1bmZTbJ+slX3E=;
 b=fkF8k8rlsoRATKPP7Hr1qpgSCIAWTowsT/NhUGVLuN7ePlfCvs033xIhNHfhiIq02t
 ohyiTXESpP7xFhinv0EbPpQ4Yod50+zJGVON5PV2FuMEwHlvqkAnoT9e8AaPtHK3i7TT
 C45p7pUXgnnXxhC1GZCtdrKziTMJI8LLprXmsXa+LaFOHs83dJBs/ozaqk7iBUEN7JaD
 zJTsFnRKCWu/zQMCeqPOWVG+xw0URupl44vcIGECXoTr4C0HmFkeHqvlOE3EBSTqCLOB
 E8Stryc+ZdrdisaIbzjyq6nTsU1GvIJbJagrIWw+AGvNZR8uPxpa+UD2lhOw2WLRhm6e
 cjLg==
X-Gm-Message-State: APjAAAW9BGidpm/l76GQF8OJV6CFssKmtMpT8URWnA3gKCZ9jJOtxbSf
 jBwQxPxt8XLrDMFSeoqWU4Y3ekSWvsz9a0Negtw=
X-Google-Smtp-Source: APXvYqwvZx2zTdRL4V8WUBMU7IKcJzlOh/R1MWEl5ktXcx9mgfuI5rurp9Bxvg3iiCgsZSJ1ro+tEr3Jdk9c56Mt0y4=
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr16725128wmb.110.1557158483845; 
 Mon, 06 May 2019 09:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 6 May 2019 18:01:11 +0200
Message-ID: <CAFLxGvy7B2K2AX0nSe549QF-gDMZcc5F4X0Y+yzRrnYfL9svEw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: raw: brcmnand: When oops in progress use pio
 and interrupt polling
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_090125_472040_E499A90D 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 1, 2019 at 7:52 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> If mtd_oops is in progress switch to polling for nand command completion
> interrupts and use PIO mode wihtout DMA so that the mtd_oops buffer can
> be completely written in the assinged nand partition. This is needed in
> cases where the panic does not happen on cpu0 and there is only one online
> CPU and the panic is not on cpu0.

This optimization is highly specific to your hardware and AFAIK cannot
be applied
in general to brcmnand.

So the problem you see is that depending on the oops you can no longer use dma
or interrupts in the driver?

How about adding a new flag to panic_nand_write() which tells the nand
driver that
this is a panic write?
That way you can fall back to pio and polling mode without checking cpu numbers
and oops_in_progress.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
