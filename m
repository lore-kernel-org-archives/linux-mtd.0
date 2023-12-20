Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56982C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9NhCMtlsyPUidZNfuIDd58q6BdAj1eNe2kuVWWo+Gs=; b=eHVWSZJCLRpC4D
	xbVbiAiPHQppGQtQjX0OEKv/nqP2hGBgz/L8th12lwzJBiraHAKDCWO+R32H0tVxCdZ6F9t0N7yFl
	za4cCx02A5qAKggKtb0NVYbZsJDdpqbA0PhQ4BDe6RHIHiM2Iw/XkbGsuQkB810JUqG4BACwtn3by
	AuotWSEFN96La8UcLo4tqJk+qJJ6TPKZ1owhFrdQahEMmYn++PZwEfGfhMZrAQ6mIXaYHVo4DfhFO
	TNoGX9FGzR1l6YyPCzLes0ANurTdahbUyjjI25J9xYkaHbNyaDZHfYL8kGl9DSk0TIIZVeg83Dtv8
	fncp9BhkK17406En57EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsIn-00Ge9v-1e;
	Wed, 20 Dec 2023 08:51:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsIl-00Ge9F-13
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:51:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40d22d3e751so2620115e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703062297; x=1703667097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtfgLv97mV5DO9TnNkLsn4oa9MmDYWceuLZDcW6WRCs=;
        b=GKrAcb2CWsPBGMDLUgBs/9a8pl6PGzKWPiGvG6x0VoyD9s2LfIfatN9nq9S1ZklCp3
         N1WuxJe2In5Ru9Ha3azwK/bj8Xpz4jBu4Cn2Ed57Fp6H121QDtO2MImKgElHlKL0LAke
         hMc3nxmamTaS9m3RNfyywCn3380JqScOxWxT6WDr5AZ8hNZQym4CI1oO/Y37FnN6O0be
         Es9M22zUUpH3ynxkv36ko93plifBJ36FG133WQkrQwnYLTs2NqNltyKmXUNGNKGwS8hy
         StTkV1K/Ob68Bqu2beLb5tVlCtfNTQCBy/2vJasmWHP+z+VZlrG+rAJX6Q/G59kmsDGx
         c1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062297; x=1703667097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtfgLv97mV5DO9TnNkLsn4oa9MmDYWceuLZDcW6WRCs=;
        b=O8wgKN25sewRwl1Ln2PLF6IMLXPFUPzTEHvXXc6xj62TE2svKTm9Sg3G9iDMiFlEYd
         HTme1snEtPI5Q/+FCm63qokjdEDpIvxTvyGzbvGOLJ6VE2DJVux0PkDZNoMk74uM4V2T
         JnFQ8ht1mta7COD9Ab0ZnlVEbEsrpD26hWilE3UO3tNMB6P7z3kn4+T2CgoBFM81bfGP
         BxkguRqzh8l06ZfFdrHAx13Xb2PkLAfWu4h6soUR1B5htPBFppazijERSh8ZOZI2BVxs
         dYV/GT2YUTKBVk4ORShpC/06mUDtWMnfjB+LrhRMg8TNfxOcQ58wr6sUrJV0OAh/NHyT
         M7GQ==
X-Gm-Message-State: AOJu0YzCZy8Z0sp/KXZlCH13MUGbEyP8ydw2EYg6imQjAdmI6Zv6wWmY
	Rf4KXO5MoaTR73xfKqndJ1Wr08iC7SLQoMQgU84=
X-Google-Smtp-Source: AGHT+IHevkVtzLWY4Thk0wPFWCO8kIPI/j01K6/wMrTuOTxuF3jI+CG+Vou8zBvdiOuvY1k7+xUQ5g==
X-Received: by 2002:a05:600c:3590:b0:40d:2dbe:b25e with SMTP id p16-20020a05600c359000b0040d2dbeb25emr882142wmq.61.1703062297022;
        Wed, 20 Dec 2023 00:51:37 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id bl40-20020adfe268000000b003365fcc1846sm10866811wrb.52.2023.12.20.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:51:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pratyush Yadav <pratyush@kernel.org>,
	mwalle@kernel.org
Subject: Re: [PATCH] MAINTAINERS: change my mail to the kernel.org one
Date: Wed, 20 Dec 2023 10:51:30 +0200
Message-Id: <170306224472.10641.8697108168767750915.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219091218.2846297-1-michael@walle.cc>
References: <20231219091218.2846297-1-michael@walle.cc>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=tloYJ/VxN2gy2w43xs8TGDo0bshxdXBahz4hd3feM40=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlgqsQ137AdkHk/hreamHCQIRz1/ZJIE1RSSAq8 ZKniR8j3WiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZYKrEAAKCRBLVU9HpY0U 6VXMB/958O9O3xvLgiQGRIvFrYToubfyV8srZ5OU4HBYFsKeamX2rCBm0HAEZjIOArE5pDfJ4q1 toVSQbbMfrcXYPgllQg609ri55F0pMcHnwO4O3p7Ved4g4i11kcpKEEVHbImVIEITVAaxnFUo4g NkGUzd+V09d7LyRwUMYsWOkVm8pNk4JFEZhK8rbf5FiPB6G4lZqWnaOx4mmxBuWfwAGLR5OSPdc mF867HobDAIRw9BvGEJLEhpBa0hHfhN5tDN+J5a8aWrTyob+5dtit8O1Db1TheNn53hL0P+m9l+ ScCqckP0L3eEtjWClWpTgoJj1jyFmRluJk4pBTi4ujOH7ths
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_005139_361970_78290048 
X-CRM114-Status: UNSURE (   6.86  )
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

On Tue, 19 Dec 2023 10:12:18 +0100, Michael Walle wrote:
> As I'm doing more and more work professionally, move away from my
> private mail address.
> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] MAINTAINERS: change my mail to the kernel.org one
      https://git.kernel.org/mtd/c/3c0e1dfa703c

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
