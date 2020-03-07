Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E2C10F00
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 03:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E661D206D7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 03:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CdE0wVlh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E661D206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31Z0woKaI8qd76tCzILUrykE3oYEP6OJlCCgAGgLCKo=; b=CdE0wVlhtrAqVc
	8ia4BQBdO09mf/AIAJlIsjdZ4hn4zm2wLHb5vpR0AUb3Efv1OB6dGPcxqPnLfX1H4cozA6ytTZhmJ
	HhIzIeSjpNgcBCf15DaLtPhNWmGYo8jNLVdmrz7PWk6JD7lfmVo0EV+VHh1+pGxN6oM10qkan9kmr
	+NaVMz0RTXidzlIUEiP0knJVXLf2iyaxkSz5XxcV+g9ed4g9Zn59N7Eku+e94Bc9FBVEJN/x8VbYq
	KOYhNqokmHjf+YHXaWutWiOhgz86qZkk2x4H64ibnvkQMYCt30J9yC7FTHgg5Xzjbu6D5kNPwIsSH
	jwW6/kBboBdbYf4US2Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAQUd-0000S2-GQ; Sat, 07 Mar 2020 03:51:15 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAQUX-0007cL-Ng
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 03:51:11 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jAQSI-006ea4-7q; Sat, 07 Mar 2020 03:48:50 +0000
Date: Sat, 7 Mar 2020 03:48:50 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v8 2/8] fs: Add standard casefolding support
Message-ID: <20200307034850.GH23230@ZenIV.linux.org.uk>
References: <20200307023611.204708-1-drosen@google.com>
 <20200307023611.204708-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307023611.204708-3-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_195109_772183_523AE92A 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2020 at 06:36:05PM -0800, Daniel Rosenberg wrote:

> +/**
> + * generic_ci_d_hash - generic implementation of d_hash for casefolding
> + * @dentry: Entry whose name we are hashing
> + * @len: length of str
> + * @qstr: name of the dentry, safely paired with len
> + * @str: qstr to set hash of
> + *
> + * This performs a case insensitive hash of the given str.
> + * If casefolding is not required, it leaves the hash unchanged.
> + */
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	char small_name[DNAME_INLINE_LEN];
> +	struct qstr entry = QSTR_INIT(str->name, str->len);
> +	int ret = 0;
> +
> +	if (!inode || !needs_casefold(inode))
> +		return 0;
> +
> +	if (make_name_stable(um, dentry, &entry, small_name))
> +		goto err;
> +	ret = utf8_casefold_hash(um, dentry, &entry);
> +	if (ret < 0)
> +		goto err;
> +
> +	return 0;
> +err:
> +	if (sb_has_enc_strict_mode(sb))
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	return ret;
> +}

	Have you even tested that?  Could you tell me where does the calculated
hash go?  And just what is it doing trying to check if the name we are about to
look up in directory specified by 'dentry' might be pointing to dentry->d_iname?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
