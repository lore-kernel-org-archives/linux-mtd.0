Return-Path: <SRS0=2SY/=L4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC75CC07E95
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 16:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD44F613B1
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jul 2021 16:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD44F613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QpiE5Bz8W/G0bukdPcKIYZ02xpAH9mkS3UzGAW3hJ8=; b=eXOhATztRX6qGV
	ticLVUIBKTkI/HkaCJnJe7IUllnwcyfYvoBi+cXPCOECDpzSnMDV9FWuG9EuGk3sjBihn8Coaqtan
	JBNRFI3imaAAPnVVnOsIy9Ilk5/ZMlv3dfxluNCOADCp7FUEAKJjBi5zYGSBH74/Z1Jf7JVrsEfKp
	62vS8dN2YsFn7X4FwHuZdH3tfD8qQnyXvWAR2oJx4kR3uNfoCbaxNGt/8dvo8zy1G8dcoiSwDixc8
	tkFdNexVkvhGNDokYs5bE+LmHFoxkPmuNOy6q0f7S+uvVpbY+0GTNEpa4+R59jChTFWlf3hrDvSzU
	LeoNuxD8I0L4a4ezOqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m04Z4-006VyI-T2; Sun, 04 Jul 2021 16:01:50 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m04Z1-006Vwc-IX
 for linux-mtd@lists.infradead.org; Sun, 04 Jul 2021 16:01:49 +0000
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 164G1LdU001577
 for <linux-mtd@lists.infradead.org>; Mon, 5 Jul 2021 01:01:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 164G1LdU001577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1625414481;
 bh=6HNc8VG/tGcCTwbJDZ5Jks5Dx/j6qMD9eu7GWnNREkU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wNuqCnDJeszwlWMRwggixesyYC9GSSNb4BVoj9s+4KoPRsmpG40FiMfGS7lZWS0rw
 Vju7775hwvZ0Ymko7dqLJR5sVeNmtGOK+qL1X5IacienSYlEX1tr9E1efYOLypdLNy
 9XM6svOhwz4yrVXQuFw6T5DLQfxO7PQG6pOyYSRv+EpQ/6TZPI6939ltfX2jSpBpdm
 voMqztZ9YNLnVtHS83PtyZ8cu/H0PCQETT4oXVzld3bvmU8qn8Pw5cVEhNiI2g/pbq
 SCIyQ8Y8i3LbWY0oRAXpMSZrbw0YXjaRATImPIsBVtZyWD1SqH4BD0ZoM+jJR1tpTN
 kcIaT3nFg1CcQ==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id c15so8700082pls.13
 for <linux-mtd@lists.infradead.org>; Sun, 04 Jul 2021 09:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM533mSBsTsUh0VEoHZStdM7yPkesHicV7CWRQGRZ4TpUHR99vacMP
 fIUHXY1xUHWVOhr9HSY+q+KL8oC7hnbjqb2yKDI=
X-Google-Smtp-Source: ABdhPJyUd8hDodVvk57P9D5cJOVWm0aBMKZx0VXs4hWaZHPG8ewFlyHJhF+kHHx66S20ClMVU2HYLZO67xrF8yJMaY8=
X-Received: by 2002:a17:90a:c506:: with SMTP id
 k6mr10433843pjt.198.1625414480779; 
 Sun, 04 Jul 2021 09:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200317071821.9916-1-yamada.masahiro@socionext.com>
 <20210630184741.GA1037365@maple.netwinder.org>
In-Reply-To: <20210630184741.GA1037365@maple.netwinder.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Jul 2021 01:00:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvYVyEQ4M_zEUdw9K9AB-RVErKoqFMQZ5OSKJF0AoBww@mail.gmail.com>
Message-ID: <CAK7LNASvYVyEQ4M_zEUdw9K9AB-RVErKoqFMQZ5OSKJF0AoBww@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before latching
 incoming data
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Marek Vasut <marex@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_090148_002205_476E9D61 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 1, 2021 at 3:47 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Tue, Mar 17, 2020 at 04:18:21PM +0900, Masahiro Yamada wrote:
> >
> >Marek Vasut reported this driver in the latest kernel does not work
> >on his SOCFPGA board. (The on-board NAND chip is mode 5)
>
> In a bit of an ironic twist, this change seems to cause a regression for
> me. I'm also using a Cyclone V SoC system, similar but not the same as
> the SOCFPGA eval board. The NAND device in my case is S34ML04G2.
>
> It worked fine in 4.9, 4.19 and 5.4 kernels. However after upgrading to
> 5.10 the NAND driver fails with "timeout while waiting for irq 0x4",
> just as was reported back in 2018:
> https://lore.kernel.org/linux-mtd/737ejrj81y.fsf@pengutronix.de/
>
> Reverting commit 5756f2e8dad46eba6e2d3e530243b8eff4dd5a42 restores the
> behaviour in my case, but that would presumably break the SOCFPGA board.
>
> Any thoughts on how we could make it work for everybody?
>
> Ralph


I no longer have any hardware to test this driver.

If you increase data_setup_on_host (the current value is 10000),
will it solve your issue?





-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
