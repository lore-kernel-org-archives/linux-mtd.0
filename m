Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0513CC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h77/cja6udf5xwuN4WiVufEfAaNCccvmDzRLb36hQr4=; b=0HD9MAR+zaXiQ0
	aejJXYqQQH8Lao6Cb/YVu8l6h+nxNl0SnQqULPpAALhZIiP1xAZE1yuQ+mdFWldXDg2uZ0i6XaMhP
	vOh8MbPlDzgR9jiCOL2fdRYW5lwfHl7jHn9wQrt/klCwh89rxOQa0Qsn2JYcXoU8G79xgtLnAa4Qt
	Os1pRPFouy2cduHbCAGA+5hUoHPzY8c6M9Ip86E+xqAmIDx6keLzN2BmNmR0i0dhUoazxZXyOU+Vz
	AwxWLKcTSrzVWdhjwPj/FPT8iVUXQyX9Vl83d/rxnXckf5VBMk32zuGIYCMyaewvwfEbdqcN0g63b
	AhGrwmZBXlV2NnsvXLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQLg-00000004ojM-2zjQ;
	Tue, 18 Mar 2025 06:22:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQK2-00000004oYc-32Pp
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 06:21:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so3079808f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742278865; x=1742883665; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpu53nh42i5pf5ZgjwfUkqGTj0+7zcXw8ix0nx7M47Y=;
        b=qZUjbdBPNKEGTLIPsT8sL2QVa2q5iBDALIy0QYTr1AcIwm3Y3FA9U1h4+fU9tzK5q1
         8l/LhUhS78so2GQYWEz6DPwcTlO1LOUC6Tr4DyhZ63dYPLLKV3qYsYnOKt+QioDZ7JAa
         vnc0lVvYFZmWXOUIVyVogFIrN/ff/tuOvbuC8QBTARTIlzrX5NPheiQVvqdjrURoVFhx
         fSyY/Ea23W5Bs8VxAIXG0BRstmFTB2SMcXdDPeevrSDA5Y9Ivnk3RBj3XC9jCdD/m9dq
         oPWg5c63XB4xotWnO+ZB6nIPnubU3LNKPjnbBwMdDWUdwNftShXBWSii2FoAl6RpIXLU
         Uenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278865; x=1742883665;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpu53nh42i5pf5ZgjwfUkqGTj0+7zcXw8ix0nx7M47Y=;
        b=wW5lWDaUI73G15IUIx55NWQHLd+ywaDqnXraLC05qh+dJBNf83YC9z85gFpfLrVoRm
         xIjhkbray1/RihWG/ZqObVWu7hDNrZxs7WHF55xvM/Ie5x2ENLnj+Y/Rg5ioiUAkKEDF
         hk6ClejUNxBSCfkThPctzMxxzBXmM87bMYXgbrPYQFln4u7B/ARI83OO3Ld4vvF1LIbQ
         0AyUDi/lsl0l1FCtg1hZTffS5M5onPESS4/n5OerHgwXrbUetCgWMDOassN0H6a/G2UK
         Dosk1dq9oVn2qIiVW3HdndsmTeaHzHCck6BcKhuOFks0oyponK19iK6o0ublJrshj3tq
         6gmQ==
X-Gm-Message-State: AOJu0YwOu1SCZb/JQe4coPKl7mORNQuyUIM7NFZ3j+7nkgwvdzgMgUON
	BbIs/O9GcTmu4iiKlPGbPRAU/XWJ0gA37mD9QNTi5gBnpYC18QImiHXQoKdHSd4=
X-Gm-Gg: ASbGncvwsutpSI+f3oCjYGbLF9/tqf7O7hpB/dbCXKjrpfcPKsxlFJEGTquh3EGHC6e
	CKODnXX4U1oI4GPodGohdDfEBwNUbC7oZNgA9LC5aLkLjQp4M9VG96ctmWjP09ilF7wZcLGC/Ru
	8KTR7q9jhFUkHC+yUCPGW36PwRYEmqUJLouYvPyCrYLbVwax9kf68H91k6ypXlsY4zw8T9JqNe0
	xjkStIM6MDHW0TNd4Jr4bqxeQvTziYMYZIKQbIyH47tdUP4NvK7ySy8GAbjkTvqm9hP7THKj+bH
	bMcMPYASWlW07ddgglAMzVDXvc8HiT5HyGZZ7CiU2gklwaXwzGJmqg==
X-Google-Smtp-Source: AGHT+IFmV8ri8McgD8SuHy1n7IpZVLiiv0FTWkc+zIL91pEGCeh4L4Esr7mc76X51YGKfSvE+jVJpg==
X-Received: by 2002:a5d:47cf:0:b0:391:42f2:5c82 with SMTP id ffacd0b85a97d-3996b446d67mr1853456f8f.21.1742278864982;
        Mon, 17 Mar 2025 23:21:04 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda30esm127226495e9.5.2025.03.17.23.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 23:21:03 -0700 (PDT)
Message-ID: <b4a5c030-e8af-4724-a0aa-b53f7e08f365@linaro.org>
Date: Tue, 18 Mar 2025 08:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>
Cc: "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] mtd: spi-nor: changes for v6.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_232106_774290_AA038336 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi, Miquel,

Here is the SPI NOR PR for v6.15. We'll try to have it a week earlier
next time.

Thanks,
ta

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.15

for you to fetch changes up to eec373688d91f7f8988702e36d4a0e07b8e782b2:

  mtd: spi-nor: drop unused <linux/of_platform.h> (2025-03-18 07:59:43
+0200)

----------------------------------------------------------------
SPI NOR adds support for few flashes. Few cleanup patches for the core
driver, where we touched the headers inclusion list and we start using
the scope based mutex cleanup helpers.

----------------------------------------------------------------
Cheng Ming Lin (2):
      mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
Program
      mtd: spi-nor: macronix: add support for mx66{l2, u1}g45g

Miquel Raynal (2):
      mtd: spi-nor: winbond: Add support for w25q01jv
      mtd: spi-nor: winbond: Add support for w25q02jv

Tudor Ambarus (5):
      mtd: spi-nor: sort headers alphabetically
      mtd: spi-nor: use scope-based mutex cleanup helpers
      mtd: spi-nor: explicitly include <linux/math64.h>
      mtd: spi-nor: explicitly include <linux/of.h>
      mtd: spi-nor: drop unused <linux/of_platform.h>

 drivers/mtd/spi-nor/core.c     | 77
++++++++++++++++++++---------------------------------------
 drivers/mtd/spi-nor/macronix.c | 31 ++++++++++++++++++++++++
 drivers/mtd/spi-nor/otp.c      |  1 +
 drivers/mtd/spi-nor/swp.c      |  1 +
 drivers/mtd/spi-nor/winbond.c  | 88
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 146 insertions(+), 52 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
