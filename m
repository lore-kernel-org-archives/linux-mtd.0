Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F33C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:43:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF06206BE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZJqlIr3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xYKqzs5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF06206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gTPwfrIrSOnU9V1OcjuWHQNfgZcihYNXLdpPtnTKCs4=; b=DZJqlIr3G/eE2zCv+K50FGrlj
	kp5eErnHqTVUYAL+N7qXEZfsw35C35a9uqYA5TrOFrYKBw6z2/RLJbho5pQzUsszj5gPZfL1JSMm/
	Nn4hTtY5b0HSCeeOkkfwcdPKKLGA3bPgsIVbYEwMZycxbFe4zBV0eA82MQXxmQet06vgZABXWklAj
	yZKk6700b8deRpePS6B5ze/We+Ji8N6QX5rfDEGaG0lp3UJ7kwdTbjeyt7vFchggXGalccb1YXML/
	Fjd5vNJH3B4zYGcXSiLOwfGV1rRbRMbjrfaCtAKTihCfXzaZHdqbt7glseXh7PiCLm1Ol8fCaGm8M
	70wQYl+jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAIMy-0006UK-GA; Mon, 24 Aug 2020 19:43:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAIMv-0006Te-UZ
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 19:43:02 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FAE2206BE;
 Mon, 24 Aug 2020 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598298181;
 bh=VP9TI9b+TMTDGH5jknxTSQWn2OukpwVeWj0+r1HqH9k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=xYKqzs5QWDMbOcSpjdJ5hplae+9Z0vbrgF8oQVls4VZxEvXDtLz1rDHee1VCMj0yy
 wWp+DdCWfkMxn4HxEREPzXoFf7y/7ki4WDeYYOZ+fH/bbI13V8Ynr463JJJJi4O0C2
 5hV76sqDY0yat2OsJtZTF1PRuaBLl2cBX2WSMyxg=
Message-ID: <fe81c713ed827b91004b0e2838800684da33e60c.camel@kernel.org>
Subject: Re: [RFC PATCH 1/8] fscrypt: add fscrypt_prepare_new_inode() and
 fscrypt_set_context()
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 24 Aug 2020 15:42:59 -0400
In-Reply-To: <20200824190221.GC1650861@gmail.com>
References: <20200824061712.195654-1-ebiggers@kernel.org>
 <20200824061712.195654-2-ebiggers@kernel.org>
 <0cf5638796e7cddacc38dcd1e967368b99f0069a.camel@kernel.org>
 <20200824182114.GB1650861@gmail.com>
 <06a7d9562b84354eb72bd67c9d4b7262dac53457.camel@kernel.org>
 <20200824190221.GC1650861@gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_154302_139785_1B22CB8C 
X-CRM114-Status: GOOD (  24.55  )
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

On Mon, 2020-08-24 at 12:02 -0700, Eric Biggers wrote:
> On Mon, Aug 24, 2020 at 02:47:07PM -0400, Jeff Layton wrote:
> > On Mon, 2020-08-24 at 11:21 -0700, Eric Biggers wrote:
> > > On Mon, Aug 24, 2020 at 12:48:48PM -0400, Jeff Layton wrote:
> > > > > +void fscrypt_hash_inode_number(struct fscrypt_info *ci,
> > > > > +			       const struct fscrypt_master_key *mk)
> > > > > +{
> > > > > +	WARN_ON(ci->ci_inode->i_ino == 0);
> > > > > +	WARN_ON(!mk->mk_ino_hash_key_initialized);
> > > > > +
> > > > > +	ci->ci_hashed_ino = (u32)siphash_1u64(ci->ci_inode->i_ino,
> > > > > +					      &mk->mk_ino_hash_key);
> > > > 
> > > > i_ino is an unsigned long. Will this produce a consistent results on
> > > > arches with 32 and 64 bit long values? I think it'd be nice to ensure
> > > > that we can access an encrypted directory created on a 32-bit host from
> > > > (e.g.) a 64-bit host.
> > > 
> > > The result is the same regardless of word size and endianness.
> > > siphash_1u64(v, k) is equivalent to:
> > > 
> > > 	__le64 x = cpu_to_le64(v);
> > > 	siphash(&x, 8, k);
> > > 
> > 
> > In the case where you have an (on-storage) inode number that is larger
> > than 2^32, x will almost certainly be different on a 32 vs. 64-bit
> > wordsize.
> > 
> > On the box with the 32-bit wordsize, you'll end up promoting i_ino to a
> > 64-bit word and the upper 32 bits will be zeroed out. So it seems like
> > this means that if you're using inline hardware you're going to end up
> > with a result that won't work correctly across different wordsizes.
> 
> That's only possible if the VFS is truncating the inode number, which would also
> break userspace in lots of ways like making applications think that files are
> hard-linked together when they aren't.  Also, IV_INO_LBLK_64 would break.
> 
> The correct fix for that would be to make inode::i_ino 64-bit.
> 

...or just ask the filesystem for the 64-bit inode number via ->getattr
or a new op. You could also just truncate it down to 32 bits or xor the
top and bottom bits together first, etc...

> Note that ext4 and f2fs (currently the only filesystems that support the
> IV_INO_LBLK_* flags) only support 32-bit inode numbers.
> 

Ahh, ok. That explains why it's not been an issue so far. Still, if
you're reworking this code anyway, you might want to consider avoiding
i_ino here.

-- 
Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
