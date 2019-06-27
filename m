Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF35C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 09:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C1720843
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 09:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbcQP1fU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31C1720843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pvGS27G9KxjGkEPztUffHxZxm3yc5CNaun+qz4QjF00=; b=pbcQP1fUzU3eXQ
	hM7HDTOQuT+s2goAK51I80FBLSTEqO/F049gn+kIUGlQLtlOCzgjYCNKfPGVjkAoWqDcExrZ9qgte
	YtUzIYoU6zVtAoYBuJqi4Nj4T/dXP7GnGAjg5cATp40xi27b5tODN8OwuSElg2Nx+LmmL4U8acVs4
	jzQ1OzUyCz58oH00pr/zk4X/pMnlwHT0aRCVvDbLWi2QgRyP84jKV163jEC/wmKoVcLTxnWNkJodi
	7PokjZ/8nm4ExnxzxB9x6WTUerl620kWEIifJB662O+GCuFMoXXqfRgJLPKRZnB1pQZX6W05DpnRa
	VE4ppl61l1yI6+cFx0aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgR9x-0008K6-Sy; Thu, 27 Jun 2019 09:57:41 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgR8v-0007ng-1z
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 09:56:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B06D0608F44A
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 11:56:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hm5XXoFMnkZX for <linux-mtd@lists.infradead.org>;
 Thu, 27 Jun 2019 11:56:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A8E67608F452
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 11:56:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cRKZ6LbPEX9k for <linux-mtd@lists.infradead.org>;
 Thu, 27 Jun 2019 11:56:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8C30D608F44A
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 11:56:33 +0200 (CEST)
Date: Thu, 27 Jun 2019 11:56:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1734592116.18459.1561629393499.JavaMail.zimbra@nod.at>
Subject: [ANNOUNCE] Alpine Linux Persistence and Storage Summit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Index: AHbRSdPwvi69TiqcRgAhTCt8oEc4nQ==
Thread-Topic: Alpine Linux Persistence and Storage Summit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_025637_643855_0F61886B 
X-CRM114-Status: UNSURE (   3.39  )
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

We proudly announce the second Alpine Linux Persistence and Storage
Summit (ALPSS), which will be held October 1st to October 4th 2019 at
the Lizumerhuette [1][2] in Austria.

The goal of this conference is to discuss the hot topics in Linux storage
and file systems, such as persistent memory, NVMe, Zoned Block Device,
and PCIe peer to peer transfers in a cool and relaxed setting with
spectacular views in the Austrian alps.

We plan to have a small selection of short and to the point talks with
lots of room for discussion in small groups, as well as ample downtime
to enjoy the surrounding.

Attendance is free except for the accommodation and food at the lodge [3],
but the number of seats is strictly limited.  If you are interested in
attending please reserve a seat by mailing your favorite topic(s) to:

        alpss-pc@lists.infradead.org

If you are interested in giving a short and crisp talk please also send
an abstract to the same address.

Note: The Lizumerhuette is an Alpine Society lodge in a high alpine
environment.  A hike of approximately 2 hours is required to the lodge,
and no other accommodations are available within walking distance.

More details will eventually be available on our website:

        http://www.alpss.at/

Thank you on behalf of the program committee:

    Stephen Bates
    Sagi Grimberg
    Christoph Hellwig
    Johannes Thumshirn
    Richard Weinberger

[1] http://www.tyrol.com/things-to-do/sports/hiking/refuge-huts/a-lizumer-hut
[2] https://www.glungezer.at/l-i-z-u-m-e-r-h-%C3%BC-t-t-e/
[3] approx. EUR 40-60 per person and night, depending on the room
    category

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
