Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3B0C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 19:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA76207FF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 19:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yoiqnMcc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZz3+cYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA76207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HTUTwGLVX9RB2Q0mjoJq22oq1mqHr7jQ087AKlkv4UE=; b=yoiqnMccnHqIYKj6HIuP/Lllh
	cy9qEmM2lKIYQocCtmJ68kflQcaFyC6XlQGzktM2oiDIrG6L4axdC9JCN71kZmFw71eQI/lVAAIAm
	OebiHtYJH304v386h0p8gMyJGOBvWENucF46YTVjhexCvTvykID4MLrqhMVtb6wtA97jNsIZJhys+
	m6Moqk9wCzG6FFzegEm1tQ/W7r0i8mIPkKb84hd+LevAkOZPrI52ZBj0bBlRNuB4yJgiAeWq/Wngk
	3wowoJG5zFXRkMYy8363QOO60dJkqj2MIRS4SzpTqzcEqEI0KYPcB2JnwxgVJvuiZ2seqbYNcv0bA
	tCr6nn+xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrRF8-0003RV-RY; Fri, 03 Jul 2020 19:21:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrRF5-0003Qx-Lf
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 19:21:00 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB37F207FF;
 Fri,  3 Jul 2020 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593804057;
 bh=PEmsm7KiYhEynj7JM9OkcWwJJEMC5FTZ1MgB7GC3/kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cZz3+cYtChLGxVGtGhI0iqF8NG4vRe7SyHyKP6rwlrniscYuLOgqOM9tC5bBvh6V9
 rCNuVMRKKdD1/I05cjOph+0nERO2OeeH/Y1QSjn/3szq+YCjsBxWz49TxA/V8HiT6F
 N6pBBTbIdf7MhFFMTY1BRtmYQCvTyvOSvJ4M/pzg=
Date: Fri, 3 Jul 2020 12:20:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 2/4] fs: Add standard casefolding support
Message-ID: <20200703192055.GA2825@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
 <20200624055707.GG844@sol.localdomain>
 <CA+PiJmTDXTKnccJdADX=ir+PtqsDD72xHGbzObpntkjkVmKHxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmTDXTKnccJdADX=ir+PtqsDD72xHGbzObpntkjkVmKHxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_152059_794934_87F504BC 
X-CRM114-Status: GOOD (  23.20  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 06:01:37PM -0700, Daniel Rosenberg wrote:
> On Tue, Jun 23, 2020 at 10:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Note that the '!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir)' check can
> > be racy, because a process can be looking up a no-key token in a directory while
> > concurrently another process initializes the directory's ->i_crypt_info, causing
> > fscrypt_has_encryption_key(dir) to suddenly start returning true.
> >
> > In my rework of filename handling in f2fs, I actually ended up removing all
> > calls to needs_casefold(), thus avoiding this race.  f2fs now decides whether
> > the name is going to need casefolding early on, in __f2fs_setup_filename(),
> > where it knows in a race-free way whether the filename is a no-key token or not.
> >
> > Perhaps ext4 should work the same way?  It did look like there would be some
> > extra complexity due to how the ext4 directory hashing works in comparison to
> > f2fs's, but I haven't had a chance to properly investigate it.
> >
> > - Eric
> 
> Hm. I think I should be able to just check for DCACHE_ENCRYPTED_NAME
> in the dentry here, right? I'm just trying to avoid casefolding the
> no-key token, and that flag should indicate that.

Ideally yes, but currently the 'struct dentry' isn't always available.  See how
fscrypt_setup_filename(), f2fs_setup_filename(), f2fs_find_entry(),
ext4_find_entry(), etc. take a 'struct qstr', not a 'struct dentry'.

At some point we should fix that by passing down the dentry whenever it's
available, so that we reliably know whether the name is a no-key name or not.

So even my new f2fs code is still racy.  But it at least handles each filename
in a consistent way within each directory operation.  In comparison, your
proposed ext4 code can treat a filename as a no-key name while matching one
dir_entry and then as a regular filename while matching the next.  I think the
f2fs way is more on the right track, both correctness-wise and efficiency-wise.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
