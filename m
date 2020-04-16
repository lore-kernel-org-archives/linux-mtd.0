Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE867C2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 11:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF10F21D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 11:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odnZXd+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF10F21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNnvERRk/T9nWwgzesid93fsqjA8vdJCnhCSpbfbJwA=; b=odnZXd+XNtptPi
	WSKxk/Ri+XCwnbCyVIOUirdRnzUlDz+QBnqUvq6lsdzJnUFPoLqu2sH8mSLeRl/AIHOP/Zk6RG7oJ
	6/6wOTHrSUIbimisBJqk2iyckoVyYf4jQElEAxaMWQ+6gibiYzBnnAEWhQvcMgcqKNbvFTUHxXRit
	l7KQ1qwoc8vf8DnF0nEMA4cXRO6k9mO2tmTP4cMZ3SWMRWN7oJB5/tZEezxuYUgDuDf5vMFBM/FvM
	PAVaw+pOGUJk12NtWF9yCZ92HO5rdao+shkBGUIuD9mjrbVkVrh8U55kz5RFZbv4W6YPepOuxmnds
	vExBhJ6+mTlzNn00Ai+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP2WT-0005TD-Du; Thu, 16 Apr 2020 11:17:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP2WQ-0005Sl-OL
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 11:17:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 263642A205D;
 Thu, 16 Apr 2020 12:17:28 +0100 (BST)
Date: Thu, 16 Apr 2020 13:17:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200416131725.51259573@collabora.com>
In-Reply-To: <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_041730_921147_6C8E5EE8 
X-CRM114-Status: GOOD (  11.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 16 Apr 2020 18:40:53 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> >>> we'll be happy to have one more of the existing driver converted to  
> >>> ->exec_op() ;-).  
> >> I have completely adapted to ->exec_op() hook up to replace the legacy
> >> call-back.  
> > I suspect porting what you've done to the xway driver shouldn't be too
> > complicated.  
> Not ported from xway_nand.c driver , we have developed from the scratch 
> to make it work on
> Intel LGM SoC , it's new x86 ATOM based SoC, IP itself completely 
> different and most of the registers won't match.
> if we port then it would be ugly and also what are the problem may occur 
> we do not know.

Sorry but IMO they look similar enough to try to merge them.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
