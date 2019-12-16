Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A79BC43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBDB206D3
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHtxN4DM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6ErLyRB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEBDB206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN8Knl5500iXowCwjqsoehtWjmO4dLfvX5kunUoVnlw=; b=IHtxN4DMaBk5UG
	+Z3CGaSJttRgQI7CbNbDXcNE9g/biP7CUM0uTeIx/CpJWttycJMdaMdpxknFw+0Leb5G8XyMHs15T
	rk53FHCD7JsOfkQX9DaF6mrwVvcUCCb26gkYTDC5QkRpnGlWnYYwgpi7oCrefF9aT6+OwatdKFqpG
	XfJ0QdiMEtr7SrenMe0J8fG0YkPqebSVEHLYWpKW0afoXZWuaBizK7A/4YrkxyHqjGkLK/M3DYvAG
	lQ7epOnYng8OD0RkeuakSfvmVrxcoDy1CpnPP8HRjPpDN7o2XVWjAtbueKakMCjFOKDYk6ZuWJa4Q
	px/TpTFdGuYynQVIUkIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ignuu-0005pg-5W; Mon, 16 Dec 2019 10:47:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ignur-0005pD-Dx
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 10:47:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id p17so6151876wma.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2019 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18RrYiuwhPg41ksFb+9Rc3HMXvIRoHYYzaNxny5Xoso=;
 b=n6ErLyRBLt3mySYsEKwgy9S+jk7r4+dqfTVtgP20W0FiVLDN/WDzNnZC1Q06YTlL6E
 DZ89nbcEyoiS5V9Up5SL+2Oe0IxxCIcEVKej8H82+ZZbOQ5HIzoRNOZJtyXOdnHDIrTe
 THlhHV+NLPGcqsWSDqCx1glOrOqrxhFMmWqycWgRb4Vc/dIH3lzUOInhZ5GvOKGq99bX
 CxHYXB+rIBpW2MbiWxoZ9Wlgp0mnAhgQbRSiJ7SRlelj/u5FH8baoLbgFD6rLvBQR66K
 R/CEngxSYdhsGAfOUFPbPQdCJnHwRhJLRUnSIbAFBeSb8q3cV4YJu0nHp2YNeLOR5iq5
 CEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18RrYiuwhPg41ksFb+9Rc3HMXvIRoHYYzaNxny5Xoso=;
 b=YwxtDAllJAIM/ZLwAwivNmHXcx6b5wiW75Kfxdn8MN+aENV/c4Wi+zGgLXj/Se+ggd
 M2NkXG+dQWpat1NhXBDUCesEqKlq0e/7c1Pz1rdLxtEcmROGtIN/tfs64UMan8OI50Y2
 axCSlx6qIaajS6zfQT8/3qIGwc/1NCdXEpT0iVhDubl6DTKbjBWsfzZWy5pVZW2cfSGW
 wCeCOI2/ET+3G2wnmZNi29EqxbZAi2UFdccgyzGl1kMIRyVpGc8IKnR5/CkA8e1Gc0AK
 HSSL8LDCquoDLlv4EgmPABnvqAwTj/KEZjVp36jj8kmlpO5BrtU+jzAVgVo7haQFAiPF
 IELA==
X-Gm-Message-State: APjAAAX9EsMJmwXVmU/MVf96r+2vlxo0VosaaVu5K0azWKQFBZdYi/63
 SE5jznigPf17vYgq2LzMbqgJhk6cZitxURxy5z8=
X-Google-Smtp-Source: APXvYqws0ZRlPGJiwN+HPcGvl0OksW7l95bU1CAQayS8Ft35MGFmhUOnc6KOuoKPqcsOc2frOb1427GD0BWt+pLLOZs=
X-Received: by 2002:a1c:b456:: with SMTP id d83mr14892145wmf.172.1576493272007; 
 Mon, 16 Dec 2019 02:47:52 -0800 (PST)
MIME-Version: 1.0
References: <4cb355340b844ab49671eb1068f45434@eckelmann.de>
 <CAFLxGvz2=LZkU769af8r46A+D=at2FQqr4cype5FGcSrsDc_bQ@mail.gmail.com>
 <882abf5cf5994b3db6a4d27b62b34b95@eckelmann.de>
In-Reply-To: <882abf5cf5994b3db6a4d27b62b34b95@eckelmann.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Dec 2019 11:47:40 +0100
Message-ID: <CAFLxGvxB_BCwBxJwA0Q1_Y63NbRUKdruiuLDnx_vpCuL8DRHMw@mail.gmail.com>
Subject: Re: Support for @(POSIX|NFSv4)-ACLs on UBIFS ?
To: "Mainz, Roland" <R.Mainz@eckelmann.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_024753_472537_604CFA1B 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 11:10 AM Mainz, Roland <R.Mainz@eckelmann.de> wrote:
> > -----Original Message-----
> > From: Richard Weinberger [mailto:richard.weinberger@gmail.com]
> > Sent: Monday, December 16, 2019 10:44 AM
> > To: Mainz, Roland <R.Mainz@eckelmann.de>
> > Cc: linux-mtd@lists.infradead.org
> > Subject: Re: Support for @(POSIX|NFSv4)-ACLs on UBIFS ?
> >
> > On Mon, Dec 16, 2019 at 10:09 AM Mainz, Roland <R.Mainz@eckelmann.de>
> > wrote:
> > > Are there any plans to support POSIX ACLs (or the extended NFSv4 set of
> > ACLs) on UBIFS ?
> >
> > Well, if there is need for it I can try to find time to implement it.
> > ...or better, you implement it and send patches :)
>
> Someone already send patches around, see https://lwn.net/Articles/657287/

Ah, 2015. This explains why nobody cared much. ;-\

Did you try the patches? ...and you can forward port them?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
