Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgjd5xwmf6NEwbM25MX1eQbuQZloGjvtVkTI28WrRi8=; b=Ndn01PTWwW+dZe
	AGN8NGb34s6G+TOf31w8rW89CBKgJ8fO9YVi04nLzaxN7hwRl6T74Lgsj6gDLsC99jTdZfh2/TaPY
	OUAq7R/qR0/ihu6/TRn9O9RvTgJrDcDmstTDXGPNWIeQuIsxondMi3liCrX2gtvE8b3zwayjQm+l8
	PriI9shjH0giP49hmW7Ki6iMkjEjgWXbwTuVsv7NLPmGx7CL5znN9VCDKEI26qSDtlsqBBAFLYnM2
	0SoX7zaw+tPZanxkg3fu402vCwL3u4WnJPXXSFvUkbPkv0qM6th05qf0bSe/rRYb6U37e9t2ackoS
	+z+cb3e6XVWZr8QweqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRcE-00H8KE-OB; Mon, 18 Apr 2022 13:40:30 +0000
Received: from mail.fmat.eu ([94.16.121.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRU4-00H4aO-Dj
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 13:32:07 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id 34B75E004D;
 Mon, 18 Apr 2022 15:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1650288721;
 bh=yyDpuAxqFQzKS8gAytHrFa3S+bup/gkPCYv8PPeubA4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vr5e5VowiOGIkhvbl9AsY0YGeDezFs0Gvz+c/jEHw3O4abzmlEIKGNZxSiuDaYhw2
 A6khmvZwJAkhrnT2tPV79N2XFpcx7hHnoe/HZAfS95uDd5svlC4oedb0/7yt2mmrFJ
 kkWgekaCz5UximAHFPkUWuFCj0O2U0TTdl9R8A3v+FlYmEF1aRQGNKKMWyf8De+O9C
 X5ZV8QcFyCcupvUuHbNxzeMk3TsnF5mtB+pDqAwGIYyiFOXBmDbCvjhH7qENPvo43T
 DgUEHnmx29xaLhjz1ogWjuh4Aav3MHJQRvaSmUq+aNJshTRsosR+RLBLnD8KU55Psa
 ssrcSiQDdQz/Q==
Message-ID: <9192660d-53ed-770d-eb15-f369117e8be9@matouschek.org>
Date: Mon, 18 Apr 2022 15:32:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spinand: Add support for XTX XT26G0xA
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408161904.94383-1-felix@matouschek.org>
 <20220411092311.3f0b97b3@xps13>
 <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
 <20220411220310.14e2da32@xps13>
 <c49e86c8-5433-343f-d41f-ce6e9dcdf75b@matouschek.org>
 <20220413175605.758ca842@xps13>
From: Felix Matouschek <felix@matouschek.org>
In-Reply-To: <20220413175605.758ca842@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_063204_688113_204FB29B 
X-CRM114-Status: UNSURE (   8.37  )
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

Hi Miquel,

Am 13.04.22 um 17:56 schrieb Miquel Raynal:
>> I noticed that there are actually some possible values for the ECC bits in the 
>> status register, that are not covered by the switch case. According to the
>> data-sheet they should not happen, but would it be wise to catch them anyways?
>> Maybe if something goes wrong?
> 
> Yes of course, that was my advice in the first place :)

Pardon my stupidity, I sent a v3. :)

Thank you,
Felix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
