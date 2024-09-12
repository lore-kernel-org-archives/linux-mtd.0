Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6FFEE6456
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Sep 2024 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=q+ueurJ3HJWzgTq3lGcXux9U0sTMNWjxZpiFQ2dTNN4=; b=zKz9EowZkb3lOX
	m0ehH2s2UOx5dV+5wzDdXwHMr11997QxV3wfcT1iPh2Sfzpb9TnwYBLdfypEpBwSo2uZyJx3VNJo2
	fctMTxunI3qYYQ5/2dM2u+Y32KNPiVs1tGAWLbyd99Yy/yYBKvN3qOhJl5Bho9hNUrV/xbOxijA9i
	PT/2nzKcheIMRX6wA//Rm9gy4fEWCH9N8zTejkjK6bm1DvLM19HEDWs4g3CHv2eZdwduMyW8fAk/8
	Z6AUtCwsY7dYt0bGzijnUasIm1wDXUsm4wLvA3KmR21G4sUhucZhS5FfCIxOkSjIMJ3luSnjvRY6O
	3uLrUpvDrp3nkTvhcaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soe3O-0000000C8Pu-075j;
	Thu, 12 Sep 2024 07:15:46 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socyQ-0000000By95-1FCh
	for linux-mtd@lists.infradead.org;
	Thu, 12 Sep 2024 06:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3xlRzXI9yb+oNIsqCP0Wa4u5a4LZve9QqMy4C7Th5mc=; b=Dut6C6EbXHKl46S1QMOW38R/r8
	3ekj8fbSVpa3M/4/NfVU0/L2n4YksdJhPe6RCzswqcuWg3XU0BC0sZSZebL3LtKud0noRiobvGk3s
	s/vCZiFAoEpUs3s3m9eG2GLI2hq9hOkVu+/Pyiz7KuUe6mkob8ueP+ie3hXBRJSLcpskkGSmRSJDN
	qrau35IL7NHMtOaOM/vu6KRhLjNPt0bgnC3Zh6h5EfMCiahs5z3wgoDQcFxfm3fN4JbbCQ9+0fccb
	D2WcU7+AMLG+HPRlw3XBvisLeOAhLALpq8oK72eukqxOqnZIqQZ9rgtSG88tBc821hJ2S4hROU7Jq
	VRGE9A6w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1socoG-001u5Y-2v;
	Thu, 12 Sep 2024 14:06:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 12 Sep 2024 14:06:18 +0800
Date: Thu, 12 Sep 2024 14:06:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	ubizjak@gmail.com, davem@davemloft.net
Subject: Re: [PATCH RESEND v2 02/19] crypto: testmgr: Include
 <linux/prandom.h> instead of <linux/random.h>
Message-ID: <ZuKE2sffS3wddU3-@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-3-ubizjak@gmail.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel,apana.lists.os.linux.scsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_230634_356449_AF925396 
X-CRM114-Status: UNSURE (   9.37  )
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

Uros Bizjak <ubizjak@gmail.com> wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> ---
> crypto/testmgr.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
