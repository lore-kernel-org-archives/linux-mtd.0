Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E5EC169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 23:31:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A2B2184E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 23:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzBTeAXi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x+shTtwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A2B2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNGe8PhihHCZFUIAHfHteZkTUrc+04pGpKtQ9Gk9w7M=; b=HzBTeAXiHly7Cc
	M4VOWZZOHy6vjay+prNLVD4SMvSM90e5WOlPYFlgIQBqD5x0u7ugfg7ge1lvoCJDLYdRPJ53/se4U
	9Dx3g3GYhDdkR0PXmZuWEDcCjy6TWTqpM0cP9FVbge/KWUawNfgHzUJ/SmvHia00pHsDYwKsIcVzT
	smriNq4uO1R6ES9JpDnTzqBUOz1dtCUMY0nDb1aNF3MqBRuyTChol4lvnlFHDATXHA6Rb92bAKd3U
	8NlSqBVpa4x+U7iyGRZWyuW5tT/M1Dg20ixH5euRoI2Mff2J0i84aWl9Ies0b31/ezSfAIeHWB+tj
	sbi10qOIXiv5OSdeTtiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtL31-0006Xo-3x; Mon, 11 Feb 2019 23:31:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtL2y-0006XM-6y
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 23:31:33 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0597C214DA;
 Mon, 11 Feb 2019 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549927891;
 bh=fJNQdBM8do17u+ohCCOCu1IDIFWNuCoHtZtiVLLi/7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x+shTtwQNLmQ8eGe/XHHqrGVwtXq8FBZym3FTVNbHzHSE3Cg7khCMkA1m0+5SBgZE
 R8LdP4PieEK/lXIgos1XiLhB7KgPc3O8tuqyaZr4xXWgBjnVy6MipqCFsBM6zaw0M2
 vqRAdII3ENalwH8QRdhEhLCwB/g59y8NXHQIzpqs=
Date: Mon, 11 Feb 2019 15:31:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Subject: Re: [RFC PATCH v2 11/20] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY
 ioctl
Message-ID: <20190211233128.GB226227@gmail.com>
References: <20190211172738.4633-1-ebiggers@kernel.org>
 <20190211172738.4633-12-ebiggers@kernel.org>
 <20190211221249.GH20493@dastard>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190211221249.GH20493@dastard>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_153132_296510_44041905 
X-CRM114-Status: GOOD (  33.93  )
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

Hi Dave,

