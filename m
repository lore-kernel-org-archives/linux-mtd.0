Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C66DC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 19:06:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44AD604D7
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 19:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E44AD604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOuQM8pgGPCPOPgFXvI2S4i15T73X7nv5QOTPTxgWFQ=; b=JSr98O/M8+caLJ
	wzbRR8VEuXInzSV5yAnpESq9ASzoqm8BhY2UwGjgnUtNBF7H9DRKe5DOa2Ea88W+VplmQdPBC0+/i
	82AbXpiMgkaN9159IUl2JwE8kJcEnK38pOAR0bNP6/GmcBNw1+hAiO1WwWEfd3wcsnasLY1lM7LGC
	wJDuETkoFTPdcC4WaMt47LkbTYkuHtaCUcgbuPhxng5m+/S2UOrL4SXWUCE2+uNOtG9YkRBRzcPwA
	y2364nuCD13PzVquz7JGK9I3Ehs/nV5cNajYpijz/JBnouTyf58kyhEG4wzqiCMuPJ7GiSsjgEUrS
	PDZiT84oUwrmaRF7KaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjnTq-00EkOW-JK; Sun, 07 Nov 2021 19:05:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjnTn-00EkNZ-F2
 for linux-mtd@lists.infradead.org; Sun, 07 Nov 2021 19:05:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id b40so1880267lfv.10
 for <linux-mtd@lists.infradead.org>; Sun, 07 Nov 2021 11:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r6K/HDk/5sXG3OR/4KUrGDRbz5Z2eOVXUmxNmMllvJI=;
 b=Cuycn6/QB+0/MgeOmvlXt+4lNtjwed3pxDuArqf/HMcILwTWRYgLPyWfQ3W1ci4g/2
 P8MNmFNdKEDeMSvfIG8aMHgiUo63eXC2m+IfbAtzLW5BJ9h9Qtm7mCJAsl/4o6nQvr/U
 O8HxRDhUDtnOL2gIcrsrzpSvc87OkdPj/H6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r6K/HDk/5sXG3OR/4KUrGDRbz5Z2eOVXUmxNmMllvJI=;
 b=CKNmB6Dfn5MMUw56TUCw8wRHQUp/E5zLydrhZaLT5YIdr1piDPnvYb83yGWbhYDSd/
 AValfuhbl6DrcB56aBnq0Gx0ArO+0fTO9N0ghGF6coicb54nrOaRRRs3CKcNdw9MrAZL
 zwdShE18YQ4Fo7PtnmXh5BaAFawgEErtIaZa2MOpxOMer8ufos0nkRpDOuMgQA4ceUDZ
 LP/wa+zcXnXhozLRp/CZiY19YNw8IKpHIWyCNtX5/Hi51CG5rS4SEwHMzRZWZ4ed0ti0
 mg5+HJiREc2/b1DW+nWFY+NO/+TvIoIMghhMqOJIkrPMdMF4uAny5KvxFStVSym0fEh7
 BcAQ==
X-Gm-Message-State: AOAM532D7s7rD+AV5X+aC3+l1PysToRsElLavWPlRa7O3En/VRdupBOy
 3ZeObR0gdCREVrW/IqoTYHGjCW/LYxoAxZSEQRw=
X-Google-Smtp-Source: ABdhPJw+RmGXiGlERotDC+Jwf69z5m9IGAxiEoMTjVNB+yb5RunuVQbU2p/Bm6tu0C1esCbyCxgxEA==
X-Received: by 2002:a05:6512:169d:: with SMTP id
 bu29mr70104609lfb.510.1636311920792; 
 Sun, 07 Nov 2021 11:05:20 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id f9sm1360226ljq.58.2021.11.07.11.05.18
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 11:05:19 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id z8so2389873ljz.9
 for <linux-mtd@lists.infradead.org>; Sun, 07 Nov 2021 11:05:18 -0800 (PST)
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr2270552ljj.31.1636311918266; 
 Sun, 07 Nov 2021 11:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20211107174555.2d1a5eec@xps13>
In-Reply-To: <20211107174555.2d1a5eec@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Nov 2021 11:05:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiFoXSsfQwa8x_Ne0HYJtnLcpku67QiRn+q5tXrqiyBiA@mail.gmail.com>
Message-ID: <CAHk-=wiFoXSsfQwa8x_Ne0HYJtnLcpku67QiRn+q5tXrqiyBiA@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Changes for 5.16
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_110523_563158_E1916AD4 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

On Sun, Nov 7, 2021 at 8:46 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> This is the MTD PR for 5.16.

I want _explanations_ for what I'm pulling.

Yes, I can see it by looking at the diffs and shortlog, but I shouldn't need to.

I want a short blurb about what the pull is getting me, and why I
should pull it, not just a "here's a random pull".

I wrote my own explanation, and then decided that no, I'm not going to
pull at all because the pull request was so bad and deficient.

             Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
