Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC85C27C40
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 05:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp94CcqDC/bTH9J/0j56fcp0y51tKOavsv1DmVMSvSE=; b=EE3ukb3+nQTxLe
	Hs7SJImc1a7vEFG2i9jlRC0NHXzn4NwoZBcfe8W6ScPwn6gTy88vwToS1abFXlnG1zTYjKMu68Lpm
	MAV1VvH/AhEucw2eZeL0F2SDbt4saSyvJxZ0J+FFPngBVVtzUTWieBRvK4Fzb2c8MRmG9NLylOL1+
	0CldCsuLR6LCSzrr6gIaY3C574iQ5mNj3CKexrSgSaCHkFoJnT1LioT0eBvyu6kE7LZrivhwOLwIB
	Vwrgxz1sGBPTYaqfGwsUDNhIGMCQhfZyJSs3BB5gXIOfnCjWMdVGoV9HV7Wqs1QvjMOJJ2i/3j27O
	RTjX2Y5ysz8K65NpEJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ2cB-002CpC-09;
	Thu, 24 Aug 2023 05:10:39 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ2c7-002Cn0-07
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 05:10:38 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qZ2bd-007EU6-EA; Thu, 24 Aug 2023 13:10:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 24 Aug 2023 13:10:06 +0800
Date: Thu, 24 Aug 2023 13:10:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y.Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Matthieu Baerts <matthieu.baerts@tessares.net>,
	Mat Martineau <martineau@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
	linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	linux-integrity@vger.kernel.org,
	"Jason A.Donenfeld" <Jason@zx2c4.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>
Subject: Re: [PATCH 6/12] wifi: mac80211: Do not include crypto/algapi.h
Message-ID: <ZObmLqztZ4vMFKnI@gondor.apana.org.au>
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
 <E1qYlA0-006vFr-Ts@formenos.hmeau.com>
 <d776152a79c9604f4f0743fe8d4ab16efd517926.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d776152a79c9604f4f0743fe8d4ab16efd517926.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_221035_075434_DDA25803 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 23, 2023 at 12:34:35PM +0200, Johannes Berg wrote:
> 
> No objection, of course, but I don't think it's necessarily clear that
> it "is for internal use only", it literally says:
> 
>  * Cryptographic API for algorithms (i.e., low-level API).
> 
> which really isn't the same as "don't use this file".
> 
> Might want to clarify that, or even move it into crypto/ from
> include/crypto/ or something?

Yes it should be in include/crypto/internal.  Once the churn gets
small enough I'll move it there.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
