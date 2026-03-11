Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB21125806
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpqHpYhQBTH1iNHZivpLf4Vi59m5I38DC6RRpJnP6ow=; b=43pmLLSP/+7CrW
	8OMh4iimUBOYSVpqT113CtZF1GkMpszhO4Okdv49tx1KIMagi4cQyOYZMIgHLXO0S52h4dqFEQlF1
	xzKMdonaVbjiKO13a6ppTSDdrWIGAOOt/JJRc8sVmwHZs1MGkf6YnjsNq9JttXu8A9hs76kG+NMyU
	dza0M4lt8COdFFqO6QYhVYrpKIUFrTwEf6qPVg9hdTOsUsHLpNt2s8hxsBVD28KITUHi+ZYrntA1M
	fIQ++6uAqqbAz3ZhMeVEs/o9P4guKmparnVJNcK7+oBaMsbtFmDAzBttPo9VtOIEXr8LrO6rvoP+k
	UXwR/3MKNDLNpRq27QOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JWb-0000000BdBd-31X7;
	Wed, 11 Mar 2026 13:22:57 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JWZ-0000000BdBC-2ozF
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 13:22:56 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56739adfa1aso10529676e0c.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 06:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235374; x=1773840174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=eGxdiKADI431AsC9GTuGo+Ipelmc749qgutnj+ZyoyTYKUqSztWh0FMckYuVBK/mJH
         bTlhitxXvP15UkPwT2X1WtyzZvUxDxv96Wys/w+wquJFISsTqHbDvRV8tZnJCCE2bwPf
         2wyNw7BJgK7LMYh7UybAWHV1PBB5V8eFkjCi3zR10ch5R8jXaHV9UM97+IYaM7IgI43y
         /4xfAwJOf6kTi8MahtMvXTas3P+QwAZGMm4zH4QZkWRdiSJ2YvWrvsHC8E6sTjuvH9Ff
         9Iyel0SxzYMccNWxWf7UoUyFVxO5cAwKSiGfSO3jy8ophxElm9vS0n1QRtUqJt3SkPbg
         WmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiASpS6wggQBOabOE4tqoKMjQ1YM3XF7q5xz55yoyEaMlnWOGWXxrAFmIj4uFFhHavbfleKO54F+I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxey+jE5Nk81PJxnWD4lYcJM1nvmesCayYr3hlx1wyiKWt7XfkE
	NBx2N/KyZywEFZXH+z4XpuR1NGRoQNiUdMurXXEVtG5dg31LYRUT/SqYkQxD5Mxw/hw=
X-Gm-Gg: ATEYQzyj10sPkcKRfgUZoik0jVZuKJ3k7j81gJDo6QNg1xwQg2mm1jKaiLVr6iGt7+g
	JndlwFyxkiWOg4saiRkB11cVs1Ard2k10ZQmJ4+u8BIu9yewxyfTIixUBH8+uh/8kOaruDdwR7w
	Cfc8jyNNgTTXZZDkW8MQRPTeK8YsVByMPXfvQFQYtWV32wVL1prrlUQ1Q9mUuTG3gYLokSV+tL6
	vDZbILeqwWEDsilHaql5X6+SQCUcacWgdHkyuOtQuKPwkJnei/YMh6KAtYRRHK4bJip4vZl7jGU
	vw+cXacD+wBVpA/1uiCUFM/wiXGaKnxBAQo/opx/X+FrbplpEX/1pVYTQzrHHp2cLu8KX3d59ko
	C6zuMFbt9EEww8ORXisTkcCCPzdrFDP6oQfveOI2f2zHZbSWKAKpGYYheqk9rOMzObDcDNJALG2
	ErhaafDwJPn0ygt7LICrgMdRMUIv8+O9RDJIXo3pVX3S8kcf0i8z1PPj24pol+uad/
X-Received: by 2002:a05:6122:17a8:b0:566:cd52:313d with SMTP id 71dfb90a1353d-56b47667a5dmr942975e0c.16.1773235374206;
        Wed, 11 Mar 2026 06:22:54 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b46311ea0sm933141e0c.4.2026.03.11.06.22.53
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:22:54 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5675d609621so11791751e0c.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 06:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJrgn6RL27/0EZIDganu2NsikT9v4TQtth0IEzg0naVapVp/8G16yS5W90Gwa+kOV9rtxWS37YRFM=@lists.infradead.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_062255_712934_BD994967 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
