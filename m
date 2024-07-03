Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B7C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLgvp+23Mv2JbpYyxZW2EX2O+nHTNyWoYTmdUViQc9c=; b=M2S5soJGig8YG8
	TmaL64O6VsLmGbKJCeGMsT5swVJmZUabo1XFTLXtlLM/WfYHRydjv5UngqKSXc2qmAfHsq9fOHx+3
	wBv8rr5kk8kSyb2ZtZNsY1/+qRykfagBhmt/gnINAeEzPIamMt+jpjhzvT0ri882m1SXEfTziW1+1
	Ie0XxoBTcLh6JRm3rYTAAe47spo0dpA2N5R/wo8Ll2ADggEm7SrZvt1/nSpZqgHvYBMF8XnL2UmLA
	HhBJRJX1qQXHcG1TThiVOOnJtzO2/YIreyxG6YuJz3f59Og4x+1B76JhSw0ZQn5GJZwU/qablxfJP
	MsjvPazePEkJSoq3conQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOv6o-00000009Om0-1P2m;
	Wed, 03 Jul 2024 08:12:58 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOv6k-00000009OlH-3N0p
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 08:12:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so50899411fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719994372; x=1720599172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
        b=XQaCZjCK0j38KnP02BDriUFDSvp54Gx2sbKaoA4NgtRuolmMKXlNZwTxEeligCtyEl
         ralRjZuCIiO0b98hhr1JNYq+Ll+57QtVxIeVOfsIfsNXaxruMS1JFN9rx0Ex3aKqIe6U
         X60fO0LFl6aZa99+GzOOip/a5WLRu9bgYKzZfqwdkqKVgRg5o9AhJD8Glq2IJec7Kqmb
         WbYq6XObs70wKmZAHMS7zfbe4NKZjYyMZAt8upoQsZ+nVk+1RY560X54Eb0BiZeXLgHl
         Z+cB/Zv+zTErv+yTG6I6xNAD0c2na2hqKtiH3sKRxO6k9IiNi/f+LD3UreblKq01/fyc
         EKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994372; x=1720599172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
        b=NNVFvzxokn46Wb7k2gFWOTu5TYzOuv5vbdLp1l4OHJHuVtIJdN0FfSpYdFJLZoS1pW
         kR1Jq4aQMJ3L5NmaY2Rd2I2aM3k6cBcwZyq8AGE52qiR6TJbB3TpXWRtz5yspHovZ9Xi
         lAOqYsbB3WAjqqV+uWLbrLpclVq941Z6dQSTuUtRFYntoxAEnAq6ZYy0jlsOxbMYcj78
         cFy6jLqSdHr4ZT3BF5/Q7He+DfwU8iO/ISHSG0pSfbcRXJQOS2nkGMks3LkODVfVHv75
         SAPopgQAa1rXRmJujBoAoyxpa7h1ZkaOimw0VDMbZA1YxYtjpYXfHfRub6wzIjZ5ps9g
         oXMw==
X-Forwarded-Encrypted: i=1; AJvYcCXcY0kbQ6NrwwvCUUFkhIxsm6oBR5bacF3KGi4wDsMeX4FPs1Bd4dd5SP/r70zrMIwfu/zQEtqEVD1C2FDCmJP20VmQE8f5q9EFtVBO+w==
X-Gm-Message-State: AOJu0YxJCMN3F6eNzAFm9FH4OgIysfZXe52tz4yMd/5uU+u8Bk9aI6oG
	kJuxad4junbvo5F9qCicPswUz87PtQfMNo+Zyr1yYqmEDv2IvPb5PQanR8+NYvM=
X-Google-Smtp-Source: AGHT+IFCrx5O8SyoDb7pv8NJaiksMiDUk0MIzdtkS+naCkfqpA17Gjg/ppieWiNLDo4J+A42AblrZQ==
X-Received: by 2002:a05:651c:2010:b0:2ec:550e:24f3 with SMTP id 38308e7fff4ca-2ee5e337c3emr70900071fa.10.1719994372235;
        Wed, 03 Jul 2024 01:12:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb0c2e10dasm15659175ad.223.2024.07.03.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:12:51 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:12:33 +0200
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
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <ZoUH8S4j164Ovfiq@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_011254_866089_D768916B 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue 2024-07-02 14:26:04, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> v2:
>  * Use a struct kmsg_dump_detail to hold the reason and description
>    pointer, for more flexibility if we want to add other parameters.
>    (Kees Cook)
>  * Fix powerpc/nvram_64 build, as I didn't update the forward
>    declaration of oops_to_nvram()
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Looks good to me. With the minor fixes suggested by Kees:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
