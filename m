Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7D3C10F13
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 23:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6412075B
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 23:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciQeFQmH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6412075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7URvdQWqao9eCa9Fic/4bkC/oU/ZckkJyFToK+HUjI=; b=ciQeFQmHpHJDb0
	1j4MZDPb1QnxFdEJvjfGWyjgXMba/k/5DkNS5mY66au1ELuI0hipU9tLf27h6uKnn3mrkKsBnNL0r
	QFK7BdrvfChBe3ikL5jaLVkmXSOh80FfBCVCaH1lPajE9TRXxsYRgasBp9e4QUj2MIHz59XMWX0wZ
	0Nk4MY0XX158HLUUTP0wxV2hSH65Z7bkJWayS+FQq4LnLsB3bfznYdk2oQw7NTfaiZIfQsSTDsBNc
	A8ptLTqU47lHBZXzQ2alyTGQzPjFPNayCtqmIyTl39/axPq3d2xYBbnhboiHlvEtK6r51nP1KbQZq
	RMyjt1hAGS+0ZDmFCAFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGXCE-0006F3-C4; Tue, 16 Apr 2019 23:08:58 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGXCB-0006Em-7v
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2019 23:08:56 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3GN8evq017669
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Apr 2019 19:08:41 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3DC7F420497; Tue, 16 Apr 2019 19:08:40 -0400 (EDT)
Date: Tue, 16 Apr 2019 19:08:40 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 1/5] fscrypt: clean up and improve dentry revalidation
Message-ID: <20190416230840.GB14623@mit.edu>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320183913.12686-2-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_160855_444254_56D7897B 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 11:39:09AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Make various improvements to fscrypt dentry revalidation:
> 
> - Don't try to handle the case where the per-directory key is removed,
>   as this can't happen without the inode (and dentries) being evicted.
> 
> - Flag ciphertext dentries rather than plaintext dentries, since it's
>   ciphertext dentries that need the special handling.
> 
> - Avoid doing unnecessary work for non-ciphertext dentries.
> 
> - When revalidating ciphertext dentries, try to set up the directory's
>   i_crypt_info to make sure the key is really still absent, rather than
>   invalidating all negative dentries as the previous code did.  An old
>   comment suggested we can't do this for locking reasons, but AFAICT
>   this comment was outdated and it actually works fine.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, applied.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
