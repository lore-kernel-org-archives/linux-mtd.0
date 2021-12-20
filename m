Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF53C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ghLMfipn7RtIHWPKPZ1U04JSJ34snQkdGZ+j3V1mwo=; b=N4spaA1crHqm7AAhHnSQP14pxs
	wRI9arx24RoYsz3rNs63pEXHChW6fvyasGfPCVb7A3mI05nmY+xau+HSlCVy19apJuF5tmepn9vPT
	OO9QMgqxtdeSbcNbABEntp8Tlf5P4CbBJwp9UCtGbC3FdT7DbY86+q/2qBV9B44tB4oUkjyEjtFbQ
	9gPbLLpoZOxYGa09tnkPawdYzpGuVwB22Hlc/FBSoWUQ2Nkg14TqGAMGZZezchuPO6pD7FQcf+uZo
	Bdjsap3E0qHMDMhWXnJPa0tEwd0dWcJwQCFmhtc22z2Re/ZHDTOVUYxpI5O+HkywtGl0cIFDaTWgP
	hniyHWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzISw-002UdP-Ok; Mon, 20 Dec 2021 13:12:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzISt-002Ubn-Ch
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 13:12:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DC01A223ED;
 Mon, 20 Dec 2021 14:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640005949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOW520ZR05AQHRv9aIyRrqTZK8P5NitE2pvLyK5C/qM=;
 b=CSuZSbeqbS4jI4Sj461a/Je1NBSAg5stv/JguR41ASZ7Zx2pgBuXXyArBQ4MT5+/HlamZG
 /lPGHSmRIiKGzVmTJEvisibKsSRGzdcn27jLd2kBGvs3XOPfwVBsBhSmQ/3gdwisxFWmlU
 zYYAgrTYUZJup0Pm3EuFFVraiDve+tk=
MIME-Version: 1.0
Date: Mon, 20 Dec 2021 14:12:28 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
In-Reply-To: <20211217173329.553293-1-tudor.ambarus@microchip.com>
References: <20211217173329.553293-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <11ba36ee085bb9e3e262dd5bbef4dd23@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_051231_646279_F16416AB 
X-CRM114-Status: GOOD (  11.77  )
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

Am 2021-12-17 18:33, schrieb Tudor Ambarus:
> The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
> starting with JESD216A. The first version of SFDP, JESD216 (April 
> 2011),
> defines just the first 9 BFPT DWORDS, thus it does not contain 
> information
> about the Software Reset and Rescue Support. Since this support can not
> be discovered by parsing the first SFDP version, introduce a flash_info
> fixup_flag that will be used either by flashes that define
> JESD216 (April 2011) or by flashes that do not define SFDP at all.
> In case a flash defines BFPT_DWORD(16) but with wrong values, one 
> should
> instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
