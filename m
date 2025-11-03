Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6D5CCF9F8
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2A0hkfi0b0M5FOiQml6sppK1ONMSlLMVvwLi4ujRgz0=; b=pRbSwxxpDWfZ6N
	NmtjKbb2RIimDlci8JQLN9SNeR66ZhasPRpXnlV26bumYn0qY+HBKge6EGKtfQ58bDElZUt3kPj49
	QJaEb2yQ+1cEnZ+5TzJd+P/1NzYn5Guwl3bNQDy/H1xrz8I7tgEDPuluPntcDX8Y5Te+fbetbc+9n
	27FCJ8o1UtllSlyOery52CFOZSVzTgbcdNlXFDaa+pXa+Qpx06rmVoWIaxfogWrU7/jcclL/Rpx1w
	t2jUO6Qw7TA00UnYo/X7fQLvjpgCmZB9hlAtEWC7PeSNG4rlMx/El/aI46reVY249kpojSvx+CN7M
	BzFMGMpycjd9fgjYcr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwNf-0000000A8Jt-4263;
	Mon, 03 Nov 2025 15:22:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwNd-0000000A8JI-0EfG
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 15:22:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29558061c68so20143835ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2025 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1762183319; x=1762788119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sq46i+h051lR0zNhATSUzIFpyE1tPhlJ5BeZkc/DJ5Q=;
        b=IYIdEw4GkuGM2vq7kRiW5/7p9PZIKnQG/f8DhQolfqTpRQlM8m+QOQCzevGqz6ZSgt
         HQczUaIEnwIyysT8sOhkab0es5M8PopwW3oExCSd8p0MIujkWq1BFkZ1/3+ssyWiwSrT
         xJaoSsOqSqw3p0yypVXgxjVOz98+Qc9ukNoORsI+6IoQXBLkz6Y9K854AxHYj68QlbDd
         wtdgM3KcYrQzjK3gDIeFXQJyO3cP/pnH+NmqSMOjlXPYYXG+kF9feARxDjcwbTfwG/BO
         ixTeSzCufEJCXZoQdXkat/YxwwPlE+2BCHG7XA0OHIiPpgMcSaPoYUb4ihMPpfAzN2BN
         DNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183319; x=1762788119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sq46i+h051lR0zNhATSUzIFpyE1tPhlJ5BeZkc/DJ5Q=;
        b=KQCtf2ibP/qSmVbpSutvur49uVTE2sSv0AtnaGnVJcHrE7l4sxIruVrrwoCDojzxD4
         nnx2wo2PjzmGmIcDVNNRGNdu+mMHZ3CQWWLAOgcpi1D5wDn7cQzza0/LS1PKIRDnSlLW
         0aT+ZlRxNnzeVVKkVve8Gme9KrldoiFDD+OMBWRuecQ7znIFMvgct9XO6/uIQXgkoCvA
         D7A+6R4l3ATy0ZtdtIeVjQmFRNpQZjXyQsTqStCuEQFCyE+3yYRlGFl4ap3P0fOghmBU
         Ba1VM+JaCX5jev8juyVKWX395+1HcGzichZ05btruoT80dXL3jXS6b8a61S60361ssJb
         PSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdXrHU4jBZjh0h+BuQJTGpL1V6tsinC3r5J6LLlNoSRk5FRZzHKFPRrC6SqEKfNEMOyWNFX8Zj0fA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8LS3H69vfipwNnxWCMbfhj7ZGDgrjgCFmv7YTSgwedz38C8cK
	1hXAf19A0SoE1FMBe1QAkKATRGt2ihklEheFM9L+DjVNwi3aWNmEX81Dxiwcj7pg3IQ=
X-Gm-Gg: ASbGncurYcTwpmROR6t9SmUziUTeictWHpQkLDGksdoM5ikV7J1iUPfSFfHau/CT7W9
	3iLoK78NnZd04jH1UDYD8pbwiNENI83TR7+rc8HuxZZj9fXkEAKYpH4vImTyCOkRbHXsltSIQQc
	GgVDnkUKmnfXxhs22hvUcmaAEDMs8aYQeE6WkzVxI7gu6Umx+DChFglEtaP2g0Q0btRzWa+XI7r
	OtnJAq5jcX+RgmJGxJWBSdlj0nOemxfFEVDAVYPilYFewuENK1+1s1CNiyiTlai8LOpGKXnoqRF
	vECiOkNN4E6P7pTyJKPEvpr+5GFT6PxUxDdoE3qDS+npb0awear95A0O4qWmgcZspP12rmcYsGR
	WVwmc61kxrQRBqwfG6EgxMPaMz4mdM+itVqll4bzmVPS3J1PJB+bfDGGH0DwWjnoyDUz3ZMcutK
	ooj3BttoF6J/mY0A==
X-Google-Smtp-Source: AGHT+IEZ36hQAR3lqXiWLha/EOf1Hq+fNo3sVkRglt1Vo/PD+PWu8Ym2w1I6vWFecirPPmZz+rgQiA==
X-Received: by 2002:a17:902:e803:b0:295:5a15:63db with SMTP id d9443c01a7336-2955a16fd56mr110344515ad.61.1762183319268;
        Mon, 03 Nov 2025 07:21:59 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b93bf44ecdesm10731534a12.37.2025.11.03.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:21:58 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: miquel.raynal@bootlin.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: maps: pcmciamtd: fix potential memory leak in pcmciamtd_detach()
Date: Mon,  3 Nov 2025 20:51:39 +0530
Message-ID: <20251103152141.57160-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072201_329230_EBB98BC7 
X-CRM114-Status: UNSURE (   9.12  )
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

The memory allocated for struct pcmciamtd_dev in pcmciamtd_probe() is
not freed in the corresponding remove function pcmciamtd_detach().
Fix that by freeing it in the remove function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/mtd/maps/pcmciamtd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 2ac79e1cedd9..206a3c463e6e 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -665,6 +665,7 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
 	}
 
 	pcmciamtd_release(link);
+	kfree(dev);
 }
 
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
