Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_NXDOMAIN,DKIM_SIGNED,DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795AFC32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 21:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465CB21743
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 21:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lRcQk2R0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465CB21743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sharedomeau.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3n3n5zEj+90JTfz7M1gr3xuWtUVjMi7LcoeHXzRXabM=; b=lRcQk2R0ANkBFP
	RLOp1+2FJ+y/+s7iJDU6hrp10vosNSd4pwxaOkugDutW5gYPlKhtVfCNG13WHKCsQzzfrVaDB3pJd
	tojjN30a1vrMxqSUwPhiKeaDnLEkNrF8YUcwLCfCzaHxq2KcX+4k4z7EfZzxBIDDE5DYfojrRrsHS
	yb1fLD39gvbJ31fijhRXz4i6X2LYDITd/xRRPyQRkhpKfkTxvDZKaCiB5Do/0etEkN1hg3hNhhycB
	7lmoqr+AgmSy0+1dc6AmFpFiH02IqRizT9yrFklvzHtr5Ynq9aioP/A8yDsxQbIfwz8npcT+vuXtG
	ydc9obG3+JFx1l+UHdKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvTP4-0001eK-BP; Wed, 07 Aug 2019 21:23:26 +0000
Received: from cloud-sohoportal-mail.hspheredns.com ([67.22.138.101])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvTNn-0000bU-Jf
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 21:22:09 +0000
Received: (qmail 9525 invoked by uid 399); 7 Aug 2019 21:22:06 -0000
Received: from unknown (HELO mail.amces.com) (lori@amces.com@104.43.236.155)
 by cloud-sohoportal-mail.hspheredns.com with ESMTPAMMMMMMMMMMMMMMMMMMM;
 7 Aug 2019 21:22:06 -0000
X-Originating-IP: 104.43.236.155
X-Sender: lori@amces.com
From: Charlotte Davis <no_reply@sharedomeau.com>
To: linux-mtd@lists.infradead.org
Subject: Offer
Date: 07 Aug 2019 16:22:06 -0500
Message-ID: <20190807161535.5A54CF26D3DC5A32@sharedomeau.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_142207_708761_AF615607 
X-CRM114-Status: UNSURE (  -0.36  )
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
Reply-To: charlottedavis5346@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

An offer to work within your region for a decent salary without 
affecting your present job.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
