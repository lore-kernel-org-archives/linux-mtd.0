Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19898C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EF320880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMX84Dbo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6R1Abvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EF320880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=j76L+mtBfX1a3keQ1DTEICsnk7dBTJuHl2sLO3DkkrQ=; b=XMX
	84DboTZt+YztD6oyQOtxIlo8vpXnsTsKOB5M/U5w6LYizGXhRakfWBbz2i3yMWpSeB6C/QB7GWg0G
	gn6j6NjzLS9GjFB/pFf60ULhpL9SnsThgGLI3i8KFMUiLWb4VDcL16CwnIz5qrN8AmSLDtWDK01d1
	SFyhyK+5C3ok63lFTycbIlTM33kG2+MRHS1saOKdoGTHNCfj+fu3oQn0AAQUxAp/fmg+GSnrH6Sgw
	FOhYyf5NMBhIXbt7oiOjbtc4VciqmhedR7bMl1+TYffQH4x5z+PCGDu2hF7PnXeQGMg9SrKnYxkyp
	KKxmYMRIshRmTMfL8+cqd4gFBvr8WlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3MU-0001SS-Sg; Mon, 28 Jan 2019 09:37:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3Lm-0000fA-9D
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:37:33 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18DE621736;
 Mon, 28 Jan 2019 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668226;
 bh=O1r/Lj0WR2/HzPH/YDbS5U8b3xFC7YYkg/oNDrf2nYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=s6R1AbvdoV79TrMdPv+5Ha8EWVerzwVy8yglYbJMv8uTm+NvAEEygmFV1u72KO8eB
 yTHIsGlvHBVpkx0ZnWAi6LlKzI26QcI4mTTJSpiqM0XFZj+SEpyC4On8L8WXcjkuW+
 qIW63fU83o01gjiNfQA4IwtP7/SA+XMhRxqcP5KA=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [v4,1/2] mtd: partitions: clarify __mtd_del_partition() name
Date: Mon, 28 Jan 2019 10:37:00 +0100
Message-Id: <20190128093700.19120-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ca136bfc2f5d4db7b3b6db35921561d250b83ca2
In-Reply-To: <20190122114134.8199-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_013706_840634_A6D13016 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-01-22 at 11:41:33 UTC, Miquel Raynal wrote:
> __mtd_del_partition() is a helper that must be called after the
> partition lock has been taken. As there are already a few similar names
> (mtd_del_partitions(), del_mtd_partitions(), __mtd_del_partitions()),
> make this clear by renaming the helper mtd_del_partition_locked().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
