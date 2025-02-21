Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC23C021B5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFQltlnLjLBK14qt4ehabl7A9zsGXtjdy52mfMCdd4w=; b=EskqrB/qiylsDn
	7xaxH8wAf1YkTba1FNVFd/tO8uW4+TJ5hH3YRupJSW+nEB54GPJvzt1gjjq8N46MjrMEDy+KMvDvr
	Tu5BHFaO8Vc5tIoYWh7BHBWgSve03AR4ZTe/POpc8NlRCdfdSq2TAkT2dsWw0D27LRBSrv+E8xlPY
	LSGvzUfIm77RO2GUO4sXx5lg4KiOHpopZhmJaE3lNpcBRU13WziLfG3dBdAlHpG9JFUIFunWwlp2w
	WphRFhO3KsXac6kJWq9Z/eRL49ZWzJedbVPJpeKArqElKzPasdHy1uBCdXia6rcHvYOgpOHPp2pVY
	Ug5IRxK26qyaJlW64uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYGX-00000006aZS-0d4V;
	Fri, 21 Feb 2025 19:00:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYGU-00000006aYi-3m49
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 19:00:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220d601886fso38575045ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2025 11:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1740164445; x=1740769245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77hh0wQ+sFBBrkK6MEd/a6yvUwrcItGhllYO30mC8s0=;
        b=jfRZKL6cBMSj7h3HN9KYh2P+W6sHzoanA1Md+9XCMzhX6N7gakBzKpfADbnAJr6bzB
         HkDfymb4OeRBU4k5sPOsa4sVyi9zuXSmuGlVEPSIu9c9hOEa4uaOSx/9e78bt1zoO0bQ
         grBNeb1ZklolpoHBecZ9pdkN6Un9EmqMthO+inuZAyUQxIBaOCuATusMHc0vEBbWkQuR
         INtwmYFwW+9fxGUrSgP2tn+VbAIuVPgeCv/Q9/u105ap6+4asHkl4aysZxs+ZP+G7y7H
         VO+qxpg/oHcOYDosevGGjY9V0iBaBTI2gBB5J0+tev03EXN7lQu++jZCQ2Mhjo3Rz6M4
         SXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164445; x=1740769245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77hh0wQ+sFBBrkK6MEd/a6yvUwrcItGhllYO30mC8s0=;
        b=trae2xm/CrXORY4uUrkfx1AvE+tD33FCTp+rnchqQ+xAWLA3ONB4aMsdySFIJn60Y4
         WooynGdLe1LGMt9+GiC2KH47MlCVLjQvXEEns1IvueKORbSr6ojkVoQekiJMmgGLKrtA
         MEVwaKJNfbxwWiXb6k3kUOXXklNedCH/ReYimMiiqw5gq3rf5yBkPfEBujYTqmNvShPk
         9OyvKpjKCxe16apBuWXj5dnH66wh2W0I5LvcQ3nAa0r/mkolv70sHcGsuAeK6xHj/HwL
         2/d+/+ntBFJQlGJeOqTMDdnvYjq24+74wgFW/T55j2Bm8GE4Ss7IoklYHYfsenthodhG
         TUBA==
X-Forwarded-Encrypted: i=1; AJvYcCXwAkVHbCdF0rGvcpzu2o8DTxgMPsXQ7SI4r2MGNZnwH6gMjH4zEpYiwEyLHTQzOqvAcgtmvj/Zq14=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoOC7nlDcMsenwSJSS3Cu1HyS4b7jlGbyVMbrz6OKxIXlJnmWs
	uzFGeZvO5BSAlGJRcydcZ2e+zxuI3Vgkb1oBQy64RThovzFT6ROvcbOr9FQm20Y=
X-Gm-Gg: ASbGncsp2As2ynw3A216xJP6OhMR7falSpW5IoQObVfC0qUEf0camkio6mdFEsRs4/d
	YeDpXILXiYK9VGwH+Ojp1y7qMQd85EPFJcdLWAvAPDPXwO63wnFsUdVcdKV+AJjrcPnCM+pefsd
	u/3NNE6/i4vQ9jbpb7/wCd+yDxhVyU5B7AczSQDtdX8WYbY3fLKbGOWDHS0qtUXDXCFM4pJ4BEC
	+b3mgeRqXoIOFjWRJaaWZhpwvkNjLq1D3u2GyhCgwSVmWVwNThgJ8yyCklA1RRDmT35B8UMD1V2
	jM++5zIlORWmfSd1SMIbGzm6I6b+QO1AG+bF9V1AVbtKrIkLP/qX1yokWWLWztnMC5d+r2nWJZV
	CIcU=
