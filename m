Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A7C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:42:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EEE764E27
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EEE764E27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jcGzuMJBBZR7cQFHKyuegB07vrjZcM3mZKXM5G35+JM=; b=XSeehmxurLo3k33yVa6rnfaiv
	jX7jMqP/tGuvFp/dr7596ujajULGrxk+TWFskb6e1SZCb1xl0NX5jacfviOfCnQ2ti1ibs+eiwjeR
	95N7AX0D64tGsX8ZfSdwdyEF8+QdQW1aIHMdNn2hHMEE/qzjhQhJR6FsD15aSVYAVrkx/+OGCR5Oi
	7VXPmXa2PnpnAFjiDNmsoGa0gQ/iOVUhB/eVq7DAU5xzepYhzpYtrrEy8SdJfekXiNzufZSuq61Ta
	FZHQWmfsTG332ndAzWHX9QPf75kQ605aMIrZZI9sSkzNXSSmDzqJtiqNxhIkXwJTz58uej5GTxokX
	rbrkujp+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9V8m-0001uY-By; Tue, 09 Feb 2021 15:41:24 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9V8j-0001th-Ng
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 15:41:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0A8E56083276;
 Tue,  9 Feb 2021 16:41:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6X5LfEg7z8cH; Tue,  9 Feb 2021 16:41:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 91ADC6083272;
 Tue,  9 Feb 2021 16:41:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 72_y7wqJgWsi; Tue,  9 Feb 2021 16:41:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 62549608A38F;
 Tue,  9 Feb 2021 16:41:18 +0100 (CET)
Date: Tue, 9 Feb 2021 16:41:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Luca Risolia <luca.risolia@studio.unibo.it>
Message-ID: <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
In-Reply-To: <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: CNyuanlCgrWAfDgLZ61+F9X+2N1myA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_104121_883514_E8C1E811 
X-CRM114-Status: UNSURE (   4.99  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Ron Minnich <rminnich@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> a bit OT probably: is there any chance for you to also implement mmap()
> for CUSE? That would be much appreciated.

What exactly do you have in mind? I wonder about the use case.
mmap() between a FUSE server and a client is more or less shared memory in userspace.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
