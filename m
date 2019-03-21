Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DB4C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4781C21916
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INPkVEYx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4781C21916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxk8M/T2kFYcdnZsO7+IiJNrwrZVk7BBrpY5w0p0vb0=; b=INPkVEYx0NAR1E
	tJynTMgDyQUFC9CmrUCDnzvVShc7+JZcbajQTHN1gajHEJScev2W7Z1ssRQbxdf/7HBZRpmo3qitv
	zlrFm0kYTrYu3Z3zGUP4/TCqQ0un1X6oqnyBz/BlmJYMhoVaCQCRpoD+BZKIpeirXcawG4f80uLpn
	mK52uFt72IzFwMFMIEPQOtGMqPb/STor1iK5Nv0+xibqmHAutcEqusf5WPU0PGTUtprSh/xtK1v18
	kwGcWCYceEvZMLMGrZIQiCSJlUx2EhJDVnxauF+nMtyIUNOIseQx0N3iE1y/av2wBjeMP5xZqkju3
	H+VC0LvN+iaOeXX21mjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h70eW-00050J-Rh; Thu, 21 Mar 2019 16:34:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70eT-0004te-7d
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 16:34:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C773D608A3A5;
 Thu, 21 Mar 2019 17:34:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0xYdRvE2D65K; Thu, 21 Mar 2019 17:34:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 67A34608A3B0;
 Thu, 21 Mar 2019 17:34:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uZDAB36d4eG8; Thu, 21 Mar 2019 17:34:41 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id A0D7F608A3A5;
 Thu, 21 Mar 2019 17:34:40 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 0/6] Convert mount_single-using filesystems to
 fs_context
Date: Thu, 21 Mar 2019 17:34:40 +0100
Message-ID: <11178040.rrurhZOAV8@blindfold>
In-Reply-To: <19628.1553183102@warthog.procyon.org.uk>
References: <20992998.5BCRIlqCZf@blindfold>
 <6007.1553181386@warthog.procyon.org.uk>
 <19628.1553183102@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_093445_424146_04234120 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: squashfs-devel@lists.sourceforge.net, Nicolas Pitre <nico@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 21. M=E4rz 2019, 16:45:02 CET schrieb David Howells:
> Richard Weinberger <richard@nod.at> wrote:
> =

> > > Bah.  The problem is that vfs_get_super() doesn't set fc->root before
> > > calling reconfigure_super().
> > =

> > Do you still need the disassembly?
> =

> Thanks, but no.  I've pushed replacement patches to my git branch.

Just gave it a try, jffs2 does not mount anymore. The problem is that you d=
efine
an Opt_source in super.c, but never evaluate it -> jffs2_parse_param() retu=
rns
-EINVAL.

What I really don't get is the new logging stuff in include/linux/fs_contex=
t.h.
printk() is already an overloaded beat, why another layer?

The log output seems very odd to me:
[   13.117593] e MTD: Couldn't look up '/dev/mtd0': -15

Please notice the "e" before MTD, first I though this is a memory
corruption, but is your log level?!

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
