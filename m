Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3481D591AA
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Be1UKiHEcRXN3mFOGIO2IcmktrpNMjwhk0bLMrBb58=; b=gtjtT3O7BZb1Gl
	y4kbmYNnDiH5gmWw4aiNupybIaK9jdVc/7DxjDjKTxlFJiiZ2yRlas0lWCkdICt3lgm3WQkZNhtvc
	sCf/cU/M8LrES15nGfwlWTxDxvk2Pv+3zp1wqzU6S48brZVh+n4uEc/qB25r3uoy0R+kO+ZCejnOY
	KTvhkjjxvHwzHPdvWFmthOzphA7jSvIcx97Vn+sG7YXKqwqlEv/S3iBjqniuJDO3DDEWuD//bR5Ku
	DcZO2q/QEnH6h2VBl8nP//0zV/cavtN5v+APyyHRJixU5ivCDewUvU1HQ6aVZbzZFtll/7tD6n6EB
	g/HMuwIwEkKps6kuWPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5j0-0000000AEgY-0Zp9;
	Mon, 18 Nov 2024 17:39:46 +0000
Received: from lisa.dawes.za.net ([178.63.77.189])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD5ix-0000000AEfs-3L65
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 17:39:45 +0000
Received: by lisa.dawes.za.net (Postfix, from userid 1000)
	id 4B5801401DD; Mon, 18 Nov 2024 19:39:39 +0200 (SAST)
Date: Mon, 18 Nov 2024 19:39:39 +0200
From: Rogan Dawes <lists@dawes.za.net>
To: linux-mtd@lists.infradead.org
Subject: Parsing extracted i.MX NAND flash
Message-ID: <20241118173939.GA11581@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_093943_976033_4563B91E 
X-CRM114-Status: UNSURE (   9.63  )
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

Hi folks,

I have an i.MX6 target I am trying to get a shell on. It is using High
Assurance Boot and various other configurations to prevent this. My
current approach is to remove the flash, extract the filesystems, modify
one that is not subject to HAB, then put it all back, in order to enable
a shell.

I have removed the flash, and extracted its contents using an Xgecu
flash reader. Now I need to parse the FCB and extract the actual data
from the dump. I have found imx-nand-tools, but this doesn't work due to
bitrot (the bchlib dependency has moved on while imx-nand-tools has not
been updated).

I was wondering whether there was a way to layer the existing linux
drivers on top of nandsim, in order to actually interpret the dump
correctly? This would seem to be the most future-proof way of solving
this problem, since the Linux drivers would be kept up to date.

Any suggestions?

Thanks and regards,

Rogan



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
