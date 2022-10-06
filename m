Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83325C43217
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qTGUxXaDBdiOVbgbAk+jHJ2epON+A3qQI8N4CDClJs=; b=od2B1HUq13aWik
	mmC14hjTqADrbslzQ8QlH5tnqgVA5YRyWy+Idzx39AXGczhOuGWY250wn3wjn5Nfgh5zxfqDTGSf9
	SYYuSXSKNKc9Q30ZjnLWCqTXgQYFqkiybYV3HKYU2zN7kvho0XpOmsbw51g3OezV4zgWpuHAUc95V
	bjsLsurud/N6FBxl3+bpzzP6YkWnqChufQUcaOuRhQZT49+Y58HG61XfgYg+mxLyIXJ+WslFob1L/
	HRYzKG1vFd/sA4z7EDGAMz0OePZReO1qdGwcLNulYPuFzfaY67xa4KL2RKT3jtWO7Z1xtRJouJ/d8
	9FJL7U4zlCc1V2TpcSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQyA-002hGn-II; Thu, 06 Oct 2022 13:31:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQy7-002hF6-Sa; Thu, 06 Oct 2022 13:31:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 41C68619B5;
	Thu,  6 Oct 2022 13:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581F6C433D6;
	Thu,  6 Oct 2022 13:31:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DnHj1hgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665063076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=19y9yEzpIVCdXeybhvKA7dJEvUCmehig1gThjjfIZlg=;
	b=DnHj1hgprWUDyqWVNS0+FROvf65adGurdj9BoRFewnCdcvlclaqDaNvUotvhmXtsFzSoKQ
	vlOw/e6Fmv5lVFuceei/jjKagVdExuPZv2ImUknrHWiHZyy1JlDjjj4okhu+RFq+SfEN5z
	qK2lNDaEi/8k1YTMXNEyFm8zDfdU7pU=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50ab4f07 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 6 Oct 2022 13:31:15 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-349c4310cf7so17790437b3.3;
        Thu, 06 Oct 2022 06:31:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf2wjR0XXOrMmIASfbfy4BiXr7qriI021Ygve4cyYrVxkdr9xmeV
	yh/6FOvLG0uy8cPiUitDqmut5/z8j/tMBHYPaaY=
X-Google-Smtp-Source: AMsMyM5LOcwlCqLDJ8Sdf5AH9P6p8LW9hstCcin8XnWJVl2TEMHnjzVUue7OZJku+oxVakLrWA9vu3wGp+73FInbltY=
X-Received: by 2002:ab0:70b9:0:b0:3d7:84d8:35ae with SMTP id
 q25-20020ab070b9000000b003d784d835aemr2699257ual.24.1665063063460; Thu, 06
 Oct 2022 06:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221006132510.23374-1-Jason@zx2c4.com>
In-Reply-To: <20221006132510.23374-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2022 07:30:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9pXuGKNsm3cCOMLSOMJoX2XJnHffpiF_rr32mW2ozShhw@mail.gmail.com>
Message-ID: <CAHmME9pXuGKNsm3cCOMLSOMJoX2XJnHffpiF_rr32mW2ozShhw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] treewide cleanup of random integer usage
To: linux-kernel@vger.kernel.org, patches@lists.linux.dev
Cc: Andreas Noever <andreas.noever@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	=?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Christoph Hellwig <hch@lst.de>, Daniel Borkmann <daniel@iogearbox.net>, Dave Airlie <airlied@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Hugh Dickins <hughd@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jan Kara <jack@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Jozsef Kadlecsik <kadlec@netfilter.org>, KP Singh <kpsingh@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Yury Norov <yury.norov@gmail.com>, dri-devel@lists.freedesktop.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mm@kvack.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-rdma@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063120_009010_C779355D 
X-CRM114-Status: GOOD (  14.41  )
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

On Thu, Oct 6, 2022 at 7:25 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> This is a five part treewide cleanup of random integer handling.
> [...]
> Please take a look!

I should add that this patchset probably appears bigger than it
already is, due in part to that wall of motivational text. Keep in
mind, though, that the whole thing is only "305 insertions(+), 342
deletions(-)", so it should be conventionally reviewable.

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
