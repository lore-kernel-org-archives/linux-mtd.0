Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76A8C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iERUL2l4uBNN01PXqASdBA6YQPZHbUHgkwC/S/s1IH0=; b=W/BIKJ4lWsgDW3
	nzo7HzonJRaSIZKyu/LdK4wzvSHnMFZRuWtCK0L91CgXio8bjYAmLUd0JDoxVQIkNuXmKIGQVIQGB
	ac8jmaUyWqStoRIrBojxUqvsK0B2B3JSSPXGk2Cp/RS1dd9carwuUkxdFnzXJ5Dodz051e/C7/mfr
	lkZbGllLYc+2daGBdMpISNKE1onpEKhWhzH157LoYkeCjDiG70Jzycyj1zyDYYTnJrNa137Fsa2ze
	AYxZLiszi9D4o2ZOqXUy5Odgkxr5uOv2Kp+9IDvnPfQK7NuHVhrDCPYyfwMdRjIMVhQkHrAKdNaHo
	OLgldNIGR+uVx6D0J4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDOD-00C7ig-0r; Wed, 01 Feb 2023 13:43:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDOA-00C7i9-I3
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 13:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09227B82168;
	Wed,  1 Feb 2023 13:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5161DC433EF;
	Wed,  1 Feb 2023 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675258979;
	bh=236qP/C90Z1wdMee922mWauOTL0WF+oXGDgnJ96vQFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMMF4aTsthtPu0qSDZz5BvWT3Pmxnz+NILt33rgl1+vXpJfzqEv41DYzKsqYGtoGo
	 RfbSM457WNfz2Hj+9ntpXQApKcCjAJVksXRu34iUU27WSsyzFHxu28zKksBwqEgFjq
	 bEmZWftDL1skahY8fxJIf/X2bYWhUr5/ruKGAoT6wF16to0EWnPfOxShNm4aNuTyFH
	 TllIEyGeIvTdR60qHVy/Feh2ApS62j8QtGi5QRujJzXjmj7KFrOB8C3HaUwsJdZUwf
	 P83wP7ZfiBKmcU8JDkWwvICV8r+9vwyn/20bGSvqbW6MrkafLuuV0989PpLRqSWgss
	 U+lNph1qFbXHw==
Date: Wed, 1 Feb 2023 14:42:54 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	Seth Forshee <sforshee@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	linux-unionfs@vger.kernel.org
Subject: Re: [PATCH v3 00/10] acl: drop posix acl handlers from xattr handlers
Message-ID: <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
 <20230201133020.GA31902@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201133020.GA31902@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_054302_757712_F4736675 
X-CRM114-Status: GOOD (  11.65  )
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

On Wed, Feb 01, 2023 at 02:30:20PM +0100, Christoph Hellwig wrote:
> This version looks good to me, but I'd really prefer if a reiserfs
> insider could look over the reiserfs patches.

I consider this material for v6.4 even with an -rc8 for v6.3. So there's
time but we shouldn't block it on reiserfs. Especially, since it's
marked deprecated.

Fwiw, I've tested reiserfs with xfstests on a kernel with and without
this series applied and there's no regressions. But it's overall pretty
buggy at least according to xfstests. Which is expected, I guess.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
