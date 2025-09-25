Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1953CAC5A7
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Sep 2025 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PNcScS+B9TgSkrLemzVWzqjUvtQRPihHr4ms7OhZmv4=; b=wUoVX87wljmDHI
	msGeNVr3q6fTbrjl1kxfhMwfmLJoTXA2+jg+WmhQsa5+CITIPwa5lB0ju9XR375r3ZHxTxJ7nP5QP
	1m0x3l2UAcQt1EGigAAYZwVDaeT7IudGKnrjiwrLpHA0HxdIbvIwz6B31EugPBpM5DwcLGJPutYem
	s2L1r8acJKVs2/8NWwOWdVlhcLp0OVP3Y81wPiXJYP0UBBQxmqeKzWg0Rop9PSpqWlUkk6PxGjhmN
	9NWU5ScVuR7k4638K5IAY1ugRcnInO04p7ERok2mlqeBwtPD+QGZ0hMJtNw9jmxz2zUGaxhsauh+V
	CA0ecSbQsrivg9vb/V0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ofu-0000000B2Xw-3aPA;
	Thu, 25 Sep 2025 16:18:30 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ofq-0000000B2U2-0uDL
	for linux-mtd@lists.infradead.org;
	Thu, 25 Sep 2025 16:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1758817101; x=1759076301;
	bh=1MHuUKkPbQrf7KZKt/NQvzs4CQkTtRZyumFNuW5+ZCY=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=e8lG5WgDow0yH95/q0nNcTFOQuvuIkXq0GfdJySIMtG99EzCGZ2c+ly6cUfw6CUFk
	 9+Yq9rEoNe2Ad5dOYMjCW4cEjfkXUYYKCbvyOOTH/Uz34Folh43CIzRrdnegc8y8cL
	 DixGBZoFbboh0z9ll/HHEFcfpfSAAUiaPAua6quXk12yO43pkL20cqUo/WXfMuY6De
	 4UgWBgv8UGCIqCUFEQNnPcucMQwPPmqDwb/RKFEeT8mGrUezFB1Mxn4XUo1F/zhXIs
	 wf5YTtfBsQi2keiC06DhFBdoKIwSVimX4KgTuNCshw/O4m+TVmqEh+fxzfDeu4vQYB
	 HqWr/CWMe4urg==
Date: Thu, 25 Sep 2025 16:18:15 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Tj <tj.iam.tj@proton.me>
Subject: [PATCH 0/1] nandsim: add names parameter
Message-ID: <OgtQTWyB7Bw9gvqL1-NZAkctyqSqiQgCz_VwZsl48KanX9m-3aW5Xl86s7jr8mUSHsOHiopDpC9SsARw9gtaXsCvmKX1i0tFZBWACgtl0h4=@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: ae35f75df40d2c592d9ee7ad2be747d458fc42d4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_091826_879984_26A36B27 
X-CRM114-Status: UNSURE (   3.36  )
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

Allow naming of partitions to aid exact simulation of real devices.
Gives the ability to execute firmware update tooling that expects
defined partition names on foreign hosts and architectures.

In this example it is simulating an armel architecure Dahua IP camera on
an amd64 host.

$ sudo modprobe nandsim id_bytes=0x2c,0xac,0x90,0x15 parts=8,8,8,8,26,26,44,64,64,204,32,32,32 names=U-boot,hwid,updateflag,partition,custom,product,kernel,romfs,web,user,syslog,config,backu   p

$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00020000 "U-boot"
mtd1: 00100000 00020000 "hwid"
mtd2: 00100000 00020000 "updateflag"
mtd3: 00100000 00020000 "partition"
mtd4: 00340000 00020000 "custom"
mtd5: 00340000 00020000 "product"
mtd6: 00580000 00020000 "kernel"
mtd7: 00800000 00020000 "romfs"
mtd8: 00800000 00020000 "web"
mtd9: 01980000 00020000 "user"
mtd10: 00400000 00020000 "syslog"
mtd11: 00400000 00020000 "config"
mtd12: 00400000 00020000 "backup"
mtd13: 1ba80000 00020000 "NAND simulator partition 13"

Tj (1):
  nandsim: add names parameter

 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

--
2.39.5

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
