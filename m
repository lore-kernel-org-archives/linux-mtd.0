Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC33C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 11:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F71218DA
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 11:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DoB7TkF6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVwzWd+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F71218DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=3M510maCmf6s8AgzgVjRVwafK98hmtaJxF7C/3Vezv0=; b=DoB
	7TkF6NZq3WYiKfOsdh2w015X+yB1vUELiGCLvfwmX6KqaY1CrsuZ/UdueTbE3VyDWuWiP2eEMLlqt
	UHyt3wNKYsbHzjjWYzAttfpBhj9RV0O4JDNmT+/Lu2KXk/1iLvSn0z6mfen2fQvFkAxZqtMuSD2wT
	aVaAHt3aHxpp3yPRBDEHSlO0yWQmh5RyAdXYE4ayEgS3CkSCn7VQfp3wUHjTtyuKaXucrN4OxOjo4
	c3J1N51LMV32rirOy1JXz8w8TzUlYZdx2akoFFDhD/JeYpmXTrAAgVe3n89M7Lsr0RJE7qkksZaOG
	1mw4L5ObyUGSUINqrVTApGBe+9qTcrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpAZq-0005Pq-MR; Thu, 31 Jan 2019 11:32:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpAZl-0005AN-4U
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 11:32:12 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CADD218AF;
 Thu, 31 Jan 2019 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548934327;
 bh=VuPBdMdl2enp/OWXjzCQAcDddf9/S7Xs6KG8Cy9nI9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KVwzWd+YzkRGg01luGoEHE0fKvNm1GR7eLh8I5WnjmiZEvJqNVF69mNnC13MKuebK
 K7cHob7wHtv2PvyMesB5OW0l1Ngd9rPjN/WyzSlEu5Cqe7zNkoMd+22XQaqMJuO4Hb
 fC+cyj1f7NJhKlq1G1RHV4R3EhUdV3VF4JZYYJuc=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: mtd: spinand: Fix the error/cleanup path in spinand_init()
Date: Thu, 31 Jan 2019 12:32:00 +0100
Message-Id: <20190131113200.18894-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 481981251714f23c9bc2e25d5a220c60281db4ab
In-Reply-To: <20190124144654.27626-1-bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_033209_962345_2EE9B94E 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-24 at 14:46:54 UTC, Boris Brezillon wrote:
> The manufacturer specific initialization has already been done when
> block unlocking takes place, and if anything goes wrong during this
> procedure we should call spinand_manufacturer_cleanup().
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
