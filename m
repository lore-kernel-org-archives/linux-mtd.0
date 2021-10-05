Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B17C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 06:04:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591F160E98
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 06:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 591F160E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNnQUtTJNmuJLip1rRWQaAr9sJA2tjyMb/vUvuNGhFg=; b=nSIXwr4Ig42NHc
	rcNBhKScBPqNPsIx955jziPm24L5v7ZkNSqdBaZkoeNXamVaBM6DVVJuyMqtdCVdOUdUTkuGgW5kf
	p4cd7sn010sx5mBsuIWmqbfaXypz/BNst+pRG2yWhSbv+BeW78vWXi/go9ZQTtcoy9RHkiqRlikn4
	cWCEiwAufUjXXcrrsDx7ovdGFeIimdWbc1dl4YkuBt/ZyxZkFFe+kt0P3C2jKAiGzTc2BDmCQQZG2
	bFjGHZzWLnepZ/Fa52nJj57XF3ZDkjidfsQhMrP3lWDFLEFwR4YdndSJf+dwSu0Zlvtw7pemWUn1u
	jcB7g83YUjXeDPgog6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXdXi-00945Y-Su; Tue, 05 Oct 2021 06:03:10 +0000
Received: from mailout03.rmx.de ([94.199.88.101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXdXc-00941n-1o
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 06:03:06 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout03.rmx.de (Postfix) with ESMTPS id 4HNn7N371bzlmSN;
 Tue,  5 Oct 2021 08:02:56 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HNn7H05Vhz30jm;
 Tue,  5 Oct 2021 08:02:51 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.17) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 5 Oct
 2021 08:02:50 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
CC: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 <linux-mtd@lists.infradead.org>, Greg Ungerer <gerg@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Tue, 5 Oct 2021 08:02:50 +0200
Message-ID: <2229542.ElGaqSPkdT@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211004160620.3guajv5vvtfjrl7c@umbrella>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211004173351.36a66ccb@xps13> <20211004160620.3guajv5vvtfjrl7c@umbrella>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.17]
X-RMX-ID: 20211005-080251-XscPVFVMWdhh-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_230304_302005_AC558AF2 
X-CRM114-Status: UNSURE (   9.40  )
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

On Monday, 4 October 2021, 18:06:20 CEST, Han Xu wrote:
> 
> Could you please try to add clock dis/enable when setting clock rate, in case
> clock glitches.
> 
> clk_disable_unprepare(r->clock[0]);
> clk_set_rate(r->clock[0], hw->clk_rate);
> clk_prepare_enable(r->clock[0]);
> 
This looks promising! Last night I had a successful test run with more than 
600 reboots! The test only stopped because my network was disturbed by the
daily backup run...

I'll do further tests within the next 24 hours.

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
