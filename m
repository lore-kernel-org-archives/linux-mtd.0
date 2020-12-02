Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73540C6369E
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:49:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD0B221F7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 22:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD0B221F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dU+3pAN7dH+h0yHJGxsowIcdYpJM+nA+hsjQTtIDEPE=; b=uVJTAjS5+6gN8nWw9nqTdOTXw
	lq/TmHMS0Z0UNB81xLIaRP4ai8WXtrLzHxRguvDMTMaAN/ctroaEnmFDs1f1GQgdJB32i20mKy2bg
	kRZXkgrqLFc6J8vmiSOtCk2MmBVU/4RvzR8F6001Z/fdvuTgQKDPhyECWuhAXWb9SOAEenK1NzMta
	iBD0arq9t9v2vcC49gJDJ+40f9w0GYlbVORv1jJLHBQNKESvXOwyRoI2Vs4op71Ca95irY4SmsfUU
	31kKgklE96zNgwLdAlsAqljXgSCRYpdT0Zcy0gmYrlwUxc8sucOuLCSILdjsqzOjfcxmYLAu4YWz2
	vPZFI3BGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkavV-0007xV-3l; Wed, 02 Dec 2020 22:48:45 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkavS-0007ur-D0
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 22:48:43 +0000
Received: by mail-pj1-x1044.google.com with SMTP id l23so6269pjg.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2020 14:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=9QfXOnDQXBcVNRGuammJHFxREgoMLaRZ+ETyqz3mSr4=;
 b=qmksV4Dals8a82iYZ6RK8iTVyq6BvbUIrYlGWlQ4O/dpBg0D4yX82WYzUNnAE7hJkr
 N8u9EtWId4CNnvU9sf2UIYJKK/91kqto6cPWMEOIYb/gkXMSps6xKX28m20aibsE3mBr
 VDOhSnMNyA3R6tzYwNFOIs+YNklblSN7U6U+J0VihswubYFQLsNzqwS3UBvEJN0Nmyec
 HCZ9oNIHzuiIWpY4buwK5YObY3wfTIKU2KeM1O1PBayhixMlEDFN+hepJR39diyLQrNe
 XVKVCKfT0Vtq0ecgex0eZJ8WyKiBOnEvPK9MzoVIcOBcpkOCekthdDwUuQ0Fn7V4VMJt
 toXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=9QfXOnDQXBcVNRGuammJHFxREgoMLaRZ+ETyqz3mSr4=;
 b=bewRCTccgb57SBNv0rA8AUMmigu7USLOY3TW9xCmrxJjlbMfJ5+RntvaZBG4e4gs/0
 tr4VlKnSsLMZN8AjQPxsyKteJJNJzQ5iqIism2Fhzkab2RugdD+nCy/l/f+MGAZLGHYv
 UQ4hO9XpjM31Ir+zYELOvByrSrPbm4ZsheA7eqvAoUoomi9e1khDWj5RQZUsSveT1BJk
 T+XNI1eNlaJuboW0ErdUSWYUKmYtCPgWM9KcUf03a/IY+m7Uzq1CRaFBTsblX9bqiwbV
 /0tPk4Z5aEe/YZ3KOBjpKqhA+VEKmU7uAVPMCg0q6ASI4Gs6TnIJrZOXPKrCTyg5qAEg
 A8sw==
X-Gm-Message-State: AOAM533mZn85OObc+kWW7rTjq3JH+lZTrOKUKTHLXP5Di2jABEo06qVW
 +Q9eAtF2SnKZ8ctDOzexwttR/T2ZfV1TJuEl
X-Google-Smtp-Source: ABdhPJwGO33+14WKujPnINCQQRxu9coWEviCw1QTjdn6wzLYUL8K2FoZeAWtCeVe/xzwjeL4Ge2htA==
X-Received: by 2002:a17:902:b70d:b029:da:5196:1181 with SMTP id
 d13-20020a170902b70db02900da51961181mr232870pls.81.1606949320011; 
 Wed, 02 Dec 2020 14:48:40 -0800 (PST)
Received: from [192.168.10.160] (S01061cabc081bf83.cg.shawcable.net.
 [70.77.221.9])
 by smtp.gmail.com with ESMTPSA id q4sm98773pgl.14.2020.12.02.14.48.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:48:39 -0800 (PST)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <317E7E03-9620-4610-8DA5-63221FE41F04@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 4/9] ext4: don't call fscrypt_get_encryption_info() from
 dx_show_leaf()
