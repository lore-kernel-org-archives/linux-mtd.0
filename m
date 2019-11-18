Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6FDC432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 18:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04BFE222AA
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 18:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6FMHDh1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6vOHOV6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04BFE222AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7reTDBtIN/ZOLU2jD0m+kshGsfPJiwyueXKiNPM+ng=; b=C6FMHDh1NFPxbn
	CNbpdJiz2QGJ0gtD8ciuZq7SmngBXMDpYastAxuQnmkH73Zdf3Ofb1BoUDubTgoY6go3pFEo9axPk
	CtH2/BZYdICUDJk/i5e3PUStXPAAaA+G7jQK9HJiXvie3fsR6F6J9uYKeLR48r8cfq++PCX0ZI7u0
	+OOtaZyB3v3F18prN9YcfLBRRo9JvktlUPv2CTJX9tuiioRxVl4B8Dk5CuxNEHYZ1G2lw0mTPL33X
	nGpyrWVtSLMxpLQoDBq7D54OhDXQRxIKrwDZGRWIspDBFi7mjU4OHS0BwZ/Z52YWUG/H0ThL45vRo
	7tAPHmW5PabG8IW7IqUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWlXJ-0003m9-Kn; Mon, 18 Nov 2019 18:14:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWlXH-0003lA-EK
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 18:14:04 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9E65222A4;
 Mon, 18 Nov 2019 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574100842;
 bh=WZxqlzttko/t7K47E27WckLwF631L0ReSZl1x8L+sOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6vOHOV6ktxUb9heORDtsKoQ/z6ArKiQs+i7bmlG2wQA2tzuuSGHRDOKvq391UoSY
 9BViUuNg+zIzMk3bFb7ar9tx5vhYOp34EEJ9k4nxuwKAyq5YH0xCJdTAB1PdlvdeFb
 v15IUmEsJZms5J6GntPM7NXh22mmkl/j8bBeyK0w=
Date: Mon, 18 Nov 2019 10:14:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH] fscrypt: support passing a keyring key to
 FS_IOC_ADD_ENCRYPTION_KEY
Message-ID: <20191118181359.GA184560@gmail.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191115172832.GA21300@linux.intel.com>
 <20191115192227.GA150987@sol.localdomain>
 <20191115225319.GB29389@linux.intel.com>
 <20191115230430.GA217050@gmail.com>
 <20191118180102.GB5984@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118180102.GB5984@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_101403_501656_FBE5C765 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: David Howells <dhowells@redhat.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 18, 2019 at 08:01:02PM +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 15, 2019 at 03:04:31PM -0800, Eric Biggers wrote:
> > On Sat, Nov 16, 2019 at 12:53:19AM +0200, Jarkko Sakkinen wrote:
> > > 
> > > > I'm working on an xfstest for this:
> > > > 
> > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?h=fscrypt-provisioning&id=24ab6abb7cf6a80be44b7c72b73f0519ccaa5a97
> > > > 
> > > > It's not quite ready, though.  I'll post it for review when it is.
> > > > 
> > > > Someone is also planning to update Android userspace to use this.  So if there
> > > > are any issues from that, I'll hear about it.
> > > 
> > > Cool. Can you combine this patch and matching test (once it is done) to
> > > a patch set?
> > > 
> > 
> > xfstests is developed separately from the kernel (different git repo and
> > maintainer), so combining kernel and xfstests patches into the same patchset
> > doesn't make sense.  I can certainly send them out at the same time, though.
> 
> Is there instructions somewhere how to build and run these tests?
> 
> For me it is sufficient if you point a branch and have some kind
> of instructions somewhere.
> 

There are many ways to run xfstests, but I usually use kvm-xfstests.  See the
command to run the encryption tests here:

https://www.kernel.org/doc/html/latest/filesystems/fscrypt.html#tests

More details about kvm-xfstests are here:

https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-xfstests.md

But if you want to run tests which aren't included in the prebuilt kvm-xfstests
test appliance yet (such as the test for this patch), it's not quite as
straightforward since you'll also need to build your own test appliance:

https://github.com/tytso/xfstests-bld/blob/master/Documentation/building-rootfs.md

Also note that this test will require both xfstests and xfsprogs updates:

https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=fscrypt-provisioning
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfsprogs-dev.git/log/?h=fscrypt-provisioning

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
