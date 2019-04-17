Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4132C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A20D2206BA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSW3OBye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20D2206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr7XoSL1468pMbcX5ycL2+W2vUtyxKvwLuYcMiExO20=; b=gSW3OByew/SPTM
	4E7og6reO0idT2shj+6rrB8XzabAqTUBkgIGoZQNVuQyOInupryzF27kKtbDCXpYdNaJPupCql7X/
	XKJBMTsquqJlL6d27X9dmB6VYBUiNzUoQF+q7Env4Snv3J2n83HBrYZdkw5u3aydPjq0XXbsmEQ3I
	wwmywKQdS/Po5k4+pUdcFkJdxnzfrU30F6n/Oyp5eoyFdvPRywFUyJ40c4m7AsUyE0GvRjel9kM4v
	j3M5hIiALV7raNRtepvGr3Arm+XU7gjAmJs8zF5c1EE8fFF0HzPvbA9YAtNAEzpTwKUtSzdOxa/w4
	z8Gr6l+/so0DsoCfwrrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGlDU-0001Tl-PJ; Wed, 17 Apr 2019 14:07:12 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGlDR-0001T6-P1
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 14:07:11 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HE72dN002538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 10:07:02 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 9F263420497; Wed, 17 Apr 2019 10:07:01 -0400 (EDT)
Date: Wed, 17 Apr 2019 10:07:01 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 4/5] fscrypt: only set dentry_operations on ciphertext
 dentries
Message-ID: <20190417140701.GD4686@mit.edu>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320183913.12686-5-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_070709_977757_51451B7F 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, Mar 20, 2019 at 11:39:12AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Plaintext dentries are always valid, so only set fscrypt_d_ops on
> ciphertext dentries.
> 
> Besides marginally improved performance, this allows overlayfs to use an
> fscrypt-encrypted upperdir, provided that all the following are true:
> 
>     (1) The fscrypt encryption key is placed in the keyring before
> 	mounting overlayfs, and remains while the overlayfs is mounted.
> 
>     (2) The overlayfs workdir uses the same encryption policy.
> 
>     (3) No dentries for the ciphertext names of subdirectories have been
> 	created in the upperdir or workdir yet.  (Since otherwise
> 	d_splice_alias() will reuse the old dentry with ->d_op set.)
> 
> One potential use case is using an ephemeral encryption key to encrypt
> all files created or changed by a container, so that they can be
> securely erased ("crypto-shredded") after the container stops.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, applied.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
