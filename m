Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B2EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljNVQtxKePi/FulaEqI7vJtLCm7SyP7DuUPdlqj8kmA=; b=mPxh29KFmWFRBzJkaVi9pJPVLu
	Bp6OZ3C+SYVzCQZW+WfIvOTgh58Tz+cWjx/CHcwNz/SOheKiyIgk3qAgur6uRRiR3+egcnpnQQ+99
	LKM9o7gLeGl7GjNr6LVQxuhTiPOX6dw1pj22Wx17/SNY8at7UtFTmoXB6q6gbmXT8aYZx9swzcTtL
	AWAVIE1MvbTjkA7Eb/eeQHNmJqKQNCXuKm7Ng0AovZ9BB5VFhjLhxVgOgCrrleFbwGvkeN6fPWR3l
	GLtz1iKzCrMXihP0+cSPBtpu/QWGQBnbnINJ7GmBpG+4v3NxgfeK2N7R+d7tEem5O35wPvHFaxT3d
	inthdEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhGaG-00AHVE-BY; Wed, 20 Apr 2022 20:05:52 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhGaC-00AHU5-QQ
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 20:05:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EAE4222249;
 Wed, 20 Apr 2022 22:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650485147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FM+OM+UGFo7QA8C4D+CNPizdEHpdObWY21ICZbjKN6s=;
 b=FPxIwhgfXCbVq7kuHMWkM11mTzLojrm6GlOjv7VPh8CrrG21YaoiHWFch5cWBErGVJutEO
 Q412TUq5GbC+aHzjpvenYmDwbnokAvQ2pMIxoAZEx10TmhROli2RDX9k8WDn64IPpvAEFt
 FBB61XP0hDHiESEvD2gAZDnzuMFCISM=
MIME-Version: 1.0
Date: Wed, 20 Apr 2022 22:05:46 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Takahiro.Kuwano@infineon.com
Subject: Re: [PATCH v4 11/11] mtd: spi-nor: micron-st: Remove status polling
 on volatile registers write
In-Reply-To: <20220420103427.47867-12-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-12-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f7943a0ef67a5195454448a343f92c79@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_130549_047183_A1A1E38C 
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
> Writing volatile registers are instant according to Micron and do not
> need any status polling. Remove status polling on volatile registers 
> write.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
