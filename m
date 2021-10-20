Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC1C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EE961374
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5EE961374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOFbufOu46JRRm7o1mRpztKigQPHys49xSt9+hpLBIk=; b=N1D7EhJGibxR8A
	GnybRquwEUBE5LCVVLztbzWo8uQrgSKT+M4aItyC/kC9WaXyl43HWOlrOk1z9gMuNUvsJ39OiLezD
	HcRM4MHx6i2quJ58Wg3atEL16LH6/ISoYxFJXVF4uE2loKgVsSL44jQMJk7HlAiT4zjYvQ5UyywKZ
	irLR+In+2sFLFKH4WNcYOTGVtgRiaLwLYu/DYsHT1fEX0pIa9xWIxBFZIaCk2q6UZq8+dK9CfQaxF
	CszL6a6HP1opKzn0FvSI0d4QHoB0o4XiVJksxS4BOjxpssaMU63+NUmAN37wfuY+X2M3+QA8nI/EF
	pecJBT6aiQZrFGNPSQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7Tf-003v1a-6Y; Wed, 20 Oct 2021 09:01:39 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7Tc-003v0M-BX
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 09:01:37 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id AC7E2C7ED6;
 Wed, 20 Oct 2021 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634720493; bh=0TDUefSKSTAfFL2Uv7HVije8SZ09HaYEgndQJR2AUrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=K0bTCdHvzy6hsDfRq+p0+IVzDX/bc9Ahv6jiOoF8VX/VmiDA127VpWk/htZopBl6p
 HEAgV1o7w5NEgg7bVOLqwIOS9H7icU952jvUa+4/s0fkcLYg0WsnpYBhBJS3bIMs1u
 WUuZsKgXdvwToj3gPB56QZfJ+oMElYjex3J14NtGnbgfm11sueeSU3DJm3AzX4StIF
 b/30EEWmHwK3i1dTsR8YAS9m5ES4+QUIyxxtjXo+I1TohRjce8hUxDRS+WKOYU8JLh
 Z93NyuC/b6bEoGKtHHaDAylQy0P9oDo+mcSWB048RwjSpsxdiPDi7/IC0pRFAS7elM
 IZP2Fw42+AXsw==
Date: Wed, 20 Oct 2021 11:01:32 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: nand_bbt: hide suspend/resume hooks
 while scanning bbt
Message-ID: <20211020090132.zuxojg6cnwsm4dwg@skn-laptop>
References: <20211020084534.2472305-1-sean@geanix.com>
 <20211020084534.2472305-2-sean@geanix.com>
 <20211020105326.0dca864a@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020105326.0dca864a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_020136_573362_E77C64FE 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, Oct 20, 2021 at 10:53:26AM +0200, Boris Brezillon wrote:
> On Wed, 20 Oct 2021 10:45:31 +0200
> Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > The BBT scan logic use the MTD helpers before the MTD layer had a
> > chance to initialize the device, and that leads to issues when
> > accessing the uninitialized suspend lock. Let's temporarily set the
> > suspend/resume hooks to NULL to skip the lock acquire/release step.
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Tested-by: Sean Nyekjaer <sean@geanix.com>
> 
> It's missing our Signed-off-by tags.
> 

Patch is from you ;)
If you are okay with it, I will add your Signed-off-by tag.

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
