Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E727C4321A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 20:03:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E5A20883
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 20:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OjjBOyhQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9H34ToU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E5A20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTVlGvxugDBBPooJsyK2fm/sj5wXFTnPuUtLv6s0DDQ=; b=OjjBOyhQqWw01p
	jTJlgQma6XmyYe7Gr2MypsAC2fgj11BH/LM0kpnCuFk2XJg6sopCRIh8FodxT7PxuA6GJ/RKwHryJ
	Ioa58sNyXQwarFmbB6MiOy6w86NV4PevMHn5Ul8JelDkbQkwbMbKOxnSsR9OxFoGxzKTgiUfm9MaA
	GkYVmcUBjvQdyquwCumc9hanl02HH+dhTDw9H/FZhLcS0ffq4N4PqTQ2E0Lp6zNcy3VmjxiovN1KW
	jU4pcn1TCkykWsHSbeYjjeP5RFm3yK1AxH0wuv2sldnPnr4Qhx8+Hgr417umlBW0RXhShovl0kdg2
	RIKTXfwdT56uAcuLU+Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hamzZ-0001Kk-1f; Tue, 11 Jun 2019 20:03:37 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hamzW-0001K5-29
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 20:03:35 +0000
Received: by mail-it1-x144.google.com with SMTP id j204so6850981ite.4
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2019 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RV2XZvKeHCt5ppTVA2xtZpaWuI8ggUAA1z+9Dn7I/C8=;
 b=B9H34ToUen3Bo1fx+8TmCQkb87rnYGQ7Eq9zOIQOakZliffIiP4mWASY+VN4UOjh/i
 Ew7jPQTWiPn3s/F1RF/sYQAsNqQgAjxIOgkAf2mGSAWcLKe3mTqNg0Qf7DEJPKb6c8FO
 NadVfE8tysk8WhnB+Y/Al8R8Pw9/KSf929Ii81Wh7AB4AVzK6H+Chb132JzJpmEgm0k0
 XRzr+jKmPCs+QV47JyA0iIs0WA8T5xM+BEzZOIFnuRun6ov0lW1BlmuqqEt4rHXfug83
 wvC/fx8J0BI/RW6Pi4X4Kp7DXwvcTxy63ctb3n8SczAYmi9cpNsm7qZjpJGesvcikdyG
 glyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RV2XZvKeHCt5ppTVA2xtZpaWuI8ggUAA1z+9Dn7I/C8=;
 b=hiZmKzcmdfCWmATUHCEoiuFAVek9hIBJegnH4nFkftDkg/MA8UstpQ0TsEnOgnjE5C
 ZgTGNsj4D8Oqgdov4zCzxcs2JCrv4zeWbaPzInNJj1rboOAHm4jc4JW3NpMx3UHSLcY1
 yAVDqgD9LKIBrKjunT3KiaQCrJx+dLOymakAEHnbuGhG5c3Lt/m9hajOsYI05ALazykB
 Xvroz8EirnlkPidROKi8rd0TWJPKu+AzWC2JdFo42EN63jLqSbOtHH5pt5K70DAvHYZd
 7bBC3eXPakcKOyXUO59EYGao/DCKv8GaQdzV6g2NWhrqgaKH3u7fI7ei6+ql+VYjG+0N
 wFsA==
X-Gm-Message-State: APjAAAX4CxHHS5f9qbdKptRoUb/mGenXSzhr7IN7RlyAWCj2eieC1h2/
 Qu37H/FjC+6cuSlzbk0XoRsDDkactua/370Ajdk=
X-Google-Smtp-Source: APXvYqzaDmtnM2/u2YwkAPf2ZtKRjdox7EPRLhSxBsUqpcGpOApjHhQFiYXQZgTZ0VHuAOFEa3uRcW4BbVw4pmV93SM=
X-Received: by 2002:a02:7b2d:: with SMTP id q45mr48125056jac.127.1560283412476; 
 Tue, 11 Jun 2019 13:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
 <1558024913-26502-2-git-send-email-kdasu.kdev@gmail.com>
 <CAFLxGvyZCpKthJevFHjjBQXo=j5f-FUip0MAsLy0HaoJzLZ2rA@mail.gmail.com>
 <CAC=U0a2UxMG2SuVCjv=TLzMs7Dg3yqJdxW6ft2tSQgEKj0C6ZQ@mail.gmail.com>
In-Reply-To: <CAC=U0a2UxMG2SuVCjv=TLzMs7Dg3yqJdxW6ft2tSQgEKj0C6ZQ@mail.gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 11 Jun 2019 16:03:21 -0400
Message-ID: <CAC=U0a3co4Ju94pEp4exDYNz=G7YnEztjdZWSjOBKTL+C_7g8Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: nand: raw: brcmnand: When oops in progress
 use pio and interrupt polling
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_130334_110478_37B0E531 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard,

You have any other review comments/concerns with this patch, if not
can you please sign off on it.

Thanks
Kamal

On Fri, May 17, 2019 at 7:56 AM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> On Fri, May 17, 2019 at 4:12 AM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Thu, May 16, 2019 at 6:42 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> > >
> > > If mtd_oops is in progress, switch to polling during NAND command
> > > completion instead of relying on DMA/interrupts so that the mtd_oops
> > > buffer can be completely written in the assigned NAND partition.
> >
> > With the new flag the semantics change, as soon a panic write happened,
> > the flag will stay and *all* future operates will take the polling/pio path.
> >
>
> Yes that is true.
>
> > IMHO this is fine since the kernel cannot recover from an oops.
> > But just to make sure we all get this. :-)
> > An alternative would be to block all further non-panic writes.
>
> Capturing the panic writes into an mtd device reliably is what the low
> level driver is trying to do.If there are non panic writes they will
> use pio and interrupt  polling  as well in this case.
>
> > --
> > Thanks,
> > //richard
>
> Thanks
> Kamal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
