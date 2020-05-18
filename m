Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C833C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B5B20758
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrF51x2x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FupRAN/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B5B20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obusucZayytmYqFP+tF9R74Bhpe3bNY284OL9XJ3FqY=; b=OrF51x2xzeykbk
	u0F5bjQienQ7rRKOZzNN7xbZ52YYZ4lyVHRzv2Bc75xt1vYT74kr8uozjchu944FUwW4Q/QUyllyU
	cTBZEJu7L6mVzfMz+g8GkGrMhtpW4lqkMEEUL40aEysq9SCHPFz6rZsgAMVpFkCs1oEoa1axVTRP4
	5RWPiQV30XVEQEYXpkvytAF8F7ZEmBDenZbpnzvmzWpEvLNffLkmctbYtwQuisSiCvCahYiZ8KcDz
	mJSPi3qMqp/W78rk0mmsh7qG7NoCJ7hJ92pxFbWQhRi1cTxisHqDhC9TuB/3+jEiQZVQvi8i6fRd5
	9otbjtKIXE20pRgu6QZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaeBa-0001Gf-AM; Mon, 18 May 2020 11:43:58 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaeBX-0001Fk-AJ
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 11:43:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id u5so4683773pgn.5
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2fiYTMGkA72yxkM7OqMlh+jTtVoL+5gotBtf6Ab1Vg=;
 b=FupRAN/PobQTaQAv55Hsu61uSDhgZ3yYRyGz8MMb28tAecTlaodhHWlWTBtxSxZsLL
 hUHBpFsd2j51DYacP5abkLC8bE0rQqecQGxlgDDhXG70Kp4nA0D407rBYGJrrN6WC3JW
 S3xYBq32QeVdIUofnBLx7OzpiOmgjjWSYxZ4huxWNohOM/1bvv1kWksiXP4exgRlnwHA
 mxmA2IVSXkpjectaLC1fgYuhtSYOjE+JUBx+StzEfl0No5bJYMY32wDd2kwSb2UXMd6/
 ef+TC7BOv19rXQ9ppgji3DX6OQ8nXQy+7mCHuWpX8NWB4NpxsMpp24w4Bq/cKSlzs4Z+
 4htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2fiYTMGkA72yxkM7OqMlh+jTtVoL+5gotBtf6Ab1Vg=;
 b=Ewp5vJNpyRZVq86Z+Q+hQI6mnS9Vtgv9zuMgyqsjtK0lFd+RBI+uXRvuCwNDctrkxJ
 TqojCcy81CVVo8lMkkGULpO5DCRSNVbw5Fb1tnQiSyiRCA38xO0vDxyLGNmDf4g0vJ2Y
 tHXlcIkXRywi3Dg7e82nY8Gy66yAVNBfIsk0knaZsLIag8fbEQ6uFnrwJziO3IeLq7uC
 SOZZoHW742Ae4UBWuBvdKpN6Dv5V2pq56RvitPa1RTXJKqCAtfZ0Y0/6ggEA4aZ+tdEp
 wPxC6417ElWLpXqGSEmCygQMa61sV7pEhU28A54fP2N1/kI4XVfhAfErQK4cB5D3eakv
 GiHQ==
X-Gm-Message-State: AOAM531ZRfTSY1gDoD6Sr8ggH4oe335sEzsT5kEeA53+hPIk5nq0PLTP
 B0Pmt6EaRv2TulQKgt3zmLfjC+YaONbacRjPxq0=
X-Google-Smtp-Source: ABdhPJyjDARrY4u/7pTXmySvEzdtyf7tJDRYLFc46T/zWf+w+QvLGa31DWfDx3lW7E/Y60GuBUgnGDnQNIZcaj+xHss=
X-Received: by 2002:a65:6251:: with SMTP id q17mr14337972pgv.4.1589802234387; 
 Mon, 18 May 2020 04:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <202005152142.AWvx4xc5%lkp@intel.com>
 <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
 <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
 <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
In-Reply-To: <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 May 2020 14:43:42 +0300
Message-ID: <CAHp75Ve_XjvvGBEQyhy=qVVJMFS+18j3aKxNxSQpGK5qJmzfBg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_044355_359255_8BBE1EBB 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 masonccyang@mxic.com.tw, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 2:39 PM Ramuthevar, Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> > On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:

> > iowrite_be32() is the correct way to store word into a big-endian mmio register,
> > if that is the intention here.
> Thank you for suggestions to use iowrite32be(), it suits exactly.

Can you before doing this comment what is the real intention here?

And note, if you are going to use iowrite*() / ioread*() in one place,
you will probably need to replace all of the read*() / write*() to
respective io* API.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
