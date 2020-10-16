Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3626EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:24:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E32620848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EDUtEawU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t19IzrzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E32620848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ueRg6jVlZYL+VqjVAy0xhX7wT3SVNFbLtIoxoGlAdEE=; b=EDUtEawU42YcVu2FMCVZkF7UBo
	fyQKx7HIF7QRhepozngul7YLpIQiciMw6lDyPoaa6mdGNfTI2JM4esZFknCCTWMONtx9nthna0PbX
	ItW+XpaUHkUzyrDMavXURA159F2edZAMfHqhjvbqaKJDDH4lo+s+sPuCrrPGB/y0E8Xn2XgRBQMQL
	O9fNnA3/7/vpdpF/yPzY3TV2o7Y6Dbvdt2m8d8wXEYDZi92kp8ZuOc9urk/gV5uV5lYOcarfSnI4h
	aDQn8ct8lN9pQB34MIGsFqbWUz4Nj6XRC0cU5YSJnrXaiaiwalcf+NWTO2k90dJ/8FEbadw7VaZh+
	s09qzUyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTPhP-0006OU-E2; Fri, 16 Oct 2020 13:23:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPhN-0006Nq-En
 for linux-mtd@merlin.infradead.org; Fri, 16 Oct 2020 13:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=f6m35M2p1AgpB94/uwzsw25InjbLlfZsf1jNobIxtRQ=; b=t19IzrzZb7dlnAk7vFzGOJtTV+
 QraJo0L9KL20X4zhW3O9D7AONtknieWIj8tT7EXT3cLFte0G2WRF4QAxYGqiIu7st18JzkJj7RHKU
 hiEPd9LsaZe+2Cm5exzqBzxS/OFYijLp4X7qRyyL1SlGJeusjZ55oE6ms/2McKXAesEpyHrwbaih7
 aynMxfI1gFJh14gMkRyvGo4DPwNTE0tBt+tBBd/yZcVrZ+GnQHomsOFHEZSXw1kuCvUB+qlbp/g/C
 5EtrKM5Fs0J3OaWZxAN4kk7m9HXEEwtBt6CddFHZoIdbTLGMubkjE6z+eFK/Jz8diNPxZFXkO/3+X
 nF5T5J7Q==;
Received: from 213-225-9-134.nat.highway.a1.net ([213.225.9.134]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPhE-0002rt-Ru; Fri, 16 Oct 2020 13:23:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: simplify pstore-blk
Date: Fri, 16 Oct 2020 15:20:38 +0200
Message-Id: <20201016132047.3068029-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

this series cleans up and massively simplifies the pstore-blk code,
please take a look.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
