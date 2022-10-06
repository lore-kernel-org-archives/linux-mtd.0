Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693F5C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 16:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgTQOxdvN/MXzCIgbB4m3giFjf2vxptAoJvgKcKHHu4=; b=mp1Ip+AaMOG8pl
	I28Gn6O+hRvwT45kMyejWWLcd7Pot4kuNI5TShaknoDioUKB23QTaceUpQan3SneL72vmACwRf7R1
	qC+60m/bnXLB+cVIK5imWTvYeBwvBZyCljl6pa31DjQl7iIPsklltggyLi2jhrs6z3/n6FD0i8uh+
	cp0Hrlykeu8k5O9sKgc0mn8jQgB23fQCW7EZvjN2QSI2lPNpuga3jGR7U8Lv2yX1qIRyz+l8tFW6L
	0SV5L8+yISAA5HvhxJDQZjgxk0buyy/cZD3LgEaKlVkO/XZX5ga9UWF6l+gLq4eTzBVuLWU0Mmy1z
	FMXhbLOgoqwLysUVTRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTh1-003p2z-MW; Thu, 06 Oct 2022 16:25:51 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogTgz-003p1U-Bw; Thu, 06 Oct 2022 16:25:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FBBB218E0;
	Thu,  6 Oct 2022 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1665073547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCQ01W/Zak7b1/Z15iSFiNNO+LnDKjRUCwgq9owN358=;
	b=BuCJHwpPWmPIMX1bCVa8JvF5Z7d74n/yJTO58u9Flcub7+SsSH8xi8XlpREVi0km3sCU9I
	n49kVMdngxh5xHUcQ7JaAcHnUNwcTFTbcX666mAdObWVWWOiQa+NDqw9MObg2XVpG17TSv
	v1FutPp1yNGHL7WKXiiXO6EFByUMvOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1665073547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCQ01W/Zak7b1/Z15iSFiNNO+LnDKjRUCwgq9owN358=;
	b=SBbeuIQGR7WWo1BYruUMTbe52g3YJZXPJmGbNwSK0jCwlB3l1oeiG8qTbAyyKKzsNlfKnK
	YUPXB99RMPIak5BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0B0413AC8;
	Thu,  6 Oct 2022 16:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UOdXNooBP2OJIwAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 06 Oct 2022 16:25:46 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 30DD3A06E9; Thu,  6 Oct 2022 18:25:46 +0200 (CEST)
Date: Thu, 6 Oct 2022 18:25:46 +0200
From: Jan Kara <jack@suse.cz>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Airlie <airlied@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hugh Dickins <hughd@google.com>, Jakub Kicinski <kuba@kernel.org>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Jan Kara <jack@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Paolo Abeni <pabeni@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yury Norov <yury.norov@gmail.com>, dri-devel@lists.freedesktop.org,
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org,
	linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/5] treewide: use get_random_u32() when possible
Message-ID: <20221006162546.hgkrftnsk5p3sug7@quack3>
References: <20221006132510.23374-1-Jason@zx2c4.com>
 <20221006132510.23374-4-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006132510.23374-4-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_092549_575987_532E877F 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu 06-10-22 07:25:08, Jason A. Donenfeld wrote:
> The prandom_u32() function has been a deprecated inline wrapper around
> get_random_u32() for several releases now, and compiles down to the
> exact same code. Replace the deprecated wrapper with a direct call to
> the real function.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

for the ext4 bits.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
