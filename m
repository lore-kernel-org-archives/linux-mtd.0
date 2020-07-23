Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA138C433E8
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 19:58:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EA620792
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 19:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3YiwptAC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+gOXK8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EA620792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6a5fR/iqo3gimZY/gRvS6Jocj2oTQ98JgSWJvVOuarQ=; b=3YiwptACEN62u7V4w7naI9tMf
	shohUDPvQrExorS7AWHRIUGZBQS7wME09JQNcZJHJFiArETfoOLrzlyNwCtVfIXHSI35ZoIJZBVPa
	SPDBcS86G7mv1YpS/pJrHhpHTqeop9BH5pOxb33/QGiGGSbs/7v1Y3m1IfnuBGhvyEDOAcNYC9PjJ
	aYE4SLyJHiB3Q9FPFaueZP7AfDEP+QXL/JSV2olrFyM06LwbEFIJCHh0144PYr9ciZkuvPPYFs6Uo
	Q7URQW3i4kvU7GocT2xOvLe1AV/W4N7HkO3YIK5Y1L3oU0k3SJg1kzKeaXpL7vWiMqCbzkFfAa1yo
	8/yBJlItg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyhLS-0001yH-UK; Thu, 23 Jul 2020 19:57:35 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyhLQ-0001xS-DQ
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 19:57:33 +0000
Received: by mail-qt1-x843.google.com with SMTP id a32so5337693qtb.5
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2020 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hk1VOua7WA4W+2a0I8tnHK2NN+ZOxHTFP4Vzc6rLNi8=;
 b=j+gOXK8rtTNs77JTc+74zeZInWXCebPkiK/Qra1mP+D0F5cHd9qLF9OvxofuHVNkZQ
 Ewc7nDTdnrpEjzXM2dKHTWVQLOEASdds3607fOuHPynBxCAXEN1IgdlFSXnowoe8gQ5o
 3i6j+QdgSAd8X/UZlH+Aar36Bc4rxRx2vWtgTZ6FRzrL3jypvRUG0SaKfCui/w2d6iNm
 a5sBDMWAcv9OYSLfqz4tj+740k9AAuIavOY95lhSoEqn8GmmzQ0V/MyOmuy/d0coOH1a
 biZ3A+ZLRrDNRasMdi/VfuBrP4bZtRe+a2oxt3EjeRbdsJQT+/OhB+FQuYffy2qNvcY3
 TamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hk1VOua7WA4W+2a0I8tnHK2NN+ZOxHTFP4Vzc6rLNi8=;
 b=fRbYOvHG2x3tY+5M+E3OQI8l3rglt8iijkJMsJtzPyroLSxALT+6QIj5GfmrxO4Av1
 Yf82GKbU4W48hw9mJjpSm74ZbUxU/rEIoPzYR2cJPQDVg/R7DX5UHs3BHWKB+Um14WCV
 8La7dUpEp4/tmJly/hl0WfUCMQbL5byJzqtPMDNSl8tNsmCZIQpveSBRxnWET2wKGRT/
 k1MfLu0kII7TbRc4ZIP2BE73GwqrOEx4aSdcgD7P1ACoxo/JXTvepolDVtmz2hFeq7DV
 5grs4sZcAf5utuoNQRz3Nc5cs4Pl43FH/1DvyIt2IlLufEanFt+1vdlEJEr+MqutMxnW
 YBuQ==
X-Gm-Message-State: AOAM5331hi2YGIscBdIqBXtuHlru/V/KY2XHYEFGFg0Q7YlhYiJfF7ci
 M2MWYOk9E8X/rmiA3rgT5sCGz5wQLFF9s+qmjT0=
X-Google-Smtp-Source: ABdhPJyx2lXUQ3HDTMYdZgeEMfHMWEhRcamB/2Z1IY/HT2QdGNZBtXBBN7HtWjH6eRybQhV+lkurDSOe++dKQvFVJOU=
X-Received: by 2002:aed:2f46:: with SMTP id l64mr5986227qtd.1.1595534249528;
 Thu, 23 Jul 2020 12:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716115346.GA1667288@kroah.com>
 <20200723111827.GA1963557@kroah.com>
In-Reply-To: <20200723111827.GA1963557@kroah.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 23 Jul 2020 21:57:18 +0200
Message-ID: <CAFLxGvzP5wMUvXzTFc8S8oqfM8mereFSy92qwwmgg-R73Z9sgQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: properly check all write ioctls for permissions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_155732_464974_55924EF7 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 1:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 16, 2020 at 01:53:46PM +0200, Greg Kroah-Hartman wrote:
> > When doing a "write" ioctl call, properly check that we have permissions
> > to do so before copying anything from userspace or anything else so we
> > can "fail fast".  This includes also covering the MEMWRITE ioctl which
> > previously missed checking for this.
> >
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/mtd/mtdchar.c | 54 +++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 45 insertions(+), 9 deletions(-)
>
> Any objection to this patch getting into 5.8-final?

Well, I hoped to get some acks/reviews...

Applied to mtd/fixes! :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
