Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB5C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdvi4YLmZNhnylgK9wAzVwM24GF0zKaK9YWQZ1khKEo=; b=HfMo3R/mhN1dMDsDZC56digqS/
	Yz+gN9JBh7hglf2RP23INWrYlVbTahslGmrO8Bdt2fWx7iYz11oNlzLRz860XEdN1+HgNV7emKXxA
	AfaXn+jnJLbxaEdBrENRTlYL6Obj4tGqC3gQc54s0XBS32pj8RbXya7ldE/WqaFYskUTUAM2VM1zS
	PkQ+oqkxJp3rf7bYn/iBoc4M5CFc8yv2RR8JRTxqvncuFrShY6z2p0F8T4p94t9gB5C66vRNcuoN4
	kQUBgonvty2hWDmmSW1/MYnIGytvFIHzXtgOqfL2xEDITk/D0+eIO2hn0UB6fZp7mk20fsoy5Pg0r
	FU5nHUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJx2-006mqg-3P; Fri, 15 Jul 2022 11:57:44 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJwz-006moH-O5
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 11:57:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id BB8EF22175;
	Fri, 15 Jul 2022 13:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657886257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IeF/ZV4745DLDYtdFsqkpNDCQqS8SqtwibNm/bx4IMc=;
	b=tj2/p2eGw1/PBhQrI8h2f+d/MYaa72wZnnR9dHJx6Z9v1kXp7GZ5Ljzht3RxhO1OSjDtxX
	tUtLFZjsu8Ge9/bDlhhIzAFECyRXaXMkPq3TCdx63jZ+MKFhtIYYGfQnUDJwBj8PHrs6k3
	Uxt11XEgG8NE6XrlX3t8K3B7HrztQbw=
MIME-Version: 1.0
Date: Fri, 15 Jul 2022 13:57:37 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das
 <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
In-Reply-To: <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <90beaa944df3778a50278afd2ac4bb8f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_045741_986458_3D4E162C 
X-CRM114-Status: UNSURE (   5.75  )
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

Am 2022-07-15 12:57, schrieb Biju Das:
> Add SNOR_ID3 macro to get chip info by parsing sfdp.

This is the same as [1]. I'd expect that patch 2/2 will go
in as soon as [1] is merged.

-michael

[1] 
https://lore.kernel.org/linux-mtd/20220510140232.3519184-2-michael@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
