Return-Path: <SRS0=Rivo=BT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B846C433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Aug 2020 19:48:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56576206A2
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Aug 2020 19:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y59uDLAw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LTKE7gQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56576206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HkZEEBi92Wht9afriirQ/8A/S+0TPJzcRhACC2bpV40=; b=y59uDLAwFiql5kGVhunBRsaVR
	PYs4dzhLyrhzz5hPNSivDQ72T+tcjbajIXmzvnMJSTbC9tobu9RBLzjq+SLg0OGGFZfzYPFQezXLd
	SsW4XPQ0kJux+CZhBqeyBolB9jqT9r0Cv2oxaUslD5RiFY9dA1QMO1TO2A0Vp4t05HNzC6DXFO+mt
	7bPmM5YPwIMEVQkzUgNPTc6j+IHApxwu89aJqnk2b8qfbFF/SK5LMYB8zXpk7xrWDO8EtZ1c+ugU4
	YcDLGa6Nx1sK33R0G3Vc9dCXSbxjPxvHGdg5IjxTuapkr7g6G2qi2CHG1AMnXFLqp1VzsJNRE5+C3
	4hGAnmxsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4rI4-0006fb-Dj; Sun, 09 Aug 2020 19:47:32 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4rHx-0006f9-Av
 for linux-mtd@lists.infradead.org; Sun, 09 Aug 2020 19:47:26 +0000
Received: by mail-lf1-x143.google.com with SMTP id 140so3619833lfi.5
 for <linux-mtd@lists.infradead.org>; Sun, 09 Aug 2020 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vy2/Tr7nL0xv4oVageuubwhBrv+oQnLE6xMeTiKzlWg=;
 b=LTKE7gQHSMbXFk9BVmgefSL/wzopLbPob90qw8+5pHE5gKF0rhLL+EohGdbeXMjNcS
 q9+Yl4CrJIBM4pVPQ58/QvBFG4KfA/1bQIvG4TBGrX8oLdm1W5xqR6zgWfQVzINniybL
 6c1mtrtqdtE5kji/ppywZ7rFT9FwrRXNif3a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vy2/Tr7nL0xv4oVageuubwhBrv+oQnLE6xMeTiKzlWg=;
 b=j4ya20iBHMvt9mTJisLNmWudyUgzsbh3Di2ZJypBW//U7zsv+NdywWP8FY9ugughrt
 8AKnCSufkTf+E2LpyYmZuSF7rC4h8DG/JGnggdz2esXnlPXKHy+GkuEjhaqdoZB6Q/ym
 PEWfWfOzzlT2XP2qTJ7eHtx52YN+k8d+m4Kxvg6TrmY2nSLpiGTJkyYAB2rO+Cx3qTkW
 6io3+Tuieb1NltchcXF1CCLNRmIFhZavSx3+ewYNMTcfsh7gjPul1IPIyQY/nKwwNDUr
 WePLXftlG/8VR3TnM17GGkH4Q8qxFUpsW2coOGBxiev1cVpm+Qn1E6NTh6L+QtlzFAZf
 MWiA==
X-Gm-Message-State: AOAM530wtSGLFPxwsgbrS4L1Y0jUWn2/HKaJ/+o2iRcUpFgh5VAHlVRE
 pq7qp4SHS4bvB3LQGKPYSx7ecBOwzJU=
X-Google-Smtp-Source: ABdhPJwawG8pn1+elv7pnNs5qNbhcW8x/BQ8qNGaiaL+Ae6CXO5ePbJO6zwZUb8iDjr3Eb3I7gX5bw==
X-Received: by 2002:a19:8c9:: with SMTP id 192mr11495404lfi.204.1597002439587; 
 Sun, 09 Aug 2020 12:47:19 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id m142sm9473350lfa.47.2020.08.09.12.47.18
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2020 12:47:18 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 185so7366687ljj.7
 for <linux-mtd@lists.infradead.org>; Sun, 09 Aug 2020 12:47:18 -0700 (PDT)
X-Received: by 2002:a2e:7615:: with SMTP id r21mr10223230ljc.371.1597002437691; 
 Sun, 09 Aug 2020 12:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200809003453.79673eb3@xps13>
In-Reply-To: <20200809003453.79673eb3@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Aug 2020 12:47:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJ0SQjLeMiVvMXayxvxCmAMdROxyb-Pzs=kr4-Ba5BCA@mail.gmail.com>
Message-ID: <CAHk-=whJ0SQjLeMiVvMXayxvxCmAMdROxyb-Pzs=kr4-Ba5BCA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for 5.9
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_154725_504658_FB50B4DF 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Aug 8, 2020 at 3:35 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> MTD core changes:
..

You didn't even mention the stm32 controller change, which seems to be
the biggest individual thing in here..

Hmm?

              Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
