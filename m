Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A03C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BDB61074
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 12:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44BDB61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l39OAZ9bVJQ+31vSHn0kOZKx3NWWBRN+prwYE1mjGs=; b=DQrtjZ7bbPFOwI
	Vx1FyBY8OO1KpkBtm56jdbOtGE+U65mrkYZd+yhciv7kqMWDIoLKIZcHy80Viiy9r14NhyveRudIS
	K3aCHU/328r2bebFPGUr7AzODh8IKlJ0snAykiV8yKyo+UZXu5gtyWZNv3pJkgIZKIDYfwYZpwLNK
	KwWz54Fh1ekZae1loMzy+1cc14cEArQgNKHcs56lquvVJors1bEkzO5tcA86TlchfWah6rnIvnEFy
	qYHbKQlapM3D5r9hdVQ8WtSQKGw5YoNL1Ph2leBHcKNZN2jA6tI/u6q75miewah8lubdoJw9gShgN
	lzGoS/ajSv1cHKEQgOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAFm-004Old-2Y; Wed, 20 Oct 2021 11:59:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAFi-004OkT-SC
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 11:59:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19KBxHvM090400;
 Wed, 20 Oct 2021 06:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1634731157;
 bh=rlMVQBrt/BXGNUndMGSC4aInghxlxwn1R/F4gxYaNVM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=vivVc90Wv/k59eXzuyZWzXoAvqlwz2HRSAVKXwXFlVZlAEisxG7+EScOERqj8wNWN
 0dYLa/HtBTgAydnr52ILPxFkZiUHMXNAyQOrajuC3CQPTMjMJIqWnwZpJVIohn6WWo
 CpfyuJqn+r7Lrw0B7raQ7SUN6lN5EXNiaGnRnCwE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19KBxHmk062374
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Oct 2021 06:59:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 06:59:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 06:59:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19KBxGJe025515;
 Wed, 20 Oct 2021 06:59:16 -0500
Date: Wed, 20 Oct 2021 17:29:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>, Lee Jones
 <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Lima
 <mauro.lima@eclypsium.com>, Alexander Sverdlin
 <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211020115913.uzo3ogkmrltnb26y@ti.com>
References: <20211013114432.31352-1-mika.westerberg@linux.intel.com>
 <20211013114432.31352-3-mika.westerberg@linux.intel.com>
 <20211020114153.0f99c5df@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020114153.0f99c5df@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_045927_022669_639B89DD 
X-CRM114-Status: GOOD (  22.60  )
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

On 20/10/21 11:41AM, Boris Brezillon wrote:
> On Wed, 13 Oct 2021 14:44:31 +0300
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> 
> > The preferred way to implement SPI-NOR controller drivers is through SPI
> > subsubsystem utilizing the SPI MEM core functions. This converts the
> > Intel SPI flash controller driver over the SPI MEM by moving the driver
> > from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> > SPI MEM functions. The driver name will be changed from intel-spi to
> > spi-intel to match the convention used in the SPI subsystem.
> > 
> 
> I skimmed over the driver changes, and I'm skeptical about this "let's
> convert all spi-nor controller drivers into spi-mem drivers even if
> they don't fit the spi-mem model" strategy. Clearly, the intel
> controller is much more limited than any other spi-mem controller (I
> mean feature-wise not perf-wise of course). The fact that you have to
> check the opcode to decide whether the operation is supported or not,
> or the way you deduce when to issue an erase vs a regular read/write is
> kind of hack-ish. Not saying we shouldn't support this case in spi-mem,
> but it should at least be done in a more controlled way. Maybe with an
> explicit array of supported spi_mem operations, and driver specific
> hooks for each of these operations so anything falling outside is
> clearly identified and rejected (we have this sort of things in the raw
> NAND framework).

I am curious about how we can solve this. Any pointers to 
functions/drivers in raw NAND framework that follow this model?

[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
