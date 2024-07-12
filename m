Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF20C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMGaqioZX1aF/sLcxGhuMpWjp4V0NnAW5rI7ofeeKVw=; b=s5oBBmB7ArSfq3
	JKc9v7447HaDo+qcsHlKkgSjiYSc/sPJUw5yDSIkFKuDNKutPkdpIH4DHPJWFSBvktYJYqlajIGv+
	VX7qgEQr7KhkuIF/DdQvt1fYIXw7Pi0wRqyrTWpvoes7cG2RgCkZxle1kJK/V9kD9HHIoToGQ4Pg9
	zbZdRRe3LeeSXp5dFn6/k9kA47LxjGmysARnlxcdupRxZQHj6rp3rhoX+Uul2zEfPgfQPGSv/KP4C
	3Ix/qpQtHG9ZNl7mzvKqjrUGm4IbBaiPF/46nKeJAT0qud8TieTNd/cvFhNBUIp6gJZTV4oo+4SgW
	8MapnVU9Ptozn5E9bLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGQ2-00000000ARu-3zaT;
	Fri, 12 Jul 2024 13:34:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGPz-00000000AQd-0nL2
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 13:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6266A61EFF;
	Fri, 12 Jul 2024 13:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBED9C32782;
	Fri, 12 Jul 2024 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720791274;
	bh=5l82faOt0Ftj9KB/8OhC//sWOYz4iWkq9/TcEQ4beHA=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=NIpY/lPlSWZI3R+9H16iJmlQjohMYFbKAnN1ICZijVCIxlgCeDDozmphS3SENp6t9
	 NaJhKqPC2L8m/HhmUn3W6QwjFQd/BxayAj7rZgH6JmROTNvSjCqWErvxVjIADxA0Jj
	 LgbR9KZgDD9ky0QfIk3xvRcWppmfvG3dVyOk8VOviNIbK5nTvzjFYb7I8uWRBNSMRu
	 d3nU3c8KR4w4tG0Xzv7Pz8rfkjFWDVpKrAc2CF3WVWE56Xl+ySb8aCouJ2iNi1EcRY
	 0JGEMFMckUZ1xp20pBOl/IX9BbWxSmIcNIpXGqtp5j++B+0GSe+alM11vUY6Dxvl2r
	 WcfbiWV3jxNxw==
Date: Fri, 12 Jul 2024 06:34:33 -0700
From: Kees Cook <kees@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
User-Agent: K-9 Mail for Android
In-Reply-To: <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
References: <20240702122639.248110-1-jfalempe@redhat.com> <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
Message-ID: <277007E3-48FA-482C-9EE0-FA28F470D6C4@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_063435_316574_2634896E 
X-CRM114-Status: UNSURE (   7.20  )
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



On July 12, 2024 2:59:30 AM PDT, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>Gentle ping, I need reviews from powerpc, usermod linux, mtd, pstore and hyperv, to be able to push it in the drm-misc tree.

Oops, I thought I'd Acked already!

Acked-by: Kees Cook <kees@kernel.org>

And, yeah, as mpe said, you're all good to take this via drm-misc.

Thanks!

-Kees


-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
