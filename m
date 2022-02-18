Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59226C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQgCeg1paXCDVOY3POj+MBiygqeZnz+p5GAURSJeO7c=; b=PsbCj2cucMOl88
	GJw7uGBGWSRJPQCaT/yeqqSdzwUycZzgNz5i9WJimC2xtlYbNPzok1QeoKwjFfz84GgLJ3Q17yzA7
	SjgrVe1HSm2Aj7/MWyY8jz0yJKQ48gVYIXRZxqpUJAtUE3GHGCAv5VWv+JBAW8zerD+LETjLTCcjT
	KwXBcPVOturtkxeW+YL2msXzhZxcNvWc2JwqLpHE1yTLK0ry8QCDGH2Pq59x8TSD1zU8KG1f5EFno
	9C9EOuv9i3bdORiokJ+TnPnik4lUnqkJbhqcKd2yFwePcD+DL4nGEfXZysdYJS1urxRwYskjcEVQT
	IE4fCqNx8IFojNYXEF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4KG-00En1h-7B; Fri, 18 Feb 2022 14:33:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Je-00Emlz-CZ
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:33:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A16FC10000A;
 Fri, 18 Feb 2022 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0DovIIcQK61e6vtfVFHZ8ExmWLz/vfcmAhthQ9qt5I=;
 b=NsnKIKpzvKlPr/ZTFjUZJBheVPeOCCD8tjVse3G7bQw5RYMZJla4IITMCmci7PSrHWBLH0
 LX05AS+xbTIUSusAzZ4TE5GARhU3Qo3m2G7sGaKRp/zM7+3i/eUdzmgI19XRvjBaNPKbpB
 f7ezJ2Wz5scXCcNkGN0eML4nEX/P63TR4cvIzdPzk7uvQt+gDq/JsrPgjalYII8VZ8vI3Q
 +jTAdh4wtN77Vmzcc/Kzb4sj38DFqxpX3/C4G4APYfmHPtpMPvjyShzN123kPW1APZX3Vq
 r0KjLZTGpj4fC2UpjeWYXTHvW667Rv+QzaECuqkT+0gh1q+Kb7FHVoedB97HCQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] mtd: spear_smi: use GFP_KERNEL
Date: Fri, 18 Feb 2022 15:32:55 +0100
Message-Id: <20220218143255.321991-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220210204223.104181-8-Julia.Lawall@inria.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ccb7bc50177c5e94e0609126654abeb4f3b67819'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063258_588114_EC838F0E 
X-CRM114-Status: UNSURE (   4.73  )
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

On Thu, 2022-02-10 at 20:42:21 UTC, Julia Lawall wrote:
> Platform_driver probe functions aren't called with locks held
> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> Problem found with Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
