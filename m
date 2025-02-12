Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BCBC02198
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXK4O3SLLXqz5aeaWWBdKVWx/RTLuh0U591n6JqqHI0=; b=R0pcBIfGP6fxim
	IzTLABEBEmeH11J5wj/nl+79PioB5Y9pznBRa6MAbT2xPeQfN2jB0wz87eUf1dCtchTnwNBzC0Wda
	8XFrH3hyYPkcILNKY0YBUD8lqPy6pKuUAMDopzZQICPSR0nhCpbomoRi+5RIyYBDDFHZirrLFEgCI
	eJyU9BZAW+gdM8T4jNidRfiU68gXUbW9kUIJ4b6fOs/7AFqk+O4iU+Mbe+oCcCtaiY3YiaNEqxITf
	xAbzktxlWmYnoVTYUw1sWQZ2hJxl32bXH3QTrec9u+El1qazC7zYBOceV6nxEGkT3hKC00lGDyQPv
	/oBrJf5PLGF95+jpX2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJeD-00000008ouO-4Bjk;
	Wed, 12 Feb 2025 20:47:54 +0000
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJdD-00000008oo6-31OM
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 20:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739393212; x=1770929212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYpSuwJOMMEcISl6VpYEysALAlzHTaGPNzJjXpfbkEA=;
  b=lpAxVVv1LEMSbl8hTWP0A1Sqn75WGlzf+b7iWu6i/CKgvZQ0nJ4g8Tkw
   hoCxox8Lv9ja2+4w+6gHpTS7Bu/A4/w/ywa5okJVR3ZhuWK9tfg1MjB7y
   IZrrJBBlRi92ir5qYNRtCTMmE51YbIze7fLM4ZO+XfXWx+51vyhANO36D
   U=;
X-IronPort-AV: E=Sophos;i="6.13,281,1732579200"; 
   d="scan'208";a="471654665"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 20:46:48 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:56745]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.133:2525] with esmtp (Farcaster)
 id d858c3ae-2a15-4763-aee5-c135d2b39cb5; Wed, 12 Feb 2025 20:46:47 +0000 (UTC)
X-Farcaster-Flow-ID: d858c3ae-2a15-4763-aee5-c135d2b39cb5
Received: from EX19D004UWB002.ant.amazon.com (10.13.138.45) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 20:46:47 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D004UWB002.ant.amazon.com (10.13.138.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 12 Feb 2025 20:46:47 +0000
Received: from email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Wed, 12 Feb 2025 20:46:47 +0000
Received: from dev-dsk-herroash-1a-77c9f4e7.us-east-1.amazon.com (dev-dsk-herroash-1a-77c9f4e7.us-east-1.amazon.com [10.200.198.196])
	by email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com (Postfix) with ESMTPS id D2DF9A0078;
	Wed, 12 Feb 2025 20:46:46 +0000 (UTC)
From: Ashley Herron <herroash@amazon.com>
To: <richard@nod.at>
CC: <alex@nextthing.co>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <herroash@amazon.com>, <rdlee@amazon.com>
Subject: Re: [RFC] UBI statistics and bitrot interface
Date: Wed, 12 Feb 2025 20:46:46 +0000
Message-ID: <20250212204646.4400-1-herroash@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <1446764217-15021-1-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_124651_909175_4D0CEEEE 
X-CRM114-Status: GOOD (  10.53  )
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

> This series adds new ioctl()s to UBI such that userspace can query
> read/erase counters and trigger re-reads/scrubbing of PEBs.
> Especially for MLC NAND flash where read disturb and data retention
> is a big topic this interface can be used by applications to foster the NAND.
> Parallel to this series at patch series against mtd-utils is sent that
> implements a ubihealthd which makes use of that interface.


> [PATCH 1/5] UBI: Introduce prepare_erase_work()
> [PATCH 2/5] UBI: Introduce in_pq()
Equivalent changes present, can be dropped.
> [PATCH 3/5] UBI: Expose the bitrot interface
Equivalent changes present, can be dropped.
> [PATCH 4/5] UBI: Add basic read counter support
> [PATCH 5/5] UBI: Expose UBI statistics interface

Hi Richard, I am wanting to add statistic metrics to UBI devices and my
searching for existing solutions brought me to this stale patch set.
Is there a reason the patchset went stale other than low priority to get it
merged and it was forgotten? And would you consider reviving it if you don't
see any concerns?
Thanks, Ashley

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
