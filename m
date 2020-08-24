Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC5CC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 18:48:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3056E2065F
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 18:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRsle9NS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW/d0Pp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3056E2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UQO+TGg7mpTMyUaDT3t/rIkCZXf29DMBARjSxGNrvao=; b=oRsle9NSzhRE5OJYtLsOCvVFz
	fD+7GuLjAbcg4Dj2QfIUnPg6s2ypke0OHDMNlmG/5cZru8xCNbrOaRre/pu3qQqh/bhpV4Cgr7LFw
	DiZocyXL4CSXNu264AFRhqX7ZmU8PLIfuuhMKcerKss7zD6LSLTVYajnzwP5haudib5tWM+jHYzLD
	ro0kAjIaNNUA3ndHqJp49dMMEqlDsmV/IsC3S+mU2dkb4GLdUO068rjc8zAw5fWRvv1NJoa5zFeHO
	rmPj6naQOuvRZ3+ZZqarqkdLQSv1S+aigypphm3CrjNdHro33UgDuPbjxPLZnNC2aNhtsKpG22SZg
	vfbM1LCjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAHUt-0000DW-Mf; Mon, 24 Aug 2020 18:47:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAHUr-0000CT-DU
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 18:47:10 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3950E2065F;
 Mon, 24 Aug 2020 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598294828;
 bh=Q7rmqcK2cO9kRc9mX2R6752q1QKh7uDgYP8Nhp7kyZI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jW/d0Pp4ABd3WvH2jRkyX22o8nNqFLAVEM/VSskJLw2gvHHnZXrjOHSDgr3mVdwG0
 dV4128xFP6onTskk79j4bPFBm6QXO20H6zHsikIukfmpAWaXp/Gm48/7ic85qV5ZZQ
 GftdbOJTX3YHxf3lfJum6XjMMK0spCkkUxBerdlE=
Message-ID: <06a7d9562b84354eb72bd67c9d4b7262dac53457.camel@kernel.org>
Subject: Re: [RFC PATCH 1/8] fscrypt: add fscrypt_prepare_new_inode() and
 fscrypt_set_context()
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 24 Aug 2020 14:47:07 -0400
In-Reply-To: <20200824182114.GB1650861@gmail.com>
References: <20200824061712.195654-1-ebiggers@kernel.org>
 <20200824061712.195654-2-ebiggers@kernel.org>
 <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
 <20200824182114.GB1650861@gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_144709_710530_E8868A2D 
X-CRM114-Status: GOOD (  27.81  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-24 at 11:21 -0700, Eric Biggers wrote:
> On Mon, Aug 24, 2020 at 12:48:48PM -0400, Jeff Layton wrote:
> > > +void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> > > +			       const struct fscrypt_master_key *mk)
> > > +{
> > > +	WARN_ON(ci->ci_inode->i_ino == 0);
> > > +	WARN_ON(!mk->mk_ino_hash_key_initialized);
> > > +
> > > +	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
> > > +					      &mk->mk_ino_hash_key);
> > 
> > i_ino is an unsigned long. Will this produce a consistent results on
> > arches with 32 and 64 bit long values? I think it'd be nice to ensure
> > that we can access an encrypted directory created on a 32-bit host from
> > (e.g.) a 64-bit host.
> 
> The result is the same regardless of word size and endianness.
> siphash_1u64(v, k) is equivalent to:
> 
> 	__le64 x = cpu_to_le64(v);
> 	siphash(&x, 8, k);
> 

In the case where you have an (on-storage) inode number that is larger
than 2^32, x will almost certainly be different on a 32 vs. 64-bit
wordsize.

On the box with the 32-bit wordsize, you'll end up promoting i_ino to a
64-bit word and the upper 32 bits will be zeroed out. So it seems like
this means that if you're using inline hardware you're going to end up
with a result that won't work correctly across different wordsizes.

Maybe that's ok, but it seems like something that could be handled by
hashing a different value.

> > It may be better to base this on something besides i_ino
> 
> This code that hashes the inode number is only used when userspace used
> FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 for the directory.  IV_INO_LBLK_32 modifies
> the encryption to be optimized for eMMC inline encryption hardware.  For more
> details, see commit e3b1078bedd3 which added this feature.
> 
> We actually could have hashed the file nonce instead of the inode number.  But I
> wanted to make the eMMC-optimized format similar to IV_INO_LBLK_64, which is the
> format optimized for UFS inline encryption hardware.
> 
> Both of these flags have very specific use cases; they make it feasible to use
> inline encryption hardware
> (https://www.kernel.org/doc/html/latest/block/inline-encryption.html)
> that only supports a small number of keyslots and that limits the IV length.
> 
> You don't need to worry about these flags at all for ceph, since there won't be
> any use case to use them on ceph, and ceph won't be declaring support for them.

Ahh, good to know. Thanks!
-- 
Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
