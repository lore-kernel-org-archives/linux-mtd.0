Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59890C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE8E21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RU3eC6lG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZMyRo/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE8E21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2cDKlBVyl0RxQSmAmpjgtbLNuIcZgV32qDgaJf7d40E=; b=RU3eC6lG5vx3WJ
	2fbFz8SB4ITQtD2MbXSlcyfCrc23BG2GyNKd5UjbqrD+yDncc3Q32LYP82Gb7cpzKbgeBqGhZSKg1
	8YreXfr6ZP63+OLTbzodcsA/sD5DfCXqleWdInUzMEM0wnrGuiB6kOu54ebAcoLR2+gFscmiqxeHN
	7SyIemL0KwdslSsZc3evRiLahBxw/hTMkbUhmm1pQ16bj7MGG2uaeCG0NebSCXtBjNcFmdabKWHWL
	uX3j5r+aiy9oE5BEUkVWqgvyxUU4Wntwg22EDnaqZKqWOzgkVCMS43RN6uAM8fDxXbIo+rd27EHPw
	xuZrzQku4zoteObF72pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmdbq-0003dq-W4; Thu, 24 Jan 2019 11:55:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmdbl-0003Z0-S5
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:55:49 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92EE121872;
 Thu, 24 Jan 2019 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548330945;
 bh=6N36+An+U5NuSDmo5Qh4vByN8PYjUQ4MI4GB5d8RCZk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=GZMyRo/g4fiIvAFS6pOEIzCwkWP1ZB+veXt8fMSgrHHb/b1+BzQ9qJXvTau3xHZ2E
 Dv57RiyYKiMN5L+dbZztXod0Il0u5ht7gBpDRC6DF25JNsoPWSDSESv6Ksz+toEU2w
 lcAMaTOP6tcdZAJ7TebNfeng4bR4ixjLhDl9DcJA=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [1/2] mtd: spi-nor: add Spansion S25FS512S ID
Date: Thu, 24 Jan 2019 12:55:40 +0100
Message-Id: <20190124115540.23523-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dfd2b74530e90831afdc4b361623de4be06018ea
In-Reply-To: <650c47f3-8657-0fc9-81bd-63974bbe06a5@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_035546_731212_6A790574 
X-CRM114-Status: UNSURE (   9.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-16 at 17:51:56 UTC, Sergei Shtylyov wrote:
> Spansion S25FS512S flash is currently misdetected as S25FL512S since the
> latter uses 5-byte JEDEC ID, while the 6th ID byte (family ID) is different
> on those chips. Add the 6-byte S25FS512S ID before S25FL512S ID in order
> not to break the existing S25FS512S users.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
