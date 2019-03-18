Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C8C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 23:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF45B2175B
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 23:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4yRuMyZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVuP1bwp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF45B2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eWMiGPQw+oTs9rs3L+WA3EpucXad9Qk6eG1kBSbzE0=; b=V4yRuMyZ7qrY+4
	iYRMRAS4r0rqULx8pQAcJ62bKnGLXJeZAEmSx8Nep4VCzIxeLEkBAPW9XMvIxtXie5wF/at8nj0Ds
	KeWucySfFlbdg9D1hgryETm4+JSoz2ROpcw2Kk3ib8MUX1yg0x0U7q3W8pI4WOj6CUwHY2uMhwcg5
	xOsOxJy5LLf/q17KKWssd0Gt7dmOeMZisLsKkhOB672o134UstNRX2EclPprEI2AhJ9sOMsdSFd/p
	eNDFzKPEf0QCfn9WmpjRYAE5QfSHRSHBp3nNzkeOl77VbjFLK+CUqJ6EvRkTzUQv4LVazyQa4Yv2Q
	OySFZmYOChxnKT9iT1iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h61Mz-0007OA-7Q; Mon, 18 Mar 2019 23:08:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h61Mw-0007Nk-7z
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 23:08:35 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 124CC2171F;
 Mon, 18 Mar 2019 23:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552950513;
 bh=yaB68QR3BXIzS0jW8UvCblXcYCpbjRQp3yuZ8DGGTpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVuP1bwp4qmwXuBEvQMzUcBL0DEML8mQuvOZjDIbo/hmgqOFAq7vxSswNifRzfR0S
 va+BLDsDjL4v+yCLWDNFQ/b10o7IhvPcrbIucRrLwNQP/dq0vijSHsN/NhZzjuaJTy
 +X/Krnpq3t96XnzWfpFjU0mupEVoaHUvA3St6n9U=
Date: Mon, 18 Mar 2019 16:08:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Message-ID: <20190318230830.GA40545@gmail.com>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
 <20190221054938.GA12467@sol.localdomain>
 <2024630.T9XyBPH5Ub@blindfold> <20190221184203.GB140206@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221184203.GB140206@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_160834_322138_CBCC22A7 
X-CRM114-Status: GOOD (  22.71  )
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

Hi Richard,

On Thu, Feb 21, 2019 at 10:42:03AM -0800, Eric Biggers wrote:
> On Thu, Feb 21, 2019 at 10:33:12AM +0100, Richard Weinberger wrote:
> > Eric,
> > 
> > Am Donnerstag, 21. Februar 2019, 06:49:39 CET schrieb Eric Biggers:
> > > Hi Richard,
> > > 
> > > On Thu, Feb 21, 2019 at 12:52:38AM +0100, Richard Weinberger wrote:
> > > > On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > > +#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE    \
> > > > > +       (CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
> > > > > +
> > > > > +#define FSCRYPT_MK_DESCRIPTION_SIZE    (2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
> > > > > +
> > > > > +static void format_fs_keyring_description(
> > > > > +                       char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
> > > > > +                       const struct super_block *sb)
> > > > > +{
> > > > > +       sprintf(description, "fscrypt-%s", sb->s_id);
> > > > > +}
> > > > 
> > > > I fear ->s_id is not the right thing.
> > > > For filesystems such as ext4 ->s_id is the name of the backing block device,
> > > > so it is per filesysem instance unique.
> > > > But this is not guaranteed. For UBIFS ->s_id is just "ubifs", always.
> > > > So the names will clash.
> > > > 
> > > 
> > > What name do you suggest using for UBIFS filesystems?  The keyring name could be
> > > set by the filesystem via a fscrypt_operations callback if needed.
> > 
> > IMHO the BDI name should be used. 

I tried using sb->s_bdi->name, but it's still "ubifs" for all UBIFS filesystems.

Perhaps there's a way you can make ->s_id for UBIFS unique?  There are already
existing places that log ->s_id, so perhaps you should do it anyway regardless
of this patchset?

> > 
> > > Note that the keyring name isn't particularly important, since the ioctls will
> > > work regardless.  But we might as well choose something logical, since the
> > > keyring name will still show up in /proc/keys.
> > 
> > I'm not done with reviewing your patches, but will it be possible to use keyctl?
> > For the a unique name is helpful. :)
> > 
> 
> Not for adding keys, removing keys, or getting a key's status -- those are what
> the ioctls are for.
> 
> See e.g. the discussion in patch 7 ("fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY
> ioctl") for why the keyrings syscalls are a poor fit for fscrypt.
> 

Anyway, perhaps I should reconsider whether fscrypt should even use the keyrings
subsystem at all, even just "internally", as its quirks still leak out a bit.
I'd prefer a nice clean API without any quirks like having to name the keyrings
and assign SELinux labels to the keys just to make the keyrings subsystem happy.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
