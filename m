Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99014C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 20:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8LDLaAsri5QYV4uP8k16LAlXNPj2D2txa0N2fFAKv4=; b=vovpWqM19Jj34R8dnHfeX8YhOU
	VEnjxsJ9pf7JicI3f0nTtU8RHHmpPo4I79Y+peHexAsvY3ZggGJZYZtFKmC1xRNBuEMTf9EYZJJf1
	TvO65nuzThJUd8kP94Ahiim9PFHXzQQjVlrWZBrNG8dEg+PkH+Q1G6W3hr4gXQqYN/YOCeK3BuXYh
	jI9076vRvQNmVgGYd2WduIYba+1a23NsOa267zFGPUbFtbNav4WGlgIbZMoDaJfz52en/IZ/SyzbG
	VFC3XNGCgv6dc/Hp5sCKOgMNJYotZXKDEFHMF/FmrCIr0a19S2E63T7nBFHoIubl6HPG7U3HIrCvh
	G0tQmbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhGYz-00AHDN-8E; Wed, 20 Apr 2022 20:04:33 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhGYv-00AHCq-Uc
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 20:04:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C57D322249;
 Wed, 20 Apr 2022 22:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650485068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVlyUurUeccWOLgMm4v3rPEY6etdKUNqiNzwxQaQMf4=;
 b=M6w8k/8NUhAjoB0cqnf3hyKnltF7o6ip1/PoNtWtZh3fS6dsWL1rjcP3yknMgErHOoDyug
 a8zlwX3uQF46LO0c4XwNsoVIvtc777gOc3E0TAUGllPSX32wFpH3dDPmBW/l3/XcBY5dsD
 2pk8nAfODH0GZDDXM9LTt9u65qMxE4E=
MIME-Version: 1.0
Date: Wed, 20 Apr 2022 22:04:27 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Takahiro.Kuwano@infineon.com
Subject: Re: [PATCH v4 10/11] mtd: spi-nor: spansion: Remove status polling on
 volatile registers write
In-Reply-To: <20220420103427.47867-11-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-11-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fe64ff3024456bd3584e1c3e748bd9a1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_130430_186851_245B93D0 
X-CRM114-Status: UNSURE (   5.34  )
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

Am 2022-04-20 12:34, schrieb Tudor Ambarus:
> Writing volatile registers are instant according to Cypress and do not
> need any status polling. Remove status polling on volatile registers 
> write.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
