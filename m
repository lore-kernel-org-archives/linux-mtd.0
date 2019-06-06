Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698A8C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 09:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 277E52083E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 09:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPULhR5t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emcraft.com header.i=@emcraft.com header.b="wPwfae3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 277E52083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1LIKj6aTxtk1TNYqvUHyuMPJqghVLMbIXahZIojs+g=; b=TPULhR5tuZKS+P
	wUjSGTvUvmN+Ly8NnRL9PoM8ETnSd3Jo0xhZM1Pift0lzgcWrjUPPCb3yi7ZjRjK8Gs8BQiboP1TO
	wzZp3ecPpgt4gnvDSTHCgmtgkEdzAsseHxqJnd0Yx6IFwSVXZU5upB/a7a8l2O4h3eveRqb0wjY0h
	YMp435nbi4+q3NUNZ8AfiK5UkatB0T08BS//LOar3DqUDafzW4JKTh+tLhJZy6uJh+0Hkjclpx9Ib
	WXJ+/CqyFj5+WJOGMRRXt0nn2p50OD+vMmMN+jrjA4sp7Gaw1RrQAvsdkNKAWMiSA74gSaoFuB/P/
	WOiHU+dQSpZuBkZcdaww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYoQ1-0007UT-F1; Thu, 06 Jun 2019 09:10:45 +0000
Received: from host2.emcraft.com ([138.197.218.152])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYoPy-0007U1-L9
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 09:10:44 +0000
Received: from sergmir.emcraft.com (unknown [176.110.122.116])
 by host2.emcraft.com (Postfix) with ESMTPSA id DF73840043B;
 Thu,  6 Jun 2019 02:10:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 host2.emcraft.com DF73840043B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=emcraft.com;
 s=default; t=1559812240;
 bh=mEDDLGmMRrHotyJ7Oc8dhTSw/AMEzEmPPzN4MRzrd+8=;
 h=Date:From:To:Subject:From;
 b=wPwfae3glejTheSwkoMWCqM3umL7+J0SALhgoWFWWv+nqdAEyosUFxzaQuRUjh0xB
 WDtvmjxGYHwkBxzuG/3M5G30EDyPPCyAsDpAgcmuzZ1ltaBotWcx3sOJB0XC5Slrvy
 vMZ7dywmmHMsiklk0RW5V5QvnOKxofqqPRxCLh3E=
Date: Thu, 6 Jun 2019 12:10:37 +0300
From: Sergei Poselenov <sposelenov@emcraft.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: file data corruption during the power cut-off test
Message-ID: <20190606121037.40a1cc5e@sergmir.emcraft.com>
Organization: Emcraft Systems
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_021042_864414_D1C6D6C2 
X-CRM114-Status: UNSURE (   5.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

We have an embedded system based on i.MX 6ULL, with the root filesystem deployed on a UBI volume built on top of the SLC NAND device. The volume is mounted as "rw,sync,relatime".

We are doing the following test:

   - Copy the same file (/bin/busybox) to a different file names, in a sequence.

   - Power is cut off during the copy sequence.

   - After reboot, UBI mounts OK, and we see a number of valid copies of /bin/busybox (md5sum matches), and the last file with the short length (partially written), as expected.

The question is: should we expect the last partially-written file to have the valid data of the original? We observe that quite often, the last 512 or so bytes in the short file doesn't match the original.

Any thoughts are welcome.

Regards,
Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
