Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB714C3DA66
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 21:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWVqCbHXMi28f1yxXO33WRivgAGMZHYSc3htasLyGus=; b=WO9z+m037LXVnk
	5FoAHry5CHhEwEotUHQE766vYvCppCO8RAwSSyFCt1CH1yGeNVAi2l320CrLNka/vYM49dmTed2ds
	EI7muweU1sXnWGmmq2bo/y6vAq2knCVhC+cwiwz4+GKqXJ4wucc8M02p6SVfTRu9pRBeS29f/k/kS
	LOpKXz+Y2+sDxmRst5Y9RN27RLEo8GpZih6J0vkKURlHG4TUt/7MMVTf5oO+P7fUq2IfCUBYbObCg
	nlBj4iQPGvtpHw33i6HlTfw8Rt5kfTAnLb5l5F2tDzweE3h5ZENngzC2k192MekUPkQnc3iBDkXJO
	0voCD+nosmSH2bseqlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZe80-0062AU-11;
	Fri, 25 Aug 2023 21:14:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZe7x-0062A7-0q
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 21:13:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AD456142E;
	Fri, 25 Aug 2023 21:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0ECC433C7;
	Fri, 25 Aug 2023 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692998035;
	bh=uiXkyRVOSV4tA0Dr9xfhgTNwejV2oZiBsqM/hZn5yPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgSWvtl49FkDkaRYO3r0z4VzYK/yDU2hQmm5FUy/saN2DaYbzz5vuhxj+oTpq/YEz
	 6iPySb9lNptNeguxiheMPfLw58USp34CyI6yLgGfRUu28v0iNMZb16krVHW1DR7eer
	 X7/UJR9hvVw1WO8f9x3khDGmYa5/plHR8kM491NKMqEuNO4Pw9iZDNRrB6DqgVa63r
	 +IjWV8he6N0kCyEWrQbC5VfgXNT058QGjrBf2pO6OG6y8NaLAaMZTNAT4pmMeyQyKD
	 eh10XcSY2us9pZi/URLX1z5VvUzlXT9gvz7Jlc/CvSoA1f7ssDARtN21vNHvUsEQko
	 AuIIYRR5eP06A==
Date: Fri, 25 Aug 2023 14:13:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Matthieu Baerts <matthieu.baerts@tessares.net>,
	Mat Martineau <martineau@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
	linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	linux-integrity@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>
Subject: Re: [PATCH 1/12] fscrypt: Do not include crypto/algapi.h
Message-ID: <20230825211352.GB1366@sol.localdomain>
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
 <E1qYl9q-006vDd-FJ@formenos.hmeau.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qYl9q-006vDd-FJ@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_141357_369052_6300C143 
X-CRM114-Status: GOOD (  16.08  )
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

On Wed, Aug 23, 2023 at 06:32:15PM +0800, Herbert Xu wrote:
> The header file crypto/algapi.h is for internal use only.  Use the
> header file crypto/utils.h instead.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> ---
> 
>  fs/crypto/keysetup_v1.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
> index 75dabd9b27f9..d698ecb9ad44 100644
> --- a/fs/crypto/keysetup_v1.c
> +++ b/fs/crypto/keysetup_v1.c
> @@ -20,8 +20,8 @@
>   *    managed alongside the master keys in the filesystem-level keyring)
>   */
>  
> -#include <crypto/algapi.h>
>  #include <crypto/skcipher.h>
> +#include <crypto/utils.h>
>  #include <keys/user-type.h>
>  #include <linux/hashtable.h>
>  #include <linux/scatterlist.h>

Acked-by: Eric Biggers <ebiggers@google.com>

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
