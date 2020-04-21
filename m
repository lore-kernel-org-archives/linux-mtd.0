Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A9AC54FC9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55ECA2076C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGlp+aF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55ECA2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ylqyg7f1CXXRIM44EgIVZtjGTeBoHnDNz/aFnCy/7s=; b=fGlp+aF0rb110G
	pITzMTCtr6KDk1AQmB3v1ibyk7NwehzFTnrUOKCbHD1M+EnXo+x5Su2NrJ79kQuEaTzpRCmkeLPUG
	0qQRaolP48a8gUqd11PwbiYWJoRP4PD8KYoVD/IYfcKvqbWRlIiii0Uvt+2n8wsRrIUStFZ6T6PkJ
	wp1yLQjuDEj01XopJv1bcmHBVbrlWDyZMJCiwwAg+4x3WAP15sRfNI7dmatLWW2MpcVhBxVJA4YoY
	MyPlp9pINNDQOMcwGU755w84iZGlTcfRyyxqdwpv6BLu+DpdYqpovxERfNP8YzHAIXhj/FB2H7uY2
	pS06AAcsRnj8SYeV0Obg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnFr-0003i3-If; Tue, 21 Apr 2020 07:23:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnFo-0003gL-Nc
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 07:23:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 646582A004E;
 Tue, 21 Apr 2020 08:23:33 +0100 (BST)
Date: Tue, 21 Apr 2020 09:23:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200421092328.129308f6@collabora.com>
In-Reply-To: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_002336_895520_77491F38 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Pratyush who's working on a similar patchet [1].

Hello Mason,

On Tue, 21 Apr 2020 14:39:42 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> Hello,
> 
> This is repost of patchset from Boris Brezillon's
> [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].

I only quickly went through the patches you sent and saying it's a
repost of the RFC is a bit of a lie. You completely ignored the state
tracking I was trying to do to avoid leaving the flash in 8D mode when
suspending/resetting the board, and I think that part is crucial. If I
remember correctly, we already had this discussion so I must say I'm a
bit disappointed.

Can you sync with Pratyush? I think his series [1] is better in that it
tries to restore the flash in single-SPI mode before suspend (it's
missing the shutdown case, but that can be easily added I think). Of
course that'd be even better to have proper state tracking at the SPI
NOR level.

Regards,

Boris

[1]https://lkml.org/lkml/2020/3/13/659

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
