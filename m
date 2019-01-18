Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5026BC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EEB020823
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFea0rRm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6gj4jCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EEB020823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=cr7xsX0TVqzPwjmIuuiGPlegqRt1cFPq4QP+6oyjMS0=; b=hFe
	a0rRmcSjeYmtuZRtM3vw3CR7x3qn7AppanIZdDsQYMqG0kdf8/LBahLRnSxvZeQOXqO+dKubwGj+J
	x9CYYpJ4pTT22D6Y0/jDVvjnJgcg+D/G+hrWrzMSKemhRnem4J/uYK4Fu4Ai//HuPZ/bQBhhNhyJG
	LcQ7Q+54qlalB6nJGSalXMNfuVUp2qlaOcZJBfXTDGi2zspPLkPU2gQ3dlVkQmg5EIGrHhi8Ij5a0
	0myp2U1nfz5YKgMdEi9xi1TrNHw03MNfQdYvMSBe7cVNpHdh9VNVme7WoxAz5ONEUtNC/283Csccc
	4EKbUw52G64uGDOQdvEi9vk9+giFxNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkSYu-0008PE-IJ; Fri, 18 Jan 2019 11:43:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkSYr-0008OW-SG
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 11:43:47 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25D952087E;
 Fri, 18 Jan 2019 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547811824;
 bh=1rWIyOeVV4VcpL0e+/AT8D891MmJYlLZjBnUt/t3DsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J6gj4jCl8otaPSOuqb1S+1ULVlsEiE5pgsp+oRFKIe2cJ61amGosHSTxK2l0t4Lm1
 6CATmWfxODfWrEQ53/zRnGgwsKAX2AUVmHuKnjd8rY8J+AcQyupfpBMdKkh67a7cop
 4ES84zlOUUEORCvg4nqOv8aJ5mPH6uBz+FpoKAtw=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: mtd: rawnand: denali: get ->setup_data_interface() working again
Date: Fri, 18 Jan 2019 12:43:36 +0100
Message-Id: <20190118114336.21970-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d311e0c27b8fcc27f707f8cac48cd8bdc4155224
In-Reply-To: <1547789438-11899-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_034345_947926_AC5FA16F 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 "linux-stable # v4 . 20" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2019-01-18 at 05:30:38 UTC, Masahiro Yamada wrote:
> Commit 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to
> nand_controller_ops") missed to invert the if-conditonal for denali.
> Since then, the Denali NAND driver cannnot invoke setup_data_interface.
> 
> Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> Cc: linux-stable <stable@vger.kernel.org> # v4.20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
