Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23099C54E4A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=A+Qsuqa6ZgHCjhYlvm/QaVmzqjKFZxo3y0HHoYhr6Qo=; b=2dmO9onMfYkLGC
	BR0yV5Fs0Co4tCrqur7rzYZAIkqme5lf5hFoJxr2g2EcGVp0XR6UCgoyu/HLpN4wUQjMxrH4Up+sW
	tw6jFfVvvUaTUIn6bc60x5ziHz7ycC/mBN0PzyIQjanAdHcgrhRIW7Qj9QUUjpUyq3KyUp9k4/Fe6
	vjPBAUC6EOPQtKK4MUXxUYL955tStlhjN5bPclUoQcq/VDv8wemXzBnpSjE/T2PduTWD4KDRVZdtN
	HDCDcO+xUXJ8mfRIOEbMPP76GRk+grjoDwEQAF6UgGu9PFQ48EjMlA71M80I8TTgm08B25DFeKq+q
	45LWunDfjByMV30C76uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYLE-00000008xpY-0WHa;
	Fri, 08 Mar 2024 11:24:44 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYL8-00000008xnH-25jS;
	Fri, 08 Mar 2024 11:24:41 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1riYKw-004tIW-QY; Fri, 08 Mar 2024 19:24:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 08 Mar 2024 19:24:42 +0800
Date: Fri, 8 Mar 2024 19:24:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
	tudor.ambarus@linaro.org
Subject: Re: [PATCH v2] MAINTAINERS: Remove T Ambarus from few mchp entries
Message-ID: <Zer1ei9qgim1tDb4@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226115225.75675-1-tudor.ambarus@linaro.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_032438_564751_3173FFF5 
X-CRM114-Status: UNSURE (   8.85  )
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

Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> I have been no longer at Microchip for more than a year and I'm no
> longer interested in maintaining these drivers. Let other mchp people
> step up, thus remove myself. Thanks for the nice collaboration everyone!
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Shall go through the at91 tree.
> 
> v2: make entries as orphan instead of removing them
> 
> MAINTAINERS | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
