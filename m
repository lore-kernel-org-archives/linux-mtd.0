Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C9CC606AC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394D620665
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 13:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gdmiI3+p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394D620665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IYUsdQ1eG02ca6cfVZ1Lm/duGc6J9DV6NpJYt4BzrU=; b=gdmiI3+p44Lluk
	dLUyH3nSdtVWlJhd0S5PFBjmPiljefrM+2Szl6itqAfelfomzpa46+eiKDK46XgTUvmF79JjSvJBL
	IETd8lKhNOVCIn+XfuJfeEJIuhJ+FCTvvRMscgG9Yp554OXyGNSPpeV8Y+QCaWV1Po+7Z1bopzJpi
	T1m8a4Jh+aW5jDmiE9/JssHP7LAckgBgA18PCR5ipXPShp76136IVssjK86hFFwc/prWdH1S+vzSB
	snzRn7RYBFxferpv6/7sb9qmPPH4R7rSd40nRMK4Kp8xFPpyVm852B1DP2XW4fEknLcZnGYtsrqZL
	ShK48Ji8xOvr9NUqeGBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkTbL-0000iC-V6; Mon, 08 Jul 2019 13:22:39 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkTbJ-0000hn-Im
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 13:22:38 +0000
Received: by mail-qt1-f196.google.com with SMTP id j19so17907308qtr.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jul 2019 06:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ianVmwRDAhEQ4C+PF75ZdEJW6kcwlJoy+bjTJQWLCOI=;
 b=lPz7Y7MtUsqUyIztePkcd4jjWWsf3FbcOmrwdzHixJ2aJAp32DJuRl4XJYgDarmIqJ
 ZINv01pkzQ7meQf7GRCMSoThS02hnzi5M/sUdJ6sk1K7OvIOH8kIVbeBjvSZdiAk3MXa
 H1Nxm0DRPq+ROe1OgIJJMy8dfZGtbqS0y3OWUjLP0wTqEJwB9K2++FtvuDnnKg7BA9K4
 FdcIOuhpJ5FYZQOz5iiRrCvLTzhTvj8GZRDyhVmuQ3qsJdpKY6Z944RLDtoFfqUMCEZa
 c5+7KEiKpW3uk41jmqv0jCEQ+269SCQOK4scyywaedpwPYIuifzB7OXJ0aL3AfhYDV1n
 AMRA==
X-Gm-Message-State: APjAAAVOpKNXScuuf04DscYuy79xWDGjaeOzEhgfXoE60rqBnXId8s6g
 j15chONSQTbD+QufUKNioAkfifqCMFvegU3NgCs=
X-Google-Smtp-Source: APXvYqwGvlyqyuTOQcP4Ew9FgdI1S1EltFJFX5o0QUVXhfDjjabMoo+wnYAm0TtL8oYxpHT3TsbGlyIjjQLveuDBDjs=
X-Received: by 2002:ac8:4996:: with SMTP id f22mr13608655qtq.142.1562592152055; 
 Mon, 08 Jul 2019 06:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190708124946.3679242-1-arnd@arndb.de>
 <20190708145426.62b4aabd@xps13>
In-Reply-To: <20190708145426.62b4aabd@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jul 2019 15:22:15 +0200
Message-ID: <CAK8P3a3ajVPdhda-UdjnbnLYhM+XqedhZ2A5JY3mkQz0XxGv1A@mail.gmail.com>
Subject: Re: [PATCH] mtd: remove c++ comments from uapi header
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_062237_621245_9365152B 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 8, 2019 at 2:54 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Arnd Bergmann <arnd@arndb.de> wrote on Mon,  8 Jul 2019 14:49:39 +0200:
>
> A similar patch has been sent a few weeks ago and has been applied
> yesterday night so it should have appeared this morning in linux-next :)
>

Ok, got it. I had rebased to the latest linux-next this morning and then created
the patch when I saw the bug for the first time, but it turns out that this was
still Friday's kernel and after rebasing again, it is indeed fixed.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
