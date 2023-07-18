Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E668EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YgYMUmNc4ngxl2TbkRiURFXTDMxdgKUpHCaes/LWi4=; b=0e0ERmikx6LoEW
	rNNOUE/5UW7U3oR+UfszIqNQCzy1KvTxnbmmyfHjkTPmBA+gZ5o0g5heecwTPACrZX6ipF1NrK9EX
	nyw+ONJfDnIKMVNaaeylrWLrbuw7+4V3Q8WBA1avJ6knhyrs65yotfaJLygrkdfTAI6sKwfTKHIWe
	Wyjg5sNkGg9+IEs/VuXKQ3742XhLS5ighLaG6Aj6SC05X3BeTgnWBQCJbBUdvMeVKH/cttzqiI8CN
	3L6kUMnae2bDSu6LVcf+JDQf6NgKVYRUE3RAtUWBwFc2cI85CSiLm3cpV2+1wkjYRifWK9x1sN7Ms
	UdrVUKVZd+LAZ7/ss+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLztJ-005MWh-0u;
	Wed, 19 Jul 2023 05:38:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLztH-005MWA-2K
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CN4IVdlkVfFNKX+jb4yzsRbLnWdBPE8Y8EfJwADNbVU=; b=HZc5p1M64xwqlZVFRveE+HfWKF
	if87Z4D87vyAq8Cx9X+Gqyy5MH2I0KVK8Rb4LGSvwme4fkGNlTHxaP2GuHmeLUxPhzc7iYzgifsO6
	j/nAqEdVSQ8VHGReA9m8+MGeptwRXdiHcbBt7aOOSgY3a/+Ux0jmsKwZP8B+8PwWiHJjy5obBszQj
	jzQBNteT010utBFPesS8ncduy3jPuLWC9u1nNoKpBEVnSQExZPvu/ceZ3AYA3dFYTY0Z8aPABvyDY
	CFaKSsuXVUssNhaLU+7TLRAit6lFrbEuPR2xYBBmSCv+Kqio8ID5f9RBM4i7Kbx2NwZnPGuNSabGg
	lvMxslEQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtKo-00C9on-2F
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 22:38:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1710612CC;
	Tue, 18 Jul 2023 22:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73162C433C7;
	Tue, 18 Jul 2023 22:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689719896;
	bh=RXO+gAcZm+MhRenqy65hhkLUzlwKRVhTNDHhFXVPjjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC8frNZQi3mlQRwzd/1B/o58REsGjVM4bTqKYDGfIE0sdXtSivhP2CyO9GHwyZmUh
	 /fSMjJcqo48S1vnfEmmBEuLJHAJPEWExHLr/fGVg72zBItMXT5mcrGyyeTxbsSA84F
	 6LENyGcMmgizG0XyhLIpTWGmW5LNVmvAW2H++ihnyl/GFL1ab+KbX6AQgQGzKV14bB
	 C7ttE95UTAd7KsoYwEkaDtSAZr6mZGfIVkXp1QrwAzNbs+XmOJRAl2Qpf1itgUpGdz
	 7Xh0infj6g0F2qtc/JkRPt1YQH30JhSn8B77F32PIysiR197GoqrB8XClTi6/Qu1MM
	 4FL5RdcE/3Bqg==
Date: Tue, 18 Jul 2023 15:38:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Kees Cook <keescook@chromium.org>, Haren Myneni <haren@us.ibm.com>,
	Nick Terrell <terrelln@fb.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	qat-linux@intel.com, linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
Message-ID: <20230718223813.GC1005@sol.localdomain>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-6-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_233823_312197_D30ABC31 
X-CRM114-Status: GOOD (  23.63  )
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

On Tue, Jul 18, 2023 at 02:58:31PM +0200, Ard Biesheuvel wrote:
> Currently, the ubifs code allocates a worst case buffer size to
> recompress a data node, but does not pass the size of that buffer to the
> compression code. This means that the compression code will never use
> the additional space, and might fail spuriously due to lack of space.
> 
> So let's multiply out_len by WORST_COMPR_FACTOR after allocating the
> buffer. Doing so is guaranteed not to overflow, given that the preceding
> kmalloc_array() call would have failed otherwise.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  fs/ubifs/journal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index dc52ac0f4a345f30..4e5961878f336033 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1493,6 +1493,8 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
>  	if (!buf)
>  		return -ENOMEM;
>  
> +	out_len *= WORST_COMPR_FACTOR;
> +
>  	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
>  	data_size = dn_size - UBIFS_DATA_NODE_SZ;
>  	compr_type = le16_to_cpu(dn->compr_type);

This looks like another case where data that would be expanded by compression
should just be stored uncompressed instead.

In fact, it seems that UBIFS does that already.  ubifs_compress() has this:

        /*
         * If the data compressed only slightly, it is better to leave it
         * uncompressed to improve read speed.
         */
        if (in_len - *out_len < UBIFS_MIN_COMPRESS_DIFF)
                goto no_compr;

So it's unclear why the WORST_COMPR_FACTOR thing is needed at all.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