Date: Wed, 2 Dec 2020 15:48:37 -0700
In-Reply-To: <20201125002336.274045-5-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
 <20201125002336.274045-5-ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_174842_479757_1E01F162 
X-CRM114-Status: GOOD (  21.99  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============6994428986927000763=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6994428986927000763==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_B03EA783-7B75-4554-A00C-B7E221071E74";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_B03EA783-7B75-4554-A00C-B7E221071E74
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On Nov 24, 2020, at 5:23 PM, Eric Biggers <ebiggers@kernel.org> wrote:
> 
> From: Eric Biggers <ebiggers@google.com>
> 
> The call to fscrypt_get_encryption_info() in dx_show_leaf() is too low
> in the call tree; fscrypt_get_encryption_info() should have already been
> called when starting the directory operation.  And indeed, it already
> is.  Moreover, the encryption key is guaranteed to already be available
> because dx_show_leaf() is only called when adding a new directory entry.
> 
> And even if the key wasn't available, dx_show_leaf() uses
> fscrypt_fname_disk_to_usr() which knows how to create a no-key name.
> 
> So for the above reasons, and because it would be desirable to stop
> exporting fscrypt_get_encryption_info() directly to filesystems, remove
> the call to fscrypt_get_encryption_info() from dx_show_leaf().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

> ---
> fs/ext4/namei.c | 8 +-------
> 1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 793fc7db9d28..7b31aea3e025 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -643,13 +643,7 @@ static struct stats dx_show_leaf(struct inode *dir,
> 
> 				name  = de->name;
> 				len = de->name_len;
> -				if (IS_ENCRYPTED(dir))
> -					res = fscrypt_get_encryption_info(dir);
> -				if (res) {
> -					printk(KERN_WARNING "Error setting up"
> -					       " fname crypto: %d\n", res);
> -				}
> -				if (!fscrypt_has_encryption_key(dir)) {
> +				if (!IS_ENCRYPTED(dir)) {
> 					/* Directory is not encrypted */
> 					ext4fs_dirhash(dir, de->name,
> 						de->name_len, &h);
> --
> 2.29.2
> 


Cheers, Andreas






--Apple-Mail=_B03EA783-7B75-4554-A00C-B7E221071E74
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl/IGcUACgkQcqXauRfM
H+CFUQ/7BW3B4eOfjKM/CmfaV3AGSXDkVCxci+BVZOXQd5jPh0jD6P+vnNHrVvaJ
OrmL9sLLzlXw39gLrZk21geNwdDWRXvNSp+mY0TmTjDBGeTvrQQydNMziRYs6xcS
+Dei6c8LQA05JAqTDHbzV9rVRE/Xxbdsux09cUB21Agt3ruFi/90TPK7G6s3ObJD
Asbh05XZ1JqaZ8W65AUPlQzwqrLXL8WCS/Qkfp0nsXWvebKRdrDtJ8FaEPjiZkeF
rhS72LzdH8Arwc4kHVe1TVw4txY0su010X14LXUIQXZT8MjZrkbArOtPut+XMrpX
8IdD3KaUFhBAvB89fK2QIN62Y+RRiPkSXQFHCz/P/S/ruRjxnjaG57PesasV/D4D
4aYArbY8+QgrpbqY8AayIDZNqOkf9xMc5xD3nm5hjqN1htXPnHxozSUa31+CXRuC
nSb1MvlGtQX6j2cpXtTrrm4jwVKW8W4JhMaUBWmaUTKvxmZvfBpOQ6BSfaSBHuDW
2mgj4jQAiqw/9ZIMY9QYKjQZszI9CUXXZdstrqhJhoQM6z4etgh3yKkvnp2gR9QP
xSwGVQ6D8z+AECS7YLnZIgrVyK4Fb9Adha36LbjFyvt0+sRroXbtMsorXLorJmQi
30z/sqoYZ5O7zhIvTegvrIJZrjuX6XPT80DQqhswJFw2fteJFsQ=
=Ks9F
-----END PGP SIGNATURE-----

--Apple-Mail=_B03EA783-7B75-4554-A00C-B7E221071E74--


--===============6994428986927000763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6994428986927000763==--

