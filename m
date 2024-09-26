Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C2FCCFA07
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLSo/vxqyuP8ClmV04itNCTRP4sfqx6WV0AEyGpZDTs=; b=GBfuwfXk1WPCB0
	iaGWUzMk1QYx8c23yEtApHO1JDHJExKO+etydJrJ3DFzZ9ek4giqex3LkNQRNa2cNQwVjNXQWgGzo
	kMl3UoL9efHbBKs33RR6T9NH1yWRqHilEg4kZMDd5SoM2DNY9w92i0mDmECQDzuTdfACfhBwIkydZ
	c8sFTJy9lLnYqhIOLhf4y0RafmZiAdiZyFN187DxMZEUDdMQS+KDFIxRfP2JkNf+/lwColRVRo4n1
	nGJxPsR20MKZgTN30JTccfhYjh3cXD+KF4BpuSLUrzNoW/V7sgKC2LnwQSetekBcbvMEwk6Wwluhi
	k4fWnaNc7dEhcbnBzmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stivd-00000007W1K-30Xm;
	Thu, 26 Sep 2024 07:28:45 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiq3-00000007Ueg-2DAZ
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 07:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+dyrPIj/vXms6g9F84iGi46agOb2XG4/wT0OCKqAhX8=; b=P4WGfk4W21jGA+KQF2E7ENNW80
	DGXb61/M28w6va7RE9m0PTWo3M9JGRKW6vzSQvU+S3bzWPQ4zysnZFliZScgTHkvmjfXamVE8JULx
	6zNUwk/39N30rrQ3veqlG5N1xpelWOnsuVq91WKO75v2KitmcAFu0lV8yP/IwYaTd0hrQrz712W9c
	8V5q7QAP755w/aIrGwNtAZZN1HeHnfoutlBNr1WXJbgaewhOqqTElUQXNJDicygSKBEvFYOa1kq8J
	ITZRCRMH3OS+5+akSFcZGscn8koXj7d+pDDHSYykt2VqWMzSViTEo1Mf9t1MJuD/tkLLHyp+pk3Ax
	je7/K0hw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stipe-000GeR-FH; Thu, 26 Sep 2024 09:22:34 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stipe-000DhP-0F;
	Thu, 26 Sep 2024 09:22:33 +0200
From: Esben Haabendal <esben@geanix.com>
To: Erez Geva <erezgeva@nwtime.org>
Cc: linux-mtd@lists.infradead.org,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  linux-kernel@vger.kernel.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Erez Geva <ErezGeva2@gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: macronix: reading SFDP by all
 Macronix chips
In-Reply-To: <20240925074903.1983601-1-erezgeva@nwtime.org> (Erez Geva's
	message of "Wed, 25 Sep 2024 09:49:01 +0200")
References: <20240925074903.1983601-1-erezgeva@nwtime.org>
Date: Thu, 26 Sep 2024 09:22:33 +0200
Message-ID: <877cayj2va.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27409/Wed Sep 25 11:17:07 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_002259_878152_BE2D1C2B 
X-CRM114-Status: GOOD (  13.39  )
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

Erez Geva <erezgeva@nwtime.org> writes:

> From: Erez Geva <ErezGeva2@gmail.com>
>
> Add reading SFDP to all Macronix chips.
> All chips in the Macronix competabilites table
> have a replacement chip that support SFDP.
> Macronix stop producing any chip without SFDP 15 years ago.
> The benefit of reading SFDP is by supporting
> fater op-codes for newer chips.
>
> This patch do not add an all flashes support.
> This patch extend the already support of SFDP to all Macronix chips.
> The new chips that reuse JEDEC IDs and chips that
> are absend from the Macronix competabilites table.
> The patch just remove the restriction!

Hi Erez

Did you see the response I got to the last revision of my patch series
that tries to resolve the same problem that you are adressing?

https://lore.kernel.org/all/D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org/

I think we should try go go in that direction. It sounds like it would
be a simple solution that would improve the overall situation, not just
for Macronix.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
