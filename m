Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B89AC47089
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qln18XFGpmUXB6j3U0t+jWabsjct1Gr9HQ3MFgDHGA=; b=WVv4Bh3a6ZGpOGDAFkEu1mgPFb
	6oPbBu3MbZ75h1Okd+hPXZMOyW8u92Hov28oqZaLTu1Ua32hyp5W8AIDB9xR9/9yqWmeINGXOZ2W6
	cK3t/p78pxPHO4iD3fHIWNgQ9hcjXiVN/cX3H/ElqN0TbnkEBYXDZxjf6tS9xQYPbC5eUPizw3JCu
	1cXvStfbNTaMeweVIOJ7R8nzBvqneqp/SZ/PtmngNN3XId0NTb1MNdcyKoKgKmXrcYTjjbRD1NwY3
	2R6/o1wQkEK9nOMRbq80uLC/K9W5EZXuIT42+1hFeWP1mbFxt6tilUp5BF1rlVIZzrlPs9jPFyoWj
	ITk0bxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17j5-00H1CN-3n; Fri, 02 Dec 2022 15:13:19 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17j2-00H1AZ-Cm
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 15:13:17 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8EE0F88;
	Fri,  2 Dec 2022 16:13:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669993991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMd+8gwhXm0Fts7QCJ/QK2hfDZAHqyWO5aLUxQbiTRQ=;
	b=J1Wzk2PgyZvCZMvCymQSd0PjvrBIyptWHSY5KUv2QVIy5BPV/31hQyu/PJmEnXeoWY+FGv
	pUmGHK0i1OuxihbFfe9D62U4Szf9XTMZz718rk/Qmgsh5Bji3zCHCAiANYFLVGOJB8dmXm
	SEUazpoly748dLkDsrv7VBLJg1xg0FRvew/TjVm3/hCqe6HunkldM2z6J/GGZVNXUg/PYi
	ezNBtxksqvhA30P3/EHpq+7XWMdq0EDO0mWBCyvZYDPjFhDb7Intz5kA9BHT/PpvTUkN4t
	FGeHktoUyLKekNgCtnsn3r36cH6PFJ8orSembemIvX5GlLw6NZ57xiVLY3x7sw==
MIME-Version: 1.0
Date: Fri, 02 Dec 2022 16:13:11 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: Extend SFDP 4byte address
 instruction lookup table with new octal modes as per JEDEC JESD216F
In-Reply-To: <20221202135539.271936-2-nathan.morrison@timesys.com>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-2-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <80cc15aa905f151ecb28500fefdd0817@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_071316_615332_F62075C6 
X-CRM114-Status: UNSURE (   5.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-12-02 14:55, schrieb Nathan Barrett-Morrison:
> This adds the new bit fields for
> reading: 1S-1S-8S, 1S-8S-8S, 1D-8D-8D
> programming: 1S-1S-8S, 1S-8S-8S
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
