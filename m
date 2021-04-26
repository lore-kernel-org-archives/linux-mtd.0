Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE78C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 17:41:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7862E613B2
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 17:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7862E613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z7oYazE2jyVuaGfXHRpoRWywxjacBhE/38ZMv46Uid0=; b=NzDa750uQLkAM/HLZKHPiYi9r
	gI/L3a64H9MSRsU59SQdycBWzOvLl8tk4Gtovh6jPsvKQM16yXMMTt9U1JeVv9tbI9iVRjHVbwJGL
	1HWZzPBKwGkOdbcNN8Q7QcgKdAySq6wn1QHngaLFbxh6YBfA2X4cX0n2Ac/X8LWX9YwZhv2ZIgM/Q
	FKJR54oMyRfk9BN1QfRMwlsZznwR38canSATbx9FHwnroxMTDfDSh/1l7JPSK2BYUER/B+1ttpSPy
	SeNP4b3q/KgmRKNTXg78GqM1KJw0JYzy5Cr8HVnAQHdRPBeDqIXofzD/MMOH0QWAFdHli+8iG+R7r
	p0jlnbyXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5Da-008Bq4-KE; Mon, 26 Apr 2021 17:40:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5DL-008BnR-5i; Mon, 26 Apr 2021 17:40:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13QHdceX127088;
 Mon, 26 Apr 2021 12:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1619458778;
 bh=7Q9DDfAP0kb5SVHmvxLJjeJZszWfE6DMCeCuhgLXXUE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tfabWYY35jAV4kpab9Eai+2VgkyqR+jQZGfz5CQbHsJFy/MNbQ7Mwhanuri2SXlxx
 Q6X80MPHdW0mAWXE0aUXbg2FyenLY3e04ylbWZlhzS+d4NSGG999MbXdbUSBFTUAoN
 FcGrMsbKfUvfAyKCp9UcUPwpx8ZIBUFdRYz0VhOE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13QHdbkF128085
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Apr 2021 12:39:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 26
 Apr 2021 12:39:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 26 Apr 2021 12:39:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13QHdavH085058;
 Mon, 26 Apr 2021 12:39:37 -0500
Date: Mon, 26 Apr 2021 23:09:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <patrice.chotard@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210426173934.zigt6b66ieuzuchy@ti.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426165118.GH4590@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_184007_649068_969BB2BA 
X-CRM114-Status: GOOD (  30.11  )
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

On 26/04/21 05:51PM, Mark Brown wrote:
> On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:
> > On 26/04/21 04:39PM, patrice.chotard@foss.st.com wrote:
> 
> > > + * spi_mem_poll_status() - Poll memory device status
> > > + * @mem: SPI memory device
> > > + * @op: the memory operation to execute
> > > + * @mask: status bitmask to ckeck
> > > + * @match: status expected value
> 
> > Technically, (status & mask) expected value. Dunno if that is obvious 
> > enough to not spell out explicitly.
> 
> Is it possible there's some situation where you're waiting for some bits
> to clear as well?

Yes. In fact, that is the more common situation. Both SPI NOR 
(spi_nor_sr_ready()) and SPI NAND (spinand_wait()) need to wait for the 
"busy" bit to be cleared.

AFAICT this API is supposed to check for (status & mask) == (match & 
mask) so it should be able to handle both polarities for the bits being 
polled.

> 
> > > +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);
> 
> I'm not sure I like this name since it makes me think the driver is
> going to poll when really it's offloaded to the hardware, but I can't
> think of any better ideas either and it *is* what the hardware is going
> to be doing so meh.
> 
> > I wonder if it is better to let spi-mem core take care of the timeout 
> > part. On one hand it reduces code duplication on the driver side a 
> > little bit. Plus it makes sure drivers don't mess anything up with bad 
> > (or no) handling of the timeout. But on the other hand the interface 
> > becomes a bit awkward since you'd have to pass a struct completion 
> > around, and it isn't something particularly hard to get right either. 
> > What do you think?
> 
> We already have the core handling other timeouts.  We don't pass around
> completions but rather have an API function that the driver has to call
> when the operation completes, a similar pattern might work here.  Part
> of the thing with those APIs which I'm missing here is that this will
> just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
> think it would be cleaner if this API were similar and the core dealt
> with doing the delay/poll on the CPU.  That way the users don't need to
> repeat the handling for the offload/non-offload cases.

Makes sense to me.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
