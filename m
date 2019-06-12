Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41DEC31E47
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 17:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDDD215EA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 17:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwIKQJms";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBWJ44hs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDDD215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMJ4777G0Ab3fgMwxAtIM0CS8Ag0PujWI4FxWqWxW8s=; b=LwIKQJmsjKIb6I
	eucLO9bh4uSrxCJRbNvwfZjISfnHhbe7iaMV2LHNE4anDExiNVU+nPhPI02bjBNxCzT5cYT3bBGOv
	3gIHkPaoGxm7NRP6lby7YzJ3gHLrHOXgvwAfLqi61807JdFMJfbMV1pyV8eJPcSIZI6DxNKhDYTtL
	3GIXTFVP3/O5xtd/uiiMn9UuMD+J7qdNqEierreDS0MBIfs3JwPsuUoVAqlF2N8NzZw4xTIQC/KmD
	UKHI6Fu3jWEYVrhMV2w4OUmnATJTgyVlyBX1svzfNTrmMOrQo9m0e/RWBjHXnJ729BdnzmKmnLauF
	XxQKRK12dsqW8NlqfZJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb6cE-0003QI-ON; Wed, 12 Jun 2019 17:00:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb6cB-0003Pt-FU
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 17:00:48 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C361215EA;
 Wed, 12 Jun 2019 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560358847;
 bh=EkuavmikHiyBucV6P4R2teI18XS+pora3Gyaqz7oGus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBWJ44hsD1QvfPy7YscJTNg1Ykxm1uMuV9iSDF7cp+DzaO20Pt/hRw9mha3flBDqz
 Q87zdpFQD/tL3p2G9CBidfZXWAlyADx0Lll4mNPLFG3MDWYojZ/Imwm3u6aj4s6tiu
 h/7vHm86em4YYBWwqyJws2A77YRG0QwGTbh/21aw=
Date: Wed, 12 Jun 2019 19:00:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mario Rugiero <mrugiero@gmail.com>
Subject: Re: [PATCH] ubifs: no need to check return value of debugfs_create
 functions
Message-ID: <20190612170044.GA3219@kroah.com>
References: <20190612152120.GA17450@kroah.com>
 <CAKKQwLSm5FchbBH43G=3hJJ3LdrcOxnEn10_cjES+MZotVCpng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKKQwLSm5FchbBH43G=3hJJ3LdrcOxnEn10_cjES+MZotVCpng@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_100047_539621_5511B099 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top


On Wed, Jun 12, 2019 at 01:52:23PM -0300, Mario Rugiero wrote:
> I think you should still abort if the directory fails to be created.

Why?

> If it's NULL, all later file creation will be attempted at root debugfs.

debugfs_create_dir() can not return NULL.

> Not only will they pollute the filesystem, but since they are not
> attached to the directory we remove on cleanup, they'll leak.

That can not happen, if the parent directory is an error pointer, the
file will just not be created.

> Also, since failure is no longer reported, it may be a good idea to
> log that failure.

Why?  To where?  For what?  debugfs should never matter if it works or
not as no no-debugging userspace code should ever depend on it, and the
kernel should not ever "fail" anything if it is not working properly.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
