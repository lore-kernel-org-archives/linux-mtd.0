Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F9C02198
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qN64QtNcKVNbQOuqqs6tLygHprEs9kP0upKE6avaRuw=; b=i0CuWx5aB5do0B
	5sBoyWSJnkcmEgbZQAyJjxD74LwwqacSR/VonMhwniSDgOrGPYTSlUepKbPJZZACdoHFae7cdUt26
	dtQ4ZsqfgMOmSRONzowkL0FX8nrdNEF8loy3eeZ33kmJQ3CfA2OB5/kvgIzdk/NJFAj47vH0xpU/q
	ZDWWFtRkXFi3asuPDKy1/pWoiY+7Ylt+Jpvud7R4arsbuWIORWNwA2AyR5qXuMePtaJRi+TTARk9O
	Cvawd+DjqPzThfI9c7c2qOIodXDIDjTjFtdqHUVWRXuDIutU+HHaktVsC+NipuRp7MVQmaj28XUef
	xmfyVcdJwbj/OQ9stdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyC1-0000000FS0s-0muz;
	Fri, 14 Feb 2025 16:05:29 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyBy-0000000FRz2-2wV2
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 16:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739549127; x=1771085127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r2u7W0MP5GCugTpInTOkN+AXnqjJ+l8XpMdAnxb/cYM=;
  b=aEJRa62yaYJ94yMNeFKXP+xGuxzoLK46noxM9++WIhnXo7OuwwG9pTfB
   oU9GdNwg4qA35tV0BDdQIVG2QRhLQLROoxUtAT7KTRKDCA79m6Yd9XiSv
   ICrxHa1dm5Sww9IkgrzTCdUoE59ZuWygK1bXVPWUCXPAtVRA39zp8Ecd/
   I=;
X-IronPort-AV: E=Sophos;i="6.13,286,1732579200"; 
   d="scan'208";a="377423410"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 16:04:21 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:64438]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.97:2525] with esmtp (Farcaster)
 id 862ebbe9-0501-4a2c-81c1-c6dd5597162e; Fri, 14 Feb 2025 16:04:20 +0000 (UTC)
X-Farcaster-Flow-ID: 862ebbe9-0501-4a2c-81c1-c6dd5597162e
Received: from EX19D004UWA001.ant.amazon.com (10.13.138.232) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 14 Feb 2025 16:04:20 +0000
Received: from EX19MTAUWC002.ant.amazon.com (10.250.64.143) by
 EX19D004UWA001.ant.amazon.com (10.13.138.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 14 Feb 2025 16:04:20 +0000
Received: from email-imr-corp-prod-pdx-all-2b-f5cd2367.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Fri, 14 Feb 2025 16:04:20 +0000
Received: from dev-dsk-herroash-1a-77c9f4e7.us-east-1.amazon.com (dev-dsk-herroash-1a-77c9f4e7.us-east-1.amazon.com [10.200.198.196])
	by email-imr-corp-prod-pdx-all-2b-f5cd2367.us-west-2.amazon.com (Postfix) with ESMTPS id CCBBDC0351;
	Fri, 14 Feb 2025 16:04:19 +0000 (UTC)
From: Ashley Herron <herroash@amazon.com>
To: <richard@nod.at>
CC: <alex@nextthing.co>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <herroash@amazon.com>, <rdlee@amazon.com>
Subject: Re: [RFC] UBI statistics and bitrot interface
Date: Fri, 14 Feb 2025 16:04:19 +0000
Message-ID: <20250214160419.18583-1-herroash@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at>
References: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_080526_784115_00FB3DE6 
X-CRM114-Status: GOOD (  11.75  )
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

> IIRC, this patches have been part of our failed approach to support MLC
> NAND. One part was exposing a more or less sophisticated interface
> to userspace such that a NAND flash specific daemon can foster the chip.
>
>
> After some iterations, ubihealthd was born. But it does not use a statistics
> interface.

Unfortunately ubihealthd wouldn't fit what we need.

>
> What kind of metrics are you looking for?
> Maybe some eBPF/tracing magic will already serve you enough data points?

The goal is to capture similar data as eMMC and UFS devices report regarding
total bytes written to the block device. So I want to capture total (payload)
bytes written by callers to the UBI layer, not including UBI overhead (headers,
wear leveling). This is for the purpose of monitoring and identifying any
pattern of excessive writing on devices in operation that may effect its
lifetime. We may want to monitor total writes to a UBI device over a 24 hour
periods or less, so only using erase counter monitoring doesn't give us the
level of monitoring we require. We write to some UBI volumes using UBIFS
and others using UBI IO directly. I was planning to add (or request you add) a
wc (write count) variable to the current struct with ec and rc in this patchset.

Cheers,
Ashley

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
