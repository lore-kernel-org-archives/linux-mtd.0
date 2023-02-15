Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA6C636CC
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RCLmA66qcEnh5OZHOOA/x7sGL8sxnQjDHwjJ7RSHYzE=; b=IBP
	d34uiRZoPoCSEJsL0LAvTRrM2O2W6NTnUYhoezPT2IXpYybDcKGg5uElHTKb8HbHZrTjC7ZYEsCBJ
	jDq2yyLbvh+VA3myR7SrvmKpjSdtyEJkJWVmoF6jeBARbJngTfky/A6NbK4rxocdL0pSThx+JW3KQ
	xQ9ZyODUOT/kWJVYOMNzJVr+J1SRAm7Ou418r1quOYSMHG+PX3tmX3/Fn18bkESLQbfCKZI7XBnFl
	nY1ds+V/8gGCvMdLylvSVEXAdrPcGpe4FFoiG0ZMMPpyEPTVB1U2HaZIA2h4wKxw8K7oR9QHQuMd+
	yH355Dqki5PKPD/BK1RGesMV5pNhNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLiE-006ikw-VO; Wed, 15 Feb 2023 17:36:59 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLiB-006ij5-45
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 17:36:56 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id k4so20629498vsc.4
        for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2023 09:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D/KbAz5FeBvde1DWwl9iOIWYjZFr9YJ9qIF1/orABb4=;
        b=cYriOyhdNuA2EoNNZXNy8xPtjOPisuyaTfco6+x0PjLBbTswJBsYT4Fwt2qOSWPO8P
         dGFe0Wy45dR2Ls/fygoyz2AMcyfuBs69+rPHB/9WlL/Gk7hucnCcHOaEr+vBxM9b9JxT
         R2icLxUhzRNM1iFWGmGvoB2yT6U9Fwk7fQDojLUQuZXvstlbNTWDFDyAy550jzB5uYuh
         /jBGmeATOLlD80kMZZuX3Rm8LcIjjkMP+96z5OrEr4n6GU+lpccryZdLrDaxXK2HZCjN
         86Jj4niv0FnG0A2l0lyqMtIC969ym85sc2EI8dcOYDwjKL5y8gTBNQ7+ucfAeNlS8Zeg
         t0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/KbAz5FeBvde1DWwl9iOIWYjZFr9YJ9qIF1/orABb4=;
        b=rfQB2NN2UwAIUFScredWqf7uvLzQuPfqEt4K5pf+bY85oBcsv5BEOrte53rPG7vGW8
         9jHRCxvERPNjtZ5HED1U5MxX6WpMiwsviz4N5jpyP241ak4S/9B+/a581jb3WyQBmavx
         /2B35YMdH6AKZfo1rfpxlWCOXW3+nafgVFxrXeiaWR2Zin1tmdecqJbA50X7AOLosB/5
         9M9YCWv485k9BVUY40F0PLXvmECYjNgYCLUz15O+b9rK88VsIWhfZ8HzuSsoj12Aj/7u
         wkAWeLFT3LnUa+CbvExoB5FZQd5payXZo5+QUVSEm38Dz9/4fsmxk8ofZDpw0mhlNLFF
         C42w==
X-Gm-Message-State: AO0yUKVVmE653CFBcTDEyILt6TtbfrmTdFuBxm6mXZ5CDpyziAkAWitF
	D9gxPyMTjYSUpqL/MmIIUOuMjqPjqgMCLZURV4o788Q1de4=
X-Google-Smtp-Source: AK7set9t//t+6BdnqgMCsubhUnUjEi3iNV6s16IQ0BY9MHTtCZkXx9TuWw2aBnkLQElmbsc+smedsNFcrl6WEVmSZQo=
X-Received: by 2002:a67:ef41:0:b0:401:57f8:7c18 with SMTP id
 k1-20020a67ef41000000b0040157f87c18mr534314vsr.51.1676482611590; Wed, 15 Feb
 2023 09:36:51 -0800 (PST)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 15 Feb 2023 23:06:40 +0530
Message-ID: <CAOuPNLgTWNMSaZmE4UzOq8UhsLWnBzyt0xwsO=dS9NpQxh-h_g@mail.gmail.com>
Subject: 
To: open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093655_229049_BD5A6C11 
X-CRM114-Status: UNSURE (   6.50  )
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

We are seeing below "ubi errors" during booting.
Although this does not cause any functionality break, I am wondering
if there is any way to fix it ?
We are using Kernel 4.14 with UBI and squashfs (ubiblock) as volumes,
and with systemd.

Anybody have experienced the similar logs with ubi/squashfs and
figured out a way to avoid it ?
It seems like these open volumes are called twice, thus error -16
indicates (device or resource busy).
Or, are these logs expected because of squashfs or ubiblock ?
Or, do we need to add anything related to udev-rules ?

{
....
[  129.394789] ubi0 error: ubi_open_volume: cannot open device 0,
volume 6, error -16
[  129.486498] ubi0 error: ubi_open_volume: cannot open device 0,
volume 7, error -16
[  129.546582] ubi0 error: ubi_open_volume: cannot open device 0,
volume 8, error -16
[  129.645014] ubi0 error: ubi_open_volume: cannot open device 0,
volume 9, error -16
[  129.676456] ubi0 error: ubi_open_volume: cannot open device 0,
volume 6, error -16
[  129.706655] ubi0 error: ubi_open_volume: cannot open device 0,
volume 10, error -16
[  129.732740] ubi0 error: ubi_open_volume: cannot open device 0,
volume 7, error -16
[  129.811111] ubi0 error: ubi_open_volume: cannot open device 0,
volume 8, error -16
[  129.852308] ubi0 error: ubi_open_volume: cannot open device 0,
volume 9, error -16
[  129.923429] ubi0 error: ubi_open_volume: cannot open device 0,
volume 10, error -16

}

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
