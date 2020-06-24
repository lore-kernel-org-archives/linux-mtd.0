Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993BEC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 06:05:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E7C2073E
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 06:05:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xhqXRFEZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="po3bfXB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67E7C2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BXsQf43vBQKut5IvNg0snUdFjb69868DkTdXzPMUKVw=; b=xhqXRFEZgyGnzSxjfsBpm1JMa
	pOSCdAosHRzTuqt95eydgNRAbdcINl6y6SponFrWFJmqcRW4rRw5vOdEFNfpQY1Fae9JYf7Njovso
	MPsQX28f7rBmqvGsoyr7Hsf9SCDvJ6Lftmjoa1oOK4xddyi+Uq7dsbKR+PNvz9dP/wzCkLalL0KP4
	KH3kcQD4ou6eVUch5MZac5vOgnpveVKftcDfMJ3T7jZ1h2Xv37Dn8R0Tz30p/tZMROvepp3wsNrMS
	7i8zX8bw8GnEECUZJbS2ofTwnoVdGp9E9OxIddjoUYTesjIS3uFqeQjz0+2M5AQK2u96MWMeBubuG
	Gk5E1yuLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnyW0-0008WL-Cs; Wed, 24 Jun 2020 06:04:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnyVy-0008Vo-Gz
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 06:04:07 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11AC92085B;
 Wed, 24 Jun 2020 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592978645;
 bh=STmnuLbp6dqBamgAzJ+Ue/+bNkc6g/1tpfJs2y+gU6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=po3bfXB92hJ+PijyLMwHXbS/arxBw/0IUAsnaYskimBhp5qtvm5z+v8pGM+WgW9eW
 FLe98JcBQR5dGhNpYT2AcM037Hpb1EdSMM5PBYfhnf2Wgpw7k7/8mYfd7JPRk5E8No
 teVgpd0E/A1IgM2mFReeceA8sMDJhn8YuudMvMdA=
Date: Tue, 23 Jun 2020 23:04:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 4/4] ext4: Use generic casefolding support
Message-ID: <20200624060403.GH844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-5-drosen@google.com>
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

On Tue, Jun 23, 2020 at 09:33:41PM -0700, Daniel Rosenberg wrote:
> This switches ext4 over to the generic support provided in
> commit 5f829feca774 ("fs: Add standard casefolding support")

Commit IDs aren't determined until the patches are applied.  It's possible for
the person applying the patches to fix them, but in general people will forget,
so it's better not to include non-stable commit IDs.

Also, a sentence explaining *why* this change is good would be helpful.
Commit messages should always have a *why* unless it's obvious.

Likewise for the f2fs commit.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
