Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B796CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 12:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E2AC60EBB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 12:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E2AC60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=DtsRLhyWQ2b1j6
	GvqmpOMKzHnAPbyhvqC1vakCqFSfgPnE3ZosZB5ACnqk1s+7gvFKoeBy9Q+/vrQkakqlmmb0l/UDU
	AAZJtmFP2cw/swV2NWlmKWfRx3KJGlt3dZAXdI1PWkcUTg6KbkdeQbB/XTs7kXM/AvZCxaJqkHRcn
	pkLffzPWXkQ1ljipOvSx01hr3ZJBKXzO8DF3tux3sSYDGxDespFLvU5FqaRVip6/eQDFbF/hiOxPH
	lz6GY7NY5Y51FgzvyWrGcAFsMVnMtAA/Tub1UHUjq83MqAXMfKMA9UQjlQDNkgVnadP9OX5cMI1IV
	rwkWcjUt+7vL0AreXV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1madYA-00GceF-Eq; Wed, 13 Oct 2021 12:40:02 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1macJS-00GH2J-AP
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 11:20:48 +0000
Date: Wed, 13 Oct 2021 11:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1634124041;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fdAuaX4PEhMuxk7bjlErjg+op/Y19MFOvRqd6AaoJc7Mv8jEXgV1Bn9PPoFrtaQ+X
 LgknmLeq6lx/RX6Uhx91gF8L2KCJULUJx9HCxZu0K/iOVQGIGcGzdFW/gWJkvV/Zbh
 0eMnzSe5KCEk2R8gXTIwvU5hEJsWdWbx85kb8z2LNmSv6YempPNTwd92S10TbdJPVB
 5rJ0OfAsrHlZbeoGIXXJOtWUx+m4Lzch/exGxNxuRV5ujUvnkpb5gBTrMix3apnAVR
 JRc2wrTA014F1gJmtbUw5PZRAvLGmOYGfpDjYcGqMsVedH9HLalPwZUZewpX8URjAu
 cLAveYsUhLg8g==
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH mtd-utils] mtd-tests: Read and write pages during speed
 tests
Message-ID: <fdad1128-af1b-3024-c3dc-09bd2c05cd4e@sigma-star.at>
In-Reply-To: <308700286.68659.1634123563780.JavaMail.zimbra@nod.at>
References: <20211013100807.306920-1-miquel.raynal@bootlin.com>
 <308700286.68659.1634123563780.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_042047_154768_FC0C5BBB 
X-CRM114-Status: UNSURE (   2.35  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
