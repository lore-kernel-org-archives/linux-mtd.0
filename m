Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E91C3DA4A
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oam9IFIRkQMrOEMVuewTkJAuUupKVJShV+cQSDQ9TF0=; b=q/nECJxTm9ow0q
	YRjaUPAzkD7ni6OtmsYyfxRbcaSDbBaLJSo0HCMDYQbhHuGo1+Z5Ta0KSYQykc2jLXZZL0Wb7n976
	YZkdYO8U7NNs8oU71g/hfIov6m53NtB7eKJAuS80a+p45f3xmsUb4ZoI1jy8vGrsv523xhOrRS3tG
	GeDEyS8W8TVS63BX9dliS44GOtD0DeIFpAlSEHAukHMpPQo4iBhXJcTADnjl9Lo40IVaR6+uRVwGF
	vZMepqcrqkeEFVxDhXqRfEyWdoXXAXm+isDzW8DkTPtPQau5hPfrLHsqJpTFYmDLbWsb/4yPLzWDk
	uWAeXx54dNPSQ/Ai5Bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFM8-0000000HYXX-19Md;
	Fri, 12 Jul 2024 12:26:32 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSFM3-0000000HYVS-16OB
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 12:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720787179;
	bh=61Rg5T54YsytFfb5o275tB/ve8FKKkyJzddzOl72DrU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ng02PIPvIHYkBYM9ZsmmArGNeKdmCARzvmV1GdYuE8JF5wHcuHAkUZRXXoUKWrREK
	 Sqdzpm78nub+p5+hVw+Fs54MEuC8BjISMwUSy0bEpSKSJRTnm/vw8Kp6tyQttl2WfA
	 r+vsHVW8rBMDW45AVQZCh+Do75llGY+c23Qcm6WtDJhVZRXzhAmVP4prhw4y9Ci0Lb
	 xYZ123Yp4K91FgHgv33mWxDZYdgVgZ8KWA5mOwG2/1e6nPxk2j30WY3naVG5OfK9UM
	 GgSqYHt980kdYyHus4Y9WAIrMsWLuIRruL/JTOpWKWWoXHx9wq/X9KFRIjXeDDYul7
	 wGpfHK9662J/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL9n21XgMz4x1y;
	Fri, 12 Jul 2024 22:26:14 +1000 (AEST)
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
 <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
In-Reply-To: <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <2d886ba5-950b-4dff-81ea-8748d7d67c55@redhat.com>
Date: Fri, 12 Jul 2024 22:26:12 +1000
Message-ID: <871q3y6bkr.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_052627_594161_3495B2AF 
X-CRM114-Status: GOOD (  16.90  )
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
> On 02/07/2024 14:26, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new struct kmsg_dump_detail, that will hold the
>> reason and description, and pass it to the dump() callback.
>> 
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>> 
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>> 
>> v2:
>>   * Use a struct kmsg_dump_detail to hold the reason and description
>>     pointer, for more flexibility if we want to add other parameters.
>>     (Kees Cook)
>>   * Fix powerpc/nvram_64 build, as I didn't update the forward
>>     declaration of oops_to_nvram()
>> 
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   arch/powerpc/kernel/nvram_64.c             |  8 ++++----
>>   arch/powerpc/platforms/powernv/opal-kmsg.c |  4 ++--
>>   arch/um/kernel/kmsg_dump.c                 |  2 +-
>>   drivers/gpu/drm/drm_panic.c                |  4 ++--
>>   drivers/hv/hv_common.c                     |  4 ++--
>>   drivers/mtd/mtdoops.c                      |  2 +-
>>   fs/pstore/platform.c                       | 10 +++++-----
>>   include/linux/kmsg_dump.h                  | 22 +++++++++++++++++++---
>>   kernel/panic.c                             |  2 +-
>>   kernel/printk/printk.c                     | 11 ++++++++---
>>   10 files changed, 45 insertions(+), 24 deletions(-)
>
...
> Gentle ping, I need reviews from powerpc, usermod linux, mtd, pstore and 
> hyperv, to be able to push it in the drm-misc tree.

For a simple mechanical change like that you don't need reviews from
every subsystem. As long as it's posted to each subsystem and there's
been a bit of time for folks to see it, and the build robots to build
it, that should be sufficient. Otherwise you could be waiting forever.

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
