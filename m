Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AA7C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 21:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2uWHA0Bs7Od0pnGV21DH8jfk+iuZqb6qi5dF6qYb+s=; b=11Ny6x3Y5TnQ3D
	H13lJzayXe+tDixlsjlXCCgFk20S4lWW3Gf/BI73r5iYgMAIWGjDJamL+WRRoWKFqtaW/knVme4qZ
	4zHplCKuCtkjBO59f5vmdqlO5xX3JO4Rr76gzx3D6DTJasFcTiV/KlCiTnnGoMcxwE2qk9lWXPHBM
	FRfX1b7KydRiM6JaMTTME/vSNiVbECn9dW7qqTC6UprqpePMMOSWOB1PQXHBf08tYXjbkejXtMlNh
	W7lgQGKWMDIVWFXY65/y3NxwcxJ5WCQ6NuLO38Eo0oPjunaXD0DTAv24rM35KL33A9TeY3ehY/ZRm
	pj2qBmmwifzzxn++Lk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJ2S-00000003tzh-27kg;
	Tue, 09 Apr 2024 21:29:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJ2P-00000003tym-0sEk
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 21:29:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ed5109d924so1898838b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2024 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1712698191; x=1713302991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lppOhDLhaTktGl6lazMPAeBs02NfwHMeHSnwbowOWTw=;
        b=dlMAfWDCTPf2VEPgPLCl1YxcPd5ts7wk537VRM7mO6vek4Z82BGWv0vwzbvsTU2wH2
         jJZXR5wNj8UJpZE9WHF2pjQ8o0g3gIuleeekkQPkjsuWm5DLyKelB1Kk1hZLUZxq3FIe
         CPn+ud7vTuaIap+uzw46nJ/6uPWrtWdvUX2crkE8Hxr/t6po+oMiSQw/vXK3hsYVq9PU
         twLDx89rWADKhgoLAqtIroUzjU2IMuAqHapmZ4n3PAiN97ztw8wiOGDNA/cSrbqtZlot
         x7ASzQRJ03v7Zr23vuXWX0/l6xoM3ePnOIBUbt0h/6U2EAA0OfN2+Dflt1+TltI7lsi9
         jFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712698191; x=1713302991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lppOhDLhaTktGl6lazMPAeBs02NfwHMeHSnwbowOWTw=;
        b=COG+SA1KokTd/lU2GfpS5OYGCzVvv6EnyYTOcExvSlYzUn/VMCkCIm0o4TQaDe9Xg5
         E8smGPn0L5CjaAT1F73+4okzSeGXeaQg4dpl8Pqbb5rwVgpE04cOkshFzUqmvN5hbyJr
         6iLbxK/dNEfP7GQ43dh2v9rrHoCOWhr+3jNYDSvzcm1c9nel7ONBycopnoX9qtErQqR2
         DM6cRcqtEEVfLYRsEKFgp8LEDjtxJjQqmECnGDIDzo9aSbWsX00pOKnOs1v4gGNwweqO
         6JbRQUOIq8uySZYEWAC7RJTlWXdZoTvCtSBbDdQTUtnCptPGQD9KUb5pXRHMFVoCcxdI
         IbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO41mfmTSkraWyV7F14X6N5fcbRTGs8rP6WkZbBwb6LkpA9XHXIHM8EueTFd2GSIyJEuFKYkplUevHfIfiwJE3heeF59FzJajK7l/CeA==
X-Gm-Message-State: AOJu0Yz2NZVRRfpXwr181b0dustfPAn8BCfAgbAGE/Qm6VNI6L0VIH1N
	eMJWR98WpNNHDvZ0E9+IMjCT9FYYqPG6tHT+HWKns0DYmlU8or7D9guULiZNexg=
X-Google-Smtp-Source: AGHT+IFvOqPyH50nuc2JACoXyF6q2DKJ9ivcnsRna4tGd1/cjZ8p4v7GhrD65qleDU/qtwwIyhj4CQ==
X-Received: by 2002:a05:6a00:14d1:b0:6ec:faef:dd28 with SMTP id w17-20020a056a0014d100b006ecfaefdd28mr932086pfu.23.1712698191116;
        Tue, 09 Apr 2024 14:29:51 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-56-237.pa.nsw.optusnet.com.au. [49.181.56.237])
        by smtp.gmail.com with ESMTPSA id x12-20020a056a00270c00b006ed048a7323sm8006356pfv.86.2024.04.09.14.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 14:29:50 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1ruJ2J-009xO3-3A;
	Wed, 10 Apr 2024 07:29:47 +1000
Date: Wed, 10 Apr 2024 07:29:47 +1000
From: Dave Chinner <david@fromorbit.com>
To: syzbot <syzbot+b417f0468b73945887f0@syzkaller.appspotmail.com>
Cc: chandan.babu@oracle.com, dwmw2@infradead.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, richard@nod.at,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ext4?] [jffs2?] [xfs?] kernel BUG in
 unrefer_xattr_datum
Message-ID: <ZhWzS47ZvqF2WriS@dread.disaster.area>
References: <0000000000002444e20615a20456@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000002444e20615a20456@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_142953_496055_EFC74391 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, Apr 08, 2024 at 09:04:18PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    707081b61156 Merge branch 'for-next/core', remote-tracking..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=1562c52d180000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=caeac3f3565b057a
> dashboard link: https://syzkaller.appspot.com/bug?extid=b417f0468b73945887f0
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e74805180000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1613cca9180000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/6cad68bf7532/disk-707081b6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1a27e5400778/vmlinux-707081b6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/67dfc53755d0/Image-707081b6.gz.xz
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/f039597bec42/mount_0.gz
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/b3fe5cff7c96/mount_4.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b417f0468b73945887f0@syzkaller.appspotmail.com
> 
> jffs2: nextblock 0x0001d000, expected at 0001f000
> jffs2: argh. node added in wrong place at 0x0001e03c(2)
> jffs2: nextblock 0x0001d000, expected at 0001f000

Nothing to do with XFS or ext4 - they are simply being mounted with
invalid mount options at the same time.

#syz set subsystems: jffs2

-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
