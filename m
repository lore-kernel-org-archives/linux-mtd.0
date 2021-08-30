Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF5FC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 19:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5741960ED6
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 19:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5741960ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9yenZp/+wZJvvFdkyLKr5rX/uklB9GddRWEfwix6Esc=; b=KHUszeQH1w27oW6VFGOktxa+es
	PZnwJBaosOPMMPqRw0aBQpr0eFRtXGjFpjxYN8o52uhyKAY1ydChGhy8ezQd9HZOEcLpyGKreccai
	38IHcUqkreedvbd7hcOEnlev5LYokwIFFU0gB0mWI8MQY9NJVqj6akflFXg+qGx4GXD/ORupqnVC4
	SV0Xg1F45QWylKqOyOHRoPD8mG1HbPsmYU0xqs4ZF7Xy3Z83yU1nz5wvcRF4vQvFteklffp+1pXXG
	1ss/PEL7PgQ+N+C3Dk8T/PBZsTbksADf7Ryu93g3XBeBZiBwZznYIbjqHxO6LakTNTSpC7UnJe5kY
	MMveJl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKmpq-000QZg-3U; Mon, 30 Aug 2021 19:20:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKmpn-000QYz-Oz
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 19:20:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id i21so33492745ejd.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Aug 2021 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=FYT+kiuMQxiO0heiAQDziwkuPBPqF6pIKA6xjuHRGds=;
 b=Rmk0aIh84uB6BhFZvp0rjDmSeiwBD3zRSaS8n/7rmq8nDz2EGuD/BdKQ1k5pW87o8z
 dS89lZP3+nYwbvCTcb1pWVuePP/2cCvWSrAedWRI5+qN5ceQYzeKnV0EdrQ+RlfLyWWl
 NqcDbF2lhlRjkFt4vM7ftmaESnPKN1/iG5ykIVBELkUO80aZ6iSp7ilO2bNRUYwiDOb7
 FTAtn9BrJX7CwvrdwVzIjAjjMQTE2R2CqfSVH6Hdh9lsOoLXWuxHz5i0DcGtQbRqY1jO
 NR48cAzalAdYioQz4WRwyT+LwbDJLGJcXU+7J7rH64YsyCKE4U0PUf9J9KIA9isqT3l8
 ZIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=FYT+kiuMQxiO0heiAQDziwkuPBPqF6pIKA6xjuHRGds=;
 b=gS1lEStfHUarEl4qKk58wFz8DWbGxBVsZOpUpfppszqVYKWlkA1FkpDvUqeCpE9Fu5
 pW7Z6vUeTsi0Hy+VfeWjnONzu9l2bM2f5Ay4RIFYYf5p4HzWmyxzXnPrtWvPVgWuVzRq
 VJ2wN895rbngXmS5j+gyNTrbS9/W57YxIxl/J1fqWYSqEZmYhak+YYMW2u/XQSWmzRGy
 7DJ56bueBOeycA5KB6u1OfGnz1k6D8QZjWk24lze+J22OMYv1HqU/m8tKCQM/oKlXCjN
 UVO4rFvAzgdUbTk8d30F/pVBfM0i1RdlnhKI/tHraZArowt5JDQC2D5OG8IIvr/LElWS
 vk2w==
X-Gm-Message-State: AOAM531ix0oPZmU2t5qp66lIjTATfcC4WVFwq2w6DslYK3nP4nsW7BEr
 K/QCYNo5wlYailSvn8Xzk+eU7uVwWkA=
X-Google-Smtp-Source: ABdhPJy5kBk6JlnC7PnEkWMnhFGqcyueG7t8wzBcNxlNGsad1cUTNjFIUr/08IlIM+rQ25Bhqjea3Q==
X-Received: by 2002:a17:906:4413:: with SMTP id
 x19mr27033541ejo.234.1630351238558; 
 Mon, 30 Aug 2021 12:20:38 -0700 (PDT)
Received: from [192.168.1.155] (ip-78-45-88-244.net.upcbroadband.cz.
 [78.45.88.244])
 by smtp.gmail.com with ESMTPSA id b13sm8101136edu.27.2021.08.30.12.20.37
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 12:20:38 -0700 (PDT)
To: linux-mtd@lists.infradead.org
From: Petr Cvachoucek <cvachoucek@gmail.com>
Subject: ubifs: error path in ubifs_remount_rw() seems to wrongly free write
 buffers
