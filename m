Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDB4C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 22:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE65208C2
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 22:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALqeRms5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kd+k8Kc/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE65208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAOrgbGV6m3ePIqFkcu7Nx1U4kdE47tc41DOmjAU59Q=; b=ALqeRms5ezua9g
	NNZoZej/Tk4FTclgOmitSOSXDO3FA7ILIByOA3T2wxhanO8S8iJ142wMbdS9UhY1wLd72p4F93N48
	8GN5psJI0m4PM+enL+UK103VvwvZoxUI71KvRXFkwgk6A3S+5l/x7qAuHu8Xfb8E60BiVCHzUjQu9
	fFFLcaWnt0ypmZoD0rW/h5qp0qk9MZ6vgVrqLrAOVDpfEtLAKnNfxq7qdxJhjfx2kuxZWuqWNKZvW
	X+3j9zRCmvIhPS2Sl4mxy0f5Jn1PP1pdrKruzvbPZKKi1RUSc/n7uV/vJBsX0WOZBP/FGzPyZD9xr
	9y9YDwqqJY9ffq93hBrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy1ta-0006up-8X; Wed, 14 Aug 2019 22:37:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy1tY-0006uW-0s
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 22:37:29 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5380A208C2;
 Wed, 14 Aug 2019 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822247;
 bh=zZu436fUH/jVRbuBikAqFWcrS6iRdnYyiGm2WREqNhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kd+k8Kc/rEbGv/TrtNBMq15M+vYNbAt/FTQ+D0vmw7cYxvFayrGWgFSLnSnlbLdnn
 c7ZNIKcI1QJjSXqgnA9fVIOBWcef8YR0lm1z6vtXFe0kH+LJGNkdiwYmd0p4/fCjAe
 +BraiOijhZifnnC1UtWKoYgFI6mf0uxQ304q3m0o=
Date: Wed, 14 Aug 2019 15:37:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH v8 00/20] fscrypt: key management improvements
Message-ID: <20190814223725.GF101319@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_153728_087786_F5481653 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2019 at 09:25:01AM -0700, Eric Biggers wrote:
> Hello,
> 
> [Note: I'd like to apply this for v5.4.  Additional review is greatly
>  appreciated, especially of the API before it's set in stone.  Thanks!]
> 
> This patchset makes major improvements to how keys are added, removed,
> and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
> adding new ioctls that add and remove encryption keys directly to/from
> the filesystem, and by adding a new encryption policy version ("v2")
> where the user-provided keys are only used as input to HKDF-SHA512 and
> are identified by their cryptographic hash.
> 
> All new APIs and all cryptosystem changes are documented in
> Documentation/filesystems/fscrypt.rst.  Userspace can use the new key
> management ioctls with existing encrypted directories, but migrating to
> v2 encryption policies is needed for the full benefits.
> 

I've applied this patchset to the fscrypt tree for 5.4.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
