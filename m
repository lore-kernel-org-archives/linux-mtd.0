Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0E7C43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 15:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F87206D7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 15:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efnhArMM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzUyIXrP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F87206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:References:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CVGIJKAoi/I/ZL9jre7igvTHm9PMtAXvzw5dkEfNiM=; b=efnhArMMIo1G5V
	5mJYfiSvrMHlpdYLSESrLSVqpYIFrv70Dh9y3Pa0RaLOnTg+AE+kjoostz0Gh6hnbhrRl4MwN0yRb
	tuNoRnI1AnYwsS6PPNPqNNsB42wdgMdAs8z4WDvZQGV09EVxMGnSqvPFbrELG1vJ/MQqUYeg0/IYD
	iO7F5RSukOv0tprHi5R+6M/RlhaYzZM1F65lqavn/ECKv34Wlw7kids64Pa2CLlS1OBXDSDL6w3E7
	lc4Ndg46hU0O37r7bJ/4yAS67iu0dySIdDnXJ2PPjm0LhzNupUS/5OtMyL5064c8x92W976gpBbr7
	ukM86L/jVcC+VIwRNrUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igrxK-00088X-Lx; Mon, 16 Dec 2019 15:06:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igrxH-000880-RZ
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 15:06:40 +0000
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0511E2072D;
 Mon, 16 Dec 2019 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576508796;
 bh=jMOUCL3/CP/pJJkOA7t0NUTyS+JifbneUnedYGo6dGg=;
 h=Date:From:To:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=YzUyIXrPqee/ljUMeNG0M7dnHegks1F/XVBAeoxt+aDuPFykdWV+l/sz71LeGhE3q
 ot0sm1Y1hyIcONHPOQxVOEyjjXP8KQGL9+utEAFUjJiWBzHdJ90kqYS91Q/oDYuPdi
 QdoSNFAs4ro3CDP/k28fXhXYRHm0t+wC/5KAIO+o=
Date: Mon, 16 Dec 2019 15:06:35 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
To: Eric Biggers <ebiggers@google.com>
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubifs: fix FS_IOC_SETFLAGS unexpectedly clearing
 encrypt flag
In-Reply-To: <20191209222325.95656-2-ebiggers@kernel.org>
References: <20191209222325.95656-2-ebiggers@kernel.org>
Message-Id: <20191216150636.0511E2072D@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_070639_912987_4B8767B3 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: linux-fsdevel@vger.kernel.org, , linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2228348910770308268=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2228348910770308268==
Content-Type: text/plain

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: d475a507457b ("ubifs: Add skeleton for fscrypto").

The bot has tested the following trees: v5.4.2, v5.3.15, v4.19.88, v4.14.158.

v5.4.2: Build OK!
v5.3.15: Build OK!
v4.19.88: Build failed! Errors:
    fs/ubifs/ioctl.c:130:28: error: ‘UBIFS_SUPPORTED_IOCTL_FLAGS’ undeclared (first use in this function)

v4.14.158: Build failed! Errors:
    fs/ubifs/ioctl.c:127:28: error: ‘UBIFS_SUPPORTED_IOCTL_FLAGS’ undeclared (first use in this function)


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha


--===============2228348910770308268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2228348910770308268==--
