Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B15C3DA60
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BA9qFIiIaHrPvpxmu3iOgMuz66295xd/ehu4UxN5pgE=; b=eelyyGEBofqc17
	zl9kNfEz0lKapJ1osB0+fLziLeaCT0U6CD/4/ZmQq/upDynkmwLs07eVqmIqMhs484MOFv7asOQly
	Zy/WnlnENqAEaymAdLd3EKZYdD8RMQfUcqK1mLrZGlm+TmlaCOdSoCx6CgdSw/hit3I+ZP1twaupc
	0PEFh1MD526f3GJoQmHTPm+i/7Mi8Le7stkurWLF4xgFTCmz3TdGODfxnhFjiM+FJD3Kp3B5xFLMO
	vKq9KwDOKfQ2rkErMMBK9VnJo9cZoqhoU94WkZ17591QJLoMCiP6/5wpuf5In4eJ/FRFnElTlnWeI
	akxmrCAukt2XcTmdmFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9FC-0000000EbOe-412k;
	Wed, 17 Jul 2024 18:19:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU9F9-0000000EbLR-0Ej2
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jul 2024 18:19:12 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8C91C20B7165;
	Wed, 17 Jul 2024 11:19:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8C91C20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1721240347;
	bh=tJdPiTzkzL7kgsepa1RSwY8pS6OHdOQ3F2zaVjV9kCg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OhFxAIc677f8IqoXw8fkc7DEx9Q+cXUJi3G4rOZDYBneRlzPDrjR/CFTVzqwIbbm0
	 HFEb5lGZUS8QYZIRkCfOC+BMbijncDDiglaGQAisAM2JNl8ST6zjFRhrGXClE1Dh67
	 CFadODeFv2QGdIzToPUffWMbbhbsJOjiIRQfib3I=
Message-ID: <c13f74fc-1c18-480e-84d4-55f11bcb1e98@linux.microsoft.com>
Date: Wed, 17 Jul 2024 11:19:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
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
References: <20240702122639.248110-1-jfalempe@redhat.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_111911_241249_D76E3512 
X-CRM114-Status: GOOD (  14.84  )
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

On 7/2/2024 5:26 AM, Jocelyn Falempe wrote:
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
>  arch/um/kernel/kmsg_dump.c                 |  2 +-
>  drivers/gpu/drm/drm_panic.c                |  4 ++--
>  drivers/hv/hv_common.c                     |  4 ++--

Acked-by: Nuno Das Neves <nunodasneves@linux.microsoft.com> (hyperv)

LGTM

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
