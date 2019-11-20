Return-Path: <SRS0=AqdO=ZM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02583C432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 11:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94BB20857
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 11:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="INeufK8E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hdscKC8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94BB20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qxZKqn1WnKetzIYTT6AwW81qOCgBWduXus1ORNRFiTs=; b=INeufK8Ejblx7Y
	dCjSX/TPKcN2xlT77ZpC092wzJp0eFUnaMUjccynqc3CRIA0hu81sajlEgoDGiwJ5xmlOV3RnHiXw
	6cHtjx8x6j8Zi0s5ggd70jHSBMORyakPSUcjzWuYxGIkYqWkKjMPh7ldgFRLSTdE1hTGCBVrmMfqD
	ek+rPwq4d4lcUrXVzI0+npi+6I4baTPr1KR8qLq3rClbPDvu0BZd3AzbSCoxbMWQjZ6nSY9oc/aBf
	75Hlo2wQL/At8PJVdrhTUmVl0wi5poY2QXv8Q6Lbt4KRUsRDwJzN/6o37ZAectfXfklh0GjXZYCmp
	ZVC7bfUfPfymqwai06Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXNnn-0004LP-2m; Wed, 20 Nov 2019 11:05:39 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXNnk-0004KY-3b
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2019 11:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oppy+F+0JaaCkFHzOboj6zfi/ynUAor3Lsm2TZQUzXo=; b=hdscKC8k4aCUGOpSCrLWZ0qr7
 J3RITMqSzQHKbgTmpQsSBFX1bIQUH6+KL37wWns3CXS1iYD6XGYBQRZCxdVnw1y6prKiHgAPR/Lgi
 tW+Mvjn5VMx/yBULUzsl248AqbMZSpQ0al1oAhBti++euAuhib3JGExA8PQZw+Uw3aikPijHrNwTa
 Q5ByKuGU7eGQyNuFOeoLimStdQnTF8gNm6Y70p4dH7YKdJ7W5Rp/htWbOyL136AGQFYKJYLu6sNgA
 vyJLqM17lOGXj4ljaMmC0EEnCnkT7msXUMmml5BbIH4BwoTpnNEIFaCg8x88meQyu3G6FjMz2qKSJ
 pjEf6GeGA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:58734)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iXNnf-0007tE-8F; Wed, 20 Nov 2019 11:05:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iXNne-0001gL-Jr; Wed, 20 Nov 2019 11:05:30 +0000
Date: Wed, 20 Nov 2019 11:05:30 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Remove Joern Engel's address in MAINTAINERS
Message-ID: <20191120110530.GO25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_030536_149895_C66E6AA9 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Joern's email address seems to be non-functional for 22 days, failing
with "No route to host".  So, it's pointless having the entry in
MAINTAINERS.  Remove the address and mark the items as orphans.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
Tracerouting the IP (213.229.74.203) gives:

 8  kvm10uk.cheapvps.co.uk (213.229.125.119)  23.298 ms  18.688 ms 19.051 ms
 9  kvm10uk.cheapvps.co.uk (213.229.125.119)  2384.829 ms !H  2384.941 ms !H  2385.424 ms !H

The domain is due to expire in two days, so will be interesting to
see what happens.

If anyone has an updated address, please correct maintainers!

 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc39f7f5dc34..5950cd457b24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2998,9 +2998,8 @@ F:	kernel/trace/blktrace.c
 F:	lib/sbitmap.c
 
 BLOCK2MTD DRIVER
-M:	Joern Engel <joern@lazybastard.org>
 L:	linux-mtd@lists.infradead.org
-S:	Maintained
+S:	Orphan
 F:	drivers/mtd/devices/block2mtd.c
 
 BLUETOOTH DRIVERS
@@ -12671,9 +12670,8 @@ F:	include/uapi/linux/phonet.h
 F:	net/phonet/
 
 PHRAM MTD DRIVER
-M:	Joern Engel <joern@lazybastard.org>
 L:	linux-mtd@lists.infradead.org
-S:	Maintained
+S:	Orphan
 F:	drivers/mtd/devices/phram.c
 
 PICOLCD HID DRIVER
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
