Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D0C25B7C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WJyEwbtc0W/uJl+0Jzh4DUUr0v14hR3FTs20Bn7ZSQc=; b=EEJ
	HcPSlzoPMrMM59UeR7AntbSdZl3JjcOHBy/x+Uixmg0G7jz+Pax+t+YAKPbKUAqHbRPAQthP3J558
	YpKGhOmcu32p1IBVWDasVqUOpFHFPOWUzt0KoUB4he+b9Th7VoiH973ZZKmOKsd+BTzbjXDFL/MmK
	b3YeMZ1tiNtNt/eVNooQ0EHU6QfHPiFMsDH1IxiOfWaeuvNFFkvEoMWZVxh44g7hk7vV0CpdvFTdA
	/nKtgDLsznsq3ZeyOXcxonjYefG7v/eEeJjZfQyMJI/7O2mMyFcECABPW3cTGnm931Rv85LavsIlY
	n2ORdhDBd9gjIGLRNSvkMPaJUCdQQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu8I-00000000EeK-3cb5;
	Tue, 28 May 2024 10:32:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu8G-00000000Edj-0fX1
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 10:32:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-529648cd69dso783526e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 May 2024 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716892355; x=1717497155; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VoT1uoy28kMc0kK85lK0e8hkQ2fA1zp91fLjG0p30Yg=;
        b=YdMlPy3Hd+KfoNjj77M/qeB1BA3cZN+NHo/vRNbgtjZiHdza0Q3D7lkSt0E34/fsv1
         z5FiSJ8F5PgsU9pnha1M+7L79nzHbmj/tbw3O7mtEt4S0N3Ot7naBzk3UPsGrVn+wrlO
         SK3LhMEep89Da6XlUQDSO57sJ5Db8IlPqfsB5ZTSbKC38w6tj+JPDhetpA5PwOqshAHt
         YswUsszEgqvt5+hCPCfc7YmA/8UOQHSP+nw6hcdl39lR1kcSApuFD0Jnwmz5UwhsifTQ
         LaxbKmc3sHKiCjJ9hnBPyfNt8fftpiXhVcmsLDGIQNcJdB2gAmvv1PraJ6oxb2scUdI0
         LwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716892355; x=1717497155;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoT1uoy28kMc0kK85lK0e8hkQ2fA1zp91fLjG0p30Yg=;
        b=SB/HWodjSf+m0vq6pE5HCXPRxkUpXtokAY0fiXCfP5qTa5Hz9EmMZ2XNue+vG7tt/R
         V1rSxVO1fkZROeM0nUsNHc7obbZ7UgQJI/b3kMzeL+rdgdhdNhxp4nJWVIK4lBViFMgv
         m3t3UNiZR89Kd1BsN+Ef1yTkdL/wm8mjv8P4pQgxMR0jmdH4RiKltXPqoThJ7In8u9mo
         84pPwRqNENiGWw7JXnmKxLpmZH0QD+Td3Y38QfXarD/QT0qhToEl7wKX/8LBFvlo2l0X
         LSfHcc8vEAR5+01r6ijdAZRCFEkorMer83uU1MedtJ3xcHsWIm87FX8zFQx7/+ZKEA05
         SXdA==
X-Gm-Message-State: AOJu0Yw6uHVHiydxpFAWYPxPFTP9V/vPHu9g5ZHOP+CHQt5YOWTude+h
	2Y2FIxtoty8uoqJC7cftfPFhWtx7KfIrXpQ7HTlqkLMTdyulVxaWO12lCLBSW0fg0grbNeCshgo
	1ClIcxkRG7Ggt7dK8OrTUaKGiojJ/CzKd
X-Google-Smtp-Source: AGHT+IFwijUtkIgcFiA7182tNoANL00NIKs1b87sqRGv02sW2lK/d3Y192BaSTiESp1ZXQ+d+WLwWrSg4PLxQasGYFE=
X-Received: by 2002:a05:6512:794:b0:529:46e:b2a5 with SMTP id
 2adb3069b0e04-52964eac45fmr9855484e87.2.1716892354560; Tue, 28 May 2024
 03:32:34 -0700 (PDT)
MIME-Version: 1.0
From: Mani K <manivalaguru@gmail.com>
Date: Tue, 28 May 2024 16:02:22 +0530
Message-ID: <CAGhZNMM8DpbuKX==XrM_xBYuL4S5VAgezSupGN-FHd+ENq+ang@mail.gmail.com>
Subject: UBIFS Recovery Process on Power Cutoff
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_033240_224807_423A1F47 
X-CRM114-Status: UNSURE (   8.64  )
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

Hello,

We have a system based on a Custom ARM SOC running on a Linux kernel
with a UBIFS filesystem maintained on NOR flash. When the system power
is cut off abruptly, we notice recovery-related messages when the
filesystem is mounted. This recovery process takes additional boot
time of 2-3 seconds.

Here are the log messages we observe:
[    4.411551] ubi0: background thread "ubi_bgt0d" started, PID 586
[    7.191406] UBIFS (ubi0:0): Mounting in unauthenticated mode
[    7.197659] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 663
[    7.212730] UBIFS (ubi0:0): recovery needed
[    7.951546] UBIFS (ubi0:0): recovery completed
[    7.956280] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "app"
[    7.963620] UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB),
min./max. I/O unit sizes: 8 bytes/256 bytes
[    7.973226] UBIFS (ubi0:0): FS size: 15828736 bytes (15 MiB, 242
LEBs), journal size 2289280 bytes (2 MiB, 35 LEBs)
[    7.983874] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[    7.989827] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0),
UUID 00000000-0000-0008-0000-000000000001, small LPT model

Is there any option to prevent the recovery process from happening?

Regards,
Manikandan V

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
