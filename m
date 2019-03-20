Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFF5C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DAA92184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 06:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJP0jw50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTKxdkWC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DAA92184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZGhQ4iPX7jwZOYVVNd7HQgCAzkAseufCWqlsiyUjzk4=; b=IJP
	0jw50QUJ5gh5j7qJ5snY3rI3YLl0x8BCNPtnLP717/P9SppyWJHXD5l3Ppaa9j8x2G0mmuMWFxN6E
	Z2fs+YG0Z3eEB9YaDnBCGbR1sVHjAnd7vfLNfFl/6WqDUpw3B8dcqF3HL/hdGNMw21BKToOJt5a5F
	xZFKLJS5fkFp5ll0SK3BcIT82EzKRVcTKv4n7+86VeKiRYvxaKKMzJE8jyKgctCTuA9TsrXXwq+hE
	LxmrxlEQPfPuvweLBBEELuVe16gHKxNeV9GUqq3O5aoVhk/XudgnCtBfQbFIckZRtRk989d+O+lWO
	+4q/R+iay45T165b0nKrJf8Y6hDYu/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Uyd-0004TX-AK; Wed, 20 Mar 2019 06:45:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6UyZ-0004T9-QM
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 06:45:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id g7so983578lfh.10
 for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2019 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SLkP8TJxlbpmYj3IeQx4PMori73rpngLIoDNoBNcf/w=;
 b=mTKxdkWCOfT87mELdZMXH4if+T/wkoQNHzciXVVDCzL0exoDtFSQbL/RgZ8yIwfbkm
 X4sCGJIa6drMfXqhgNFgLOkK3uVbdWua2Kns3vMeCs8TaGaYfMUkRtjJnwz583HZdlIF
 //39Mbi7FgMQib2RjtdU2UpFWJcN4+VXK9udeq3OTBNntz1CL99wyOklvhoeTYweO1ao
 vSsRRhZ7DLFQkwvgdRyPpHUISC1EMnvJv/yWfoYUPpLMYJVcOf8mn/fsOiPzMcmr6CPx
 ggPjvn+9pagXSqTHyzB066qmgk4TVOjtXXDz4j+YIbnfB6of7asvxpGoVfmyXxDVZ8IM
 zOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SLkP8TJxlbpmYj3IeQx4PMori73rpngLIoDNoBNcf/w=;
 b=baqYHdoFVKWD/g0iDLrSBvXcS1SUqBi7+zh+tN+aFyhlXRR3+vlZhShcpt+FY0h0Mp
 7CRLPPMTQPygUpbNSVkurrl53fToesbudkmA2qAweitRi2kftTfEK6DMJPqxa7yeUbJU
 Ox85TxFWmv4rqpp1lCcbPxTb3wum/xJVaZs4nyoRw/7NIVwI8OYTa6OkBNQJmow4dFph
 R34FPmLQ2dtD6WcxJYQJ0XBMEIdAUoiD8H21vpE8h9qU5cmjYy+zP+jVZcIVUOTZ+DHM
 /8EKMviSj3PYAXy5JpWheahrNLYcL+daCWYC/lbWG30OpV5R/2ubSGc37DyZ7jeTzFAs
 FexQ==
X-Gm-Message-State: APjAAAU0m9yDPbz5YRbzNZe9CJUYncohypIGnI/jG7ec6fgVn4MgnEqd
 /b0JguBKDDBy3U5dBR2wjnkvtQsOm7aPsuypz95itJJ/
X-Google-Smtp-Source: APXvYqxkNElFnapE6AOOPoZ+V3nt8GEd73OGP0OiAr4P5K9di42/rV+leXNd5uglNcy/UHQf4JkG+0GXw1h63PN3a4Q=
X-Received: by 2002:a19:40cc:: with SMTP id
 n195mr15705313lfa.150.1553064320808; 
 Tue, 19 Mar 2019 23:45:20 -0700 (PDT)
MIME-Version: 1.0
From: Shibin George <george.shibin1993@gmail.com>
Date: Wed, 20 Mar 2019 12:15:09 +0530
Message-ID: <CAGu8XfQHuEcU6b+bbD80641ePKvR--5sv7vraGibKZBj4_JEnA@mail.gmail.com>
Subject: nandwrite vs. flashcp when writing image to mtd device
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_234523_908465_848EADE7 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi,

I wanted to write an image to a mtd device. Here is the /proc/mtd
entry for that mtd device.

/ # cat /proc/mtd
dev: size erasesize name
...
mtd10: 007c0000 00040000 "recovery"
...

First I performed a flash_eraseall on /dev/mtd10 which was successful.
Then, I tried flashcp:
flashcp /path/to/image /dev/mtd10

This command fails with the error:
"While erasing blocks from 0x00000000-0x00680000 on /dev/mtd10:
Invalid argument"

dmesg has the following error:
"msm_nand_erase: unsupported erase len, 6815744"

But if I use nandwrite to write the image, the write works fine:

/ # nandwrite -p /dev/mtd10 /path/to/image
"
Writing data to block 0 at offset 0x0
Writing data to block 1 at offset 0x40000
...
Writing data to block 5 at offset 0x140000
...
Writing data to block 17 at offset 0x440000
Writing data to block 18 at offset 0x480000
Writing data to block 19 at offset 0x4c0000
...
Writing data to block 24 at offset 0x600000
Writing data to block 25 at offset 0x640000"

So is nandwrite the recommended way to write a raw image to a mtd device?
Any reason why flashcp wouldn't work? One query I have is /proc/mtd
lists that the erasesize if 00040000 (262144) but flashcp is reporting
erase len as 6815744..

Appreciate any help in this matter..

Regards,
Shibin George

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
