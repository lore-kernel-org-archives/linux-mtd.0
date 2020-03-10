Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4219C18E5A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8249C222D9
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4uEvRBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8249C222D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JicMdmbTQiqMhyvQCVEqDXXvmaWQC30VcjavGRjn7tE=; b=K4uEvRByRw/rL1
	pipHOMw8B+3r50QoRjmhrViy4PVSAbKYa8RjqUtfVn8KAbv/dYiCJCwejqVjqARVdmmcViv/kJZjm
	CNm1LW52FdmKgnj+2R+jvpm5CkBjS9/tYrT2FTffFzSvB78AQsAHPRrNVrBwO34DsS+Jw4xOoInFL
	i/SXliBnS4vHVYy5J/zKSqBHbEKhU6YKWeuMI0B/Aiytc1LAyaLIT45hcB2ND1j0rNn3+ldnRa/Jc
	OHu405+552RccTYvtpks06FdNxYlAWF+5c/QgSOnb7J3rbgD1Kipclzul/uXyVO22LRp5Iia8yTVm
	rs0lZFc7hh9E3Dv4J5oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjl0-0002rf-6g; Tue, 10 Mar 2020 18:37:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjfW-0004iB-CJ
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:31:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 74E9820004;
 Tue, 10 Mar 2020 18:31:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Jeff Kletsky <git-commits@allycomm.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/3] mtd: spinand: Stop using spinand->oobbuf for
 buffering bad block markers
Date: Tue, 10 Mar 2020 19:31:49 +0100
Message-Id: <20200310183149.18839-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218100432.32433-2-frieder.schrempf@kontron.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 683ca5c1668a74c87902e5715b6f15bb5c9f523c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113154_571830_5DF34D9F 
X-CRM114-Status: GOOD (  12.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-02-18 at 10:05:14 UTC, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> For reading and writing the bad block markers, spinand->oobbuf is
> currently used as a buffer for the marker bytes. During the
> underlying read and write operations to actually get/set the content
> of the OOB area, the content of spinand->oobbuf is reused and changed
> by accessing it through spinand->oobbuf and/or spinand->databuf.
> 
> This is a flaw in the original design of the SPI NAND core and at the
> latest from 13c15e07eedf ("mtd: spinand: Handle the case where
> PROGRAM LOAD does not reset the cache") on, it results in not having
> the bad block marker written at all, as the spinand->oobbuf is
> cleared to 0xff after setting the marker bytes to zero.
> 
> To fix it, we now just store the two bytes for the marker on the
> stack and let the read/write operations copy it from/to the page
> buffer later.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
