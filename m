Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72327C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:14:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5AD206E2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vnGBWjPZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5AD206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AR5IIbnPWIT70gixUnNxQjokaTywYjawZgZvKR9/9Dg=; b=vnGBWjPZj/SAUlW1EQvGI28rC
	I78Swh8e3e6LlEfLKdXCz17edvsnGglOmxwq+Wieyw1SQuKn3SRvDOxFWShOk13XggCWRLQezubUI
	sBTH30Wsyo+PINY3jLhARa+6E9F3a27e6Ny7ide1wgJBqi9TWZANE1X9eDq/CAH2yVyD4gQxm6L9E
	OBj1kd/TC7tbN/VYhKWzuA3PIBs3xJ3DsJZ+twSqJTVXX6jdWPSzL2zNUSHvFehgpsO97R+NY8l3f
	Wws2ldrmYKeDVaqIP+7o16ZFj0YlA6uqtbUHVL4Brug7So7HRjoG2oaTVhhmEg7i4bpgKElobwj5/
	urWCeY5EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnxiz-000653-0K; Wed, 24 Jun 2020 05:13:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnxix-00063f-1N
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:13:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B1D7D2A3349
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 1/4] unicode: Add utf8_casefold_hash
Organization: Collabora
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-2-drosen@google.com>
Date: Wed, 24 Jun 2020 01:13:17 -0400
In-Reply-To: <20200624043341.33364-2-drosen@google.com> (Daniel Rosenberg's
 message of "Tue, 23 Jun 2020 21:33:38 -0700")
Message-ID: <87h7v1gi6q.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chao Yu <chao@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel Rosenberg <drosen@google.com> writes:

> This adds a case insensitive hash function to allow taking the hash
> without needing to allocate a casefolded copy of the string.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/unicode/utf8-core.c  | 23 ++++++++++++++++++++++-
>  include/linux/unicode.h |  3 +++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
> index 2a878b739115d..90656b9980720 100644
> --- a/fs/unicode/utf8-core.c
> +++ b/fs/unicode/utf8-core.c
> @@ -6,6 +6,7 @@
>  #include <linux/parser.h>
>  #include <linux/errno.h>
>  #include <linux/unicode.h>
> +#include <linux/stringhash.h>
>  
>  #include "utf8n.h"
>  
> @@ -122,9 +123,29 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
>  	}
>  	return -EINVAL;
>  }
> -
>  EXPORT_SYMBOL(utf8_casefold);
>  
> +int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
> +		       struct qstr *str)
> +{
> +	const struct utf8data *data = utf8nfdicf(um->version);
> +	struct utf8cursor cur;
> +	int c;
> +	unsigned long hash = init_name_hash(salt);
> +
> +	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
> +		return -EINVAL;
> +
> +	while ((c = utf8byte(&cur))) {
> +		if (c < 0)
> +			return c;

Return -EINVAL here to match other unicode functions, since utf8byte
will return -1 on a binary blob, which doesn't make sense for this.

Other than that, looks good to me.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

> +		hash = partial_name_hash((unsigned char)c, hash);
> +	}
> +	str->hash = end_name_hash(hash);
> +	return 0;
> +}
> +EXPORT_SYMBOL(utf8_casefold_hash);
> +
>  int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
>  		   unsigned char *dest, size_t dlen)
>  {
> diff --git a/include/linux/unicode.h b/include/linux/unicode.h
> index 990aa97d80496..74484d44c7554 100644
> --- a/include/linux/unicode.h
> +++ b/include/linux/unicode.h
> @@ -27,6 +27,9 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
>  int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
>  		  unsigned char *dest, size_t dlen);
>  
> +int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
> +		       struct qstr *str);
> +
>  struct unicode_map *utf8_load(const char *version);
>  void utf8_unload(struct unicode_map *um);

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
