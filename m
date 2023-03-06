Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6DC61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ2z8hvLs10o22S3Pg7EbCPOSgDQH7z5+2I8tiZNIdE=; b=Y1wWW75E8sZS+h
	mY2oVF9qagYqbKJXfyy18CWmed4gdp3Bv2ckaxhAgd9kZW8HXt1oNzoMqplHDHCoTMKFGooG+atEy
	2L6XkmeKEhTBWtS/mLgWghm2bNlzcHllpfJ3N5FfeGw80JMC/4Vh+BDvxiHtcqtjPnNTs8WLfEwf1
	SmSuWx63ueYcHSBSOvkE9mySqy1GkK+nxtifCcvVrETI93j8GZ1CAfFxRR5t9gctfuoV5UIWeisEP
	kNpmQSIaGMMgltYoIjrtUlN9imFqeL9CMu7oBSJFMLmr0lK7jwrD/BIFeZZZEgS5Hoh9GVRHCsr8C
	d6vuR52yNwgkYrur/yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ77E-00C5Ah-Ch; Mon, 06 Mar 2023 09:26:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ77A-00C59Y-ER
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 09:26:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF6BE60B2C;
	Mon,  6 Mar 2023 09:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2167C433EF;
	Mon,  6 Mar 2023 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678094799;
	bh=57FrCCZ2Wq+YAZlBEbTVLCXLXyHrbe4LXgxzAP6Rt70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGpHk5/EASsEtl4vKnAkGUaXhtbPzA/d2cXgftsQx8PVrRgVXQNsAAnUOBX1GgX6I
	 G/6gfIFXfw4GETwfv8Vqa+2mueXnJba6vq4doCPeNTZ+42jYFYMi/XGYUBkeA8X/oD
	 ElKS799bOnXufZBGOEBscaDcXEpJHRp87DtATu56G0m7hUhBUbQpW3gm1nxMrdfglF
	 0ZbBUcHJGIkJmz/Hsybihbq8zOv2if13KJ/EEandIpN1dFYg7WzDuihAtyiEKIBsW3
	 NHz3uKORaef+IPel5P8LpgPELeV5dFcgKzByHGHs4b9oIVc5RyT13xsoOqXUWsxf3W
	 aynSxAyBPrijQ==
Date: Mon, 6 Mar 2023 10:26:33 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	Seth Forshee <sforshee@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	linux-unionfs@vger.kernel.org
Subject: Re: [PATCH v3 00/10] acl: drop posix acl handlers from xattr handlers
Message-ID: <20230306092633.tobpejvw7mwcx22v@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
 <20230201133020.GA31902@lst.de>
 <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_012640_833997_DCD0685C 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 01, 2023 at 02:42:54PM +0100, Christian Brauner wrote:
> On Wed, Feb 01, 2023 at 02:30:20PM +0100, Christoph Hellwig wrote:
> > This version looks good to me, but I'd really prefer if a reiserfs
> > insider could look over the reiserfs patches.
> 
> I consider this material for v6.4 even with an -rc8 for v6.3. So there's
> time but we shouldn't block it on reiserfs. Especially, since it's
> marked deprecated.

So I've applied this now. If there's still someone interested in
checking the reiserfs bits more than what we did with xfstests they
should please do so. But I don't want to hold up this series waiting for
that to happen.

> 
> Fwiw, I've tested reiserfs with xfstests on a kernel with and without
> this series applied and there's no regressions. But it's overall pretty
> buggy at least according to xfstests. Which is expected, I guess.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
