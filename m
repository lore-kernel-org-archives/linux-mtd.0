Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61B9C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8D2205CB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 17:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1CgEYu8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8D2205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X21IelYyIfFU/BkD1ZOBWWOKVl5vtiwCx/980z0JXNg=; b=E1CgEYu87rG1+U
	4Yvf7XvcVL1UZBDTF+g4dSooTHozAKGzVAMf9HienEg4RlOM842g2TAsm7lSeGOga5CHZaJETCiPT
	T+ESlsa+h8IcqQU0LQ/swwXI3/yDtdSaHad+QBtbHQGgob261SLhTmaVCGQfJrcG0d6bVyOREohCM
	/ACDdk81k++IltO41+caz7atjQjCk7PO0L88Zg/hH5Tac8Wywdoov9vlv6Lx+kORBVTp0U8aND3/8
	QsXU6NKfpDALUepclRRVUpSNKJp/CnVMY9f6f0IGf5Ciwo89jQ+IQIhNm2HR3eV6l3vSiI5gkqKet
	jq5gUr8T2Bzo5JDLahYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYupI-0006W4-7s; Wed, 13 May 2020 17:05:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYup9-0006N4-LG; Wed, 13 May 2020 17:05:41 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29FCB2A28FB;
 Wed, 13 May 2020 18:05:36 +0100 (BST)
Date: Wed, 13 May 2020 19:05:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/2] ARM: pxa: remove Compulab pxa2xx boards
Message-ID: <20200513190533.2b737434@collabora.com>
In-Reply-To: <20200513170132.1446-1-robert.jarzmik@free.fr>
References: <20200513170132.1446-1-robert.jarzmik@free.fr>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_100539_826832_2899300E 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Mike Rapoport <mike@compulab.co.il>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 May 2020 19:01:31 +0200
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> As these boards have no more users nor testers, and patching them has
> become a burden, be that because of the PCI part or the MTD NAND
> support, let's remove them.

Thanks a lot for doing that.

> 
> The cm-x300 will for now remain and represent Compulab boards at its
> best in the PXA department.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
