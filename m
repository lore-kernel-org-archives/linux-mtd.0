Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32F9C4CEC9
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 05:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43E4214AF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 05:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OFXRe0Z1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YCFY/y/e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1mjtKNTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43E4214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LBcvD/BjZAKQKbd16XyTgZOFLIHPu+VqlslSHhnrJc=; b=OFXRe0Z1hs4DUb
	8s1lgGj0icGSSM955LTJeJeOIFYFnoYhcVgGFsAfJOjJF/v1s7bszeHlqir1PyZyiH3fZaoPt4ZzN
	YPMIstEVArdaMAu4F6/U7oze8t/R4Qp4VhwFi/xRUgxj6asMrKiYipzKnKRpJ9HM0SeJsSZN+tbVy
	hdevUprOFYacNtraEN87tpI7VWX2rmpm2qvk/0AHI/nd06PGsT5wLEpVLwujl0NEkscqvCpQUAqfm
	LLyuDTvb9cJ975GALyV9qr5X+IhO0uKb+OatFxGrKLdKA4pJfTryQzycNjQ2I22DFmmjGrWLiJFzZ
	e8yieK+4jTqdDhK2DZWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iASte-0002K0-QS; Wed, 18 Sep 2019 05:52:58 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAStb-0002JZ-CG
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 05:52:57 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C8493222BA;
 Wed, 18 Sep 2019 01:52:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 18 Sep 2019 01:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yApEeM+cx/E4QTe1WjDT5jZr1YH
 cZM80TBsuKqJwhoU=; b=YCFY/y/eLPs0MW5E8Gblp4ZMmbBw7GlX5JgQgnfo6o5
 CFjN8lsSv7c8xpwNoVft/+Iz4a1OdGFW8VLeh+02/JViuvo7gzlDH1tVNpVwtrGa
 DRDdzQ35e1SpnB4FlbAw+DIjOB49TOZCjIABftiUhzOJmvztzTxfghK+iE6cphY1
 mzBbapgIjg/0eakfgYrcAmlgmIdux1/EvQRXLAHA7wEUXfeZtnf9+R6rbWtgNlA1
 6OwMtB9k9gZerpGvocHhd8EE+YhR57dtYnRu1VDqxt2Fo/oxJRjmBJDpVzAiBxLF
 z7aXlc1sYNQB3bgZCUOXY3vBTwTr4Tvch14P2xX2uxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yApEeM
 +cx/E4QTe1WjDT5jZr1YHcZM80TBsuKqJwhoU=; b=1mjtKNTkHWi7g22WLFIbOD
 Mc9vdk7g/h7aDxfqyuFsLIfOnU7aqPRyOVNIlZeSuZIZfKc2UjjPfswoiibIOAVY
 Fb+OYWhO0rJcswhtAMdVEXxxYDYPFDQm9Tc8W7suuhECLfhm/rYAMZvlUXlecKli
 tKICy5v2NbxuFPKWFDzk0r1ix00Ii/H3BkVjfgHGrggdxtOnvoCFoi8s2+RmDn9L
 Vx1WhkZGinXJPE8X/LhiSN+y3qfz9UbW9u21UyP5GZWxeRhlGbRgXZiEaggtXIFz
 iv7gc6pIs79mtssIZD3qy2LszqVSg/eo4witDz+EJDfQ3BIvWjKpoMlWaUoI3w8g
 ==
X-ME-Sender: <xms:MMaBXUgofsVIGyapbzM9S8gfWHi0AC2ZFr2bKl8dm2_usXLeRZaC8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:MMaBXaauZV0g62-XlXG-2OKdFkR3TYIQ0ybywrf6YzDgvmtKm0G2qQ>
 <xmx:MMaBXTb4Pu3W00bvJuaVXnCLkeTfr5uWqWEjm4nSCZ_TwYvp3uqecA>
 <xmx:MMaBXfybWNApS0-krnX1wj71OqYaxzsS3zZ2WcqXXTL2E80fUCi_Vw>
 <xmx:MsaBXZJx264xcrTbgq3IBJfKvD8LA9mmgykxr53TBfKAcFbJOqH4_Q>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92778D6005A;
 Wed, 18 Sep 2019 01:52:48 -0400 (EDT)
Date: Wed, 18 Sep 2019 07:52:46 +0200
From: Greg KH <greg@kroah.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Subject: Re: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
Message-ID: <20190918055246.GC1830105@kroah.com>
References: <20190917175048.12895-1-ikegami.t@gmail.com>
 <20190917181127.GD1570310@kroah.com>
 <7c0113e0-d455-e3e6-86fc-45429be196fb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c0113e0-d455-e3e6-86fc-45429be196fb@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_225255_751123_6A624949 
X-CRM114-Status: GOOD (  23.75  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, stable@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 18, 2019 at 07:32:39AM +0900, Tokunori Ikegami wrote:
> 
> On 2019/09/18 3:11, Greg KH wrote:
> > On Wed, Sep 18, 2019 at 02:50:48AM +0900, Tokunori Ikegami wrote:
> > > As reported by the OpenWRT team, write requests sometimes fail on some
> > > platforms.
> > > Currently to check the state chip_ready() is used correctly as described by
> > > the flash memory S29GL256P11TFI01 datasheet.
> > > Also chip_good() is used to check if the write is succeeded and it was
> > > implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
> > > checking").
> > > But actually the write failure is caused on some platforms and also it can
> > > be fixed by using chip_good() to check the state and retry instead.
> > > Also it seems that it is caused after repeated about 1,000 times to retry
> > > the write one word with the reset command.
> > > By using chip_good() to check the state to be done it can be reduced the
> > > retry with reset.
> > > It is depended on the actual flash chip behavior so the root cause is
> > > unknown.
> > > 
> > > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > > Cc: linux-mtd@lists.infradead.org
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> > > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> > > [vigneshr@ti.com: Fix a checkpatch warning]
> > > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > > ---
> > >   drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
> > >   1 file changed, 12 insertions(+), 6 deletions(-)
> > >   mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> > You changed the file to be executable???  That's not ok :(
> 
> Very sorry for this.
> I missed it to fix to not be executable since it was changed to be
> executable on my local environment.
> Anyway I will do fix it.

Please do, we can not take these patches as-is at all.

> > Also, what is the git commit id of this patch in Linus's tree?  I can't
> > seem to find it there.
> 
> Actually it has not been pulled in Linus's tree.
> But it has been merged into
> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next for
> v5.4-rc1 as the git commit id 37c673ade35c.
> So I thought as that it is okay to send the patches for the stable trees.
> But should I wait to be pulled the patch in Linus's tree at first?

Yes, you have to wait, please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