On Tue, Feb 12, 2019 at 09:12:49AM +1100, Dave Chinner wrote:
> On Mon, Feb 11, 2019 at 09:27:29AM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a new fscrypt ioctl, FS_IOC_REMOVE_ENCRYPTION_KEY.  This ioctl
> > removes an encryption key that was added by FS_IOC_ADD_ENCRYPTION_KEY.
> > It wipes the secret key itself, then "locks" the encrypted files and
> > directories that had been unlocked using that key -- implemented by
> > evicting the relevant dentries and inodes from the VFS caches.
> > 
> > The problem this solves is that many fscrypt users want the ability to
> > remove encryption keys, causing the corresponding encrypted directories
> > to appear "locked" (presented in ciphertext form) again.  Moreover,
> > users want removing an encryption key to *really* remove it, in the
> > sense that the removed keys cannot be recovered even if kernel memory is
> > compromised, e.g. by the exploit of a kernel security vulnerability or
> > by a physical attack.  This is desirable after a user logs out of the
> > system, for example.  In many cases users even already assume this to be
> > the case and are surprised to hear when it's not.
> > 
> > It is not sufficient to simply unlink the master key from the keyring
> > (or to revoke or invalidate it), since the actual encryption transform
> > objects are still pinned in memory by their inodes.  Therefore, to
> > really remove a key we must also evict the relevant inodes.
> > 
> > Currently one workaround is to run 'sync && echo 2 >
> > /proc/sys/vm/drop_caches'.  But, that evicts all unused inodes in the
> > system rather than just the inodes associated with the key being
> > removed, causing severe performance problems.  Moreover, it requires
> > root privileges, so regular users can't "lock" their encrypted files.
> > 
> > Another workaround, used in Chromium OS kernels, is to add a new
> > VFS-level ioctl FS_IOC_DROP_CACHE which is a more restricted version of
> > drop_caches that operates on a single super_block.  It does:
> > 
> >         shrink_dcache_sb(sb);
> >         invalidate_inodes(sb, false);
> > 
> > But it's still a hack.  Yet, the major users of filesystem encryption
> > want this feature badly enough that they are actually using these hacks.
> > 
> > To properly solve the problem, start maintaining a list of the inodes
> > which have been "unlocked" using each master key.  Originally this
> > wasn't possible because the kernel didn't keep track of in-use master
> > keys at all.  But, with the ->s_master_keys keyring it is now possible.
> > 
> > Then, add an ioctl FS_IOC_REMOVE_ENCRYPTION_KEY.  It finds the specified
> > master key in ->s_master_keys, then wipes the secret key itself, which
> > prevents any additional inodes from being unlocked with the key.  Then,
> > it syncs the filesystem and evicts the inodes in the key's list.  The
> > normal inode eviction code will free and wipe the per-file keys (in
> > ->i_crypt_info).  Note that freeing ->i_crypt_info without evicting the
> > inodes was also considered, but would have been racy.
> 
> The solution is still so gross. Exporting all the inode cache
> internal functions so you can invalidate an external list of inodes
> is, IMO, not an appropriate solution for anything.
> 
> Indeed, this is exactly what ->drop_inode() is for.
> 
> Take this function:
> 
> > +static void evict_dentries_for_decrypted_inodes(struct fscrypt_master_key *mk)
> > +{
> > +	struct fscrypt_info *ci;
> > +	struct inode *inode;
> > +	struct inode *toput_inode = NULL;
> > +
> > +	spin_lock(&mk->mk_decrypted_inodes_lock);
> > +
> > +	list_for_each_entry(ci, &mk->mk_decrypted_inodes, ci_master_key_link) {
> > +		inode = ci->ci_inode;
> > +		spin_lock(&inode->i_lock);
> > +		if (inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW)) {
> > +			spin_unlock(&inode->i_lock);
> > +			continue;
> > +		}
> > +		__iget(inode);
> > +		spin_unlock(&inode->i_lock);
> > +		spin_unlock(&mk->mk_decrypted_inodes_lock);
> > +
> > +		shrink_dcache_inode(inode);
> > +		iput(toput_inode);
> > +		toput_inode = inode;
> > +
> > +		spin_lock(&mk->mk_decrypted_inodes_lock);
> > +	}
> > +
> > +	spin_unlock(&mk->mk_decrypted_inodes_lock);
> > +	iput(toput_inode);
> > +}
> 
> It takes a new reference to each decrypted inode, and then drops it
> again after all the dentry cache references have been killed and
> we've got a reference to the next inode in the list.  Killing the
> dentry references to the inode means it should only have in-use
> references and the reference this function holds on it.
> 
> If the inode is not in use then there will be only one, and so it
> will fall into iput_final() and the ->drop_inode() function
> determines if the inode should be evicted from the cache and
> destroyed immediately.  IOWs, implement fscrypt_drop_inode() to do
> the right thing when the key has been destroyed, and you can get rid
> of all this crazy inode cache walk-and-invalidate hackery.
> 

Thanks for the feedback!  If I understand correctly, your suggestion is:

- Keep evict_dentries_for_decrypted_inodes() as-is, i.e. fscrypt would still
  evict the dentries for all inodes in ->mk_decrypted_inodes.
  (I don't see how it could work otherwise.)

- However, evict_decrypted_inodes() would be removed and fscrypt would not
  directly evict the list of inodes.  Instead, the filesystem's ->drop_inode()
  would be made to return 1 if the inode's master key has been removed.  Thus
  each inode, if no longer in use, would end up getting evicted during the
  iput() in evict_dentries_for_decrypted_inodes().

I hadn't thought of this, and I think it would work; I'll try implementing it.
It would also have the advantage that if a key is removed while an inode is
still in-use, that inode will be evicted as soon as it's no longer in use rather
than waiting around until another FS_IOC_REMOVE_ENCRYPTION_KEY.

The ioctl will need a different way to determine whether any inodes couldn't be
evicted, but simply checking whether ->mk_decrypted_inodes ended up empty or not
should work.

FWIW, originally I also considered leaving the inodes in the inode cache and
instead only freeing ->i_crypt_info and truncating the pagecache.  But I don't
see a way to do it even with this new idea; for one, ->drop_inode() is called
under ->i_lock.  So it seems that eviction is still the way to go.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
