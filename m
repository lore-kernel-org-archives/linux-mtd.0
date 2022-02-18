Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74319C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHl3olHFHpAGcP75KmICcUYineHy9wtW/FqrdWvriPo=; b=ZTkZZhK2JLUTF1
	ZggJeri3wpKU8WkTvFIiVKu4AG+t4od62MuJxNgMvns2g4+SgDo0lUQYLOpVRy2OAcdpIqKB7htr9
	1JGHa2NifEnTvu5grDf0OgRgeqFJPoTy2oKSPBpreCx07yrru0B32WUCykBJtzWD2AY3FUBJCu9Dw
	dBVtbzraoqTUv0gDNZlhm+R8OoK9ghooLLKDfiKB93DZM2GUymo0PMkORLVZOiewJkDOu5XQoZzUg
	tnIWnO0vwAiTfDESSEB6HW6HU2j/ujuSuhF0dWrxbtPaGr5I3IkV3ZmCMVC3IeatTB/RIuOO9BoQp
	aCsU+vKXf8y2P+vbPZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4Lc-00EnZB-66; Fri, 18 Feb 2022 14:35:00 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Ju-00EmtB-PA
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:33:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4241A100007;
 Fri, 18 Feb 2022 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1dnR8Czxi29X/52zcUWqpPxP9yVrLF/lYUdiVn/ts4=;
 b=ZLE+Fkg+gI1PoYzz8vf27GCg4YYSgXOqSknjTDNKXX/1O839kUa7mUMDfP0HCZYPozDTbK
 TlpAxL78PbSYMP4YDDymY7GYKDFhMqS/EFn1tTQOhX+xgUA8W1uSyyqRk6sIaYEMYN0rex
 sEuEzQCADjaXXk8Tmphahrs2fHhbN60KhONrw0TrxkmfPTAtR6HDgB2NBVed2Atmi+8MYL
 OGXXhC/oLYMUkjIpgRQmuGyZYa84KsTzoi7DBpH4sLYjdT/H7c3V3hlosIMNXyZnAWh/QL
 uhvOnFzvPIe+uZftzY0j89xqZ/f6Yfmx8Pa+eb9MpCeszA6io1bSoybHh6YRDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
 miquel.raynal@bootlin.com, nagasure@xilinx.com, vigneshr@ti.com
Cc: richard@nod.at, git@xilinx.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: pl353: Set the nand chip node as the
 flash node
Date: Fri, 18 Feb 2022 15:33:11 +0100
Message-Id: <20220218143311.322348-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220209053427.27676-1-amit.kumar-mahapatra@xilinx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a1fe2ace2c39dcdc7c053705459a73b7598b1e4f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063314_995255_14698618 
X-CRM114-Status: UNSURE (   6.11  )
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

On Wed, 2022-02-09 at 05:34:27 UTC, Amit Kumar Mahapatra wrote:
> In devicetree the flash information is embedded within nand chip node,
> so during nand chip initialization the nand chip node should be passed
> to nand_set_flash_node() api, instead of nand controller node.
> 
> Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
