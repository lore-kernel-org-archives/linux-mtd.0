Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63F7C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 15:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37FE1206F1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 15:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkngsO6e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtgq2Y1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37FE1206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qf8dCK2rZAlPiaMjKNh+TWSTQj1H3EvldzkB3qvr0YI=; b=hkn
	gsO6es1GA044XxaVkv+1REMjPhA1Z3Zl/xhu/7uXseJL+HTjnXvM6dDQrFtPRS/ALwnzfRuvU21+t
	H51G5f7CmB1+j3VeZZRihugn9PhWj+3xGc3xsdpEbCP4Fg1NmIadqiDfDm733hKbW4n03uPlyqtCn
	Hz75HCy98CtaVTXgZkMpOZtFiGzf9Zo9cbLADMD0XHYi5kTcZeyzuEEO4ygRmupQmbliFqSz8mwX3
	kX2ihzNPocWRCn46XAkrroUJV+IS+5F2RB/khg3bzY0f1HWsnK7nxJ7loS2CcrKDPIaFz7fm89iM6
	WJrEYLZDmmr8e85JJfYekTPKaKd/jNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdbux-0007f1-8d; Tue, 26 May 2020 15:55:03 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdbuu-0007bD-GQ
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 15:55:01 +0000
Received: by mail-qv1-xf32.google.com with SMTP id er16so9677107qvb.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2020 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BsQP6fRdg5RL1dFc3HchazhBnmpsv8sSvKvK9eUTOHI=;
 b=mtgq2Y1e/Er0KeNdiILN6oU0lWb72ncJILMV11PpEKcacEWFYa8/2ZUAuLrTBe+C7j
 dgvQIzF99QnUBluRX7Vko4D062YQCYgMn7t2TrGUr+/76u0LXU8oR7NZKVG0rm8Ztpma
 3I0ZlYAtSz0JKaJCXgzkCKf5ZjL7mlps1IJdAhklY3GBQX01Z3ZYQfXwSTDIY6J6YDiD
 Ju8R7YY0IScatEq886iQySZH9qcgs5IeEyYol6L6funb8juM/CPp61c+/rFdmIcb+7lC
 vBJsFOjb7HLYy+2WzZ6dmN9DkdB/1giyGJ4yVV4LqS9AbzALJP0k/KldYxrm9r+Te/CT
 T32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BsQP6fRdg5RL1dFc3HchazhBnmpsv8sSvKvK9eUTOHI=;
 b=JK64ZCD9TEIHMS4eGeXrhzevFL6oO5h88m5htCd6ewy4G6ypUTvmQiPnqmzRtRGXDP
 Dk4yQhTXCL3ij5sGvWjzZNLmnHQp+gRCAb+C2V0TFTKvS1x/6yUkS31EO61S1A4L6Nnr
 lsVdtgs56w/f2tLu6p90ntpp3V4RFVT9DljMCL/cjcXQEEf4ySFvFUUwK+qNlgW/IWsW
 gQcxR0L0EdAzOwzehcux1kAfsCiYNdyRtSgaeFU5ZCB3fhlxbU+wFlFH8sWdbKWtB1v/
 enm8dD8WQN9kecvJgJ3oaIsX8HXdDNWaJGzlNrM44X32jcS/Zmjr/70cQgAZeKCTOsOs
 /xlw==
X-Gm-Message-State: AOAM531pkn6pIijmgZsMAv83J7FiKiGBDUNls59JNZYIZFjaUr9hpvMS
 Ioh8LmnqtlKR+g/5emxIQ/rYQ3ImnDnJQhNLKx1VekD7
X-Google-Smtp-Source: ABdhPJwz8S7RNCnF4LB0v/UZdBBYpEXlzXnakuCbPpyfu+D+vAE5yn1zu03B4sTIH0jXG22EKb4JbCa5XCJw3pQzEC8=
X-Received: by 2002:a0c:a8cf:: with SMTP id h15mr3617798qvc.104.1590508496497; 
 Tue, 26 May 2020 08:54:56 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 26 May 2020 11:54:30 -0400
