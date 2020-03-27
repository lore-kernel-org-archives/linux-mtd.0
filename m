Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6575C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 16:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A332072F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 16:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="siTi06zx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="od9Dqxoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A332072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb8zsdOIkMZd2+ShB9Lu3LjunNUiRSN0Tm7/n5EcVdI=; b=siTi06zxUmB6ew
	Pov51VwN9D1btvDuYH9Asdduoknh0AP3sFCc2lOHlBtVclB+Hha5FGKfl6w/DL54whZiEiUOpm+1p
	ao6VSR5wasVvPRNHwX+qGCI13sRADWffz+mJ1Gp44eIT+urMOvQV0semL4dfyWN5TesGadzSkkVJh
	x5HIrpO0CpQ+GmbIOP/IrP3ewvM76jL2QSlWzBLoGhWbSPksCJKcttgNVmYAaAs/d/iYNf8d1Uvm/
	NgcdKL6bpk0X/nMN4tLLiYhp/wksZzkbGwYUbSBLO8AmyCQLyGpHOCt/aKw8S58FeHdCIRrf4XNxH
	0FvPMW/YbmCEMc5f5YCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsEx-0004Yw-L3; Fri, 27 Mar 2020 16:53:51 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsEv-0004Yb-1I
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 16:53:50 +0000
Received: by mail-ot1-x344.google.com with SMTP id z5so10152479oth.9
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2020 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wlek8nW67YpAwQEVeC/FLJrQkav/43bJTmq/7Hu49cg=;
 b=od9DqxoqjebGFcOXMsYdOIZ/Lf4Vll7fxCeIQk0fSWfUDUUGpFLyU4YRTplfhNQUr1
 1yLaMtoh7zzIFe73LvQWtXgCaf2vxXwr2Av6bSogQpPCIwBi/rzXOYJeeq/YHVJS0N8F
 Ds/cfIcWlj9fFoEY1MUswrXOyu5Pd6YVRRvydhP3HLb5QRonZcf2EMGYvcbME6JE0ubi
 EPIi1wnJC3dCQzpOVS+/0CIpYGclVp32ytsTFkbSyztciHAQQXdXVuULFk4IyxwLNhyZ
 gTNWvjvxA7vzEBVyF8YZ0LKaYV0utxR0JudaLXjAH+p+GP3FpaC+aH72iVxfCau3S7WL
 bgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wlek8nW67YpAwQEVeC/FLJrQkav/43bJTmq/7Hu49cg=;
 b=cg7FOcHhRVYoJlz+Q8w8jAwlQr7P1ECDhT9jqcQA1nmovqdiW6Udrw93PKPT+rEE4R
 QArDJTQQlzFqwPBreJ5CkWyX4/wVuL0oN9+1LQpKoYXGqSAwZb39cx5Eo8x5q6Z6vxZI
 wJY/B+i2NoANnH2FSztQ78vi599ENj2Ul+4zKIE2so1ZUicyHWC0zg6vyv6WrrKJDg0t
 wGUpE9YoOvzLx1WgkmI6iRuu76Dz4F37bWyMkBLxgaVEm69vV31yj2hYuvMyaOUHkzav
 r5Zkherrg9Zt35sxXedj/gHLfc33AqrZeKbUzRiJbKwONvP5uG/5g/RTCgYGO2fuG2dd
 OPKg==
X-Gm-Message-State: ANhLgQ2NFuquLaI96MFKfGw7NYGqNslnGgQmF5ZyB3Zk/0i5mLGeVWz1
 qMduyphKfzbSMt/FTtGlXpfIpTPkHHHHPhGTNEI=
X-Google-Smtp-Source: ADFU+vvSLIXV7aB38M7LpdERmCi/GZJGZGtNczDQn0KeNOMw1x+R7PoK+KS+if5UIa9F7ZINDW3lacu2tJZML6qAWhY=
X-Received: by 2002:a9d:414:: with SMTP id 20mr11266384otc.300.1585328026991; 
 Fri, 27 Mar 2020 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com> <20200327171907.7a7ffc73@xps13>
In-Reply-To: <20200327171907.7a7ffc73@xps13>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Mar 2020 09:53:35 -0700
Message-ID: <CAP6exYLi0OnDd92b0uoAYm5B4x=+2h2_g+NXRnOSYaxkRA04QA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_095349_078775_990BA484 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mika, I have to agree with your comment on parsing the name correctly,
but the pci syntax is sufficiently flexible that I expect it would
create an explosion in code size and complexity and that is a concern.

OTOH, I can think of a few options: we could require, for example,
that PCI names ALWAYS be in the form AAAA:BB:CC.D, and then the test
is a bit simpler: it's a PCI name if id[4] == ':' && id [7] == ':' &&
id[10] == '.', and we can break the id from the parts at id[12]; it it
is not a PCI id, we do a strchr as is done now.

That would mean I could just dump this admittedly ugly change. I admit
the test above is a bit nasty, but it's pretty reliable. WDYT?

Miquel, your patience with this patch as I learn how to contribute is
greatly appreciated. Thanks for the tips. My last real contribution to
Linux was over 15 years ago, with 9p, and the real upstreaming work on
that was done by others; the kernel community is all new to me.

I'm going to drop this patch and start over and try not to make such a
mess of it.

thanks again everyone

ron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
