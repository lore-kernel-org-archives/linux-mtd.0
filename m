Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D9FC169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 22:13:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A4A218A3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 22:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhFFzvDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A4A218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fromorbit.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReyO5gQJk1Y7wCQMwhzNinQl+CI1v+QFbY/OybTabBQ=; b=mhFFzvDS//gPIW
	p0seF/4/MeI6UBA7Z7DBwVFCNdvVuF+nxKA05zVdhrWa8JcQEKcRuSKC6T3tt5xzFnMZ9gYhHBAEx
	KANaWXAUUQiw8H9xIZS5gDBcKdhCRh1PPZ9X80HUyZ249e+FJIyKFKyY2TV1PeDvzYAOO9HOu0JD5
	z2uneAKddhkjitiOWRbKhi+W12UuwORPSfpE4MRS+MrtpQXKbD/+mBBedfR1vM7L9rS+b13sjdDv6
	CRFfzcuyrvgZdToAk2jvoP7eQXiuF2IbWQmbGRhu5+I7S1sCrnyIlyy+A16tlgzIjKSfEzqHoL88P
	aAneNvQRIzLRQjFIlFPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtJox-0004WK-Fi; Mon, 11 Feb 2019 22:12:59 +0000
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtJot-0004UB-0K
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 22:12:57 +0000
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard)
 ([59.167.129.252])
 by ipmail06.adl2.internode.on.net with ESMTP; 12 Feb 2019 08:42:51 +1030
Received: from dave by dastard with local (Exim 4.80)
 (envelope-from <david@fromorbit.com>)
 id 1gtJon-0002HS-4g; Tue, 12 Feb 2019 09:12:49 +1100
Date: Tue, 12 Feb 2019 09:12:49 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RFC PATCH v2 11/20] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY
 ioctl
Message-ID: <20190211221249.GH20493@dastard>
References: <20190211172738.4633-1-ebiggers@kernel.org>
 <20190211172738.4633-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190211172738.4633-12-ebiggers@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_141255_653832_949338BA 
X-CRM114-Status: GOOD (  24.10  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 09:27:29AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a new fscrypt ioctl, FS_IOC_REMOVE_ENCRYPTION_KEY.  This ioctl
> removes an encryption key that was added by FS_IOC_ADD_ENCRYPTION_KEY.
> It wipes the secret key itself, then "locks" the encrypted files and
> directories that had been unlocked using that key -- implemented by
> evicting the relevant dentries and inodes from the VFS caches.
> 
> The problem this solves is that many fscrypt users want the ability to
> remove encryption keys, causing the corresponding encrypted directories
> to appear "locked" (presented in ciphertext form) again.  Moreover,
> users want removing an encryption key to *really* remove it, in the
> sense that the removed keys cannot be recovered even if kernel memory is
> compromised, e.g. by the exploit of a kernel security vulnerability or
> by a physical attack.  This is desirable after a user logs out of the
> system, for example.  In many cases users even already assume this to be
> the case and are surprised to hear when it's not.
> 
> It is not sufficient to simply unlink the master key from the keyring
> (or to revoke or invalidate it), since the actual encryption transform
> objects are still pinned in memory by their inodes.  Therefore, to
> really remove a key we must also evict the relevant inodes.
> 
> Currently one workaround is to run 'sync && echo 2 >
> /proc/sys/vm/drop_caches'.  But, that evicts all unused inodes in the
> system rather than just the inodes associated with the key being
> removed, causing severe performance problems.  Moreover, it requires
> root privileges, so regular users can't "lock" their encrypted files.
> 
> Another workaround, used in Chromium OS kernels, is to add a new
> VFS-level ioctl FS_IOC_DROP_CACHE which is a more restricted version of
> drop_caches that operates on a single super_block.  It does:
> 
>         shrink_dcache_sb(sb);
>         invalidate_inodes(sb, false);
> 
> But it's still a hack.  Yet, the major users of filesystem encryption
> want this feature badly enough that they are actually using these hacks.
> 
> To properly solve the problem, start maintaining a list of the inodes
> which have been "unlocked" using each master key.  Originally this
> wasn't possible because the kernel didn't keep track of in-use master
> keys at all.  But, with the ->s_master_keys keyring it is now possible.
> 
> Then, add an ioctl FS_IOC_REMOVE_ENCRYPTION_KEY.  It finds the specified
> master key in ->s_master_keys, then wipes the secret key itself, which
> prevents any additional inodes from being unlocked with the key.  Then,
> it syncs the filesystem and evicts the inodes in the key's list.  The
> normal inode eviction code will free and wipe the per-file keys (in
> ->i_crypt_info).  Note that freeing ->i_crypt_info without evicting the
> inodes was also considered, but would have been racy.

The solution is still so gross. Exporting all the inode cache
internal functions so you can invalidate an external list of inodes
is, IMO, not an appropriate solution for anything.

Indeed, this is exactly what ->drop_inode() is for.

Take this function:

> +static void evict_dentries_for_decrypted_inodes(struct fscrypt_master_key *mk)
> +{
> +	struct fscrypt_info *ci;
> +	struct inode *inode;
> +	struct inode *toput_inode = NULL;
> +
> +	spin_lock(&mk->mk_decrypted_inodes_lock);
> +
> +	list_for_each_entry(ci, &mk->mk_decrypted_inodes, ci_master_key_link) {
> +		inode = ci->ci_inode;
> +		spin_lock(&inode->i_lock);
> +		if (inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW)) {
> +			spin_unlock(&inode->i_lock);
> +			continue;
> +		}
> +		__iget(inode);
> +		spin_unlock(&inode->i_lock);
> +		spin_unlock(&mk->mk_decrypted_inodes_lock);
> +
> +		shrink_dcache_inode(inode);
> +		iput(toput_inode);
> +		toput_inode = inode;
> +
> +		spin_lock(&mk->mk_decrypted_inodes_lock);
> +	}
> +
> +	spin_unlock(&mk->mk_decrypted_inodes_lock);
> +	iput(toput_inode);
> +}

It takes a new reference to each decrypted inode, and then drops it
again after all the dentry cache references have been killed and
we've got a reference to the next inode in the list.  Killing the
dentry references to the inode means it should only have in-use
references and the reference this function holds on it.

If the inode is not in use then there will be only one, and so it
will fall into iput_final() and the ->drop_inode() function
determines if the inode should be evicted from the cache and
destroyed immediately.  IOWs, implement fscrypt_drop_inode() to do
the right thing when the key has been destroyed, and you can get rid
of all this crazy inode cache walk-and-invalidate hackery.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
