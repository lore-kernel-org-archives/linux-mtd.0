Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315AAC07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 06:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06115613D0
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 06:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06115613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=trwCmx00lO9a/cxGdOIGfd8InbGeMlbTdH2NqkNtrzs=; b=pV1
	anHdin6bPiwKMDiNC3NL4F9MC4daE4yui34400F5lHW2JKwFi8kJt+nMCUwfjUDv4rs68AiC3Sa1z
	eJXommOSLYxSz7tBA7OTpMJ2eP0B1kQsf6F828NAoYwmv/gGsjKnjBi54+TevjvrEp3wgB1Gu1jMU
	Uf3rAhcuSXsjYe1wUTX2LoEFXre2E66miuj3Oh739YmzwgbVhvWeQGwFQ8cTNWU+4qcR46lCOrDLt
	08/XONazK/5GIHOQFjxoYYv2MjS3bk7mC9HE2J6D9zK2Zrq12znLdEGfxjKVylJkvIoK0/gGarTN6
	iiPNZgaBSVABDlspbwnkqaJIax9e+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4HYn-003PC6-PV; Fri, 16 Jul 2021 06:42:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HYk-003PA8-Nk
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 06:42:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id w14so11531952edc.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jul 2021 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=O5Zke66uI5LxZVkYWI95Tx+J3KNQ1bPBIGGmEE1oiJQ=;
 b=Zt8Vy0wAGBl/en8Xn9uzslyZHwSzjc1/gs/urvGIcRN9UWRy8/ZTbccFU1C7yY0/5Q
 axNSq7qTb4vh3bdcGoQ2ZVaY6LIsu0SdU5aB5RZGRBXe3+dIktx0R6ZiyiYpVGWC6hpY
 PrgwhbedATfheNR8ZKHjs/nYUokDMq+wmPjPMhMJhCSL9vwVx4bxSiTm+Ky6kFfOFo60
 J3RaSxMWubWBhbS6IkggABuT9FpMSN1c25AWbQTYy1qfUEZ4BEBH01fc2x44agUT4QAT
 dobKSzXd32r7LZh/EfpSdyUHSC/lxahmD2V0s/lnF0DLX6Qv8dBl8rkKFYZl++u3BjTp
 A+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O5Zke66uI5LxZVkYWI95Tx+J3KNQ1bPBIGGmEE1oiJQ=;
 b=kPUuicgtdLvM8F9Ms1hGBK75izdJ//fzi4OdaHqwnFOr6pKPN9bL1UanZ55aGYF2HJ
 O7e8ucbKXPi74Y87W03pvpaK8BjFnFhhpBGVOP8uIabsJ67Ngr4A4kmJIGaFJJPoJpuJ
 ssI4LbNcFdUfYjNVdEweilxS8T2ikmGbrbukXg60fYqJroqbr53cA1gFe7l4COL4d/5x
 DHnLMfelhHYMP+srJYGcbu6H/kj9hC8h3w5Xc/6xaa3dl1fE+H7Zp9LEJT3yrne0ioc2
 Bl+l1OrP+Q9mXP/PoUJLPz/WwxEvtKbDsZ8q/H/G8CQD9s8vKqlBrq8tWiS5lWrdXN3+
 954g==
X-Gm-Message-State: AOAM530Y4dvrKEwdk+YEkELEMcI8tYOmgbIA9ho8xYQf50Xq8Fj4BP1i
 l5aD6t5WWiUsALZJR4miGx2azv1bgdZg8JoUwEs=
X-Google-Smtp-Source: ABdhPJw+VGZgQAn0kjFh/ndkDCk6xrwoK9JC9hWPUgvQg28yCLKiLI1BqsD2UUYKC07wFnL249FnqDPk/Oo6olaRXT4=
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr12670927edt.63.1626417772479; 
 Thu, 15 Jul 2021 23:42:52 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 16 Jul 2021 12:12:41 +0530
Message-ID: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
Subject: MTD: How to get actual image size from MTD partition
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_234254_831662_C0D1BD5D 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Our ARM32 Linux embedded system consists of these:
* Linux Kernel: 4.14
* Processor: Qualcomm Arm32 Cortex-A7
* Storage: NAND 512MB
* Platform: Simple busybox
* Filesystem: UBIFS, Squashfs
* Consists of nand raw partitions, squashfs ubi volumes.

My requirement:
To find the checksum of a real image in runtime which is flashed in an
MTD partition.

Problem:
Currently, to find the checksum, we are using:
$ md5sum /dev/mtd14
This returns the proper checksum of the entire partition.
But we wanted to find the checksum only for the actual image data
which will be used by our C utility to validate the image.
Here, we don't know the actual image size.
We only know the "partition-size" and "erasesize".

So, is there a mechanism to somehow find the image size at runtime?

Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
