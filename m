Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9964C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vxRDQOVXwOgI3Sa5RRjvvZfPRMFnc6Tj44oaCAqXim8=; b=nrT
	X9zUDxmLcGsexVUUUlWWQ1yoWRNnaUBfAX67xUMdzbZntwQaxXkHbTRph6SM65nPWCfe/8l+uVf/q
	fwIsi3cTk0WvtawUVcYRuapDw6/6XjOxNeUraFFyOdKVLRJw/TzJRrKBXWX9KmDX0BBn3ifzNe3dJ
	VzeLjNTnT46NwFqX71J8mCJ9/Nvmin81XWVuvL714mQSMGjXz8/yMbeGIuMSA/BDeZgIypP6E7NB3
	C8C19TgPUm3owKu15CavQNNhsiaXK0EuyI8cNf/Vc+RqRFoWbNlTE+/T+AICPTSVfGPBArNXhINzg
	JKtpaHaxdKud1x1Skk/WKwp6hn7Cqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2cx-004aUI-LP; Fri, 18 Nov 2022 14:46:00 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2cr-004aMp-3o
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 14:45:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id m22so13499903eji.10
        for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2022 06:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tRR+6Ow6WpMzvdBFJwiz/dtSoOgX37Usiy4TyF7eNG8=;
        b=K9oGbPn/HnVddmldFDTn/bT0xB8kJ3zzQ1Qb6wHaTPf25z/yLIbKFHZXDUob39lfES
         Ytc5zxHu+yN29Au+vgMFJAioBrNCWpPrlNW0zgPJ58DsnvdWwzSI6z7U/+Soaf1mqeUx
         JytbyRnOjh2KlM68urrHu6TQNLaXiKx/3VRAgvIWrGLerWYsDTC1/KzgMaN6jIqzYCNl
         9ok9jW3b+lqnyrbA5HkRW6Ski7k9P/MUN9IigaIhC5eqfZ+lNMdYp9B/G1WwlmiaRRHB
         //7sxteTR2OuitwjKX5zH4yAiGFydNoBAisNN0V23Usalm25lPomWgPtLXPogt585G4c
         VHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRR+6Ow6WpMzvdBFJwiz/dtSoOgX37Usiy4TyF7eNG8=;
        b=24D86jDyDxhkOMBzrRYCTIQAdRRXz7fabq9GBIy2mojb8qTy0pBRr2OCXxxiRiMsFM
         zrbIIoQ7nxR5IbPA1Yxwu+fwjXtBjepeFgVK0OcVDerMYEQsVMTl4QFj+yCtI+CnAkMz
         vpsl90bxjz+a3WN0Lgvh3+sos4C/eZyIzwmL2wQ4ROSyBUQQolELSWO1PhjnS6LmHTvk
         odYqAI0w+4HVakEIQ1wbDfWOyQZZZhF/8sWCUNp/4DyYl/IcH7fyxVMZOr/4WJ27yFDR
         PNcjHTpDg3N682Ovblm08jZdK8CLRpI4/x+Bhs7gB5EeqQbZIH6IT2CjtAerBN8m/clp
         A0Vg==
X-Gm-Message-State: ANoB5pntjnMpDOWSmhsNn8MUy7ixKB0KGIgoxh3w/LL5KphCWcw5Vq36
	lKtmyqI02pMLQraBqs6JqOZtVipXrSc6ThBw03X4nkEdd6k=
X-Google-Smtp-Source: AA0mqf402ZjX8W9+UJFypCRNCoF2CvRdX0lH9NdfS3zbyd+0n7r5cFD2cKiQgqeby0JntTSHRrPoVVBKidDGEx2YIp0=
X-Received: by 2002:a17:906:b12:b0:7ac:baef:730e with SMTP id
 u18-20020a1709060b1200b007acbaef730emr6042449ejg.691.1668782748378; Fri, 18
 Nov 2022 06:45:48 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?0LDQvdC00YDQtdC5INC60L7RgNC+0LHRh9C10L3QutC+?= <proga08@gmail.com>
Date: Fri, 18 Nov 2022 17:45:37 +0300
Message-ID: <CANtMH_=9gp2OD5b3fjLuoar3soKx9Qz3g_iFaLfwCb6Rd7WwRw@mail.gmail.com>
Subject: UBIFS: failed to read inode, error -2
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_064553_214518_D017FA28 
X-CRM114-Status: UNSURE (   6.43  )
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

Hello.

I encountered an error while working with UBIFS on Toshiba
TH58NVG3S0HBAI4 NAND chip, the kernel version is 4.19.78.
The following errors appear when trying to access file named
"SCND":
ubifs_lookup_level0: UBIFS DBG tnc (pid 906):
search key (8593, inode)
ubifs_lookup_level0: UBIFS DBG tnc (pid 906):
found 0, lvl 0, n 3
UBIFS error (ubi0:4 pid 906): 0xc01fb7b9:
failed to read inode 8593, error -2
ubifs_evict_inode: UBIFS DBG gen (pid 906):
inode 8593, mode 0x8000
UBIFS error (ubi0:4 pid 906):
0xc01f8819: dead directory entry 'SCND', error -2
UBIFS warning (ubi0:4 pid 906):
0xc01fe39b: switched to read-only mode, error -2
The file "SCND" was presumably broken because of the power-cut
during writing. As a result, the file system became read-only.
I'm setting the file system to read-write mode. I'm trying to
erase the corrupted file. But this (like any action with this file)
leads to the fact that the system becomes read-only again.

So my questions are:
1)Is there a way to repair UBI filesystem? Perhaps, some sort of fsck
util for UBIFS?
2)Is there a way to remove a broken inode?

Thanks,

Andrey Korobchenko.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
