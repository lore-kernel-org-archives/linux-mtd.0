Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EC2CD5BD2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ula1e4wpYi9eVjUJ7jXK6rD1Ls6TwXoANgcLTWbbrSc=; b=yIybyusDfBprL9
	UGYeRY7d+CPqfKZBPr/69VwJvWXNXkRl987jx/G14kduEF7VBL8kY0b4seJXzMcdAr4/282aU98Pj
	94xuI/CMtWWEBlMd5ISqbvvp9Be9cCr0wP9aBSf3M/4g2YAXg9Wrwjw+RWd81R4ogQTIdJdwoRuUP
	Oxhxsiibwl4EaHTCsPOyaZ7bCRVyyVVu3SLj0gjJDb5spSa++BO+vsA7K3nz2tf4yGjpLSTGIut/P
	8t1QZ4cMzhAUyxdpRu18mOfGL2CW23VV5J4I1EkFG2JVL1rFUdiDAEgu+gEPemwipsIRAPdPg4G6V
	iNgv83jAk5Leg9MKevdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp4w-00000001eje-32mM;
	Tue, 26 May 2026 10:32:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRp4t-00000001eiy-2qb4
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:32:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3404843CF3;
	Tue, 26 May 2026 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44551F000E9;
	Tue, 26 May 2026 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791523;
	bh=Xi35KhtFKZU3jjrnJmZS3TFAyAUXL58eOylSXncyoSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nyN08167ur+qEBWBettVH20Z8aVLFn/4IaVu0rWywoMYRtxwu6q3wTKGENwaqA3Xu
	 Sfx1KWKUWXSkkS57VM2hPZAtQ5LdmHlB94s+u5tfkREJTW4e3cf05PKytkBK+Bhagt
	 V3DMOdmKc3QFuM7F2h9+R1mGjh2FuSneJafghXT4eMiTSEJWTsmemhZKVAT+wJW2em
	 SCfJkrWhtspM3C7lxx+FQmcY6wacKXb85cRzP79RogMcwnkbQPxdJgM+TFu8BIG17w
	 RC1bK6NfOWKQYyMPN3CMPgvfq/iFQGNazEginyCA9Dg4sh3su8ZnRIjdA3vJOk855x
	 gqTsYnybnrJmQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean
 Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
	(Miquel Raynal's message of "Thu, 07 May 2026 18:46:44 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
Date: Tue, 26 May 2026 12:31:58 +0200
Message-ID: <2vxzcxyi5un5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_033203_734295_2DEAFB5C 
X-CRM114-Status: GOOD (  12.31  )
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

On Thu, May 07 2026, Miquel Raynal wrote:

> Not all chips implement the 4BAIT table which typically indicates the
> program capability, while many of them do implement the relevant SFDP
> parts indicating the read capabilities. In such a situation, programs
> can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
> 1-4-4). For the reads to work in such condition, the QE bit must be set.
> In case we later use the spi_nor_write_16bit_sr_and_check() helper with
> a chip with such configuration, the QE bit would get incorrectly
> cleared.
>
> Make sure this doesn't happen by keeping the QE bit under a simpler
> condition:
> - the quad enable hook is there (no change)
> - and at least one of the two protocols is based on quad I/O cycles
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
