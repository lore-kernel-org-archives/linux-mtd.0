Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F92C35FFA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkpGD2ZFHBKV/gjuBlqmJgX/BAZl1qHUN4YEvLm8beE=; b=HAqbHdRKINJr2D
	t10yHYcvmpRRr5lDFYeYWU/7Xzg7p7JyF/0JdBDf0YdQ8IYpoq9fcS8caj93rgGMQQCZunUvP5taB
	W4/8Sr8QmHzWEZI8/zHcb1yeJnoONUFKWdmkwXwEWYUvkyKjHH5A+nKYnVP/wKI9b3zxnpcGGJihf
	aqJ+lwup2XllcwtBsAD2GrShtlLSZMNWB3fNKOI7BJtVq4KSNZr1yzG1Q9wk2RuvJXU7HAyMhb6x7
	MfEOkughL2H4vnl3Rtr2TaZPJjKde47J/x8dytotC3EL02RHTZNPywOcic5is9o9UIkTKKZr6Cu5n
	RQ0zP6nsqnv9QuctMdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq9V-00000008aSo-35kE;
	Wed, 19 Mar 2025 09:55:57 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq17-00000008YVC-2XQG
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1xba3QwBDEdOqsdbJ70a1n1eNBHIuSvaY2GOl1m11oQ=; b=ETkCthiiHS/MuYoJ6fJY00srdI
	P23n6lZx9HO7rjd98/zNB5Jcv+hvV/1fBViMadwEPHECeJuz4/daWuvBJxSEjISbx8UkMIX/YXaZg
	B0x/yj0QH5LtDsPGbXkXrZ8X4HvmibFMUrYHDPeDXAiZJJC3EfCEn5VqrfrAjPNmAhEKbq9EopGdu
	EpZI+4GnhAGLB6k8BNHfZpwv7SRavwGCPp/I4YGHUcjjshZCDFFiwjgRsEgd2+d52zXmdKSRfexT0
	5iegz2atsw2WKGKOHMynI2/4npLS+xhLk3/ci20wYg4ZgtaK+eVBKRh9nelBIYuSrXE8u9xRLfdl1
	XszRH+MA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tuq0n-008Meg-21;
	Wed, 19 Mar 2025 17:46:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 19 Mar 2025 17:46:57 +0800
Date: Wed, 19 Mar 2025 17:46:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v5 PATCH 14/14] ubifs: Pass folios to acomp
Message-ID: <Z9qSkRbwig5VXstP@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <99ae6a15afc1478bab201949dc3dbb2c7634b687.1742034499.git.herbert@gondor.apana.org.au>
 <9f77f2a4-e4ba-813e-f44d-3a42d9637d0f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f77f2a4-e4ba-813e-f44d-3a42d9637d0f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_024717_648566_BDDEF473 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, Mar 19, 2025 at 05:44:17PM +0800, Zhihao Cheng wrote:
>
> Tested-by: Zhihao Cheng <chengzhihao1@huawei.com> # For xfstests

Thank you for testing!

> > 
> > diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
> > index a241ba01c9a8..ea6f06adcd43 100644
> > --- a/fs/ubifs/compress.c
> > +++ b/fs/ubifs/compress.c
> > @@ -16,6 +16,7 @@
> >    */
> >   #include <crypto/acompress.h>
> > +#include <linux/highmem.h>
> >   #include "ubifs.h"
> >   /* Fake description object for the "none" compressor */
> > @@ -126,7 +127,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
> >   	{
> >   		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
> > -		acomp_request_set_src_nondma(req, in_buf, in_len);
> > +		acomp_request_set_src_dma(req, in_buf, in_len);
> 
> Why not merging it into patch 13?

Because it will break without this patch.  If the input is a highmem
folio it cannot be directly passed over to DMA (because the virtual
address has been remapped by kmap_local).

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
