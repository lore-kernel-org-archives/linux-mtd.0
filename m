Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3ADC87FCA
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cerrtt404ZzBWF1a7HUjj8awITSCZbROCIqvl055ls=; b=LUV3jIR/OBv7AU
	uSaA7kKkaacfF86Pw6S+/5hxOmiAyxdh25Wq8+VQsZ7iy846Z/PxQEz97WLz3vG1rVl6gsQvfvXKL
	Sg+XCCx55a+PqhNq0vByhSaawxcPEtujmw83/jjqg7EDMusL4931GYojS8H74kLtLn3+CmhfB4yLC
	glMz+uKYT4h0uFhytUqLEvTw+GBJLKpKka3qFnAHAv9sAYbkCNoVBlkxybC0YHY1EsZfp7qIHuxlg
	w67CgJ5rHVziA6mUxc8nXlnBi00qD5pFEfVbCI3YMeMj3wlJ/2i8e0d7gbJyC+9rGpwskZqwDcPFv
	QweWRyLXF/sLl0GqxWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWns-000000049Bc-2B9Y;
	Thu, 31 Jul 2025 17:10:52 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWnp-000000049BH-1VIr
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 17:10:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae0e0271d82so209565966b.3
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753981847; x=1754586647; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pnzLH6uf3DEV9O17GgRnugOfi8Wzn+Qhiwp4n865PpQ=;
        b=V5/PhBAoBKxzsrvhwWCrKcTKa9Nm+q50cqjq9glJPGxQyrfBb5mCc6d8hTRPOKqv4Y
         rlbVceHK+2ZRRP/Ak0F5QufuiDJ8fbGrgkYDR4aHlMzXlC7Ag7wMlahib+ektT88N/Eu
         5p6yTLVLPnaiFmAEgWCst6rVrYUbYZF47/dKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753981847; x=1754586647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnzLH6uf3DEV9O17GgRnugOfi8Wzn+Qhiwp4n865PpQ=;
        b=vFAOGYZwIRpzZxfxHb68gPz682C545mcrjj3Dv6Gy5L+B7AVEzkgxMYIAF1Tp0T3QN
         KWiWh4hiKNuQ7JzYGR4swqU7kOaKlcOvP5eQ3Sqv90mKQuV76Vpqe+aO7gf9jXO87s2O
         ySQNi/2Yhw6Fc92wrWu8KzwO3bp+SOPtCH61J6cjl/k+3KBU62WaIm2ILHyfdKSYOqip
         ONLYt5rqwgcn+3L7ojn1+DXEVBRgtui+3PKMxNCP8FHDkiETzpAbphl0Cg32SIcriGMj
         deKk1T+zR4D+2qVqlC110/vuvGhn6rrn+GSm+ZeZbOJkjoShWe41svhs8KFF1GBCMq/H
         GZQQ==
X-Gm-Message-State: AOJu0Ywf4mLFKzqbj5+URnC/ibbyxMnfMFDQULib58YjgzPpTAwhLl6V
	sC8zjg2Qz90LXlpTSz4JRJ/XMk1bI9ww2xzxSg4P48uXO2EZ7BBTlIVbHknSuQ2XSy7eZTzbXNq
	sJNpaX6U=
X-Gm-Gg: ASbGncuioD6OXr7K9m62Vf8dP34Kj/OkYFq7mCJLXAgQpGddlMkYEi5MWJupnaM/Qqw
	3NP8scyWi6fpV7Zlp29mD7QzFaQQgVqQpQyumU2ofWZOEZB8ELjdI+sTLQjCbpUQI8TyR8HRJzU
	pCwT5A5YP2RtL12Dxg5gCuTc5tRTm2GhXQc3uq1f4drW/mVUi/jEm636Fa6w9v7JUL6Yp9IBwjO
	8pAgCwaHw+Aamuiz/wnHSQonaR2z8Sy/oKYFzhdkecsaVYQKNm0bPR2KcOJ8ogg/VOUVVdahnil
	CuclzNtt8OKqbLbM6jcXAiQKNwoNYFwpwzQ5nhq2AQpxfbJDmjmrk8sGr3HOtUleCyITV2njZRs
	NCHN/i3hq5YaVFMf8psT6vXptSCccs0oTsMgycn4pXLqSBFyz3642RqPTLdDx4wZ8XbPuALvR
X-Google-Smtp-Source: AGHT+IEDljzuIXOnnB1J4TEkg648tlAB6LKiHYWtUn0Bg3CMbBTfQgNvwAGTv1SaABUVxKtjWkYJsQ==
X-Received: by 2002:a17:907:9707:b0:ad5:3055:a025 with SMTP id a640c23a62f3a-af8fd69b617mr883657166b.6.1753981847493;
        Thu, 31 Jul 2025 10:10:47 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92b650c8asm17858666b.65.2025.07.31.10.10.46
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 10:10:46 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so1842714a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2025 10:10:46 -0700 (PDT)
X-Received: by 2002:a05:6402:51d0:b0:615:9242:df7e with SMTP id
 4fb4d7f45d1cf-6159242e195mr6154463a12.18.1753981846212; Thu, 31 Jul 2025
 10:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <7787490.DFzTOozpa1@nailgun>
In-Reply-To: <7787490.DFzTOozpa1@nailgun>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 31 Jul 2025 10:10:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNLbhDHSqVke1=b0QV_CNpLhLxnELVK=5arNVsT0eRxA@mail.gmail.com>
X-Gm-Features: Ac12FXzs9mAsXY6GkKaxy_rsJ7KQpBBHN9lOKvPvbNi4FOy2MbcwFyubn9YlRn4
Message-ID: <CAHk-=wgNLbhDHSqVke1=b0QV_CNpLhLxnELVK=5arNVsT0eRxA@mail.gmail.com>
Subject: Re: [GIT PULL] UBI and UBIFS changes for v6.17-rc1
To: Richard Weinberger <richard@sigma-star.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_101049_421786_4806EA1A 
X-CRM114-Status: UNSURE (   8.08  )
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

On Tue, 29 Jul 2025 at 13:10, Richard Weinberger <richard@sigma-star.at> wrote:
>
> This time I'm sending from my business account because Google still hates
> my mail setup at nod.at.

My workflow checks the pgp signing of the tag, so I didn't even notice
until you mentioned it...

              Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