Message-ID: <CAF_dkJBQJSY_Fg5H=OcFHvio1-FcDEfgbKwhRmc=KhvdcnNAVg@mail.gmail.com>
Subject: Missing 2 blocks on my UBI partition
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_085500_542767_3F0E4ED4 
X-CRM114-Status: UNSURE (   5.47  )
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

I'm curious to learn where 2 blocks went missing from my UBI NAND
device... can anybody help me out:

# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:57
Present UBI devices:            ubi0

ubi0
Volumes count:                           8
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     1024 (130023424 bytes, 124.0 MiB)
Amount of available logical eraseblocks: 99 (12570624 bytes, 11.9 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  20
Current maximum erase counter value:     33
Minimum input/output unit size:          2048 bytes
Character device major/minor:            252:0
Present volumes:                         0, 1, 2, 3, 4, 5, 6, 7

Volume ID:   0 (on ubi0)
Type:        static
Alignment:   1
Size:        127 LEBs (16125952 bytes, 15.3 MiB)
Data bytes:  16031744 bytes (15.2 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 252:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        529 LEBs (67170304 bytes, 64.0 MiB)
State:       OK
Name:        persistent
Character device major/minor: 252:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        static
Alignment:   1
Size:        30 LEBs (3809280 bytes, 3.6 MiB)
Data bytes:  3746638 bytes (3.5 MiB)
State:       OK
Name:        kernel
Character device major/minor: 252:3
-----------------------------------
Volume ID:   3 (on ubi0)
Type:        static
Alignment:   1
Size:        143 LEBs (18157568 bytes, 17.3 MiB)
Data bytes:  18145280 bytes (17.3 MiB)
State:       OK
Name:        old_rootfs
Character device major/minor: 252:4
-----------------------------------
Volume ID:   4 (on ubi0)
Type:        static
Alignment:   1
Size:        30 LEBs (3809280 bytes, 3.6 MiB)
Data bytes:  3745994 bytes (3.5 MiB)
State:       OK
Name:        old_kernel
Character device major/minor: 252:5
-----------------------------------
Volume ID:   5 (on ubi0)
Type:        static
Alignment:   1
Size:        38 LEBs (4825088 bytes, 4.6 MiB)
Data bytes:  4763648 bytes (4.5 MiB)
State:       OK
Name:        language
Character device major/minor: 252:6
-----------------------------------
Volume ID:   6 (on ubi0)
Type:        static
Alignment:   1
Size:        1 LEBs (126976 bytes, 124.0 KiB)
Data bytes:  65536 bytes (64.0 KiB)
State:       OK
Name:        crypto
Character device major/minor: 252:7
-----------------------------------
Volume ID:   7 (on ubi0)
Type:        static
Alignment:   1
Size:        1 LEBs (126976 bytes, 124.0 KiB)
Data bytes:  65536 bytes (64.0 KiB)
State:       OK
Name:        prev_crypto
Character device major/minor: 252:8

This shows that I have 8 UBI Volumes with sized as:
Size:        127 LEBs (16125952 bytes, 15.3 MiB)
Size:        529 LEBs (67170304 bytes, 64.0 MiB)
Size:        30 LEBs (3809280 bytes, 3.6 MiB)
Size:        143 LEBs (18157568 bytes, 17.3 MiB)
Size:        30 LEBs (3809280 bytes, 3.6 MiB)
Size:        38 LEBs (4825088 bytes, 4.6 MiB)
Size:        1 LEBs (126976 bytes, 124.0 KiB)
Size:        1 LEBs (126976 bytes, 124.0 KiB)
Total: 899 LEBs
There are 99 blocks free, 20 blocks reserved, and (according to the
documentation, 4 blocks of UBI management overhead

899+99+20+4=1022

But my NAND flash has 1024 blocks.  According to ubinfo, none of them
are marked as bad.

Where did the other 2 blocks go?

What am I missing?

--wpd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
