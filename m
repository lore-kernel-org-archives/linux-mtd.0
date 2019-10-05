Return-Path: <SRS0=9l0+=X6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6775DC4360C
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2019 00:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F7A20873
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2019 00:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7cK80Rz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmpmqRs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F7A20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rKSsG1bihrEgIagyQrtdC92H1VEiUbgOoVhhgGnMPMk=; b=Y7c
	K80Rz4yFPd0wjNFte741iGacSI6CFcI208hKlwPt99ZWJyglrINWqbx1zVfFsuYChm5IY9A/jmrcC
	ST7HIVRpziaqos8oHeWaG6jEDYcl/Wair/k6ZhfjhCLGIfMcr3/QUD10OsAw/LBr3mYgc0/ed/A91
	H3uB8GN819G/3Pg9YrYKyhdU52jjRz5JQ/gxRj0Eg2zZvRzNuW13KsToCYJUiXB7ZofFxabRp/nNl
	37nCk1xWIbTUW74x9yjMl+01Wvswjf1oRu412nh12TAm5ZO5AUrkA9CT51yIuhxnlEYJY9sVv76+s
	6T301juOm2cjXOYTSF8UN0uj76iaI0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGYHn-0001w2-PH; Sat, 05 Oct 2019 00:51:03 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGYHi-0001v7-TK
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2019 00:51:01 +0000
Received: by mail-io1-xd36.google.com with SMTP id z19so17430005ior.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2019 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kF6qgkncq3cBTnmfEu9ynfD5f4dx0pIiwe8/+0o9vg0=;
 b=JmpmqRs6WnaJ67MKWAWX0T4uR9+gBbyX4yxIXw3Kmjf5b43ZHrvLFTnZ8mOVHj4FVT
 FGWCJPa3dBUl+W7Wa+IaVX3ZZWSecjyQaOdy+gUc8rJZ/QnByDHqE0xXGeUcMuT0G0V8
 RI7dU7m3EGPZBk06LaX+rvAG1btXeRRbf11iJvD3pfbXwGkIN5mBzHvQoR5I7N+9DnGc
 uKPTH3y0z8CUbvzBxqdbMF7GiVDIpSaZJp6GfcQCFyyPoRmVCYX4w4aJSetgLp5ULVUJ
 od38nXeoITlk7w7HqgFhRRZ67ui/WDxLw0rRu/9cxXyeY122GGGLAZCWN4j2Nvk8rMXn
 EPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kF6qgkncq3cBTnmfEu9ynfD5f4dx0pIiwe8/+0o9vg0=;
 b=uEVCIFuDJev6qmJYxg6iHwp5jX0IBtXMP5KDfnwwJwUOvREXqpygWKb/Kch4fTJxs1
 W0Zw0WjaM4XtqX5I1DcXV0KNAXOy8uRsPY2HLC7XhadpAn41oWMuSDwCIuGR5LxfrpIU
 bfqsS8FAUX/sh8PqFTS3/zwoMIASeD6fIGWMLDFKYJr1eJn4mW0mvT+mjiBbsrgQThQh
 jqD4Hlz+vrSwHc1Mm67QyITQc6n7vyzBi6M6+2TZi2ZYagXlIWEjKGXmzkgsLcfAgFmY
 shNZCfy7zCfM4+yKewqgox54uiOls1BPMmqfLYfA1vhnSKh0G8mq0dmN6gJJ6qgogJq7
 stuQ==
X-Gm-Message-State: APjAAAWUly+vXWOngS5hXEb0bSdkEIAH5JXfK0mnoyuvey/Es7W7S81X
 o70NVTkGFKso4dWs6qMaaap0znD65plMzbErzOJszSGj
X-Google-Smtp-Source: APXvYqzZrfbZ/kSjPFHQr0X69k4vgSK5D3InF3e5x/MLRFsbY8h1TwnTn5MwkWHLgZQXggBPOQ23k4AXIbjcLBpswro=
X-Received: by 2002:a6b:bd42:: with SMTP id n63mr3854276iof.53.1570236656197; 
 Fri, 04 Oct 2019 17:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP;
 Fri, 4 Oct 2019 17:50:55 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Sat, 5 Oct 2019 10:50:55 +1000
Message-ID: <CAA=hcWRsrE73HPc0qzcUY7AEHha3NUYQCXj7tTK8o-KN0xLbzw@mail.gmail.com>
Subject: Where to define multiple volumes sizes in one MTD rootfs partition?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_175100_510047_8133EEEA 
X-CRM114-Status: UNSURE (   6.07  )
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

Hi,

My apology if my question is not related to this mailing list.

I set up following 6 MTD partitions in boot argument environment, the
rootfs is in mtd5 partition where it is currently created one ubi
volume for rootfs in ubi0.

MFG_NAND_PARTITION
"mtdparts=gpmi-nand:4m(boot),2m(ubootenv),2m(dtb),16m(kernel1),16m(kernel2),-(ubi)
"

NAND_ROOT_UBI "root=ubi0:rootfs_data rw ubi.mtd=5,2048 noinitrd
rootfstype=ubifs mem=256M rootwait=1"

Recently, one of my device is broken failed to boot up, I still don't
know what was the cause by hardware problem or software, to be
precaution in the future meltdown, I am going to separate all writing
data from ubi0 to to another ubi volume ubi1, to keep the rootfs in
ubi0 read only. How can I define the ubi0 volume size to 160 MB and
the ubi1 volume size to 30 MB?

NAND_ROOT_UBI "root=ubi0:rootfs_data ro storage=ubi1:rootfs_data rw
ubi.mtd=5,2048 noinitrd rootfstype=ubifs mem=256M rootwait=1"

Sorry if it is a wrong question to this mailing list.

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
