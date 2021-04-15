Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740E5C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:22:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161C5611F1
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161C5611F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YQhLsqChIVYCfnQvE4+ev3odOflrEfE2bQzSb6xLODo=; b=PfGlKggzloiMhx
	O363oUgVwQi/nrj9TFfo59VhtIJRGg3ZsepHHDUzsXXXu8YJp5vxcJ/6KZ1VG3nLcw3zBDNY0zCX2
	MuZ6FaR9yJoGTKQGe2mYxMR5ZkrGHinitzPSYn56XCItXDNsq14FsHBU0x3rhurCRC5h6jI8xFq6n
	xwykOKRnuA5JfAZV+bIMCH/DNfW05knJwcYYX0qINYpGc5+Mm+vlk7nfzsVPDcjoyl9iZ0l6wjLtO
	SkKbxdtMuhHPM1xWGJ5kmvYTwLzfosRgtYVetI5SQLOKt25qeWpEEu9Pif3t0wqVso0B0RzfQWR8l
	JjTWW0VKPhu8j4SR4y2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyBJ-00FV6Y-N6; Thu, 15 Apr 2021 09:21:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyBG-00FV68-DX
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 09:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CA0/MwUIbCGt0VrvxTdh5sMHmaheOacKc/Iz9y0ByjE=; b=Po5gy4ljcVlMU4AphGLchXLXTQ
 7L6Hj/OvZWtGJ/+5Z7RJny5CbON42KfxhrvT7iUYZF/FlE57MMuMeUbAoyVcowiIEhgWGe8+je5vY
 t9mT07E6KEMfCCYYJs85IrjZPjAgd9ZEMvuuNtgFfj0Z8PDTjUPkhW+9awuAGIk9nz+VwYQQLiRnI
 j30fXZcp7hVWI9KdZKgrcZi0JtHVIKrRksFFnkMAyzcmz+JEPTKyvznxSpVhPfGN8sR5ZPvRhV9PW
 KiA2xpRsNkoi7lqHzeAUd+qmlOO9JxHnFCOajVLk6KnPyjkC+mEwHTJQ5/4Tpqe8+dKLZqldXMLWR
 0UR9wyww==;
Received: from mout-u-107.mailbox.org ([91.198.250.252])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyBD-008Q0Y-MP
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 09:20:57 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4FLYjZ0lZgzQk1q;
 Thu, 15 Apr 2021 11:20:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id n0YoW04k0WHy; Thu, 15 Apr 2021 11:20:46 +0200 (CEST)
To: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>
From: Stefan Roese <sr@denx.de>
Subject: MT25Q Advanced Sector Protection support
Message-ID: <f59dc821-22fe-27cf-b93d-147709d64983@denx.de>
Date: Thu, 15 Apr 2021 11:20:46 +0200
MIME-Version: 1.0
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: CCDCB187B
X-Rspamd-UID: b05a26
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_022055_915166_AF812C85 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I'm right now working on a board equipped with an MT25QU128ABA1ESE.
And after doing some intensive QSPI NOR tests, one sector (at 0x40000)
seems to be permanently locked. The normal unlocking does not seem to
help:

# flash_eraseall -u /dev/mtd0
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please 
use it
Erasing 64 Kibyte @ 40000 -- 22 % complete libmtd: error!: MEMERASE64 
ioctl failed for eraseblock 4 (mtd0)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd0: MTD Erase failure
              error 5 (Input/output error)
Erasing 64 Kibyte @ 110000 -- 100 % complete

My best guess right now is that somehow the nonvolatile locking via the
advanced sector protection is active and locking this sector.

Does anyone have some ideas on how to continue here? Is there some
ongoing work to support the Micron advanced sector protection in Linux?
Or did I miss something trivial perhaps?

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
