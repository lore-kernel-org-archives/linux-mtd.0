Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE07FC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 18:32:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F4A619CC
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 18:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F4A619CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6TMnINuUOL9YCIMcHDFUDzX2o9sj4IVrxrTZxOpe1MM=; b=ECTTv6x4nZlk+DikWvT1l6Vhb
	gYtg2eh95yKTWAbzuU7RalIMOBpsc+rwhBwNazLM0gnYMxKO8AXy0o74ijlK4lJPNzTDMSKbL0jWX
	yOFWGLsNKzugeIp5g36nxmil6+zCritnk55nfxIujAQTYbKe+J96+CSUXA1LvQijQDEuPKk8wNT0m
	oYrP4jUnc5/Rqw174NlLLn5ph2MSaSrsGifIv6ME1oy1k03XgB6Qvr37tKuBEWEWo/H80A31hEdVR
	808gA6b3s9m6husxClxRVrhvcEFjI+Ludf7/cgtNaLuEENRVfpV+dxnAv8eG5wpP8nWBenPSOTlTq
	4GlW50Dow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRJ9D-004clW-TD; Tue, 30 Mar 2021 18:31:29 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRJ98-004civ-ND
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 18:31:24 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lRJ8m-0015x3-Kf; Tue, 30 Mar 2021 18:31:00 +0000
Date: Tue, 30 Mar 2021 18:31:00 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Cc: Joel Stanley <joel@jms.id.au>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Kees Cook <keescook@chromium.org>,
 "William A . Kennington III" <wak@google.com>,
 Lei YU <mine260309@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: Hook up splice_write callback
Message-ID: <YGNuZMUkzH0tkce6@zeniv-ca.linux.org.uk>
References: <20210330134537.423447-1-joel@jms.id.au>
 <20210330161715.GA12783@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330161715.GA12783@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_193122_829130_A9A5A9DE 
X-CRM114-Status: GOOD (  21.02  )
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

On Tue, Mar 30, 2021 at 06:17:15PM +0200, Christoph Hellwig wrote:
> On Wed, Mar 31, 2021 at 12:15:37AM +1030, Joel Stanley wrote:
> > overlayfs using jffs2 as the upper filesystem would fail in some cases
> > since moving to v5.10. The test case used was to run 'touch' on a file
> > that exists in the lower fs, causing the modification time to be
> > updated. It returns EINVAL when the bug is triggered.
> > 
> > A bisection showed this was introduced in v5.9-rc1, with commit
> > 36e2c7421f02 ("fs: don't allow splice read/write without explicit ops").
> > Reverting that commit restores the expected behaviour.
> > 
> > Some digging showed that this was due to jffs2 lacking an implementation
> > of splice_write. (For unknown reasons the warn_unsupported that should
> > trigger was not displaying any output).
> > 
> > Adding this patch resolved the issue and the test now passes.
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

The same goes for quite a few other filesystems, actually - at least
adfs, affs, bfs, hfs, hfsplus, hostfs, hpfs, minix, omfs, sysv, ufs 
and vboxsf are in the same boat, and I suspect that ecryptfs and ntfs
might be too.

Christoph, do you see any problems with doing the same thing for that
bunch as well?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
