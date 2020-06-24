Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E4DC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:38:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E87E2072E
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 05:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0x4EI7d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME2/ILyR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E87E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Vbfn+3IdDWDuv5e07HLKkIB+N7K056Z3D5dx6zg1Xo=; b=T0x4EI7dV6O7cJPDtzSrCLVkC
	H8TUzGOCxaXF+62ifQhQ7/8ffCiqQDFBdqclUAm9uitdGTVL2xxmx2fAUB+IhUO/ECdx66ptgJuOr
	z0qAJpcAVFAaBFNefyjKDQDmXLvntDNDBinJA0wKSE4Jo24abpYrl10v5xTEKznmRQ6Jo8b0EKBSV
	CJcmF0vSZsKk/IX8EMEdsPWmUvW423QdJiA8U1DPhmiVrXrtDHyC2JvyAYDnxmZIWu2x/ZkxhpExK
	YXlNP5o2M54CFGSvhPT+Zq3qnnZaRmA2dIb413SAMcjxHZFYmp57fNAVQhl/NDFk39gM9botq6Zw/
	R+YKDYnRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jny6I-0007S1-Qf; Wed, 24 Jun 2020 05:37:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jny6G-0007Qz-7E
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 05:37:32 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC0C82072E;
 Wed, 24 Jun 2020 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592977051;
 bh=wb4QukjekILuiNOvt3WtAggRANvs3/DPlF6kk/OZN9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ME2/ILyRl01EO6yDPEjuIw5z41jE6WT0YL/dZxeFp1FPcCqTGoXmWlZASWXMdQg+d
 Gg6ZXHBJaopVsT69BCF292QvgQpMxHWYMvgoHHUbOyO2xDDrO8HZyvDEPplfoZjCZF
 oVsC9NaAewstXOI+yLeiPyQ9MDInXF4S2T12EQBY=
Date: Tue, 23 Jun 2020 22:37:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v9 1/4] unicode: Add utf8_casefold_hash
Message-ID: <20200624053729.GE844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-2-drosen@google.com>
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

On Tue, Jun 23, 2020 at 09:33:38PM -0700, Daniel Rosenberg wrote:
> This adds a case insensitive hash function to allow taking the hash
> without needing to allocate a casefolded copy of the string.

It would be helpful to add a few more details in this commit message.
Somewhat along the lines of: ->d_hash() for casefolding currently allocates
memory, it needs to use GFP_ATOMIC due to ->d_hash() being called in rcu-walk
mode, this is unreliable and inefficient, and this patch allows solving that
problem by removing the need to allocate memory.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
