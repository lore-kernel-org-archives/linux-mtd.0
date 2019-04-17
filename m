Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BA3C10F13
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 00:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53BC72177B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 00:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tm64jJRg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnSwm4q9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53BC72177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6K9ve/jNBz1i2U58fereQ6JFwBjm6xmUP6lJSStFpOs=; b=tm64jJRg2VNtN4
	1JFMOZU5u+XNTJOwv8PveRSfaXtFr+hGGUzV7IQguT+RNxzvcB050je89xCdTut3ASX6sSwEM1KCC
	TeOfcKaitx7HXSVgH9z48C03SSka6sP/SB+KZPULxU2gKRjv6vbe3aDg09DdrHcXLM6ubpfSWVAA5
	t+s9inNuu3K++fl0dCtRNhWL5EJQ4Gg/0WYWMeuieFE6HsUxEcTuELMvX7t7MEQc1JTOeq5Otim1h
	ny2JMK91XKgG28rWchLuHOU5P67dKVQphbnmXyPhrFLAePwnHazN7dqGC7nR2cGOSTR8SbA7eS2mn
	g6oIptk5uvOdWisHzvLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGYA4-0000JF-3Q; Wed, 17 Apr 2019 00:10:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGYA0-0000Ir-Tw
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 00:10:46 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD2942176F;
 Wed, 17 Apr 2019 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555459844;
 bh=9EgjyPTwyBH3hbIjglZPk1qxDWK0l0tAqHzLGYC7bOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OnSwm4q9mAnM9L9uROODGHLzGSntdduItP+X97q8kBJ1shAUGSNZcVVFJZZjeUOjc
 p9ucAr7X6+YqhEnAwmYoqjDmKx1aZ46+ZQPLATvR7zqt7IxCxlsczk8+P5/tM0Uv/V
 7lXCP05DAqnCc94kCwjnaaVzaEnxS3FEOD+St3PQ=
Date: Tue, 16 Apr 2019 17:10:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v2 1/5] fscrypt: clean up and improve dentry revalidation
Message-ID: <20190417001041.GA18090@gmail.com>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-2-ebiggers@kernel.org>
 <20190416230840.GB14623@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190416230840.GB14623@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_171044_979160_3F79CC3F 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2019 at 07:08:40PM -0400, Theodore Ts'o wrote:
> On Wed, Mar 20, 2019 at 11:39:09AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Make various improvements to fscrypt dentry revalidation:
> > 
> > - Don't try to handle the case where the per-directory key is removed,
> >   as this can't happen without the inode (and dentries) being evicted.
> > 
> > - Flag ciphertext dentries rather than plaintext dentries, since it's
> >   ciphertext dentries that need the special handling.
> > 
> > - Avoid doing unnecessary work for non-ciphertext dentries.
> > 
> > - When revalidating ciphertext dentries, try to set up the directory's
> >   i_crypt_info to make sure the key is really still absent, rather than
> >   invalidating all negative dentries as the previous code did.  An old
> >   comment suggested we can't do this for locking reasons, but AFAICT
> >   this comment was outdated and it actually works fine.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Looks good, applied.
> 
> 					- Ted

Hi Ted, I assumed you resolved the conflict with "fscrypt: use READ_ONCE() to
access ->i_crypt_info"?  The code in fscrypt_d_revalidate() should be:

        dir = dget_parent(dentry);
        err = fscrypt_get_encryption_info(d_inode(dir));
        valid = !fscrypt_has_encryption_key(d_inode(dir));
        dput(dir);

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
