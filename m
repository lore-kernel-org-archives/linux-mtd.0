Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5011C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy4+uJ/aoz6Bj0XXbEKS2qWALl0LnMxA3rtfIitygew=; b=DfA68IpwMIHl1e
	KA8Hu1b0pO32oneAe6iLxwPLWcF/UzzoN5w/TasDw6HUTZlwLBZYT9e4JEX/Br4Upml05aopPYEXs
	OgioLzwQIstlBYM/HOQYE+jfS0zsQ4Xr3kN32isICI6NLfQWU3la52F0kgSOQY/bbfjOHU4QOmHq5
	HUKbnEkItHOE+YWZ7IIXPN9Ijr1pyNepthA5C2LHWuHRHEO0FmiVjKvaSbCWzXn2LLi6k8DW2htSa
	7ZNF74asYQVehcLL5kp6KdLF1e6So57uI9mmBwwknvDqk26uj+7Qlb0ul9rOocfkdROChr42Gh9iM
	Kshpgc+1Vvx0+krRGjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFMK-0000000HYcn-0O4g;
	Fri, 12 Jul 2024 12:26:44 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFMH-0000000HYau-0uiv
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 12:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720787198;
	bh=y3aYzv3E08GfB0EpusXKM20MT9AQOoPQDNzGPOMTVdI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Co2V4BjMcX/7vgmwzvkEZr1aw14sUnlShzS9Kl4XYLI/CPlBJuzENWiJr0LaAUuQb
	 5Rq1q2rDPvbSJ1YAYgU08a4HZ3wXvPI3IjgetuU3olC8OnhS2LlTyoaPk9ym+pE58S
	 UObABJKdLCh2UwQqXCMD+iD/FUJIdJ9VVV9eLni4lXsif1Ole5T+oVEIc2MzvXRAkR
	 dZVfKo9PbCLDzZyRn2eaAZDq0nN9zt672hBIQcLnonXlMWFIBnGrEZ/ksdeICD5xpX
	 0vAu+ZIF8Ja30ubpJC+fE+b72H6qZ+2BavN1T8n0hkN11amwpuxhp0uuabUwALmEPr
	 LWDATLrj4zR2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL9nV3m8Hz4x1y;
	Fri, 12 Jul 2024 22:26:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jocelyn Falempe <jfalempe@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John
 Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jocelyn Falempe <jfalempe@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Uros
 Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
References: <20240702122639.248110-1-jfalempe@redhat.com>
Date: Fri, 12 Jul 2024 22:26:38 +1000
Message-ID: <87y1664wzl.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_052641_437425_55E9D7ED 
X-CRM114-Status: GOOD (  14.93  )
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

Jocelyn Falempe <jfalempe@redhat.com> writes:
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
> ---
>  arch/powerpc/kernel/nvram_64.c             |  8 ++++----
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  4 ++--

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
