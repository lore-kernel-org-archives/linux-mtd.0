Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D300ACEB2CD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuh7GuX0pwkYEgGx9VHwqM8/ZCmviMVjklEri9r2Y1s=; b=NjYmiVaqkHk2Ho
	6kEmy1n/Fs44KI0ufCmTAstSaiPIp4An5jw78zRscn/es6jrzi9Koip80qqEzEYZ99nNAqISr2WIr
	zrAB62Gab/tCv2JrIrmvBESG+G29gyi2wyxpFSt7lim5WhGsQm3ZwE4shLDQ5odHm2nYbErrbcCqm
	JoU3WKrZsmvhbwHNBFVkmxLc0TI9KJ5qeQaLaJdUmp8bYpoW7xnzbTSHnjyUIzXKgvg6CycJx/5mP
	woKr5fW5D7GS2uqirNCGaVx4h3LSiPx/ORCczY8vqY82URvQtRPOqucIq1gZOu1hExRRtTSqQhmTM
	3Hj+67eDZ/ruqOXrKBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svQtK-00000001Dlz-315W;
	Tue, 01 Oct 2024 00:37:26 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svQtH-00000001Dk0-1xaQ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 00:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RhzDv+P0yHp7rVJxU5AwpoZg82v6v7rn8wwhs8V4CzU=; b=Ziv2p46JOi78oP1BjYuks6Yetm
	BYPTN68OFOVw1HnELeFXkbO+CispyjNFaIgie9zjIcPeToUwY1gXEvHij8YwFbkPrtpVP0VnXmmtw
	VnGzMvZEKtdrK0eJNwgWNhxjCkPGD4DVdnytageTWJ1xxr5W4MC1SjZD+FvLeh2n4A78cCfxtb6EI
	4ZKEewG8FMFGs0sQZAr6APUrd2ChcGqXi6si6ANRO7/NzuuSm7B+0uKIKQH+Z7x891CLgZedYi+Y8
	YalKRylc2TGiuiVfB4ROgOclg797c9AMK8bzg0PuYBF6v7QXrqncCDHwjpBxo11LKF60LkOBLSSlP
	Jt8FBu3A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1svQj9-005w9M-38;
	Tue, 01 Oct 2024 08:37:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 01 Oct 2024 08:37:09 +0800
Date: Tue, 1 Oct 2024 08:37:09 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 02/19] crypto: testmgr: Include <linux/prandom.h>
 instead of <linux/random.h>
Message-ID: <ZvtENQJvp8h1uvdU@gondor.apana.org.au>
References: <20240930123702.803617-1-ubizjak@gmail.com>
 <20240930123702.803617-3-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930123702.803617-3-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_173723_521722_B82E5171 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, Sep 30, 2024 at 02:33:13PM +0200, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> ---
>  crypto/testmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
