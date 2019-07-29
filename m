Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6048C7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 02:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871272075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 02:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sd2gioyC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871272075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mUJr2PrjQEab1z58XvCqoHDWDdYcVhMHvYcdFGwZz4=; b=sd2gioyCD/ip+x
	nAlRTcS80QpbBLsU7loZxHMrRS7jWwR1iedEW93fXjJ4V1w6kEjwo7ayCuFap32hUw4ZcrVDja0XU
	Nil7UhtWHpLFe4lMHKjByOFA1WroJhx7uC2kgMf2eL4cRAwcPKAnemmaQ3yPdHwThEf216nPgjIqx
	ku+qdSVhP0qmKDnV9NwCYF9OFmUUhJ/AxJVgkDFgcWMZ4FaDkTwIVgcK5k0r90I6W47xA8QShMHS9
	55E0iHEntVObNIuK5Y3Uff1KlNc6TWUNbwafg5L8PTAX5PGg3dhi7rFVuTI7qN3EcLvydmTNQPgbe
	EmutqOnk/AXK3ww8UXNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hruxl-0002Ki-Uh; Mon, 29 Jul 2019 02:00:34 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hruxj-0002KL-4e
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 02:00:32 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6T20BFl005802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 22:00:12 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 0C9074202F5; Sun, 28 Jul 2019 22:00:10 -0400 (EDT)
Date: Sun, 28 Jul 2019 22:00:09 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 16/16] fscrypt: document the new ioctls and policy
 version
Message-ID: <20190729020009.GA3863@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-17-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-17-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_190031_350133_7923E33A 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 03:41:41PM -0700, Eric Biggers wrote:
> +- The kernel cannot magically wipe copies of the master key(s) that
> +  userspace might have as well.  Therefore, userspace must wipe all
> +  copies of the master key(s) it makes as well.  Naturally, the same
> +  also applies to all higher levels in the key hierarchy.  Userspace
> +  should also follow other security precautions such as mlock()ing
> +  memory containing keys to prevent it from being swapped out.

Normally, shouldn't userspace have wiped all copies of the master key
after they have called ADD_KEY?  Why should they be left hanging
around?  Waiting until REMOVE_KEY to remove other copies of the master
key seems.... late.

> +- In general, decrypted contents and filenames in the kernel VFS
> +  caches are freed but not wiped.  Therefore, portions thereof may be
> +  recoverable from freed memory, even after the corresponding key(s)
> +  were wiped.  To partially solve this, you can set
> +  CONFIG_PAGE_POISONING=y in your kernel config and add page_poison=1
> +  to your kernel command line.  However, this has a performance cost.

... and even this won't help if you have swap configured....

> +v1 encryption policies have some weaknesses with respect to online
> +attacks:
> +
> +- There is no verification that the provided master key is correct.
> +  Consequently, malicious users can associate the wrong key with
> +  encrypted files, even files to which they have only read-only
> +  access.

Yes, but they won't be able to trick other users into using that
incorrect key.  With the old interface, it gets written into the
user's session keyring, which won't get used by another user.  And
with the newer interface, only root is allowed to set v1 key.

> +Master keys should be pseudorandom, i.e. indistinguishable from random
> +bytestrings of the same length.  This implies that users **must not**
> +directly use a password as a master key, zero-pad a shorter key, or
> +repeat a shorter key.

These paragraphs starts a bit funny, since we first say "should" in
the first sentence, and then it's followed up by "**must not**" in the
second sentence.  Basically, they *could* do this, but it would just
weaken the security of the system significantly.

At the very least, we should explain the basis of the recommendation.

> +The KDF used for a particular master key differs depending on whether
> +the key is used for v1 encryption policies or for v2 encryption
> +policies.  Users **must not** use the same key for both v1 and v2
> +encryption policies.

"Must not" seems a bit strong.  If they do, and a v1 per-file key and
nonce leaks out, then the encryption key will be compromised.  So the
strength of the key will be limited by the weaknesses of the v1
scheme.  But it's not like using a that was originally meant for v1,
and then using it for v2, causes any additional weakness.  Right?

    	       	      	  	 - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
