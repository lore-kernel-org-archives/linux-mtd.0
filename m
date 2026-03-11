Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DA91125833
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8K8TQ+eYbE7peO8jk2hibKwopXG59Y9f7aMPjgps0M=; b=jguZd60lkRoCC4
	RD39mtQX3bTzwKwUHMPMO8rWfhMNG2HTNuYYGiULR8WDpsL/RRmB8o5P+wOSnC6ZWPcIP066+HlGX
	GNkvz9SospsZaHf092P3hdB2hx+PkENWfuPX9jZHvMBXeZmR4Tt2WngtaBik4U1wqQ5H5HTyvYEdk
	OKBp9o7ZLLSxWAlr8n3Cx8OkFkfJP9cZilCu7x7Vu9qc/9YF64O70TXwo4GF9+/CSzyASIo1w2Mds
	TQhq3uwpaAxkCkiceJIoAgRrFcpxsn970G92gCH4f3taFu2eNJ+eccYxmpyCq1fAAUdsaQ0l9kM32
	EZUsecuGYm39gnRWhABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KCk-0000000BgIp-0IsJ;
	Wed, 11 Mar 2026 14:06:30 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KCh-0000000BgHi-3cnZ
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 14:06:28 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b96dc65b886so178853566b.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 07:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237986; x=1773842786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=l9dOqOacdwXD9zSvkbNK9HWTAVwSQfcG+ySizKVtYoAGT0line+tY//2i3U5TkD1xk
         mi5jhCVHwp6Sw2nUukrqWRvB9XLKc9Wb8cXQHsstJquvBMbMFwLYVuiCB5QjjsNiE5af
         dF3SkoVZLhEZzpXeyT70HTMyaLAimPQzQjZ4V9bypllpaQrVv6N6lKGyCdmEgIgxEO93
         h+5nVRgXo2B528TX7sMulJSchOqMSQ0U1ht0cM4RRhffP/5kLi6LZDW1O8ayWZ9z+2nY
         nqR9TftKacXyOsGhrZ0BO5ncdczOD19/16lcibTsSd/Ahu6GMqjLsdA8wu5U1+Yh2IPd
         I9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV52y3c/LH12ZBr+Womf0NhCzCETsofwNPU8UIXGmiKt35N1wgL3sOagWK94ZSYqE1LLWJnYchIGg0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+p7CBzQQ3WbwRSBREsyMXojfYEqTMlR47riOj1V9z4ZG10hsW
	oDy9Ca53tKRxv0Vx2UR2ObN6yRCSd7lftAmjPppgdkLm4zRm/jeNM/ZFRvMR30H0jy/BCw==
X-Gm-Gg: ATEYQzxa5wfCeukeE8iyyonHmXWGJLvSyulVHWvm7b5E50SVkSgkuUVSTFJBn/1OTdq
	EXss/RKlfIKDRAznd0/p7e8Q6Ck+CCfK2mJuNrD7H0lhY1gar6Nn5oGn3fM4xIAfYmEin/N8lpz
	ZSH3ON9l6GvKao/+dZ/XygtFVSXh+jN/Tk9njbk000eKA/Bx6fj0A5STia83uAkt0KCcb8++zB5
	T4wm0XGRWi2oD2Dqc4Bh3AiVFB/YE5ChJ+iPgKLdl385cCkUfMMDktNAChxGhKEaL78woVzbVpL
	A6tQ2PjtROUaxwtElFNPtJbF88z4YNf8D5V5Yrq3etjfaqqmmtQpBMNQhnMyiuxijQjQbxTPPUg
	aj6hegYSkiMbX/aXJV7CzWQhErCahh+WGEn0+OvGx0PAOm4Stxw/aextnT9wG1nydgcts8y9Zaf
	K+jXWNpWZVZ70SAlvjHtDDTGfAyQ/ygtTfrmzUKTbZMQWClmN+elmlehaJqg6p
X-Received: by 2002:a17:906:6a01:b0:b94:3ae3:6af7 with SMTP id a640c23a62f3a-b9711a1ff43mr473187366b.17.1773237985776;
        Wed, 11 Mar 2026 07:06:25 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08ca1sm61714366b.10.2026.03.11.07.06.21
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:06:23 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso1627826a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 07:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnLn85EGNhxncU+chcthvN4KZJBxCW2TnzWrrL9LJAyGmyKIMgb8w3OJkXsVI7ni1ELXFJeDLFL04=@lists.infradead.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_070627_912381_5F776887 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
