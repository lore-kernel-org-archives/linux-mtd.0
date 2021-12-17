Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D706DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73URflZqRu1nKQFsANCKpPXvYYtW43HmF1kirRTWBfA=; b=zJZFYzMeHo2dQE
	2iw9U4gTIDYiIc0c+qyTwOaIAneuPyrH2exSdGufcTk7sZ550jKPg0Mq9JAFj6cDhVw6+z23iSQXC
	wNGEIwxWUUbStF09AeGn6M2FvW+hZitZQiMaBk9YskLgAu1MIPVfC2Onjwkurs8VkCSAN9HZXSJkH
	xx2dWtvQ+d0n1TvS/VGXaFlgIwEmVjczJsVgMyVqRtiNcR5+CQ/1mMFI2qNbOoWcqBlmpd7RAdLtj
	dYZ2+/JclSbjZtvne1oZCAZartikOR7T/bJ6nvoNMIb/nd5rqZwGOOccVhaI1a8gDAnpMafbzin8g
	VtiAxLMDbg007z5dQIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCFH-00A635-HE; Fri, 17 Dec 2021 12:21:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCDF-00A5Go-7I
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:19:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E093A6000E;
 Fri, 17 Dec 2021 12:19:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: mtd: ti,
 gpmc-nand: Add compatible for AM64 NAND
Date: Fri, 17 Dec 2021 13:19:46 +0100
Message-Id: <20211217121946.327955-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209090458.24830-2-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'14a3ca56c09d6b5ffb5f3f0eb83decca9b68d7fa'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_041949_468495_34F8D3D9 
X-CRM114-Status: UNSURE (   4.74  )
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

On Thu, 2021-12-09 at 09:04:53 UTC, Roger Quadros wrote:
> AM64 SoC contains the GPMC NAND controller. Add compatible for it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
