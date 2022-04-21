Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27378C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC0qXu0qO3NLTY358fVBUP+HdmlYqYrilCL7xeIieRU=; b=QBfcCNgGBKJOn4
	SyLmwPM5JWsV6zGHUvScMFa+/PGgkxPoj9KQ3R5pwKdlae11pHUR9zWWqtWmpOajxSAoOPKmMiSdk
	AaxLg4S9rjvtgLK8Tqi5V0PqYAKfySdZGot8wK+ixIfDIs3Js9nBUZys+NmjCnAvQFnBSDrcxohOv
	Fz6eFeh9S5eZpoGwRitf0KIgoUMqywYfc46X0hGSvsUbvAZWBHSxk9TOU7sPzcm02LvVb8jED2sL/
	b4DmrlH+HvaDs0BHN5CqriecVI02xxSAPJZY+J3xxRDfryJ76m+mwf6TBV4w2XF3TX46lmfaxRte7
	3k1C4/4z8XHV24gsbmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhROy-00C5EA-6n; Thu, 21 Apr 2022 07:38:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRN5-00C3rW-OY
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12F95FF804;
 Thu, 21 Apr 2022 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVGnZRBh2+G0ZueQwAdi2X409UOe0yFExWlQh+HD/eY=;
 b=jilqWnddagPV+DDgoz8P+m6beiSI85dIus7XSjc3wy4dpFYkHdbuC7FfEYaRdEmmv0CuuR
 +qmvMBPi3VTRM/CRzGWtQwB8/li/psBUT1/8R8hvhwcQ4n8CD6urzGMuOIbhsf+0rCzZZA
 1R1xayZmWcGyjUFiHSPoelQ4SWZXZ55iQSIG+UJr5Bxws0lUUxZmGG1RnKVxFILIRCYJh2
 nR39LhTL5n+Z1s8Av2zPzOZFPfTEhrmHDT0GUkaZ1bDuFIA87FjWbeTeiRc2wRCztfKS9q
 bX0EjEcVL+Fu6nsnuM7Vidr/m/7JrNAsJ/h3yO8b1lD7HuS/RfqWvd+7ENyksQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 4/5] mtd: rawnand: gpmi: Rename the variable
 ecc_chunk_size
Date: Thu, 21 Apr 2022 09:36:56 +0200
Message-Id: <20220421073656.72556-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412025246.24269-5-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2fb038eaeed82811eaecc4248b119218f8a3551b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003659_970913_E5A49B0E 
X-CRM114-Status: UNSURE (   7.94  )
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

On Tue, 2022-04-12 at 02:52:45 UTC, Han Xu wrote:
> There is only one variable ecc_chunk_size in bch_geometry data
> structure but two different field in BCH registers. The data0_size in
> BCH_FLASH0LAYOUT0 and datan_size in BCH_FLASH0LAYOUT1 should have
> dedicate variable since they might set to different values in some
> cases. For instance, if need dedicate ecc for meta area, the data0_size
> should be 0 rather than datan_size, but for all other cases, data0_size
> still equals to datan_size and it won't bring any function change.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
