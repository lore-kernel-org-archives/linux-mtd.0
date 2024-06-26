Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51455C27C4F
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2024 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPOfZ6BTTdwGYVA/MVgDSTTKkMQ+SZuhTWZqJw7l42U=; b=suRujpLv027o9B
	Ci4AosiDtTr4mjTo0x0vrF0nRGa8af00HlRxZ0rG/YB3on/xfiLOfPTZhE9bmOxUbEjnjcgQm3xSi
	AgIQzyFTXvZ1wFyXY+hWrVePmfz6b2YiFLJZWnzYITASFK2kdzIgQ24JYqHVgTr7dtafO/HkOCGDJ
	DqTnTlDIHFzA4eHJ9cRwHlg2Hj8Ig7rlowsqASBAwEAwzvDKcZZZXB0o7fWHCi0UGC+s33vNqYoA9
	biHShs37qXnQg0hG741LQghG3PXY8bow8ilL3EEPsEeX53oxz9k5YFQ0r5opZjpdYl75Ggb89vjmv
	lwhEIqUXUy3pQkfX53Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNaG-00000005q5Y-3lm6;
	Wed, 26 Jun 2024 08:00:52 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMNaD-00000005q32-1Fco
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jun 2024 08:00:50 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso76152031fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2024 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719388846; x=1719993646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
        b=GS4ny46V7dXpctmlfAKZGcxldwhtdDpTaKyQpxLJZIU9N68NtMTwhIvZPgp7idcCAP
         Nbnw/Ms4JI4T0IizpX930+WrqWqVajVKPhc1orj+2HONH0Ln/JetkYYPEXmGUYedJf2+
         aL5mS95pC5TqsUP0URCiVbXlSNtFwhMku8NhnmALSe98+Qw0qm6pX0CzQEuSyo509XSq
         9diE6S5wjXZmH1itmP8RURi0NiNwvId47N4IEuKOqikm8m8yRnBchbMlB40mehqG9Zys
         lV83U8Bx2fOnbkJL6swtuWY1wcX21qxtqKKQDwAj7LYxS1qc7iysA45Aiad0mwqdq40E
         as7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388846; x=1719993646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
        b=CWGKojt7ww3zd7hQLuxPQmEm4JAsByE3RybzT/EbDoHC024som7LwFSiRhwFg+m7m7
         7/gj7cxwfQjAvMC5G1k5ZEIe0gazfhNmq5cDcVQhWB09NKUi6f41YnSLB6/AAmeBOTqU
         BV2Z6sqZehpH0f0KPBylFHil9monuA+E1xwzWgXwzptSupZovCBO/2HbfYZkvCXc6UZ1
         XuimwB0265rIsQPzINhQEMbX4u5yQenPruQZIIw9rHEDb8YtjWPXMWVyoIk2xkTUjg8d
         79QZ15C9RoTQXKKc7eSk7VggBD+1yB5HEOBBYsbDr7ZNV49nkthQmztWh3MDiqE/P65a
         P1/w==
X-Forwarded-Encrypted: i=1; AJvYcCXfYPS4Fbx7qMm+rymhHzsFlHTdyZeVBtwTC1/OieBp2M2+9hRTVWFq6Nlzeow5JpY2LMhtfHsfjCLvJFbsS3dUM/CsAq3tvkMZIJVPeA==
X-Gm-Message-State: AOJu0YzGymePzYapprSnvnPlNpt3hk5sgvRN0GFrlPkAce9o7cUZSeUO
	S8lumsYCf4g/6tA33vVhcyqNP7ouvun/rgCdZjxPxil6lQa7wgNUnvrSumyuBq0=
X-Google-Smtp-Source: AGHT+IFNePKBHG9JpceEuNMrhp5ms+q4nwziDYVudYAAE2EIYWBHCuZo7vzBBRTi5aESxDL6rd8szA==
X-Received: by 2002:a2e:3a13:0:b0:2ec:5019:bec3 with SMTP id 38308e7fff4ca-2ec593e0cd9mr61741411fa.21.1719388846249;
        Wed, 26 Jun 2024 01:00:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70676a2113csm6032019b3a.214.2024.06.26.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:00:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:00:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
References: <20240625123954.211184-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625123954.211184-1-jfalempe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_010049_365408_A99A7410 
X-CRM114-Status: GOOD (  20.66  )
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

On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new parameter "const char *desc" to the kmsg_dumper
> dump() callback, and update all drivers that are using it.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  arch/powerpc/kernel/nvram_64.c             |  3 ++-
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>  drivers/gpu/drm/drm_panic.c                |  3 ++-
>  drivers/hv/hv_common.c                     |  3 ++-
>  drivers/mtd/mtdoops.c                      |  3 ++-
>  fs/pstore/platform.c                       |  3 ++-
>  include/linux/kmsg_dump.h                  | 13 ++++++++++---
>  kernel/panic.c                             |  2 +-
>  kernel/printk/printk.c                     |  8 +++++---
>  9 files changed, 28 insertions(+), 13 deletions(-)

The parameter is added into all dumpers. I guess that it would be
used only drm_panic() because it is graphics and might be "fancy".
The others simply dump the log buffer and the reason is in
the dumped log as well.

Anyway, the passed buffer is static. Alternative solution would
be to make it global and export it like, for example, panic_cpu.

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
