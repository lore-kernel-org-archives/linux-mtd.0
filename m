Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1261FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71XfHMq2CdF2OckJEhpxLAo1Mm421Ddjlelk7Je5Q/0=; b=zok8DCNVvoJuiG
	wU5NXXfYOs9DpdfTdXxJ2Dc2E1sSVwBk2AKnZjwyU2bAzomiwm+i4zm5K7pY5GIT+qEtCGcEP7Pa+
	x8OvDOReOBTOC+jkqeVCgUtrq5h4+wnQTnCmKYM7xjH0rQD8UDGkYiV+f6zrJKIAfmMxL/D0bO5g2
	vHxdyqXnIl5nj+QPoCsdoLsvXr0vZJGKbnJHZSakFRI049WaLs48RzMERSQl+8OIFS4tBikuL3OuI
	o+z/2NEdoaqRyz+ZCbkXXbZXRoLXAI7jZ2+sn8OuoMzmqn+r5WDX3f1qlSfKBwpiPSnwJ+D3bbWur
	k0fIChW3hhb32wW4L0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbINy-00DvZN-79; Mon, 04 Apr 2022 08:48:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMy-00Dulj-E4
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD4EBC0009;
 Mon,  4 Apr 2022 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJ0vCytaTI0HqUjXr+swIRK6As2mValu0X3WcDyz8EE=;
 b=TkSpf/VOzEw9QZNfw2t3lr6Z4cC0H3IeOmv5WlXO9f0rSBgNHgsXndLJS8Tk4G2HPZPqc0
 qHEIF8+D3ETz/s2qJ9H3nVKlc6JlqAKk0cV+jcnV7a4TvgeDfp1h/Lk4ERZSBb5NeO7OY9
 9n5yd6nKETrqXqIc/qSgL5R54q/nZGuaWvVHmDXEt514WVucs/GcVH+j0z/eDudcP1bhVA
 WKr1EoVLGqEaxmHAMHDw/xrLAgRB+emNdC9Lu9yFwEUIsMdj1WYZFfib5uX6HP90gyMpmm
 GRQPEFczg/9XOloh80hIDDl7sVeE3G9c6edjWixnYvrWdaM8AtcC8xN3dD50Xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 2/5] mtd: spinand: gigadevice: add support for
 GD5FxGQ4xExxG
Date: Mon,  4 Apr 2022 10:47:21 +0200
Message-Id: <20220404084721.1202925-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220320100001.247905-3-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'573eec222bc82fb5e724586267fbbb1aed9ffd03'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014728_667114_4BB116B8 
X-CRM114-Status: UNSURE (   5.78  )
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

On Sun, 2022-03-20 at 09:59:58 UTC, Chuanhong Guo wrote:
> Add support for:
>  GD5F1GQ4RExxG
>  GD5F2GQ4{U,R}ExxG
> 
> These chips differ from GD5F1GQ4UExxG only in chip ID, voltage
> and capacity.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
