Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDBCC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 20:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0C7218A1
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 20:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuvjHZGn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BOoXzi1T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0C7218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zyOc2zrm9pwF9rFF3Phju9Is0dr5bu8n2wqX24DaZvg=; b=YuvjHZGnlFAptC
	PSs+S/jtSyeP3BtNBOz5PgoxhHJIPTL3anaw+V4nzunXnsnORLf8XMK3f8j99nkpbcsp6wCnXee7p
	a/raQSgg6pmmpIatzXikK+lGQUFOm13F4mbZnR0wZlU81PTJugeWTuOMSk4V9L93I5GvaE3WUvvZp
	Q30vtWhF5SyvDheRutdXQJ0/YtHgZC8fmovBNFXbNp1XA9ekCUMhUIkNJIA0QxSeoLmzRsl91BdlM
	jSStt1UyXu5reDnUig4PEj8XbSaMUto4ptIqzm9qwA3qe/D3OuRMC2yR6LVpo6Xst+rCLfzYnc6NS
	ra238I1UYu4Il5zWeLrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h748S-00084m-Vm; Thu, 21 Mar 2019 20:17:57 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h748I-0007uV-Nu; Thu, 21 Mar 2019 20:17:48 +0000
Received: by mail-ot1-x344.google.com with SMTP id x8so4739320otg.7;
 Thu, 21 Mar 2019 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/wxyUvtToomdZ+5Q9o+FQ/M8e4o6ylXXt1G7gXDkthY=;
 b=BOoXzi1TLXiHBJG+1HwL+ID2AnLv3oZT6PlJ1aORSU6oRHSSgjPMihc1eXyKPMdyD/
 AqFJYySnhXSr/0KJyrtQDtju9Fr248wnuBcTNenyPVOZ0PHV8QNzp2jvcn1CbBa6l+An
 GMsEqyRqcPt8vX6qgUAu9wZb5RYF6Ezu+PIvFDfPlByy+bkmb4Blb0cd9dqhuxowHTZn
 MTjTD4Bg8pQ9Q9xgazplzVmi36XlNjsp/avPctiTShRqAN8PfMdK3maZbLpXpzZCOXP9
 hrNEmNbrANp5WxgBJCzg9g832X4/sb7Ijvgq0pfVeoOJ2/arzBW23a2dvX/XrfcOvwke
 sHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/wxyUvtToomdZ+5Q9o+FQ/M8e4o6ylXXt1G7gXDkthY=;
 b=KvO/puQ+Ees2p2+iH3C73aNRGuVNZq+pAOZsKnX7rGZIKuZw2uSoeHAzSv56FJ3IQN
 ysd4RMVqKNPcS2nc7qDKt4cEeTnIVuMP3JzDv3HLagpbm5R0dN8VjgLyq+L039a9s99x
 IiFbCHh1qXrubEA9dlZX9jm7NXvO/EvnoW4/wLsr/O8ve1XKtXyq5UH48lpTzbvoQTPI
 f7jfH2Q4K89+dRcRntH0wavjPR2dOjjk6hV4uHht8t/ltWGYSbrCeB0iyOCSw3Gyj8QC
 PboUOOhkGjAPw6PkkroEDSoli97HBn5f477j6Y06EAQGS3lACaEIL8WfIccuTIMFydW3
 X73Q==
X-Gm-Message-State: APjAAAWP7HzLm+uc9LRj/h2AA35w8abj2k5ll1ohSljUywhyhWmQrJum
 CdTgOzo3ckVcM09Rp+kcdk+1ztx7rWWSJDTCEhM=
X-Google-Smtp-Source: APXvYqwUYsousOMTeeL8c+A2HnTXT2l2mWYx2JCiWrVy/yAmVWlPJppOWrh94pnxO/J9vbn6442DXbT8N9OeaM9xXRs=
X-Received: by 2002:a9d:5614:: with SMTP id e20mr3932876oti.348.1553199465574; 
 Thu, 21 Mar 2019 13:17:45 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Mar 2019 21:17:34 +0100
Message-ID: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
Subject: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_131746_806897_D3F53643 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: mhocko@suse.com, linux@armlinux.org.uk, willy@infradead.org,
 rppt@linux.ibm.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 linux-amlogic@lists.infradead.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I am experiencing the following crash:
  ------------[ cut here ]------------
  kernel BUG at mm/slub.c:3950!
  Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
  Modules linked in:
  CPU: 1 PID: 1 Comm: swapper/0 Not tainted
5.1.0-rc1-00080-g37b8cb064293-dirty #4252
  Hardware name: Amlogic Meson platform
  PC is at kfree+0x250/0x274
  LR is at meson_nfc_exec_op+0x3b0/0x408
  ...
my goal is to add support for the 32-bit Amlogic Meson SoCs (ARM
Cortex-A5 / Cortex-A9 cores) in the meson-nand driver.

I have traced this crash to the kfree() in meson_nfc_read_buf().
my observation is as follows:
- meson_nfc_read_buf() is called 7 times without any crash, the
kzalloc() call returns 0xe9e6c600 (virtual address) / 0x29e6c600
(physical address)
- the eight time meson_nfc_read_buf() is called kzalloc() call returns
0xee39a38b (virtual address) / 0x2e39a38b (physical address) and the
final kfree() crashes
- changing the size in the kzalloc() call from PER_INFO_BYTE (= 8) to
PAGE_SIZE works around that crash
- disabling the meson-nand driver makes my board boot just fine
- Liang has tested the unmodified code on a 64-bit Amlogic SoC (ARM
Cortex-A53 cores) and he doesn't see the crash there

in case the selected SLAB allocator is relevant:
  CONFIG_SLUB=y

the following printk statement is used to print the addresses returned
by the kzalloc() call in meson_nfc_read_buf():
  printk("%s 0x%px 0x%08x\n", __func__, info, virt_to_phys(info));

my questions are:
- why does kzalloc() return an unaligned address 0xee39a38b (virtual
address) / 0x2e39a38b (physical address)?
- how can further analyze this issue?
- (I don't know where to start analyzing: in mm/, arch/arm/mm, the
meson-nand driver seems to work fine on the 64-bit SoCs but that
doesn't fully rule it out, ...)


Regards
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
