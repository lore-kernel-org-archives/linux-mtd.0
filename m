Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D720BC352A4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 01:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F42620838
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 01:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECXng/QG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F42620838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oxu.publicvm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	From:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wd4aNDgWu8yQZFlJMcADa2d7+ZuyDrzgdRb+Eef1Gec=; b=ECXng/QGtSJa0T
	A8JAB0FtQas0f1Mz2PTXYdqbWZ+8ysOwkP5/d++DRNZJTxmMnSghNY9mlgeS6IyDP/HV52sY+5eSQ
	UjkVQytJpTuyjLKZTGUnWMSxVKXftsEYbUSKOir+TDGBLebWMn/1B7evlO5oNR56H5MC6CcLz9Z3w
	XbnNTO4dEHNLUW1TprrH/TY8VcWhiMz32pBUqkyryyR17Ypmeyc+1F/4pnsU4ujqq5z1wcA0eeElI
	0WsyynhMjNkcFbTCBfM7Vxi2dFY0ISZS1JMCXDyGtnPiEt0Rlrd7Vi6JWIEdKvUB2VlzwlymX42rq
	8oS8h4pgHHI/upTg9zqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1Kjf-0002GN-1h; Tue, 11 Feb 2020 01:53:11 +0000
Received: from oxu.publicvm.com ([31.7.62.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Kjb-0002Fh-4D
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 01:53:08 +0000
Received: from WIN-L6QNEL5022Q (localhost.localdomain [127.0.0.1])
 by oxu.publicvm.com (8.14.4/8.14.4) with ESMTP id 01B21PNC004686
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2020 05:01:26 +0300
Message-ID: <03cc4dab-43871-825b7443840162@win-l6qnel5022q>
From: "Nelson Corey" <info@oxu.publicvm.com>
To: linux-mtd@lists.infradead.org
Subject: Is this your linux-mtd@lists.infradead.org still active ??
Date: Mon, 10 Feb 2020 17:50:55 -0800
MIME-Version: 1.0
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_175307_489069_E65E034C 
X-CRM114-Status: UNSURE (  -0.84  )
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
Reply-To: Nelson Corey <coreynel0015@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have tried to reach you on this linux-mtd@lists.infradead.org mail account severally but I have gotten no response from you, Please get back to me at your earliest convenience if you have received my email this time. 

Sincerely,
Nelson C.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
