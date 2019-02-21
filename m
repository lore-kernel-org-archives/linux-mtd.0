Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB22C10F08
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:33:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBA820880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LY/S8vmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBA820880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aww0oUQitmWLs3qPq7F1hB3xsO6NiNbAn3WNxc9d6Fg=; b=LY/S8vmZ2IeGrV
	0+Yz2j/OAxg3BqZ2lRzoUphRvk77v0p/14vdtK8LfMd40fujDnd4TzEOBFlqf4Kcas3hhkA2htfJg
	tn8Alm4YKZS++9Q+qPx6dhlitic6QvkaTDmiPViAkqm5mkkmL5TKo9KdBNVEFAVkxQqgT/MdmTsj3
	2UATQ0vCUq7PM9W0VDeOpxsVnVnJODpTNKzslg8Cn66GtY7XOTLXaag9qCPa7uL7SWYQ36Tf5Ox7D
	STuPwQmsaQU+uAvrhQU+L5NZXLy7MfgfLL0oWy5F4+D0xt4W4TQKFZ5FvFZBjNTlzq+p0b9tcJLBv
	1xumVMRBtvfvEvSr2tAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkjH-00022D-4o; Thu, 21 Feb 2019 09:33:19 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkjD-000219-Ir
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 09:33:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5E19D6083265;
 Thu, 21 Feb 2019 10:33:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dbO284T6jKnl; Thu, 21 Feb 2019 10:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DD3AC6083268;
 Thu, 21 Feb 2019 10:33:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id izVKilIaD7-H; Thu, 21 Feb 2019 10:33:13 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 4BB0F6083265;
 Thu, 21 Feb 2019 10:33:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Date: Thu, 21 Feb 2019 10:33:12 +0100
Message-ID: <2024630.T9XyBPH5Ub@blindfold>
In-Reply-To: <20190221054938.GA12467@sol.localdomain>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
 <20190221054938.GA12467@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_013315_767629_2AFE827D 
X-CRM114-Status: GOOD (  15.56  )
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
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric,

Am Donnerstag, 21. Februar 2019, 06:49:39 CET schrieb Eric Biggers:
> Hi Richard,
> 
> On Thu, Feb 21, 2019 at 12:52:38AM +0100, Richard Weinberger wrote:
> > On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > +#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE    \
> > > +       (CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
> > > +
> > > +#define FSCRYPT_MK_DESCRIPTION_SIZE    (2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
> > > +
> > > +static void format_fs_keyring_description(
> > > +                       char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
> > > +                       const struct super_block *sb)
> > > +{
> > > +       sprintf(description, "fscrypt-%s", sb->s_id);
> > > +}
> > 
> > I fear ->s_id is not the right thing.
> > For filesystems such as ext4 ->s_id is the name of the backing block device,
> > so it is per filesysem instance unique.
> > But this is not guaranteed. For UBIFS ->s_id is just "ubifs", always.
> > So the names will clash.
> > 
> 
> What name do you suggest using for UBIFS filesystems?  The keyring name could be
> set by the filesystem via a fscrypt_operations callback if needed.

IMHO the BDI name should be used. 

> Note that the keyring name isn't particularly important, since the ioctls will
> work regardless.  But we might as well choose something logical, since the
> keyring name will still show up in /proc/keys.

I'm not done with reviewing your patches, but will it be possible to use keyctl?
For the a unique name is helpful. :)

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
