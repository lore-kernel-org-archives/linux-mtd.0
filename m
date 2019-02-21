Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16492C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 18:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3EE2084D
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 18:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jN8OZhEe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ke37FgjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3EE2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssZvfZ9gC0LXQj0fbYiCKmWS8DM0zn+mAvuzAUQM/JI=; b=jN8OZhEe3EUvDX
	Zz2HQnWUaKRN44NDRle5UmtmrQuiuKERMwpspWpMTJKJRbiLKdgR7uo4gHQCo3AJRpIR9y2601zmx
	fupQpbVn3YTopsRcNozpG7wAtguIHfSLm0O1Zq1EO+c7+Ut9Rk+4Gl8tJuLvKyY2CI1cQZp+Miifh
	mf5h3tojXmQ/KHeYQ5cT+l/NdmDVXrqJZWbdXSyrs0+ReOsuKolP/RqYhzQJaQ3HqABTaygubS51f
	FebFPjUsETbIjKls5UGP9mMLeg3x+2GUpkmYCTYiZNCsjBvuBCiSn5l6S63NBk3z/zQD/+nCxtIMD
	W8rv2UNIMb6l/wa4rOBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwtIQ-0000KD-21; Thu, 21 Feb 2019 18:42:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwtIM-0000JR-H2
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 18:42:07 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34FC42081B;
 Thu, 21 Feb 2019 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550774525;
 bh=8WKfNcnNtJXTFf2p8f1PbAp1G/jCPpazwETOsaObbZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ke37FgjPjfD4DAQE5bmCpnIW8dqvUeojVbB5fbu7JK8OR4Fz0d4bRO/cO9cW/ky01
 4dvsH301UvnSe+fJUKitDa2JRfH0Lf4vyaOmAmZHBl3WJVqhpeq3fLp/FZBf5hiPJf
 OOQnk5yz1Dh5AowMdEuYi2W4cesPUW2PoNiB9Ork=
Date: Thu, 21 Feb 2019 10:42:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Message-ID: <20190221184203.GB140206@gmail.com>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
 <20190221054938.GA12467@sol.localdomain>
 <2024630.T9XyBPH5Ub@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024630.T9XyBPH5Ub@blindfold>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_104206_585389_959B0EA3 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: linux-ext4@vger.kernel.org, "open list:ABI/API" <linux-api@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 10:33:12AM +0100, Richard Weinberger wrote:
> Eric,
> 
> Am Donnerstag, 21. Februar 2019, 06:49:39 CET schrieb Eric Biggers:
> > Hi Richard,
> > 
> > On Thu, Feb 21, 2019 at 12:52:38AM +0100, Richard Weinberger wrote:
> > > On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > +#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE    \
> > > > +       (CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
> > > > +
> > > > +#define FSCRYPT_MK_DESCRIPTION_SIZE    (2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
> > > > +
> > > > +static void format_fs_keyring_description(
> > > > +                       char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
> > > > +                       const struct super_block *sb)
> > > > +{
> > > > +       sprintf(description, "fscrypt-%s", sb->s_id);
> > > > +}
> > > 
> > > I fear ->s_id is not the right thing.
> > > For filesystems such as ext4 ->s_id is the name of the backing block device,
> > > so it is per filesysem instance unique.
> > > But this is not guaranteed. For UBIFS ->s_id is just "ubifs", always.
> > > So the names will clash.
> > > 
> > 
> > What name do you suggest using for UBIFS filesystems?  The keyring name could be
> > set by the filesystem via a fscrypt_operations callback if needed.
> 
> IMHO the BDI name should be used. 
> 
> > Note that the keyring name isn't particularly important, since the ioctls will
> > work regardless.  But we might as well choose something logical, since the
> > keyring name will still show up in /proc/keys.
> 
> I'm not done with reviewing your patches, but will it be possible to use keyctl?
> For the a unique name is helpful. :)
> 

Not for adding keys, removing keys, or getting a key's status -- those are what
the ioctls are for.

See e.g. the discussion in patch 7 ("fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY
ioctl") for why the keyrings syscalls are a poor fit for fscrypt.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
