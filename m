Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5EAC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 05:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06822086C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 05:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BA4Fdhf5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaQLabSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F06822086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUCYxLrUB1PIB6yoKpH2pw1k++4X012YXz+I85IWYO8=; b=BA4Fdhf51RRu0/
	Gs7bztelytcJBfE8Ikud66fYDq7JaLjR1MdyAGEdkvqaek+UbG+5S/RtTtzFf+7XpG45Hgww/LEDc
	hK/3JZ2SF1amXpYaY7KEybWW6frPi+HrJhCkiwHwjq2r2UucO2DP9teLwYMSUbkBu70eVi1AwXQOn
	1jUMvB6B5vorzcshRJUU+48SXXPT7whKbYaHU1RicMzz7c84wNxZ7r1Dtq656Z0FkWcGAqJkGZ89A
	oF3C0zvkTgydC1tTL7j+GMCSAbrXClvpI0IOgVOp6xDq+JDNftG+cGXaw7qPKVeGgRQxKzdCJtofF
	IAV0C+x/R34UlT8rDPmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwhEy-0001fQ-84; Thu, 21 Feb 2019 05:49:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwhEu-0001e8-4w
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 05:49:45 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E22692084F;
 Thu, 21 Feb 2019 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550728181;
 bh=i2gB2WiF3pXqcwwpFZZxSn9+PuXQgQG4KD3gpU79voc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MaQLabSmwIvE9NyktnSQZfB8cleojLpn5vsGGgBOtuYuBc2aWPKfr8i59/5FmfxyM
 QksNlTgmtEBvLgDNvxTrI8wgupS8SKQzdpEfNmZwANw/6VP027PaWg3CRFdERMfvXg
 7UF0rzCP2zX1hUQv5qBHqMW8aADuCXMTJkZBq8Po=
Date: Wed, 20 Feb 2019 21:49:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Message-ID: <20190221054938.GA12467@sol.localdomain>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <20190220065249.32099-8-ebiggers@kernel.org>
 <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_214944_207793_FC3E6800 
X-CRM114-Status: GOOD (  12.78  )
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

On Thu, Feb 21, 2019 at 12:52:38AM +0100, Richard Weinberger wrote:
> On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > +#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE    \
> > +       (CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
> > +
> > +#define FSCRYPT_MK_DESCRIPTION_SIZE    (2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
> > +
> > +static void format_fs_keyring_description(
> > +                       char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
> > +                       const struct super_block *sb)
> > +{
> > +       sprintf(description, "fscrypt-%s", sb->s_id);
> > +}
> 
> I fear ->s_id is not the right thing.
> For filesystems such as ext4 ->s_id is the name of the backing block device,
> so it is per filesysem instance unique.
> But this is not guaranteed. For UBIFS ->s_id is just "ubifs", always.
> So the names will clash.
> 
> -- 
> Thanks,
> //richard

What name do you suggest using for UBIFS filesystems?  The keyring name could be
set by the filesystem via a fscrypt_operations callback if needed.

Note that the keyring name isn't particularly important, since the ioctls will
work regardless.  But we might as well choose something logical, since the
keyring name will still show up in /proc/keys.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
