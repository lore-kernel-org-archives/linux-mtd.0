Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D907C3065C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuJEdRQAGeL8Roi8nTnxzJkxU6Z1EyFUJ8EfEWvLX6U=; b=Opcl8A5RUtnZr3
	sJEuQVCY64OmsvHqT8fF1qs4GMnWJN+2oKnUnJCCPlKM0j/h12Q0Qm3YgREw3hGUttBKdc9caGrHu
	6X1OP3k0gfyN2OURxbFT4/wwQRnwNnuKce7eVMv9LqbPSzESKtI2aFPmHB5RI0KLktxyxj4y3MWWf
	okByjpWGuSGUZY5krDoatYy9gUTxvTARxkM97WQx/nwvTpVz2+wW8xlCaq3nIjYmaSQDdZ8ANmu5H
	eFkxIxYWUZ90Syavmj3/UcwjdSNvckXBKemJgODWkvLeUnkgU3BcbDJrYU4Vr5b00VZeqPHwyAHFV
	U0+Z86itxDNhMROiQeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOk84-00000007tSd-497E;
	Tue, 02 Jul 2024 20:29:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOk82-00000007tRs-0G1Q
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 20:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94DEDCE20B4;
	Tue,  2 Jul 2024 20:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D70C116B1;
	Tue,  2 Jul 2024 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719952166;
	bh=5Rxp/h9KApRPjvKzc6wYI/qk2q2v7qYfjqOFXP5VY/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMULYvaRAq2JE1hDB7HqrZUGyX+NMgBOjzOLgQXT9im/iw7MRTrc/s0A7hzDEcviR
	 UzxKjOhwIylBFkuLvnYzmIrK+TWv6zvsM8M8z6oItamUsI2TGhrOmjUcLQcp+gIGQK
	 /gq3E4v1qpaTJK9ZdHKd+Khti22IGRZPmypbLGUPgL0+mjl3AWPBuYuCp4wB9bjV9D
	 a2GkHeFqh0f6BzpQjThX3VHhNKtDEKdi3lCfSL6LsTFXgSkyFPD5XK3zR0wJMkjY9K
	 TLQjwQzsZ15xqiR0vpGkwtPIL9GyLtFAy+YOUp+OJ0RYLfzQeN8vly6fFk5ixzZLfX
	 6ijdEMKRMyjMQ==
Date: Tue, 2 Jul 2024 13:29:26 -0700
From: Kees Cook <kees@kernel.org>
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
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Petr Mladek <pmladek@suse.com>,
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
Message-ID: <202407021326.E75B8EA@keescook>
References: <20240702122639.248110-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_132930_471830_9462A4E5 
X-CRM114-Status: GOOD (  21.63  )
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

On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.

Thanks! I like this much better. :)

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

The versioning history commonly goes after the "---".

> [...]
> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> index 906521c2329c..65f5a47727bc 100644
> --- a/include/linux/kmsg_dump.h
> +++ b/include/linux/kmsg_dump.h
> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>  	u64	next_seq;
>  };
>  
> +/**
> + *struct kmsg_dump_detail - kernel crash detail

Is kern-doc happy with this? I think there is supposed to be a space
between the "*" and the first word:

 /**
  * struct kmsg...


Otherwise looks good to me!

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
