Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53DEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2797E61175
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 19:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2797E61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kubicz.engineer
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=l0XHGORXUNcE78T0qa/RY5ftN2Lvv3hR2hRyZkPQj+Q=; b=fu5
	Lwt2YAWYzkEK9VdfAXklQva5spjkLzTNO25yoMTvp/kcM9bPrKNq8YIWXsAryagy1gvq8DACMtNJ2
	i/CeuyPRT+M59uYaPxQD9IPIPH5N3SIjDN8gZGOXpcIcCyxJZv6DCpJBjjw+ReTPbaCUYbIagCdbw
	DTrMw0lJuhag0z69LuNYUK6Bt+y3rlfQcKxt4FHcO+2oUxCXYvSsKboqiu/I0nGoOTpxnUwlvleFi
	HpPeo1/Nfk8H4Jy12flOwsMM7ms6Os292AEvVkfVoFv8cY8PfMMso/tPnAq03tQnbzG8cyY2QcW2Y
	MMd3cOZ48BLXeShl0PG/tVuY+YIEVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSP2m-002wLM-Nr; Mon, 20 Sep 2021 19:33:36 +0000
Received: from sender4-of-o51.zoho.com ([136.143.188.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSP2j-002wKW-Hk
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 19:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1632166409; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nl91KOWnb6HDS0mj85wknJ2bzqwTp3h9KIbr516tkCx0eD+ScOwGSEOeH/AHLoIkLm5Sz/HOhYX+Ifa05Uzx1fDvd/QX/8DMh/TEe5swTQHWxui3K19agNkgvy3yNbYJ6vAWN5YpHd3EWxXVjfc9iVQDw2h0StoteAfPWyXnOZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1632166409;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=vENLH+AJDPhIvOck/0uAm590ioju/qlA0wwRJoBummQ=; 
 b=OlfdmHBxIL2qP39ao5jFN3KPkIZzmKSEysoCSsk+79B5DV/8/J9H7hGtQ3NtqpeW3jnZr+SR0Wy0MbQzfxelfz7S3WZ0/mQ+1c0pV8QRwwT8Zrjz5PidSHLC+2c5cZe2qgc6xAJRl0/dGSDnTIJvCTIqmmeScy9SUOePHSxC5Gg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=kubicz.engineer;
 spf=pass  smtp.mailfrom=filip@kubicz.engineer;
 dmarc=pass header.from=<filip@kubicz.engineer>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1632166409; 
 s=zoho; d=kubicz.engineer; i=filip@kubicz.engineer;
 h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=vENLH+AJDPhIvOck/0uAm590ioju/qlA0wwRJoBummQ=;
 b=ZqSG2B78crREfMF3LadQ9tabnYNmZTvJcrnfgM+Xhi1RNkf6uSVhmTK6DRWIy6TD
 b9gBk4NuiEA0Y4t9T+t27rRneoGsaARPAUWO1/O0oMk7PR9jfRZRqIOo5K7CF2WM/hd
 KnJsXVcm8MW4Q1M03797M0t95g3TvIlQLK3Qdgpw=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1632166402915376.41797743391885;
 Mon, 20 Sep 2021 12:33:22 -0700 (PDT)
Date: Mon, 20 Sep 2021 21:33:22 +0200
From: Filip Kubicz <filip@kubicz.engineer>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Message-ID: <17c04b2db3f.11955d8ed102190.1977520078612166881@kubicz.engineer>
In-Reply-To: 
Subject: =?UTF-8?Q?Re:=C2=A0MLC_NAND_support_in_ubifs?=
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_123333_876519_554AFAA7 
X-CRM114-Status: GOOD (  17.59  )
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

Hi All,

I'm bumping up the question about NAND support since it looks like it slipped unnoticed between emails with patches. Does anyone know the answer?

Thank you in advance,
Filip

filip@kubicz.engineer
tel. (+48) 697 088 078


---- On Thu, 09 Sep 2021 18:41:24 +0200 filip@kubicz.engineer  wrote ----

 > Hi! 
 >  
 > I would like to ask about MLC NAND support in UBIFS. 
 >  
 > I was recently bringing up a device with IMX6ULL and raw MLC NAND flash. I have built Linux 5.4 kernel, u-boot and rootfs (using buildroot), flashed them to my device with MLC NAND flash, and learned from dmesg error that MLC is unsupported by ubifs. Support removed in this commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5094b7f135be 
 >  
 > Then I followed the story from Richard and Boris and watched the talk where they explain the issues with MLC, and propose an alternative: https://www.youtube.com/watch?v=9j2pOIiJqYw&ab_channel=TheLinuxFoundation 
 > Alternative available since Linux 5.8: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.8-NAND-MLC-SLC-Emulate 
 >  
 > My questions: 
 > 1. Is NAND MLC (+ubifs) reliable to use with SLC emulate mode introduced in kernel 5.8? Or should I rather switch to eMMC for this design? SLC NAND is too costly at my required size. 
 >  
 > 2. If the MLC NAND is not supported, can you update these pages: 
 > - http://www.linux-mtd.infradead.org/doc/ubifs.html 
 > - https://www.kernel.org/doc/html/latest/filesystems/ubifs.html 
 > - http://www.linux-mtd.infradead.org/faq/ubifs.html 
 > Each of the documentation pages mention MLC, so you can get an idea that it is supported. But it looks like the MLC NAND flash is not supported by UBIFS. 
 >  
 > Kind regards, 
 > Filip Kubicz 
 >  
 > filip@kubicz.engineer 
 > tel. (+48) 697 088 078 
 >  
 >  
 >  
 > 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
