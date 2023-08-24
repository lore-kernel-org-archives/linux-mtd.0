Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31258C3DA6F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6xopijWucFfKYiMhZHVqg4WvDrqKQVM+SubPgLWdyM=; b=yLs4DGM+8W/9QU
	dNd4jeZ4tza4zkS6VZzaGZ32YbUy2B0ktNXn2vsf84CVER+Tz8aPV6Mv7rl0bp91WwcegCrTutoxN
	X+BBt17alcKLld/8q2gkoJOj0b+EdjZq8UqIzutsU0iAzh2UVISrKeFuQ1701gh5KOvVeySXqG/r/
	eQ7Dkv890f691xGKMiO49v156is6ByHE7kiFqgB+b3xu6E7q9mo3f1vzfWFTNtmxW4WgWbPoHdGrf
	NTP/EdSduB3bsc3av2CtWKHS5RqDLGlQzsVUzchdP8LDClyVzvepvvoTL9q6U0Oo0pFhUzN5KbLKM
	770N7REuHN0WG3XwlgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4JR-002Mgz-2a;
	Thu, 24 Aug 2023 06:59:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4JP-002MgQ-0D
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 06:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=HMhvBcrp05+CiarwI8trcnBfG30fJaYkCg7iyfQbXOI=;
	t=1692860358; x=1694069958; b=a4fxJG8vDp+GZIJZ2t9ZNYpRS9cBHwBja0K6G89AFe27ykh
	6qLPqbdE9xRMEF0CwZw4Uu1vBZNjOj5FwVQDP7YFbuDwD7KOkRAsbRhFZNMSlT9mDR5RYog2vsWIS
	mMnOAK5oFrRVemywnYNLP3TojOCX21CUyYXkXeOmPSor2XT3h2WzQtH3WPfdEFOYulYvON9Sbxjj0
	999TiAI8bOLhGaUev9EdptQE9VeR31KEy7dcKOpBKBRPGQPZQAWq3qeBaOPcSjQtkHDBKbDgy2KvM
	eyHlXQeUzThRodt+89ffpLfSjJmbmFhRPAQToHy8vxxgSC8NEgVS0qLcbcNXxzJQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qZ4JB-008ia3-2s;
	Thu, 24 Aug 2023 08:59:10 +0200
Message-ID: <dbbd230e26245274d5a05c64c553c42574f15d4b.camel@sipsolutions.net>
Subject: Re: [PATCH 6/12] wifi: mac80211: Do not include crypto/algapi.h
From: Johannes Berg <johannes@sipsolutions.net>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, "Theodore Y.Ts'o" <tytso@mit.edu>, Jaegeuk Kim
 <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz
 Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,  Xiubo Li <xiubli@redhat.com>, Jeff
 Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,  Steffen Klassert
 <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org,  linux-wireless@vger.kernel.org, Matthieu Baerts
 <matthieu.baerts@tessares.net>,  Mat Martineau <martineau@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, 
 linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, 
 linux-integrity@vger.kernel.org, "Jason A.Donenfeld" <Jason@zx2c4.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>
Date: Thu, 24 Aug 2023 08:59:08 +0200
In-Reply-To: <ZObmLqztZ4vMFKnI@gondor.apana.org.au>
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
	 <E1qYlA0-006vFr-Ts@formenos.hmeau.com>
	 <d776152a79c9604f4f0743fe8d4ab16efd517926.camel@sipsolutions.net>
	 <ZObmLqztZ4vMFKnI@gondor.apana.org.au>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_235923_590573_79D22E63 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, 2023-08-24 at 13:10 +0800, Herbert Xu wrote:
> On Wed, Aug 23, 2023 at 12:34:35PM +0200, Johannes Berg wrote:
> > 
> > No objection, of course, but I don't think it's necessarily clear that
> > it "is for internal use only", it literally says:
> > 
> >  * Cryptographic API for algorithms (i.e., low-level API).
> > 
> > which really isn't the same as "don't use this file".
> > 
> > Might want to clarify that, or even move it into crypto/ from
> > include/crypto/ or something?
> 
> Yes it should be in include/crypto/internal.  Once the churn gets
> small enough I'll move it there.
> 

Sounds good :)

I was kind of waiting to see - but now that others have applied some
patches to their tree I've done the same.

johannes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