Message-ID: <f4796737-9bb4-e40f-d7ee-0e30f98399e3@gmail.com>
Date: Mon, 30 Aug 2021 21:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B15CAFF0F05855000265E181"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_122043_887915_7688A837 
X-CRM114-Status: UNSURE (   9.57  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------B15CAFF0F05855000265E181
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
it seems freeing the write buffers in the error path of the 
ubifs_remount_rw() is wrong. It leads later to a kernel oops like this:


[10016.431274] UBIFS (ubi0:0): start fixing up free space
[10090.810042] UBIFS (ubi0:0): free space fixup complete
[10090.814623] UBIFS error (ubi0:0 pid 512): ubifs_remount_fs: cannot 
spawn "ubifs_bgt0_0", error -4
[10101.915108] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, 
PID 517
[10105.275498] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000030
[10105.284352] Mem abort info:
[10105.287160]   ESR = 0x96000006
[10105.290252]   EC = 0x25: DABT (current EL), IL = 32 bits
[10105.295592]   SET = 0, FnV = 0
[10105.298652]   EA = 0, S1PTW = 0
[10105.301848] Data abort info:
[10105.304723]   ISV = 0, ISS = 0x00000006
[10105.308573]   CM = 0, WnR = 0
[10105.311564] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000f03d1000
[10105.318034] [0000000000000030] pgd=00000000f6cee003, 
pud=00000000f4884003, pmd=0000000000000000
[10105.326783] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[10105.332355] Modules linked in: ath10k_pci ath10k_core ath mac80211 
libarc4 cfg80211 nvme nvme_core cryptodev(O)
[10105.342468] CPU: 3 PID: 518 Comm: touch Tainted: G           O 
5.4.3 #1
[10105.349517] Hardware name: HYPEX CPU (DT)
[10105.353525] pstate: 40000005 (nZcv daif -PAN -UAO)
[10105.358324] pc : atomic64_try_cmpxchg_acquire.constprop.22+0x8/0x34
[10105.364596] lr : mutex_lock+0x1c/0x34
[10105.368253] sp : ffff000075633aa0
[10105.371563] x29: ffff000075633aa0 x28: 0000000000000001
[10105.376874] x27: ffff000076fa80c8 x26: 0000000000000004
[10105.382185] x25: 0000000000000030 x24: 0000000000000000
[10105.387495] x23: 0000000000000000 x22: 0000000000000038
[10105.392807] x21: 000000000000000c x20: ffff000076fa80c8
[10105.398119] x19: ffff000076fa8000 x18: 0000000000000000
[10105.403429] x17: 0000000000000000 x16: 0000000000000000
[10105.408741] x15: 0000000000000000 x14: fefefefefefefeff
[10105.414052] x13: 0000000000000000 x12: 0000000000000fe0
[10105.419364] x11: 0000000000000fe0 x10: ffff000076709020
[10105.424675] x9 : 0000000000000000 x8 : 00000000000000a0
[10105.429986] x7 : ffff000076fa80f4 x6 : 0000000000000030
[10105.435297] x5 : 0000000000000000 x4 : 0000000000000000
[10105.440609] x3 : 0000000000000000 x2 : ffff00006f276040
[10105.445920] x1 : ffff000075633ab8 x0 : 0000000000000030
[10105.451232] Call trace:
[10105.453676]  atomic64_try_cmpxchg_acquire.constprop.22+0x8/0x34
[10105.459600]  ubifs_garbage_collect+0xb4/0x334
[10105.463956]  ubifs_budget_space+0x398/0x458
[10105.468139]  ubifs_create+0x50/0x180
[10105.471712]  path_openat+0x6a0/0x9b0
[10105.475284]  do_filp_open+0x34/0x7c
[10105.478771]  do_sys_open+0x78/0xe4
[10105.482170]  __arm64_sys_openat+0x1c/0x24
[10105.486180]  el0_svc_handler+0x84/0xc8
[10105.489928]  el0_svc+0x8/0xc
[10105.492808] Code: 52800013 17fffffb d2800003 f9800011 (c85ffc05)
[10105.498903] ---[ end trace 46b721d93267a586 ]---


To reproduce the problem:

1. Filesystem initially mounted read-only, free space fixup flag set.

2. mount -o remount,rw <mountpoint>

3. it takes some time (free space fixup running)
    ... try to terminate running mount by CTRL-C
    ... does not respond, only after free space fixup is complete
    ... then "ubifs_remount_fs: cannot spawn "ubifs_bgt0_0", error -4"

4. mount -o remount,rw <mountpoint>
    ... now finished instantly (fixup already done).

5. Create file or just unmount the filesystem and we get the oops.

Regards
Petr Cvachoucek

--------------B15CAFF0F05855000265E181
Content-Type: text/x-patch; charset=UTF-8;
 name="ubifs-remount-rw.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ubifs-remount-rw.patch"

diff -Naur linux-LSDK-20.04-V5.4-orig/fs/ubifs/super.c linux-LSDK-20.04-V5.4/fs/ubifs/super.c
--- linux-LSDK-20.04-V5.4-orig/fs/ubifs/super.c	2020-02-26 10:13:26.000000000 +0100
+++ linux-LSDK-20.04-V5.4/fs/ubifs/super.c	2021-08-27 15:32:14.573982594 +0200
@@ -1811,7 +1811,6 @@
 		kthread_stop(c->bgt);
 		c->bgt = NULL;
 	}
-	free_wbufs(c);
 	kfree(c->write_reserve_buf);
 	c->write_reserve_buf = NULL;
 	vfree(c->ileb_buf);

--------------B15CAFF0F05855000265E181
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------B15CAFF0F05855000265E181--

