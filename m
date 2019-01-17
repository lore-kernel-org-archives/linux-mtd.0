Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353BFC43387
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 20:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0003420859
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 20:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUodLC5n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF39qcHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0003420859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ocSQ4lnBXNwnnYGziWettt3GkmqEAf4PXap9GZnNLo=; b=hUodLC5nSwWLwn
	FfG1kYx4InFUcuJdEpWdyN3VDKqLgb/vSGfSoYmUaiW2jiI/vohi5vcUxaPBxAOva4wEF2wrwz81d
	Bk3TMg/eHb8MMNTULYN6X9MRjD196jneF7Qh/0meWpeWgbrBSa567xfFYfMb8se6CrWvZz1mTVggJ
	cUj/3E+nix0EajdQEhKT3qWKIddM1/tHjr4Y17qjhxjycLgX0iTImrzMDOfwj5QUosEiIILHU0/Vc
	93xXxJdI4dZWC/0aa4UyfiNtDwIsDmepqxh9vBsqeHgv6oH8ymgOVafzjK3JjhWa6gcYsUDBGhTWy
	xQJvXISd9b3UtDG7P4xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkE5U-0002he-7g; Thu, 17 Jan 2019 20:16:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkE5Q-0002hA-3A
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2019 20:16:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id c16so8789291lfj.8
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2019 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=extqXWphiYmhUmCZ4Wm4zERC8vJAc6Gmd+medFIf0MI=;
 b=ZF39qcHolsqO3lgMLh5d9iueLsuVyT4OYJoFnRNK/9QFUF5Sofl5imR10BAYZypyEr
 3cIyYogQ9hgvt1k2JckLqTN2z/rKd8JXTlbblEJ1PvI9kg1Cq4Z13G+X6Hq0feVOZ5rv
 i6XiVVu8mE+0YHQLB9DP3e0B9462JhstT80U8RJJG3bUNlz8aquKylyyA9BaIvoXNILd
 oucxZE9AVN/JHwNET/rUA9QkaAaZBo2UFK6k5DGWuKYUj5Amxi+JTfHnXCrMTFwJ8Esg
 trglG2gMTXMCmGgvX4d5dz0DrkT/bXvjaC+8SYe5TbhyCm2FP0kXTjuxrbDEpc0mEDap
 BXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=extqXWphiYmhUmCZ4Wm4zERC8vJAc6Gmd+medFIf0MI=;
 b=RW8CkzYSqG0oTd9Wt9hPH07pyGsvi8Fw+feM70tcGUdA78QF0lxS7La//xnS6jIKMB
 Z49wyKrf3HxRcAByMeMqe/rBIAGo8/4X2RZPZmPvvV9V6Vkr5Xh2UT0tUmPL6NcSBZ9h
 fDmJ5JekHto3uPhye6XWzd6XxiCxYaQOscHpv4momLbDc6O9AcUEWr5AezedCdbqYGuC
 RnnhQJv2q2iHXGZfaWPz8BQwZzET0F0RiJqsmyBhE5kCQ5I7Uku2N5GgyuKSr2Iv7AbC
 k7QQCIoyF+XFVJKdQ8b9zlnrdG/ML9G/HgbYjHGeOz2d3HWNThsaMKZeMzclPG3gvqOu
 H8aA==
X-Gm-Message-State: AJcUukfD+PGwLSoyeqj/39kAOD1bcKltoPAaFtyYe2yZcNaHtpKM+9Q4
 laLkuCKMxfgzh8rJebyec2YUr1+9
X-Google-Smtp-Source: ALg8bN75qgF7hU2Ag9Gl5alnXkJxBmKJKM9kv6OR+aORtfBzSQGMYqs9fS99oHJPrjL3wyUljPgJFg==
X-Received: by 2002:a19:2d16:: with SMTP id k22mr10772519lfj.12.1547756180850; 
 Thu, 17 Jan 2019 12:16:20 -0800 (PST)
Received: from [192.168.75.106] (staticline-31-182-180-253.toya.net.pl.
 [31.182.180.253])
 by smtp.gmail.com with ESMTPSA id d2sm462172lfg.16.2019.01.17.12.16.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jan 2019 12:16:20 -0800 (PST)
From: =?UTF-8?Q?Marcin_Krzemi=c5=84ski?= <mar.krzeminski@gmail.com>
Subject: VIRTIO iface in mtd
To: Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Message-ID: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
Date: Thu, 17 Jan 2019 21:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_121624_889059_80885CFB 
X-CRM114-Status: UNSURE (   9.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

recently I have spoken with Boris regarding new MTD driver
that will use VIRTIO interface to communicate with Qemu.
To specify how should this look like exactly I am bringing the topic
on ML.
My understanding is that this driver will use VIRTIO to communicate
with Qemu. From Qemu side at the end there will be a file that will
simulate NAND/NOR. Is it correct?
What use cases do you have in mind for this?

Bast regards,
Marcin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
