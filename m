Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226B606A32F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZHkk3Ev;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gp8rIV0N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fgY7cRx1WO1nBX+Qgei5E56J09hynb5q6KqgvBFuJss=; b=EZHkk3Evs+AGJnonbRzoT9QSw3
	/bJ7mC4LlmlCHIh4DiiuWZrJE/ZjvhHqmyPr7hitgxA1r3yFjBwUOa71Ke0bW9GNPEjb1rp/eoLzj
	BFvMc+gk5uhDN37naMxIsi6pGd4BKXXcF8lVt01HA1IS4PcCJZJgUlgKKrp646iGp5b62w9erO6Co
	M12cJWwhgFtrctygM9FrqABDfgCApC78Y2u0Yt9TNwlsiwKqiSCip03bq3f/otiZAM5NNju2Hc8tN
	Mi+HD0aW+Sbk5EbpkWygLaUdu9fNaDiwTBXc0RN+wJN+bVAy35E77PgQmSJQC+aonzYxtQWt0q1UO
	NvNlQ2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2d9-0000000C8yV-077x;
	Thu, 19 Nov 2026 13:56:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2d7-0000000C8y9-2rYU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:56:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4CFC74733E;
	Thu, 19 Nov 2026 13:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 829561F000C6;
	Thu, 19 Nov 2026 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096609;
	bh=JaH2ERcOdqXe22GDDVQwmxv1pTLrLmRw/kARhV4jLxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gp8rIV0NTptIohMnJQ05QaiSObOkq3exz3L/SdW/PqMI6BPddaWWIsIEnpQWOQ/SH
	 iFKIN/DNagn/mKnYeay8ptBSslceV4SLQU6kQ4vtaIc05BJMFRKIAjPqwu5i8QJ/cP
	 ibgVMkpEhNwZ0qSiZqUjl71o4d7mYIe7Oulz+oblkpNqnlKO4rR+FCI7AYFeZy+PaM
	 scwzo0vUtbaGfcPdLDco6Z2ySCtTuo2I+rLGfUfqDNfXxqM7Zoxff++K6Ix7nHF7DF
	 u25v2+8TuA5Hl6Vpfe9Cgm9Qd7s3Mrad5o8b9MprsxllXQ2dA7INrTEfAENpw3HAKr
	 DFVXiN0monb+A==
Date: Thu, 19 Nov 2026 14:56:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 02/11] nvmem: drain keepout and cell post-processing
 accesses
Message-ID: <fhmks2ykxm7dtt2qsm7q2d4b25l7pft6tmmzl5bwlefpzg4usm@i7aqkq6w6fne>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:38:09PM -0700, James Hilliard wrote:
> The register callbacks are protected by SRCU, but keepout traversal and
> cell post-processing take place outside that protection. Unregister can
> finish draining a register read and return while its caller still uses
> a provider-owned keepout table or invokes a post-processing callback.
> 
> Hold the SRCU read lock across the complete access, including keepout
> handling and post-processing. Reject accesses after the operations pointer
> has been cleared, including reads satisfied entirely by a keepout.
> 
> Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/nvmem/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 802637f375f8..73aa53145f0b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -164,6 +164,10 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
>  static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>  			  void *val, size_t bytes)
>  {
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	if (!nvmem->nkeepout)
>  		return __nvmem_reg_read(nvmem, offset, val, bytes);
>  
> @@ -173,6 +177,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
>  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
>  			   void *val, size_t bytes)
>  {
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	if (!nvmem->nkeepout)
>  		return __nvmem_reg_write(nvmem, offset, val, bytes);
>  
> @@ -1651,6 +1659,10 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
>  {
>  	int rc;
>  
> +	guard(srcu)(&nvmem->srcu);
> +	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
> +		return -ENODEV;
> +
>  	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
>  
>  	if (rc)
> 
> -- 
> 2.53.0
>

With that, you always double the SRCU critical section. I'd prefer to
see the existing SRCU guards in lower-level functions removed. If this
is not possible, then we may need to shuffle the code around and
introduce "unlocked" helpers that don't take the SRCU lock.

Bart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
