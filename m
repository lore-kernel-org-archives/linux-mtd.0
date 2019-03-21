Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E258C4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F686218FD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FI2vBfXN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F686218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vQmKqYbZEHBmClt9FiwSIO/TOBju7Nx9yqdyHAq0I7s=; b=FI2vBfXNwQZqul
	IwHq6Fr53R7ewNrUmX5Op+uenI4hotEnAh+h5WoLEfdRWWx9jl15APY412hsW7W6t1m+4qeeYrMoS
	WEgdYB1BOiLdtEt3xLe/bYwQzJZW+fLfMPdvCgKDEpgrTkvkdarpYHbIkgmbVCoDCfazsnCdGuJtd
	vhwd+hZn2+JySUc9Ff5+BoWV73Jlj5CLo/RkRMyQ0Z2DfIe+6ihUfAIwBb2LNsmeKjduA4zpdeWcE
	auZToUvxvKH+tWWfL/bOEEUWRlNrqB4Q35uXVVVk6wcWVforeCk5ZnwEImRYWyjMZ9WXUrVP3QFTr
	yZa9HzDXZTxF4h4HDIcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6wDQ-00061Z-9J; Thu, 21 Mar 2019 11:50:32 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6wDN-00060e-6f
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 11:50:31 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C60A63082AF0;
 Thu, 21 Mar 2019 11:50:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 261B760BF2;
 Thu, 21 Mar 2019 11:50:24 +0000 (UTC)
Subject: [RFC PATCH 0/6] Convert mount_single-using filesystems to fs_context
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Thu, 21 Mar 2019 11:50:24 +0000
Message-ID: <155316902426.29884.2476392753144421312.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 21 Mar 2019 11:50:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_045029_261114_106A675D 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: squashfs-devel@lists.sourceforge.net, dhowells@redhat.com,
 Nicolas Pitre <nico@linaro.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Al,

Here's a set of patches that convert romfs, cramfs, jffs2 and squashfs to
use the new fs_context struct and replace mount_mtd().  They have
prerequisite commits (such as replacing mount_bdev()) that can be found in
the branch detailed below.

 (1) Provide a replacement for mount_mtd() that takes an fs_context to
     specify the parameters.

     I also put an mtd device pointer into the fs_context struct for use in
     the sget_fc() test and set functions plus a destructor because
     put_fs_context() can't reach into the mtd module.

 (2) Convert romfs.

 (3) Convert cramfs.

 (4) Convert jffs2.

 (5) Get rid of the now-obsolete mount_mtd() function.

 (6) Convert squashfs.

These can be found in the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=mount-api-viro

Thanks,
David
---
David Howells (6):
      mtd: Provide fs_context-aware mount_mtd() replacement
      romfs: Convert to fs_context
      cramfs: Convert to fs_context
      jffs2: Convert to fs_context
      mtd: Kill off mount_mtd()
      squashfs: Convert to fs_context


 drivers/mtd/mtdcore.h      |    1 
 drivers/mtd/mtdsuper.c     |  181 ++++++++++++++++++++++----------------------
 fs/cramfs/inode.c          |   69 +++++++++--------
 fs/fs_context.c            |    2 
 fs/jffs2/fs.c              |   21 +++--
 fs/jffs2/os-linux.h        |    4 -
 fs/jffs2/super.c           |  172 ++++++++++++++++++++----------------------
 fs/romfs/super.c           |   46 +++++++----
 fs/squashfs/super.c        |  100 +++++++++++++-----------
 include/linux/fs_context.h |    2 
 include/linux/mtd/super.h  |    6 +
 11 files changed, 316 insertions(+), 288 deletions(-)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
