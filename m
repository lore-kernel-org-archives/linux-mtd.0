Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301DFC369C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 01:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vn52xWA+CIswqK2+2txisU74NBNUpoUTuwGRsZkxeFo=; b=AaLX7WYPAmN0Iw
	N3xyVRhXSBAibiaXsahX7lvxxLUo/5K3RXIc32HopqwIweoWgIkF/K30y6Z9yZbMR2opvWmucZ+p4
	n5RA5FJJOcQpNhBhDynmx383gLJxcaqqVc0IfHmCGlR8ip4bueXRhj8ISxi3rP/vKrRs8qt41A3o4
	MibiV2hv/XWEdP1l7HD02zvZ3zdseFbx9lYE50KUfL6BMgvgQ5gJK6YHDIqvwsnyCNk8ozi1ynIcG
	eFz3tcFb+/QBQYhooFK/40VRsJPlQukmgSPAs33TajoF6UozvpRsh7jZVdrFFo3ZAndXSVQXgkKFy
	CDArhykUk4CyBh1/y/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Op7-00000008xLw-2O2A;
	Wed, 23 Apr 2025 01:22:49 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Op4-00000008xLT-1Pie;
	Wed, 23 Apr 2025 01:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Bm5aY/6VVF0bgAOLgzDfud9C1Mj1JgBZ+ZlOE5CW70w=; b=jydTR+NwHdzKIURBEiuMVZboYi
	DCzwWQLhKnGgUo5HZYkqzhQ0Qz4mqZljqyNFR4KZ748gcounLL9OJfWLO9LCXsHD72iXYufOYaV1P
	sboHKZo/GUYfcCaZlUJxUiAOdrFgPiUh1R1kKLJmYiCA+eLkrq3n3sYoOrjjZ7el4b9E7204of4jf
	8aNRskw8RyHMGk/okwwPl2V0fiSxWpTuNAZluzf5ubyATJh3JG0vjWfh9hGc/TaKN2/mMovlLb4Ij
	NE6K3gIk1LKIRV7jAZ5frHwcgR6VaRMJuSYa4yTALGKsKpB352lgMQg24ePUV/T5rpGh+OJPfVWCO
	7yVn584g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u7Ooc-000FHI-0h;
	Wed, 23 Apr 2025 09:22:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Apr 2025 09:22:18 +0800
Date: Wed, 23 Apr 2025 09:22:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Matthew Wilcox <willy@infradead.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <aAhAylotNK_zHl0C@gondor.apana.org.au>
References: <20250408082018.GA23886@francesco-nb>
 <20250422175409.GA877874@francesco-nb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422175409.GA877874@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_182246_372877_41A72096 
X-CRM114-Status: UNSURE (   7.87  )
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

On Tue, Apr 22, 2025 at 07:54:09PM +0200, Francesco Dolcini wrote:
> 
> On Tue, Apr 08, 2025 at 10:20:18AM +0200, Francesco Dolcini wrote:
> > I do have the following regression on single core system using UBIFS,
> > dual core seems not affected, any idea?

Please try this patch which will go in today:

https://patchwork.kernel.org/project/linux-crypto/patch/aAW8E9NrKWq1Xk2w@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
