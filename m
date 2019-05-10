Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48226C04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 17:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5AF208C3
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 17:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4t6xcxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5AF208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hemscot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Message-Id:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZsSogB0RXk5WDuynSg/cXnQsOZRj2DhJKMu5DULaMzU=; b=s4t
	6xcxNvZRPUG3yoleZTLxyNqtvY1VDzWZYrFGpDO3DhmIhYDemr5gpy7nFTyucQd06sGo6rCI9A++R
	pZOyVvu7AnoCIm6dsCfZeIuNbj1hF7cRQh1vcRutlyMqyuW+KDDYoaL3xdSxRn+2tDnIrq94pFenr
	QAfhII4+0dsykUEuTmutv5GFebSVQsh9v0hOto5mWgAZ86kA1Y+fU1K6zFB5uvYy1uIZxkxQ8xDnT
	2O3lHQKu6Kog357vlbMYZ/QS4bOBCV51+0QtLVbZEUTw45EEIUlK97a0/e9y0+ZHTK11JUQGPkW8o
	DjcBCWzdVNK9LFzlrD4PZhYWxVgzCAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP9kb-0001Fo-J9; Fri, 10 May 2019 17:56:05 +0000
Received: from sv19.hanbai.com ([49.212.219.206])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP9jw-0000M3-Cb
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 17:55:29 +0000
Received: from [74.208.253.180] ([74.208.253.180]) (authenticated)
 by sv19.hanbai.com (unknown) with ESMTP id x4AHbMUn001309
 for <linux-mtd@lists.infradead.org>; Sat, 11 May 2019 02:55:22 +0900
Message-Id: <201905101755.x4AHbMUn001309@sv19.hanbai.com>
MIME-Version: 1.0
Content-Description: Mail message body
Subject: 5-10-19
To: linux-mtd@lists.infradead.org
From: "Timothy Petrone" <tim.petrone1@hemscot.com>
Date: Fri, 10 May 2019 17:55:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_105525_254972_EC13B247 
X-CRM114-Status: UNSURE (  -3.78  )
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
Reply-To: tim.petrone@tcbnbp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Good day,

I have this proposal to share with you and I'm hopeful your experience will be helpful in closing. Get back to me for more details if interested.

Regards,
Timothy Petrone.
T: +31 970 050 34732

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
