Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9C3C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 22:24:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C8B20637
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 22:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WzCEAisG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zox1hieA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31C8B20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GEtYUruOEH4Pu4L94LuyKHeryj2qJ5oq+hTQIeKWku0=; b=WzCEAisGfVhNtu
	rYdYtVziLBU0M+hcfbFqK0RKXW3keYb0EmVHT5Ke4zr55/VZddHEtq6Ka+zea7b02vxO6tXpaaFwK
	reEzw7V7eaQmlf+qMhI5C2pDua/U80ZsU1wCzqQ84vvOZ2i/Ii8oJlxHBsdccYA9o3OHUg5OANNA4
	YEJ6H/NVSNvo9IqRZLXeuTJbXKwDHmwL6OnM9CqvpKPBTLq4ScbthKBqmOts+8hcaJSgapsU1chRp
	OToGqGh+OLBojuWAQ9tz3F3EOh+y8DNSdadA3W6TVshyb2bXdZrh8JN2+VhBcoxam5GbEqUohKNgV
	Cc5bV3Yn7S8MPEoLXn5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRS3-00025s-AZ; Mon, 09 Dec 2019 22:24:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRS0-00024e-3z
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 22:24:21 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E02020637;
 Mon,  9 Dec 2019 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930259;
 bh=NFF6oeKHFTNzJKOukLVQn69hTShkEDvr4AVzVzeQaDU=;
 h=From:To:Cc:Subject:Date:From;
 b=Zox1hieAUcZrvzfyYghZIP0Z6K4YjW1mC+/7n6hFnQr9bvWvnGUI/3jVvDjuOrQ8g
 Hb48ODsQ23EzxSNrsmmJ3rpOWyhKN6N9qFPAlBBQq95tLDUNQUFRyg+3S6Xy8h1IYc
 5wswW23CKtooqMNUHX18kpdImxEMoAGUAUcmN9DM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/2] ubifs: fixes for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS
Date: Mon,  9 Dec 2019 14:23:23 -0800
Message-Id: <20191209222325.95656-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_142420_181410_EF363E8B 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On ubifs, fix FS_IOC_SETFLAGS to not clear the encrypt flag, and update
FS_IOC_GETFLAGS to return the encrypt flag like ext4 and f2fs do.

Eric Biggers (2):
  ubifs: fix FS_IOC_SETFLAGS unexpectedly clearing encrypt flag
  ubifs: add support for FS_ENCRYPT_FL

 fs/ubifs/ioctl.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.24.0.393.g34dc348eaf-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