X-Google-Smtp-Source: AGHT+IGGJurj1ywGFGfMqLad+W4V0w/HWPMlDvnZ5WiNoOtzbXCiXiC9jiI+n/maSmmLogJdgVe5uw==
X-Received: by 2002:a17:903:2346:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-2219ff5e7c8mr68299995ad.27.1740164445571;
        Fri, 21 Feb 2025 11:00:45 -0800 (PST)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5364676sm141352715ad.82.2025.02.21.11.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:00:45 -0800 (PST)
Date: Fri, 21 Feb 2025 11:00:42 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon
 <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, Peter
 Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Thomas
 Gleixner <tglx@linutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, Eric Dumazet
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, "Jamal Hadi Salim" <jhs@mojatatu.com>, Cong
 Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Lee
 Jones <lee@kernel.org>, Thomas Graf <tgraf@suug.ch>, Christoph Hellwig
 <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zijun Hu <zijun_hu@icloud.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for
 void APIs
Message-ID: <20250221110042.2ec3c276@hermes.local>
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_110046_943678_4CAC2B3B 
X-CRM114-Status: GOOD (  17.57  )
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

On Fri, 21 Feb 2025 05:02:05 -0800
Zijun Hu <quic_zijuhu@quicinc.com> wrote:

> This patch series is to remove weird and needless 'return' for
> void APIs under include/ with the following pattern:
> 
> api_header.h:
> 
> void api_func_a(...);
> 
> static inline void api_func_b(...)
> {
> 	return api_func_a(...);
> }
> 
> Remove the needless 'return' in api_func_b().
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
> Zijun Hu (18):
>       mm/mmu_gather: Remove needless return in void API tlb_remove_page()
>       cpu: Remove needless return in void API suspend_enable_secondary_cpus()
>       crypto: api - Remove needless return in void API crypto_free_tfm()
>       crypto: scomp - Remove needless return in void API crypto_scomp_free_ctx()
>       sysfs: Remove needless return in void API sysfs_enable_ns()
>       skbuff: Remove needless return in void API consume_skb()
>       wifi: mac80211: Remove needless return in void API _ieee80211_hw_set()
>       net: sched: Remove needless return in void API qdisc_watchdog_schedule_ns()
>       ipv4/igmp: Remove needless return in void API ip_mc_dec_group()
>       IB/rdmavt: Remove needless return in void API rvt_mod_retry_timer()
>       ratelimit: Remove needless return in void API ratelimit_default_init()
>       siox: Remove needless return in void API siox_driver_unregister()
>       gpiolib: Remove needless return in two void APIs
>       PM: wakeup: Remove needless return in three void APIs
>       mfd: db8500-prcmu: Remove needless return in three void APIs
>       rhashtable: Remove needless return in three void APIs
>       dma-mapping: Remove needless return in five void APIs
>       mtd: nand: Do not return void function in void function
> 
>  include/asm-generic/tlb.h           |  2 +-
>  include/crypto/internal/scompress.h |  2 +-
>  include/linux/cpu.h                 |  2 +-
>  include/linux/crypto.h              |  2 +-
>  include/linux/dma-mapping.h         | 12 ++++++------
>  include/linux/gpio.h                |  4 ++--
>  include/linux/igmp.h                |  2 +-
>  include/linux/mfd/dbx500-prcmu.h    |  6 +++---
>  include/linux/mtd/nand.h            | 18 ++++++++++++------
>  include/linux/pm_wakeup.h           |  6 +++---
>  include/linux/ratelimit.h           |  4 ++--
>  include/linux/rhashtable.h          |  6 +++---
>  include/linux/siox.h                |  2 +-
>  include/linux/skbuff.h              |  2 +-
>  include/linux/sysfs.h               |  2 +-
>  include/net/mac80211.h              |  2 +-
>  include/net/pkt_sched.h             |  2 +-
>  include/rdma/rdmavt_qp.h            |  2 +-
>  18 files changed, 42 insertions(+), 36 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250221-rmv_return-f1dc82d492f0
> 
> Best regards,

Is this something that could be done with a coccinelle script?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
