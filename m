Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0DAC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 23:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D592146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 23:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sz5sN7V0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfV443U0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23D592146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yJSyGWsaGjVDsYzle6wxsgtmmU7sN1DXJZHvFflG0I=; b=Sz5sN7V0uRKf8J
	K/jYEpu4fCDeVE7cxGk8b59glZFfLDfq4r28xMAN0rRKLBkcaj3zcObzPSAXKNyFWHtKNWZpEBFPp
	5ocavoWEGSZwgCwVQLz1672lAhLGaNuD13X15ON8nVZZVs734zpN2PaavYqC24W+8CvXqjVOK1f66
	Ni+j0mIhvXMH22fGhHClWzoWTRa9mgy7JDquFfyjmpwv6V3dX+fc9YT3uRAZ4CQK6bs6oc5JzhTIy
	DDFkow5SEF7j+y59fmpZsp3sFHYnCkz36+zEm4Tj0zF7uxcV+ke7QjF48vuGuSdxdggsDgnbHXVn0
	HSZ2AuvDeGXbfQd48RMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwb9y-0001Ao-DD; Wed, 20 Feb 2019 23:20:14 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwb9v-0000oP-63
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 23:20:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id m1so8403979wml.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2019 15:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Ins5SyXMErLIBGwpAEI4+DBCUKf26tDWyMTuCKUOUc=;
 b=NfV443U0Jcnfy6bnrxZteDTcKePL/CRtH8s/kdhxdgg4urIsLioKO8RfpVs3buxjrL
 uqRH/GhD+8rvjqkGiLC45VUpcJ3JJ3b6AHSEDYP/1T8hrp+HXNOiQu0s0kBL0jzEW44g
 tfw+f9Zw/zXB0PgtqqAhkyf9Rmittt/Jf3oT7NS1ka/zCoc9ovcAYW5CduzuU1WEcgkM
 FwMCP7+p517q6ImLXhUnSUcPjc8eIFv5x1NJ5NAGzPBCJmc98bRwkw0laUu5QE2I9dIH
 puscTPDMWPZcgqfbsTrNf8G+Y7zU3ZrbZXPkCMcM0LJVJn3ijgd7A5UlQZYFKHWR9vG9
 NtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Ins5SyXMErLIBGwpAEI4+DBCUKf26tDWyMTuCKUOUc=;
 b=kpueOYUqKaw3zCQqjV8+H2fY69ArFYJC/MfnM6GQ13PfS0NY67TPsxgj5Ujvuijy+1
 27sfLdgzk+EdvHEETWvQ1NgdyiXrogc7StJFaPLpEx7bDUMzSBjkvZIAvLxe3gQAmUCD
 rY5WhvL4kw1BmMMXJXFMJwR63NMGaTZMniBEMqHtfHsi9IMGue/W0/53U0s+qe3TTpUN
 jyL1+HaEP3QcTmUrWfbLBir3OWad1T+OWMYW4wl3HW+dnP1VcxfFaBWiiUH+B5P/PJEE
 WUUYGKvQAyoTcdbPCTmuULm+QquiwA1bYQ5hLsmYs2UmFTQRrqFyH4LHpajTPmfGwvf+
 zZGQ==
X-Gm-Message-State: AHQUAuYPrUJmQep9eQd+7QcXYe+7mBkpIbHDFexv7cRB19vMFSB+xcyr
 17SlbFDYHEyAfbMHq1S15r6Y4ctz2xpB8p3uMMY=
X-Google-Smtp-Source: AHgI3Iam+0XE6fSvTXehqi+p9lvz9Zn5TXYAUy2xKlS2Wf6cWRWWndzfq69Q09+NpDaZfma0KI14mqqq8AZCbYgookg=
X-Received: by 2002:a1c:1fc8:: with SMTP id f191mr3491639wmf.110.1550704806748; 
 Wed, 20 Feb 2019 15:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <20190220065249.32099-5-ebiggers@kernel.org>
In-Reply-To: <20190220065249.32099-5-ebiggers@kernel.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Feb 2019 00:19:54 +0100
Message-ID: <CAFLxGvxLYL1raaXZPyyMS7CUUak3L6GncZ_GKYz2SSsGHEHpnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/18] fs: add ->s_master_keys to struct super_block
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_152011_228874_900BDEFF 
X-CRM114-Status: GOOD (  18.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>,
 "open list:ABI/API" <linux-api@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add an ->s_master_keys keyring to 'struct super_block'.  New fscrypt
> ioctls will allow adding and removing encryption keys from this keyring.
> This will enable solving multiple interrelated problems with how fscrypt
> keys are provided and managed currently, including:
>
> - Making the key status (which is currently per-process) match the
>   filesystem-level status of which encrypted files are "unlocked".
>
> - Supporting a proper API to remove encryption keys, "locking" the
>   corresponding encrypted files.
>
> - Caching an HMAC transform for each master key, allowing the use of
>   HKDF while still retaining good performance.
>
> - Preventing denial of service via keyctl_invalidate().
>
> Similar to the existing ->s_cop, the keyring is added to the VFS-level
> superblock struct rather than separately to the ext4, f2fs, and ubifs
> superblock structs so that it can be used by the shared code in
> fs/crypto/.  To minimize overhead, the keyring will only be allocated if
> userspace actually adds a key; otherwise will stay NULL.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/super.c         | 3 +++
>  include/linux/fs.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/fs/super.c b/fs/super.c
> index 48e25eba8465..7ca05dda905c 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -291,6 +291,9 @@ static void __put_super(struct super_block *s)
>                 security_sb_free(s);
>                 put_user_ns(s->s_user_ns);
>                 kfree(s->s_subtype);
> +#ifdef CONFIG_FS_ENCRYPTION
> +               key_put(s->s_master_keys);
> +#endif

Please wrap this in a static inline function such that you can get rid
of the ifdef here.
Just like put_user_ns() does.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
