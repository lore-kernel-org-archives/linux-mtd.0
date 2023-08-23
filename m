Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCD2EE49B5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZF0y2kAGeGcnA/1iD0jtSvizuQP7zRlZvZUWV99KV0=; b=rtdyDHIJPDC+k+
	FEg4E2tt7RrzigsnwuWjm0r1lHwl6GAgMPCrUxqkfeWNx7GKApas1TkKc1uu6iWShPbguDOWMZ9r0
	U4jKEBxMe8oZl68ofvwwraoxkEsLMcLjxlxRZlzGg5a6zVE18Ys4AUtYip8I4Bnn0bb9Q0Zs6Cctl
	cHTzq/pHinXBdd12+lLSdatwJy/s65kSAOvazrsj8Gu5ASOXI5AjmGvnnmXjJNWQ/iDQ7FptcA5jL
	kSUV8HyM0rLUGJgPz3JT85kcIafO5rZDElFlB4S5CqP/GyRYjuMvm0YC4wXattOUZM1RdxCTRypLc
	gW3l+lpXoqiNTtgmF5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlCY-000KPX-0l;
	Wed, 23 Aug 2023 10:35:02 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlCV-000KNh-1H
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dWTFqHYz8fPSN7BLKAD0EIV85Zk+mX8TWHKPbvtc7n0=;
	t=1692786896; x=1693996496; b=IZV8ai9I3B6VAY/wWuksBiYpy7agYoM4pQW2EOyYuLFmjEt
	L2dfs0g+FQMisbVivbhqHvYtyhcawXvdZIXdCIxd7pJkGBBWbDACjvZizOQDOhAE6co9VHeUkRKx2
	4rtk/BqoWLZbV144dIcesBIX2Kv5BkMnyZiKmvLAjxYbRnmjNF3tbiAh5p3sWgXdSJRdgVn+x0bTR
	OtETu3XJVl9NsiW43ijpjOrCaX9V2MX/TZYH9vs2q5Ki5QXHzDlnWIyY2uArLnCT9w3Gt/PLW0pJf
	ueKcjcPL0HyH+1b8JG9NfnwMA7QXi1iGmbqndmxoe+OhZsj5uf8zMu8tJWBSvXcA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qYlCD-006xpQ-1Z;
	Wed, 23 Aug 2023 12:34:41 +0200
Message-ID: <d776152a79c9604f4f0743fe8d4ab16efd517926.camel@sipsolutions.net>
Subject: Re: [PATCH 6/12] wifi: mac80211: Do not include crypto/algapi.h
From: Johannes Berg <johannes@sipsolutions.net>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y.Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan
 Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>,  linux-bluetooth@vger.kernel.org, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton
 <jlayton@kernel.org>,  ceph-devel@vger.kernel.org, Steffen Klassert
 <steffen.klassert@secunet.com>,  "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Matthieu Baerts
 <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck
 Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
 linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 linux-integrity@vger.kernel.org, "Jason A.Donenfeld" <Jason@zx2c4.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>
Date: Wed, 23 Aug 2023 12:34:35 +0200
In-Reply-To: <E1qYlA0-006vFr-Ts@formenos.hmeau.com>
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
	 <E1qYlA0-006vFr-Ts@formenos.hmeau.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033459_432903_147F7EFB 
X-CRM114-Status: UNSURE (   7.77  )
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

On Wed, 2023-08-23 at 18:32 +0800, Herbert Xu wrote:
> The header file crypto/algapi.h is for internal use only.  Use the
> header file crypto/utils.h instead.
> 

No objection, of course, but I don't think it's necessarily clear that
it "is for internal use only", it literally says:

 * Cryptographic API for algorithms (i.e., low-level API).

which really isn't the same as "don't use this file".

Might want to clarify that, or even move it into crypto/ from
include/crypto/ or something?

johannes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
