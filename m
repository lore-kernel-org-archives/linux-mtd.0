Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C580C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IFgVGv+xwBGfnnedGbHK0Xtr9MQzaIUqzvyqNucz1FU=; b=hOQ
	mVRWlY2ANERCC4w/LhiI6dOiLTfkygHrUkyaxtOH9VJaiEnzHMq48j/de185HsTxYlql6D7M6Ugqj
	ixG7e0c4RU/6inDe5UzY6uOUp4HBEDyOrTt9T0h5DJ94cJNqaiKLeR5qBYP3pDOiAVcp1gHkJa5CU
	TRosBwEh9CNDbBdbIFe1g+/Q9NaLqASLF6//NvvgjmKb9aQw9cE1sqFn2X/Xdlxz1+tyZNwSvLGUM
	FA2BNXzxT2dHk6hRbF9HUxPps/bOHcnU1JZAGuQHtDkRLwbJ8ztlwOOYUJrk023PlZGlO2nuDQwpI
	pwwWPiK7gwlCnIUAPZ4xsNn53NyCWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fsQ-0029NP-LX; Fri, 07 Jan 2022 03:25:14 +0000
Received: from mail-40136.proton.ch ([185.70.40.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fsN-0029MR-09
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 03:25:13 +0000
Date: Fri, 07 Jan 2022 03:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1641525906;
 bh=Qy0eZiC9ju+6/DrEto3g5TXN27KUKHcJkM1Wm1L/UjA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=nun/+Hr5i5PeLKnyyyasCq332My5Vt5002v8aZvG62xh7deM6TcMEjNF6irpQv7fp
 h/dlvy9Ly2ZkmDaHJZ9XwnTCv2yv+1A5IRSBXgRCY1xlVy+QFwyH/Wxw9FyDN+ySAu
 9Vah1Ry7Gj6c3sPm6D+G3Rflz2oLWvz7E59CyKIjDvSS1cxYk7tT/8S0yxL7sa/Ujs
 Th3SHZpeqJ3kQ3bB53r/2vYgaek1D0Qu4Z8+NFyEVs7TfYR38+diQ9fzjqLBhJdhby
 ZlC69z2kGnzQ7UgKzkVofTCI86wzrzQ49aeXI+K0Pf4eyFfscRMaYFO6pTNSPuKw6r
 cXwSLSGz2p3Lw==
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?utf-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.4 is released
Message-ID: <c31dba4f-42a8-ba48-7df2-b56bf4699a4c@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_192511_864235_7A1C8032 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

mtd-utils-2.1.4 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.4.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.4.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.1.4

Alternatively also mirrored here:

Tarball:               https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.bz2
Tarball gpg signature: https://infraroot.at/pub/mtd/mtd-utils-2.1.4.tar.bz2.asc
Signed git tag:        https://git.infraroot.at/mtd-utils.git v2.1.4


Roughly half a year after the last release, this is a smaller, patch level
release that primarily consists of a hand full of fixes that have accumulated
since then.

This includes some fixes regarding the user space ports of mtd-tests using the
wrong page size, and most recently a fix regarding a missing jffs2 kernel header
in the last release tarball, causing build failures on some systems.


Changes from 2.1.3 to 2.1.4:

Features:
      - ubiscan debugging and statistics utility

Fixes:
      - Some mtd-tests erroneously using sub-pages instead of the full page size
      - Buffer overrun in fectest
      - Missing jffs2 kernel header in the last release, leading to build
        failures on some systems.


Raw short log since the 2.1.3 release:

David Oberhollenzer (2):
       Fix: add missing new-line-escape in jffsX-utils Makemodule.am

Diego Ismirlian (1):
       Add ubiscan utility

Miquel Raynal (1):
       mtd-tests: Read and write pages during speed tests

Ralph Siemsen (2):
       mtd-tests: use pages during readtest and stress
       fectest.c: fix buffer overrun


Regards,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
