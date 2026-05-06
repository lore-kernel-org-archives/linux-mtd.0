Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD5CD343B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjIfrM5FMl0a+fHZ7spDQokiJO4iL2HLrSYzO9yqCew=; b=R9CnDkuNfGpswM
	yakuJdYfky96WmOEFYDr3ouCeP/AdzgAyPV/iD7A5aJBkQ5heRBxFKgo5+I+Nm4RzbplyKMyjIrCF
	NtqPSNMUGRI99IWfWaF/ZcD9aOE+KjFH6Tw8sJYxIdmUb6p1QDB3NN7Qp74DLmQ8sX3c3cgXv9pmd
	L/D1541xROC/f6J6k7djWVFMK2AH/EW9iuiTfUGOotqm/RivtXDhEwW8rMABRvEW1QZXRhhwE9TE3
	d8DlRMsO0YTSYqkZWyIhLZzrNMSQa/YDLkdDt/yoeIsSUzqJ4A07w18Lm9FdCaYLNLv6+ZUExFf51
	kaA5PpTpiqHTVCMleHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKePN-00000001NYq-37vx;
	Wed, 06 May 2026 15:43:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKePM-00000001NYH-2tff
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 15:43:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso6752615e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 May 2026 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778082210; x=1778687010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fc0UCfWAi93QxZVKMurRg9gBAkKxhWc0Wvdno1Zk6bQ=;
        b=IklvhEnNcR9MdUEtlGbkuPuH8aH5m/bE4v8Bs+9rIKydbtZYXmT3AAgs3LQL8vhdXT
         O6GDsSNYoGnsj60w6K5UiPdJ1YqFSt8RvPUN/yEX7CQ5i6VjK+vHPIuK/KQg3aFgh1az
         QGsEX87RhLyP1uhMtDrZghvK/EYfFqencFWFKGUprl9gMpIrrr5Bu0C0LmcVKsVV/WPA
         newwoNj70jB4FBTVI1w7DlHM4ztI6JXSsYSF860LxktH2U74RtPKIRRhqRWQxDVu9iqg
         XC3e83oiYW00c+3fE5jGsCan2Vi/0vkB58ecd69BSWQ1BxQYPKqk8sA5PbPFgMIbfMwU
         9gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082210; x=1778687010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fc0UCfWAi93QxZVKMurRg9gBAkKxhWc0Wvdno1Zk6bQ=;
        b=pOddyrWtdRnx7h1nTWbsETeFOgW98bNukSxQ69rQ6OK0BUlWf1QbW2gt9wGRBU9U3M
         xTNn4LNlT2JMdSsMx8K+ilqy/LZbfq1+cOUG242k4CVfToKsi0DCJ2DsqK0Z2GsrxxHy
         N4g61kti59oavYhx+FxfG3MI66ybTxTTgU5lrqA1bLC5TPHyte132aiKPI4wnQ5xXStc
         PZDC/x4wF6PMB7zUo7/v6s4vcIGaGqTAKsVZFp02UUM7khbb8Ei1i/Jq3WFuSBQtOQre
         /8jcz2jDffOBhN69p9nqKrjomwjOEXb+aQFOEQiBO6O7kG0Utt/0RVb3qc5bE/UXQ8ni
         BYrA==
X-Forwarded-Encrypted: i=1; AFNElJ9MQ5Vx0EPMg03G6DViRLnELOYwCv1GeuEUYM+xcJ/lfEIfwcNPeTenyvRTPEHz7UulLmtq4CT00dI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2C+/26xjvtQjGY8ZNTw46tznsQ9LcBe+d8X9QuwNOoG7FmWsw
	x4gJOFfchCMG56dsc35AUDcfc8oyU9ZUL6ZcU3V/Va6DJFi3XNFlU+jG
X-Gm-Gg: AeBDieuxU24L1ySig21hsQOtmFww8/FHAVFm0c6lzGVhzivBl38GuDK3m4s2JGyJp/7
	aZOTSlvk3x8IQ/3ibfvtgzeHdn529DpvoelYUaeH4jPIAeKB07JsAZP2/HC8XsjY7tLF3TEtra0
	GK3OgjmRHQTS9c8vo9P266EZPx9SgwMbgk5FYezSs6zCscLt2EToWpQay1VSYE/DIbxCX6gMTjE
	5xevfG3X5HWL3UiNfhmgIWwoSxC6IkGs80kjz0/3yFadrQ8Aiud4sIRAuoMp7cPkeMiFpun08rB
	nfvMS5Zbz/rrwmZX3xN+r0jif+pyNyOkYKLz3ElgM3I1HDKrkpUavmr2BrfERJrwg0/6nAWL4lh
	Q3Cd1bjZ5OPcqNeHQYpFA2ZRQoPUB2x5pijzZpz7/cwGDTSmt2DVOojErgettoTihhwrQcZ4MWV
	ykaj7MI8CCpRwqQrFDaCW1lvuJXC08d7Kc/9Ic7jNMzIAlF2P2w+OcYbxODsHr2K3ISphDJnw=
X-Received: by 2002:a05:6512:685:b0:5a8:5b19:fd03 with SMTP id 2adb3069b0e04-5a887a9b5ccmr1445551e87.0.1778082209637;
        Wed, 06 May 2026 08:43:29 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393919f663dsm34884431fa.33.2026.05.06.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:43:29 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: Re: [PATCH 3/5] mtd: maps: physmap-core: fix reference leak on failed device registration
Date: Wed,  6 May 2026 18:43:27 +0300
Message-ID: <20260506154327.673283-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084332_735063_7A589936 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Miquel,

Thanks for the review. I need to withdraw this patch as well, for the same
reason as the rest of the series.

`physmap_flash` is a static `platform_device` without a `.dev.release`
callback. Using `platform_device_put()` triggers a `WARN` in
`device_release()` when the kref hits zero, which is a dealbreaker for
systems with `panic_on_warn=1`.

The kernel-doc NOTE refers to dynamically allocated devices; for static
ones, the original code is actually correct.

I've already sent a withdrawal notice for the whole series (1/5-4/5) to
the cover letter thread. Sorry for the noise.

Best,
Valery Borovsky

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
