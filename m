Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B035C71148
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvH41Wc/YhmGFQbjSE1QjAVCsJ61hkIRehi0GFkN+rU=; b=l+EgY1pII9MkCL
	Rjj7XLXbW6DAU3btJtn8Az/SedxwKbmPQtJAa7e8fronNiugpJGd4k9CO/TkspNzx5h03JFG5wRhp
	c1i18lfD92cn0MwLDsmMhJmu3Rx6oBng7TfIkwDmXe+qIyAvRyaCj7vg/F/2WEXqGDf/YvJpDaDYF
	+LFXMbU9AvkRPxVIYotGlzF1bwrfHPqVoNmOu947GKblDJ3bMyL9zZ/b5s+bfsPVNBJkVKZVPHsCQ
	xhxbHMk9rS9G0TmqCcCUVAQDECpO6dfOcIk5xMK44d6O9NJ9Rzi1DO64gGYAgbnuRWj66YzXt+0CX
	tgQHccz6MN21nZ/CPTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6cB-0000000GwkQ-45Ik;
	Fri, 13 Jun 2025 15:46:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5cZ-0000000GjO3-2YLq
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 14:43:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDDCDA511C0;
	Fri, 13 Jun 2025 14:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40697C4CEE3;
	Fri, 13 Jun 2025 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825786;
	bh=X8uCzsD5itqoI7POYg9wvCv44Y1Bhh9aSVeaZS08ftY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpFPf1B01lZLa94UVQa51/VgBj9RwtCQJaDlD3SVGhwXzEGZYdDlaAcrCnvBSQri7
	 9DNPosHAUVOyrQMIbBB/+2Wjlt+ohCPB/fNLZk9Q9MK4uf3fMpdAqz2An/+VcoUyuX
	 xKHKE1bm45MNSEB8bBx2L8WTP1QSY8pnf1lkhFMeMCcomHCxZl3A9uBXRB8jHsJjbs
	 9IkOmrjHo4lZU7OafX32/ep8bZb8Mp/wowKzwXA/DF1zUYwF5qBR7tCgJKUp9eSzUx
	 K8fUOcYr8aBDNj2Y1dVSRMJgqyx/oJy1V4XkrJ4m94l2lylSW2dTEnDF+6knaZvHE8
	 U80TOWjguDBUg==
Date: Fri, 13 Jun 2025 07:42:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxime MERE <maxime.mere@foss.st.com>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250613144239.GA1287@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074307_722229_4491E3FC 
X-CRM114-Status: GOOD (  20.41  )
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

On Fri, Jun 13, 2025 at 11:01:03AM +0200, Maxime MERE wrote:
> Hello,
> 
> On 6/11/25 22:58, Eric Biggers wrote:
> > To protect users from these buggy and seemingly unhelpful drivers that I
> > have no way of testing, let's make fscrypt not use them.  Unfortunately
> > there is no direct support for doing so in the Crypto API, but we can
> > achieve something very close to it by disallowing algorithms that have
> > ASYNC, ALLOCATES_MEMORY, or KERN_DRIVER_ONLY set.
> 
> I agree that software drivers are more efficient and less prone to bugs than
> hardware drivers. However, I would like to highlight the fact that certain
> ST products (the STM32MP2x series) have features that allow the loading of a
> secret key via an internal bus from a Secure OS to the CRYP peripheral
> (usable by the kernel). This enables cryptographic operations to be
> delegated to the non-secure side (the kernel) without exposing the key.
> 
> If fscrypt no longer supports hardware drivers, then this type of
> functionality could not be used, which I find unfortunate because it is
> something that might interest users.

What?  fscrypt doesn't support that anyway, and there isn't any path forward to
supporting it in a way that would actually improve security.  (Considering how
fscrypt's key derivation etc. works.)

fscrypt does support hardware wrapped *inline encryption* keys, which is
actually designed properly and does work.

Honestly, the responses to this thread so far have made it even more clear that
this patch is the right decision.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
