Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDA9C4363D
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 16:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF23208A9
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 16:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IOD50pWy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIYsmBEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF23208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hSLXZxqidJvs69+m7leplkwu35m5si1niKq2AfSOsOM=; b=IOD50pWyv3F0xYkp8Dse42NeJ
	mrlZUiOMa2XSHGuRXOyDMp3Y7xcGjxnrcAive0TStFd+teFY9DgAfCyIBDbnXvLfPN5ml6g2iHYOW
	Awmf+5w+lBk/DMGkHaWiHfszFgrUndrbvC/2O3xtKqjtopI35Xb1VqHPVzYHxTLoZjwV93wgnkPEc
	9ksfdzeskUPWJXGsyrIzspax5Cjm5Q4UHxq4N7EEow/Cjcl8oJwuYHZ3CpEIZBOauJy5fCPqjjxpB
	UUkySvo1dRiq+uh3pTLrf1alshpNANs7b5iF8qGZI6+KEE23WnwS2UcWVu7Zoj0qgiBbGYLPy/aeE
	jR/sCpoiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKkjg-0008JW-Iz; Tue, 22 Sep 2020 16:01:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKkjd-0008I9-M9
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 16:01:42 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B00672399A;
 Tue, 22 Sep 2020 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600790499;
 bh=+JbPuKTQwLYiRtLrv7dRgf3ndqTICplWlXGxANCBloY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UIYsmBEGgBG28a67cc36efeTmr+VyZEYubJkA1CnDNucRlSPGUUMf82astmsgTQ1B
 oNOuT+s12Ov2S/HKXGJWAeiuAaMlIRPqbOrYPRIKP1mi3oYwgjJ2ObNlSgaMEDeXVp
 P6br8rNFA/3F7DPqLISqW6RMXWF8Emrl79vwMOdQ=
Date: Tue, 22 Sep 2020 09:01:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/5] Add support for Encryption and Casefolding in F2FS
Message-ID: <20200922160139.GA3718581@google.com>
References: <20200922104807.912914-1-drosen@android.com>
 <20200922135940.GB5599@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922135940.GB5599@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_120141_872493_E6CA4D56 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09/22, Eric Biggers wrote:
> On Tue, Sep 22, 2020 at 03:48:02AM -0700, Daniel Rosenberg wrote:
> > These patches are on top of the f2fs dev branch
> > 
> > F2FS currently supports casefolding and encryption, but not at
> > the same time. These patches aim to rectify that. In a later follow up,
> > this will be added for Ext4 as well. I've included one ext4 patch from
> > the previous set since it isn't in the f2fs branch, but is needed for the
> > fscrypt changes.
> > 
> > The f2fs-tools changes have already been applied.
> > 
> > Since both fscrypt and casefolding require their own dentry operations,
> > I've moved the responsibility of setting the dentry operations from fscrypt
> > to the filesystems and provided helper functions that should work for most
> > cases.
> > 
> > These are a follow-up to the previously sent patch set
> > "[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"
> > 
> > Daniel Rosenberg (5):
> >   ext4: Use generic casefolding support
> >   fscrypt: Export fscrypt_d_revalidate
> >   libfs: Add generic function for setting dentry_ops
> >   fscrypt: Have filesystems handle their d_ops
> >   f2fs: Handle casefolding with Encryption
> 
> I only received the cover letter, not the actual patches.  Same for the lore
> archives; they only have the cover letter.

Me too. :)

> 
> - Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
