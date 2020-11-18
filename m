Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F99C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:32:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07C82076E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXwEaxqM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMbgFoel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07C82076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AjejHjHcDlbjrvL805N9G2waHzlNjjI+1wdHrdtzxEY=; b=DXwEaxqMJmOj355TihzoTBn0M
	QLv4oYyoZ8Kv0VLyHh9ptI60EaWDc1+46CoGhpm92fvZ4vo2LJkQwRRkiALhVMqStY730fEwF4sz2
	eLLXtHO3rzJrE05+RnwRTpmm1hLLabrXux5ryrwwXmIgb0UEkhhSwD4UiK9qeVuHk8Xs4bF2lVDDY
	xUmUNAokl/DQLEavkcgcPvLX9X+ApM1AiaaLReQyn6kcinZZPkOWpK5opVQHkwUkwwTzQspXlSMOd
	b8D0sYfWPYEiWewMSvLLVkgMSI2O6JXl3TaTySgciqVqx60vC5YbAJzf2UmNwKqIrL0BSJInCo8CO
	1Q8AVvD4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfSFU-0001Uc-G4; Wed, 18 Nov 2020 18:32:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSFR-0001Tj-Sa
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:32:06 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C14482076E;
 Wed, 18 Nov 2020 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605724324;
 bh=SF6czFyUVoCSbzDlPAUCgmPSS0JKy3lsEIQaFy7Bvvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMbgFoelI/TNirFp3bkkrWuOteC8rAKh1UcHpWZpjLMHq1i5ckHRjkE+oZlAjYvGC
 T/CRAZSXjsOjXTXPvrGWFb+PrT8dGRlcIirZsaZf55RaV+bviSwA0v7iYfL7x9tdfR
 tjIJPtI19BkRgjL0oDtuukfMOhO/99K8DTIP3qv8=
Date: Wed, 18 Nov 2020 10:32:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v3 1/3] libfs: Add generic function for setting dentry_ops
Message-ID: <X7VooviygzLQoprL@sol.localdomain>
References: <20201118064245.265117-1-drosen@google.com>
 <20201118064245.265117-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118064245.265117-2-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_133206_101032_2AB9675B 
X-CRM114-Status: GOOD (  13.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 06:42:43AM +0000, Daniel Rosenberg wrote:
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif

One nit: it would be good to change the #if condition above to:

	#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)

... to make it identical to the #if condition later on:

> +#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
> +	if (needs_encrypt_ops && needs_ci_ops) {
> +		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +		return;
> +	}
>  #endif

It doesn't actually matter, but it's nice to keep things consistent.

Otherwise, please feel free to add:

	Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
