Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838A9C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5vAZVcPeI9O9sCqQa6P+CnEwClGVwuuPs8MArjHDzA=; b=YHvYvciYawKCpc
	vHYsRR7jJFSu/vUXN4HUsDv6WPj2NMVdEsLyXgHzC+aH3s6pCyYi4J8exiXHxfqcox6TbJo9AHxKl
	7IueyOFwLP1IsxeV2Sk7ikn3//7dB0iHXDt4QsL5zSl5aa0HZYdfEVenpu+/ENRzXghHD7g2pBudU
	BnRTni23OpdXVCWTMMyRcUK09KUf1+RvLW4Iidi6JbaOZ6rIcndxh+Pis1h7hwfUwCrVQJN367EWo
	g4L1Qn+GgXAwWPOR5V/W0ZcAMgbnzTerMYKgiPJrvbfWQgEeFPRVWEmL2likpMLed5mmsDOa0zU0j
	Z5SIoR9FLvcH0R4jaD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDicI-00HQ8R-0p;
	Thu, 14 Dec 2023 10:06:54 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDicG-00HQ85-1D
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 10:06:53 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5906e03a7a4so4635447eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702548411; x=1703153211; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+mnpBKIkvktVVWw5oNIRMFI7nwLJmu8xmakuMbH6HY=;
        b=JeuU2yCaMVyuyLq5igv/8mMfVMFxWe941AJcajGLtNLssc2BhcpVOWElkJPf9/+r/w
         8ag8m2VrxPbkaBS23Bep32+tUECLccQVyiK/DKOpUMT4xiArcbAmWa/SZZrxco4JbHLk
         FAxZB8gKjYqHdWBqroxdY2cogKOpLf2vad2onf227UieNb+eRrqcObKEM4XLDuhE54Im
         S1EPMf7UO1nO0kAip/AMdq+RusTtsDyRFgYubo7lm+88Ta0PCoaEOXm+pJhakaI1xTYs
         T7XxPHgh0tQiZviQCvJEdtkNPj0QSX0OZJSTFeng6uzAJQk7nSW62iv1/9w61oPbNh6E
         Qsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548411; x=1703153211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+mnpBKIkvktVVWw5oNIRMFI7nwLJmu8xmakuMbH6HY=;
        b=jE0JXUcvBgJAE0eIqYZmGs29Zhh/ykSL8JMNSBgRQA8MPr8lDiIabw6+f7Yr2rgRVM
         lD11ES7G72tSyuqH2I4fr10ZuIg7GKkD2Vzu9H853YT6tTcrDy0tboZNgYB5sTNpjbMo
         syVtt9lx5Zf85JGp1hDXQNOFTXYkwsJRycGJuRc+4IPHyR3E8eRRgCvxaVKEpe/fUfsj
         60uQboEVVsFEYd8yGZb5PFEpfrnppbPFKYv8YJIPjlKH3VxunkT0WQpHj36hl56DNWi8
         2tzpZbfOkFD3TRFMzks1vi7UjS9PQzODaXR4zCH6jdQJTwNOXKrbi3giQv+ZC2eFKO4Q
         bDBQ==
X-Gm-Message-State: AOJu0Yw7gH2/tEiD0sGpG3V9acYEzjug3ylgaTrjle+fDtpcSrkEI/Js
	edn58/lxiO7vQt9rr2CYdRG7P+QjjgPTy2gqCOQ=
X-Google-Smtp-Source: AGHT+IFcDYFTN6D4ttm2HVfzXV8xCMjdDJAXGZF3aK8bdHiKJXZ6DHveVitTMy5txMdFzFirsTQZhXAM3NAe3xVPuCU=
X-Received: by 2002:a05:6359:1a86:b0:170:21ef:3e71 with SMTP id
 rv6-20020a0563591a8600b0017021ef3e71mr5984136rwb.42.1702548411470; Thu, 14
 Dec 2023 02:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com> <d0d1171b2fd3e77774cffcd7112653aa@walle.cc>
In-Reply-To: <d0d1171b2fd3e77774cffcd7112653aa@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 14 Dec 2023 18:06:31 +0800
Message-ID: <CAAQoYR=+gEwUuw-CbWio7-h9jAP4ESQshF_Ao=Q+pU5jhpejDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_020652_419180_C2D88763 
X-CRM114-Status: GOOD (  10.07  )
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

Hi Michael

>
> Hi,
>
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >
> > BFPT 17th DWORD contains the informations about 1-1-8,
> > Parse BFPT 17 DWORD instruction to determine
> > whether flash support 1-1-8, and set its dummy cycle
> > accordingly.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>
> Reviewed-by: Michael Walle <michael@walle.cc>
>
> > ---
>
> no need for a 0/N cover letter just for the changelog. That can
> be included here below the "---".
>
> And you can also keep my Rb tag.
Got it.
Would this version be accepted or should I send a new one?

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
