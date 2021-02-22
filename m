Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_05,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MONEY_FREEMAIL_REPTO,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC35CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 15:17:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EE164DF5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 15:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EE164DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=real-ptt.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3nmiVexiwwGHuY14T4kTM0l5pR9hroKNlNNGbpo+Txs=; b=BhRFHodVhaOIjV
	5ncuS8tGLxHwV8DOySHHuX2RFuL1U4P8cEiBW4uyDzhl1lVCY4nBAi9fVmNkzFSWCqzryELj/bQNY
	o/Q/w64u1is38elS4VDErdLHlPctdiXKrQbA+xUCqPVkcjI+OAnCuQy0eVc0ELKf/lCy/88jdfxxd
	rbBKocwm+/6KQtG7YIBdyM/Apf8O6gBh5xfQl8g2VqfpPy71VtJYvOipZeNRszUXqVBjHjN1koP+j
	SODlQk3xIPNSSNy5Hon+KXIdI16aqS1J0OceJEgSveS53FdEbjtD4/2tZr4F5bCOe7Qjvb3SFvy8F
	vu20YDRv9UpxhK7KYc3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lECx9-0001eq-CP; Mon, 22 Feb 2021 15:16:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lECx6-0001dn-3m
 for linux-mtd@merlin.infradead.org; Mon, 22 Feb 2021 15:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Message-ID:Cc:Content-ID:In-Reply-To:References;
 bh=pXIgOOxyZp4aE+IYJxOfc37kmQfJ+Fic1R3d+i9deOQ=; b=hAiZhiCU1ep3y5Y+JpUrFWdgkX
 HmavM0zXlq5Ll+HEj661SFvfYoAefErVXtwhDkk9nCl9WbF0IIxR3hT2BTmr+jwiK1zEZnDrNMhkN
 mnCZhoLf85DaHowImnIh1RBJ5wHLP8eAj2HoQlgc/vZBfLSYy2ZV6vCK81Qnpv2COfwPkJhgU16wu
 Z4UW6EBMmTMMe6lI59C0SyTP7eWkZn8xHy5oodPYoF2zSCGRa1i0F2+TRH6mj6RWVhWJ5Ep2vzuiW
 fPQqHbrwABTBtIwfGT7OGN9opaRPFlHQqwXJClUYLrUf4VdYSb9/Qv7Q9PtEvBP5cEZpayGtURZhf
 hZ32M9OQ==;
Received: from [8.211.43.121] (helo=mail.real-ptt.net)
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lECwv-006jB3-Fx
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 15:16:40 +0000
Received: from [103.99.1.174] (unknown [103.99.1.174])
 by mail.real-ptt.net (Postfix) with ESMTPA id 78D67BBE69
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 23:16:32 +0800 (CST)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Low-Cost Loans for SMEs & Investment Funding.
To: linux-mtd@lists.infradead.org
From: "Nicholas Toms" <service@real-ptt.net>
Date: Mon, 22 Feb 2021 07:16:30 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_151640_181731_1814CDFF 
X-CRM114-Status: UNSURE (  -4.80  )
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
Reply-To: nchlstoms@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <E1lECx9-0001eq-CP@merlin.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

My name is Nicholas Toms, an investment portfolio manage. We offer the right loan Investment funding with low interest to finance your business or project ranging from US$1M to US$2BIllion. Kindly contact me for more details as I am open to questions. 

Sincerely, 
Nicholas Toms

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
