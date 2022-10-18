Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC010C43217
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z43OtyPr8Oe5yhxN0L9AJ2omBMC4RNrbT1TfjHhQxSY=; b=kQEeqT5AV1VAMg
	T0PJ/NB6YG0KeJrxqRvAcybYSq5tqSoDerwmoiTTU/Y6siOBh4WRaJC7+2DvBCldgVEc5tBk4HGL5
	DX6aZbluWGgZ/Tv0bhv/uNF/VY+kmcqoGh3M42gywkvUtfILmlKc/+CU+GEtlE5Wb58iY3pe05Xs8
	xD7DwsWxgadp845bie27QsPh8qq4lU9tln1y1pctvKwcS9UTJkojWyc00ki2+lCgdGqIHjw2D1SFT
	61u+8BtitH357cuX7JOeYWK/vUFizz0jzjchE7ID/jR4LLKtWHPkdQx0myjHHxfBw/aO0m442aAuu
	KxHGIrRa1Ai+3PiCG0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiUy-004euD-3E; Tue, 18 Oct 2022 09:02:56 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiUu-004enT-8C
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:02:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CBABE240005;
	Tue, 18 Oct 2022 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GYCexmla+K3Yaqaosx/NDHgpwO3ew94UiEZ0KVBRK5g=;
	b=EAE7uLN01isiBu+/6PX0OqvTSaNJEDn90fbrxnvDLfacscBt4BU5yvuQU9lRnVO6IioDUY
	tPktBgX9HPiZ9k3ilRy7L2i0TDehucFXXx/1yEI0vkdXw2rV5J8iH/c1yVghpBFdeCdrxD
	ZL5ot1fgHCWIZKFac1CT2U0ytIiOnlFzNboCWCRr6QOgV+ElL3sb+UwCKp193u9FDyKnCa
	xR+EQYUdUXw0olDjE6fdsWOD2bYcmhjf9yfP7qReKBktr7+z8op8cadNcIpDQWm7vKUnb/
	5Fn8IPOwlpbQfvLFbiJgjupZzd3iMuPCd/XD7buYvMqlC5Evxk7SODXRSX0ePA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for nand-keep-config
Date: Tue, 18 Oct 2022 11:02:45 +0200
Message-Id: <20221018090245.393831-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ce107713b722af57c4b7f2477594d445b496420e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020252_610802_DE724BB8 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2022-09-27 at 02:47:28 UTC, Chris Packham wrote:
> From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> 
> Originally the absence of the marvell,nand-keep-config property caused
> the setup_data_interface function to be provided. However when
> setup_data_interface was moved into nand_controller_ops the logic was
> unintentionally inverted. Update the logic so that only if the
> marvell,nand-keep-config property is present the bootloader NAND config
> kept.
> 
> Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
