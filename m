Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4918C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DFF20863
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 10:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQj/EMu/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DFF20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+EAsnHc2K2DvBQ8egNJY63o6TCU+Kg/AUYnn446Sc0=; b=eQj/EMu/PQByuU
	8S3fobSmpWyPGvNVo/3jgqb22amHcKqdMuohaYU77gUZIzoaNnB4ei3TSWkEr6Fv3ZA+45nfxarrw
	jWDishAWGh5SU/h/3ltoTGntgAADgArpATwS2rSTqFZRziWBmjJl71E1YDJoPAytudVm6D/gzeuOk
	d6bu+fgEI8xyXnlrLTjwivkBniklbVm1I/Wr6I2AYMClMG0QoOwMOAe/AAESMcx+jNzGKmATOA/Vz
	vl0oBfBuwzTzKSGzFYTZkWAzztkdcBbmQrNFqxr20zE50iJBmYdxRSz3RUYU1mS473upaM8g7ovw4
	wTkHy4eGzXtf/PHqhHOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mpc-000141-Pd; Mon, 25 Mar 2019 10:27:52 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MpV-00012e-9T; Mon, 25 Mar 2019 10:27:50 +0000
Received: by mail-qt1-f195.google.com with SMTP id y36so9585481qtb.3;
 Mon, 25 Mar 2019 03:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWk2E7FS2keWQ3mp16IWcnefUS4l+ZTi/r4nGIMgIAY=;
 b=exw2rXdXY/FGu1CXrnSdvNPFSDAQ9sK0vaimW5wg82rUEyXpGxr2GGxiN6bJfTiP6K
 VBd/snLrb9ppJG41nYESmPfuxh4gyyaEs6pFW9HPwxVjn6qGvDnjO4pwrEND56JvLyXN
 0nh0OB6KluPsEZyN5RHl+9nslgOpnO6QoeQZPjaMINrdNU8D0TGaWI9DrpgRwBIsfYGe
 QCJpv67uAirUixf8n5Eb1CFiSgJhB5IEennJjptk5aZcTtseowaTlQJ67pM8QGbGJX68
 8Tbeo1aojeW3QyzU+ypyCNWtdFa1LVXQS7XZsHUYVBOMXWxNoyTeUc7nlql+/VYcF9H6
 dKgA==
X-Gm-Message-State: APjAAAXO51JrVOEzEfZ56zu3C72tsr6s+QdrYh+HIrxO5rG23OILz6lu
 Oi0FP/j5fc9O+/l9fRDGX+GiIenO44DjUz+1S2Y=
X-Google-Smtp-Source: APXvYqyjyImGL1pGf/aDVmDwHNjft4SZK7XiOGetAykXBVPrR+YAK8JAm8dLkG811rLOdSD5qF9H6YdvL0SvSIQwzSg=
X-Received: by 2002:a0c:b758:: with SMTP id q24mr19400309qve.149.1553509659744; 
 Mon, 25 Mar 2019 03:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <1553062828-27798-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a3BG_mxYxxCx4S_+ZKAer_+5FpmkzLk0VrACZekuD=2GQ@mail.gmail.com>
 <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
In-Reply-To: <CAK8P3a0GEYTbw5XCwzVeZe_-pGF=7e=1kXhH3U+fidnMZeP0CA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Mar 2019 11:27:22 +0100
Message-ID: <CAK8P3a3SRYAHSoNfLb7_25O8kP6faN=Bg--QNOzaL9=wVn=ycw@mail.gmail.com>
Subject: Re: [PATCH] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_032745_323989_A38A00AC 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Hansen <dave@sr71.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 2:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Mar 20, 2019 at 10:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I've added your patch to my randconfig test setup and will let you
> > know if I see anything noticeable. I'm currently testing clang-arm32,
> > clang-arm64 and gcc-x86.
>
> This is the only additional bug that has come up so far:
>
> `.exit.text' referenced in section `.alt.smp.init' of
> drivers/char/ipmi/ipmi_msghandler.o: defined in discarded section
> `exit.text' of drivers/char/ipmi/ipmi_msghandler.o

FWIW, the message up there does not match the patch anyway,
that was an unrelated bug.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
