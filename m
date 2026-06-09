Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CA6CD8CA4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p+lWkBGExPKq+whqrEUKqTZdnmf0q1/M6kEK1sCbKRU=; b=kOuqdXXpkAjMQI
	/09jZnNRAelIGYVRtzrw7P0iw/Zie3++zlIFtQMb4clIXSLSbM1rw9Sg8+FFvxtMcaXr5p0GOZftz
	/C7ItvLccbVwEKawfKVxDLOyoYZloPlayY2TnreRH6kfugkawIbgKhHY/z+gw/a0YPuu/sbwQKoBN
	7iBDmA47zRdN5XzRbRhd7Xj02/1BAx8PuBS9cT3xMJdAg6ipBSjKNncf4Si3VrCNqKlcwgRg20uZp
	DDDG/8H14iRlOmzGafqi/raV1XgJLv+VYKb6DRu5FI7ZL8MgGBH8LiNFdqbKYeQ2Iu1TcTnWBPFpU
	aUTxwTZEpItr+Vn/3t5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5f-000000055yz-389Z;
	Tue, 09 Jun 2026 08:45:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5Y-000000055xz-0PJf
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 08:45:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso5201685a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994734; x=1781599534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmCbPgs8yv25f/ZGETdEDYYNUVdCtnNzlxSBu1CqcKg=;
        b=O6Wmt15d91rMzDd5QmwquRyVzfhWjjn6ryBmWYBt0zhe733im1JskM9tdaWhUjVVdL
         HSklmdX+yftVnhVoy5WsS1jx3CvEmojsqnU5/GsipYxacmZ6PMcdZoDfPo0XFm1rh4bz
         DqjGJwcMNgVxMagejP5YyQTkncuYZtJTgOonilHJXJLkVL0TBqDOCT4PXjdtA0A+XU+J
         JX7GDV9f7cw3jB+hOY8ic8N/NxkzlgFdiTCzdbqZ2480f9jhKDKmNRUdIn8o8SCwHVuY
         cj/g1wATnaNHKnkUk6KIQ+J5LhaAxWlKDexZAsVPpiFSc7jiIdITfuohvGDNDYWyzNgx
         DaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994734; x=1781599534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmCbPgs8yv25f/ZGETdEDYYNUVdCtnNzlxSBu1CqcKg=;
        b=GUP//h8kSwjAEmGjnDQhFfBENRfCMLkQzHdNTeDIwBnib0kJyw8ECVG4ckY6jZy3cI
         qeeZMGc7ojytQRwY3eVJIhVTzZ963JRKWHx47lQxH5uVTchi5u6gRR/eEgZnnaQ9LOVu
         V4Fo36uAiq5jDtwoA4hKkX9SnezY4VEnJCAygPzwDhUMa5lz1ps/82c+Bce4Yq50SXv8
         ygOLwtn8UFpFyeD9MaG/YkR0NFMbJ4uB+m9r5dwmBzW+pueDnejEkpa12BbyRArlpouh
         e8qGSAsnHYwVLRfGSf4A7UG5bHutyT6hIeTjwH2V65hFWbtXyZfiqbI3zzF9FzDs1q86
         YdBg==
X-Gm-Message-State: AOJu0YwV7QR4g3TLRW1ID5CLSehepTGugHq132PumZKq/uX9iTGckmq7
	RB2MAjK0g3ElrMB7A+uGrQbbcrbJ7Y7+U2xfOjFmNRKXdAL0TTmjPPGZ
X-Gm-Gg: Acq92OFgl1EE4Yev087oOQzI1oQQLhiwljgd3on1uuiSrXffiuw4KABMcgop/+QhFIE
	50hQ+91eq5J04d12OWmRJX9OCgJ50Zfv1Ohc19XQ9ThyCH2hGQbmxTl4eiFAGbXQT+EZ1gS7O5P
	vKEv/LTHbVR/slWZy9WB/jw/08usJx/LJz5WjFBv6b3rimMuEoBwme//yIGwV1ON9hdEBUn+2W9
	e0uyjxAitU1bIN8f+CpVYq3rRpB+UdzRXI5qpu9yXar/14mYKCLUwFM6bYxcwW/1W/PrKNWg9q/
	US3Hqj4dZ7+/AA6NjWoHGIfvOSObTq1gf1Q8YcXO5N7fVotUGpdXPDj3Wu4lRwCGhCNyM+WlMnS
	5IvXygyTYlBBCz9of7GN7OenPLGqvx7DAUbQtYjh+YoIk8fg+1msRGsep+UM7drdi57i70peTeC
	xzrzNYJsOxbKSQs0VT0jl70AAazjK40mV+Pb0xrb+VbZPybCZm/ffSxCm9oVcV6oeN
X-Received: by 2002:a05:6a21:a0b:b0:3b4:882c:4e0f with SMTP id adf61e73a8af0-3b4ccdfd8e4mr22833774637.19.1780994733650;
        Tue, 09 Jun 2026 01:45:33 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm17608599a12.0.2026.06.09.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:45:33 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2 0/2] mtd: slram: fix failed registration cleanup
Date: Tue,  9 Jun 2026 16:45:26 +0800
Message-ID: <20260609084528.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_014536_239694_40875BC5 
X-CRM114-Status: GOOD (  10.75  )
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

This splits the previous slram patch into a backportable fix and a
follow-up cleanup.

Patch 1 fixes the dangling list entry on register_device() failure and
carries Fixes and stable tags.

Patch 2 is a cleanup which uses local variables while initializing the
new entry and publishes the list entry only after mtd_device_register()
succeeds.

Changes in v2:
- Split the original patch into a fix first and a cleanup second.
- Add Fixes and Cc: stable tags to the fix.
- Link to v1: https://lore.kernel.org/all/20260608162939.6-1-ruoyuw560@gmail.com/

Ruoyu Wang (2):
  mtd: slram: remove failed entries from the device list
  mtd: slram: simplify register_device() cleanup

 drivers/mtd/devices/slram.c | 96 ++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 44 deletions(-)

-- 
2.51.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
