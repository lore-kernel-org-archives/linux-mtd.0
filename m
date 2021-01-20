Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56662C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:42:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128992339E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128992339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qKvgaxgD7WrwUGDPERdCXHXEaouddSbZ76AIIguj+4s=; b=o5wFqIxj/HA8LGNRSpOLWBKb9
	FkiuWxWZypXMGtQZ11A3Sg1GbztHdYQ1uheZ9iprIAzu0Lo/aCcEWk1VXe9KV/nqs5iSahk2ia4K4
	0h6ybbbU0X/QEqzryNGe91VOZvDHs6jj8G6tvSd+VbzvHhverH3KtjYwZ5pUNMSy5w82r7IyYjjhP
	x7AyX4jlIiUUAZvLUPmI0ReTZK7msaNm2nx+fE1Vl2YA4evN1Wn3yBnM0MForso3EJdXXSdsIMqEH
	RXj80BLk8lva6fn3u6j+uEHdXGpnxAV5lu4l2vCAKj+aARfkKqCAg4g4VeXC/CzimwD7AQbeRNEHO
	O0ra0uLng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Fc2-0007C9-4P; Wed, 20 Jan 2021 15:41:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Fby-0007AX-EU; Wed, 20 Jan 2021 15:41:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5061423381;
 Wed, 20 Jan 2021 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611157293;
 bh=U5pHl/bDl13XXoNt00xkmb1grpKCo0LHMfGTYPyuPiA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hbwaDSo5qcMBsQgSCL4f/ZZwNDG0NPAR/eJlHtzC9OknwAO2zQTaUje7cYWEOyD+7
 Fdu2hMWQQY0S+arZX4ROrfJw/C6QRr7HzDsd548qQuyY5rpI+r1Hy5rpBkxEpVdcKj
 sApGGQJLC+MpWUVAOLQL0frz5+z+0R+bXl4GLoM4yMIlZKBuE2UmWdAJRaxzltWCIV
 kcCZEoL2iNT5JRIcGuiDOUYV7KkqgZGeQhdy8g9B9Pq0LYtExrITCg8i+EOyiaD+GE
 eMtUnmIQrpdTDlo+D7+hh6fWWWhP3oWzneNz1+d0//qsn7wniL7VY6QvIuzwqjwi5C
 2YRSe0Sc/GEhw==
Received: by mail-ot1-f42.google.com with SMTP id d1so3243080otl.13;
 Wed, 20 Jan 2021 07:41:33 -0800 (PST)
X-Gm-Message-State: AOAM533/GIvawInjQY48bS4wEK4B4T7jEwFXnZISruxkok9ey8PtV7LX
 RzlZuWSd/Tpb6MUMkngQlTdPXirUgiWHjilVl8A=
X-Google-Smtp-Source: ABdhPJw7r6/+HRYvhMB+K+WeJcCiADNCuffoxluoSpAlo3xz6YSw2gE2LG/LXFQjhrnqRvOG7l8Z+efglKcrkgAF0Io=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr7429505otq.305.1611157292731; 
 Wed, 20 Jan 2021 07:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20210120150555.1610132-1-arnd@kernel.org>
 <20210120162904.1a1588bf@xps13>
In-Reply-To: <20210120162904.1a1588bf@xps13>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Jan 2021 16:41:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3imz7hiir0iJbAN4v-SVbjQPPiieoV0PJ5UKgj4DaTuA@mail.gmail.com>
Message-ID: <CAK8P3a3imz7hiir0iJbAN4v-SVbjQPPiieoV0PJ5UKgj4DaTuA@mail.gmail.com>
Subject: Re: [PATCH] nand: raw: remove tango driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_104134_544603_0D24A854 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Mans Rullgard <mans@mansr.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 20, 2021 at 4:29 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> Arnd Bergmann <arnd@kernel.org> wrote on Wed, 20 Jan 2021 16:05:26
> +0100:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The tango platform is getting removed, so the driver is no
> > longer needed.
> >
> > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Cc: Mans Rullgard <mans@mansr.com>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I didn't know. I'll just fix the title when applying to something like
>
>         mtd: rawnand: tango: Remove the driver
>
> If you don't mind.

Sure, please do.

If you like, you can also add a pointer to the platform removal

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/

which I had added to some of the other submissions, but forgot here.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
