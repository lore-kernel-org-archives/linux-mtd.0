Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC852C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4LljJpJRh9QpzkGoI7puzW6KrfqW8KtAN3voF1Nimo=; b=caTr6WkLiZJSNE
	57R0dDS1ggvs1pbLvxdglvgaDaRNy47JLRo+tWMjiFRq5p0sF6UXm04zrGdeDGz0PfTmeN1whDEz/
	V66i812Xc3oficq3oRBmx1voK47UCbuL9/C7jHDcEto1YN6I9NYGYNTdFrmo3C5adJq1jNeyhV04u
	pPmovthmnilAPaKx/2r3EBE7zfna958F4XjGE2IMgxdcrdoTCJIvHrMk2jpyTorpOdmuMyhEDVTdK
	ffekg2IV2Jsxm/4xPHOHI4cAj8EqpUU2QSB2bhY9/XOERsYf4pii4dndoGLEv01ywb04uXuKYXP4r
	eHonx/XMdXtYex0AH/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvG6-00000009Ppo-0G4Z;
	Wed, 03 Jul 2024 08:22:34 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOvG3-00000009Poa-1E8r
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 08:22:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so67727311fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719994949; x=1720599749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
        b=a0bLBiPTozDqWAuNycFMJXkHUB8rq3YjIt8udc8kesCaRjSbrbAKz5CYntq4eBkUhI
         D+wKYX7RoP383WqKkQBemKp365JsGRzgp43IqXfOHhfEoGNRbnsewLiL9swya9fzfv9y
         CXJf5oExXSrBUjPq+CjOPtJbfHF/rHNI23ODarpvLLOSv/p660JmRaJT28OfUz5k27MK
         In7EIaHSVVVm6XXv1OEIxtmwPyGgblCgPA8yiOQwzm9ICZkOym6Tpt9zdgiphgYwddJ3
         68XhTolbWRO0Ni/szk83DiFyFGg0NCxR7/7pkJFBcw2hj+ltzJoZQhZ48G/4JA31oqk4
         LQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994949; x=1720599749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMQqT/Muz0iwxmBm/vQkZCAi7Byb2pCrA2WM9iHg1No=;
        b=wVF5NjWTS5MxMMumuf99EXiovb75eUvUrkki4J1UI/BVSNRCj8Ahokui+6Ydeft4un
         LiItDUJRU2+2AxTrEm3lzSH99ar8D+vQz8yY/ToE+ZtT/HSSA4H5e3s+psFvUYyoDZt3
         n2B4qcAhOxcHsiR20e4kWFZdJzHH54ieSur430DR4kdqTQPyZPiCSIfrFPf/D4ogQw3s
         RgCU9484t5mEmRQYkfJdkOWVo5/UjrHi5kWoHli2/DOZKplUusWQO2pDrAfVNExfwG22
         mdvt1aLX++82ViCDqkCxO0y6EYlZzoErMXaXV7mjE9Yrc7G4rYhfZldlX+vsHzBR5yEJ
         kMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1q3QZqw6kBkmZxYqE99NjJO5tL7XNb6TIybLGxpiJ9aKQhlgpTrLraLjpMUPX/bviYmn1FcP4Oxnb96MvXUn9U2hnq2QoAe1u9iHHeQ==
X-Gm-Message-State: AOJu0YzsweutwtnJMoDv2RedrOPUL0VNFYLytE7O8N+9Y45vUt4T80LJ
	BMoyzch/QOEzGYLgEbo+vh1EhER3BvcaZIL/TGcgr6d0x2WdIvI63SOMHLb/Lts=
X-Google-Smtp-Source: AGHT+IGgmL2y9QM4c4g0Wf6Xz0uaCMi9coDigbGLy4p0by/hZmKG4KPflaiBbCeCe+DcbaFV7kidJA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:7a54:3b14 with SMTP id 38308e7fff4ca-2ee7a543b8dmr26465461fa.7.1719994949278;
        Wed, 03 Jul 2024 01:22:29 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802959d41sm10094847b3a.96.2024.07.03.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:22:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:22:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_012231_358049_F56D4516 
X-CRM114-Status: GOOD (  35.21  )
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

On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> 
> 
> On 02/07/2024 22:29, Kees Cook wrote:
> > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > callback.
> > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > reason and description, and pass it to the dump() callback.
> > 
> > Thanks! I like this much better. :)
> > 
> > > 
> > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > function and a macro for backward compatibility.
> > > 
> > > I've written this for drm_panic, but it can be useful for other
> > > kmsg_dumper.
> > > It allows to see the panic reason, like "sysrq triggered crash"
> > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > 
> > > v2:
> > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > >     pointer, for more flexibility if we want to add other parameters.
> > >     (Kees Cook)
> > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > >     declaration of oops_to_nvram()
> > 
> > The versioning history commonly goes after the "---".
> 
> ok, I was not aware of this.
> > 
> > > [...]
> > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > index 906521c2329c..65f5a47727bc 100644
> > > --- a/include/linux/kmsg_dump.h
> > > +++ b/include/linux/kmsg_dump.h
> > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > >   	u64	next_seq;
> > >   };
> > > +/**
> > > + *struct kmsg_dump_detail - kernel crash detail
> > 
> > Is kern-doc happy with this? I think there is supposed to be a space
> > between the "*" and the first word:
> > 
> >   /**
> >    * struct kmsg...
> > 
> > 
> Good catch, yes there is a space missing.
> 
> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> is not indexed for kernel documentation.
> And you can't find the definition of struct kmsg_dumper in the online doc.
> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> 
> > Otherwise looks good to me!
> > 
> 
> Thanks.
> 
> As this patch touches different subsystems, do you know on which tree it
> should land ?

Andrew usually takes patches against kernel/panic.c.

Or you could take it via the DRM tree, especially if you already have the code
using the string.

Also I could take it via the printk tree. The only complication is
that I am going to be away the following two weeks and would come
back in the middle of the merge window. I do not expect much problems
with this change but...

Best Regards,
Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
