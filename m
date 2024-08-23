Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A5C5321E
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkAjMK3ODk48HHreDQnpECX4u3TBx9Qe0CKNMkJx/js=; b=ErP0j4pMAlGIoz
	x4Asi1G7EnckL8qmML/VF+/Z0BZdhBajQSK8qI/mr/3Sg2JnWTO7qIqg2NdUIVKSBXcrAJmZPzu00
	jQe4hsCAxAAVHiDfRT2XxTEDB8TX6YiHWslyhtLLrZReY7cOLwscCYxvjgsxw1LuEUAEhOL4TzUF9
	BUfCLNUlcWPks54MNHvtis8w+f2kn6nPMhLCUXR/gRC2XiIyfKUh9j0thjkqhA0OuvHb/5m6IT9u+
	6s6orALWGcvOdSfxEMLFlSjHm9rEgbwX/B4pRK8gXsN46mWD60q4WQWjH8O6okF5xGnnFn+6b5sSB
	SNznLytzhl7PMx/XMt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTiD-0000000Gkh5-0Oks;
	Fri, 23 Aug 2024 12:48:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTiB-0000000Gkfk-0fcE
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 12:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2518E612B9;
	Fri, 23 Aug 2024 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A684C4AF0E;
	Fri, 23 Aug 2024 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724417293;
	bh=qd76aVXXa9PH3B0Qr1qMmogqTt5TqPgH6h/3Z5BF1Rc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hrc/yKoOuLKU2GS2LAnnQyfKGWImpJ6Bygq9qdi6wpaaJEPMD3cCXyT1U3Gascgw9
	 bAr5nayzDDg5izVtAz83Ql/m3XfpE6y4aPBuseh3fvl2Q/h1ov0ITX7BRGI9IlGMAB
	 IHXFtVoomfK3rhVNAjNuWw4wZJ8ASqi6JPGZmVhXSqWwsDD0JB25igTKNqZ8F93HM1
	 oz3CJ1qS4386KZFctDyqzHH0yO+gFAwLs0z2uGHAGNYuMHYqVlR5/bT+QHR+Az+VrH
	 n3IfiJ9kQ3F2o0kmy1yyD3mZsVovU7W2ZCPVBvfLt6RpuxNwweA0iBfeUlFvf6GATe
	 vLqAyShUXaIbw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Julien Su <juliensu@mxic.com.tw>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/9] mtd: nand: Rename the NAND IO iteration helper
In-Reply-To: <20240821162528.218292-2-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Wed, 21 Aug 2024 18:25:20 +0200")
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
	<20240821162528.218292-2-miquel.raynal@bootlin.com>
Date: Fri, 23 Aug 2024 14:48:11 +0200
Message-ID: <mafs0y14nv20k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_054815_270249_75A18A08 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, Aug 21 2024, Miquel Raynal wrote:

> Soon a helper for iterating over blocks will be needed (for continuous
> read purposes). In order to clarify the intend of this helper, let's
> rename it with the "page" wording inside.
>
> While at it, improve the doc and fix a typo.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
