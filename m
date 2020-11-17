Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D6BC5519F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4429A241A7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LDLjZOg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4429A241A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r9OT/eaWY1jblHEQQJMmdJgDoDTApShvtTDv9rL8bcc=; b=LDLjZOg/cQDTm5CkEWXc/aHvW
	FrPwCEoIWIjxmrCLdU9VGzIx2RBydxS/JChbgG6wlCsBNSASADgHU2eYbXTFJs2mJ6g1HvCKSZx67
	xoySc9h3mR+6Ed6YJPQ/tLRtkjVZf1aQZqTMJx4DhyIvrSkqFC/MBCJPwC67gEqczqjp/27iDxqW6
	7UjrZR12siSiH0FxpcX+bPbvl1Pw67lwlrY7JNm8cpSsh5dq/bNzB1Fbu/Rndut0/ARR88YndY1qC
	6/XWi5m4CWk3Wy8r9Ht59Ror5WvrwLv8BG1m5/d0w2HEA4V6nXd6wXyEdQI5ACEL1SZRh20Y6l3K/
	UvCPNWpuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4rP-0003fv-83; Tue, 17 Nov 2020 17:33:43 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4rM-0003f8-Ed
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:33:41 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AHHXWfn000355
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:33:32 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id DC283420107; Tue, 17 Nov 2020 12:33:31 -0500 (EST)
Date: Tue, 17 Nov 2020 12:33:31 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v2 1/3] libfs: Add generic function for setting dentry_ops
Message-ID: <20201117173331.GE445084@mit.edu>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-2-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_123340_581231_3FFEB419 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: kernel-team@android.com, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 04:03:13AM +0000, Daniel Rosenberg wrote:
> This adds a function to set dentry operations at lookup time that will
> work for both encrypted filenames and casefolded filenames.
> 
> A filesystem that supports both features simultaneously can use this
> function during lookup preparations to set up its dentry operations once
> fscrypt no longer does that itself.
> 
> Currently the casefolding dentry operation are always set if the
> filesystem defines an encoding because the features is toggleable on
> empty directories. Since we don't know what set of functions we'll
> eventually need, and cannot change them later, we add just add them.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
