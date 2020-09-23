Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0860CC4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:26:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A769A21D43
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 06:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pUByl20y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9hZFORZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A769A21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v6n6A+TQdH+My8t16qD8tNmugqmwCcTITPHEvspHzB0=; b=pUByl20yNO+YHAY8KEvtVSuoJ
	gZoPbN73XTtfHxjPGSZVc4wFC6D+lx2KC90JWzF7aT6CJkpAxb6VLOo3CTQW9g0hBwyoLzjlheAB6
	V4+GH4+j5BHMCzmffucHztSrhIbMvpUfgCUcwkZ+gAjkFUOfP8JvQiLp8OE4y9c+5Xpeof044jrEg
	MSHZH5W73NDYWOVswLW7r9LzwWf8SEqtxe5ZBqEoVzHalczBPTkMwn61BBNDv1ha5uC5goK9+/pTg
	mZXD/xJqdqwAiyUzWwwBcHJiNsQ9bN3ureijRnTtk7T44P6eigu7Zqn/AM0HAS8/t/3ztcWxRU26V
	Yg3nr2nwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKyD8-0005sv-M5; Wed, 23 Sep 2020 06:25:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKyD5-0005rz-BC
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 06:25:00 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 425FC21D43;
 Wed, 23 Sep 2020 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600842298;
 bh=EH8hBpeiETHC+h9j5rcOQFLvuMpOSGcVeSqcrnJIr+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o9hZFORZJfS43AD9qs/eouYS9H2lmfwPF3ydoBftcuORWrWFA+Oosf8DKY1mk3Zm3
 cIZCITTnRgEk6JhC/F6wZsXxGJPNPdgYJYJhHDaphw687jIKp1UHYaNhlwigfbmU7Y
 swkdL+l/hvzPy8OCNZxj+GedL3eT8qcF1ZOoGSNU=
Date: Tue, 22 Sep 2020 23:24:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 5/5] f2fs: Handle casefolding with Encryption
Message-ID: <20200923062456.GF9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-6-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-6-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_022459_555686_7764AE23 
X-CRM114-Status: GOOD (  20.71  )
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

On Wed, Sep 23, 2020 at 01:01:51AM +0000, Daniel Rosenberg wrote:
> Expand f2fs's casefolding support to include encrypted directories.  To
> index casefolded+encrypted directories, we use the SipHash of the
> casefolded name, keyed by a key derived from the directory's fscrypt
> master key.  This ensures that the dirhash doesn't leak information
> about the plaintext filenames.
> 
> Encryption keys are unavailable during roll-forward recovery, so we
> can't compute the dirhash when recovering a new dentry in an encrypted +
> casefolded directory.  To avoid having to force a checkpoint when a new
> file is fsync'ed, store the dirhash on-disk appended to i_name.
> 
> This patch incorporates work by Eric Biggers <ebiggers@google.com>
> and Jaegeuk Kim <jaegeuk@kernel.org>.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---

Generally looks good.  If it's needed, you can add:

Reviewed-by: Eric Biggers <ebiggers@google.com>

(Though, some may claim I can't give Reviewed-by since this patch already has my
Co-developed-by.)

One comment below, though:

> @@ -218,9 +219,28 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
>  {
>  	const struct super_block *sb = dir->i_sb;
>  	const struct unicode_map *um = sb->s_encoding;
> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
>  	struct qstr entry = QSTR_INIT(de_name, de_name_len);
>  	int res;
>  
> +	if (IS_ENCRYPTED(dir)) {
> +		const struct fscrypt_str encrypted_name =
> +			FSTR_INIT((u8 *)de_name, de_name_len);
> +
> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
> +			return false;
> +
> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> +		if (!decrypted_name.name)
> +			return false;
> +		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
> +						&decrypted_name);
> +		if (res < 0)
> +			goto out;

We probably should be passing up errors from here to f2fs_match_name(), then to
f2fs_find_target_dentry(), then to f2fs_find_in_inline_dir() or find_in_block().

Ignoring the filename may be okay if fscrypt_fname_disk_to_usr() returns
-EUCLEAN, indicating that it's invalid.  However, if the error is -ENOMEM,
either from the kmalloc() or from fscrypt_fname_disk_to_usr(), then the caller
should receive an error rather than the filename being ignored.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
