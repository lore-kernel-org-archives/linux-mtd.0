Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F427C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4W5Ns8nT+xsCJzDLy02mTs+U1+eEon9rhxtwl0jeG5Q=; b=T2v6pZUS2SAKzF
	levigBiQwjyuWBmpCq6YmzziSd+SWHLsG1t5LLmHD6WfjquRU+oM3N+FD7pGP4vYwu9lgXXCeJJgP
	zu+jHxahFRGw1llNjIZVd+jAfGvSA7rRZ2g9Z3bx/b5Uxo4iZ9DLiaqOmAdE3QUfSPX8hJ6MmUJIw
	Zy6gEmb+Az0Ik8+Mklo1t3wsYQAANytOZItDnEQWPNWcumOcyxxRCLmHLtvxQJdsXhjYgp8xoFhpB
	4zy52Awo5yv/csnHPYg8biK81vcnF6nVuSuv/DTZJLTMu/U0jMR+Ww21uqq1h7PlWsDQ6ncTOwzUu
	S4PRNXd8FjagJZzViLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3Jz-004GLI-6j; Tue, 15 Feb 2022 19:17:07 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3Jv-004GJh-V3
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:17:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJH11m054157;
 Tue, 15 Feb 2022 13:17:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644952621;
 bh=6+4pNjB4kGYhVNFqBm0KwJ30sZDsMp6NZjQKle6vH58=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=s8lu9Cogqf4+4irS1uoqqLkePMbgism4OjNJJoYBycwZqR4D8apaJ4BX7/JW0nTep
 TIuy90ARiQFaPdzzhbXx9CCg9mFaJ1FSuenTSy4ogx/5WuYgMon8WYLqiLqPS15i6s
 4w7wXVLm7RCHb6Wd1Y+zSydcuF+blf1rcwCEjit0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJH0UW024912
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:17:01 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:17:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:17:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJGxwV023879;
 Tue, 15 Feb 2022 13:17:00 -0600
Date: Wed, 16 Feb 2022 00:46:59 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 09/14] mtd: spi-nor: micron-st: fix micron_st prefix
Message-ID: <20220215191659.cjcmoitewpcu3avk@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-10-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-10-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_111704_106351_F3BABDF8 
X-CRM114-Status: UNSURE (   5.85  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> The usual prefix is micron_st, so use that instead of st_micron.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
