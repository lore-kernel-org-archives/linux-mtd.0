Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2832C5AD7B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIRf2TScf1amMOh1CQHjPnD16lELn4VfV80G2G1Qz8c=; b=duUNVXLEkziOKn
	MvfFM0UnVsZ+BTksPKkx87fMG461RYx75BnFkh+SXM/IK6eSNE3OphdaM3q7o4XUbG3MNpPkYygsT
	x9KTCtCYP+5439Y/J9OADghCLIspOFs6/qjaTEpCfgyD5usLZRwqhK8c8kn791rIE64mxh7I7Klub
	xEDVlJTxVXoaRVIkNZhJNLYrlA+fnCpToZ8niW8t1HkdhuZG7eDdEgLUbfz+yFQiwpKpKRH14pHk6
	LdpyiDiu86cJtVeW6pQoYvs/Rcdp5aMbxgu0I9p7WfqDJIRKakOGyNBWw/H6563xC9B/ihMyc521E
	xfbT4+7Bk+iarnNcDDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbDT-0000000D75M-00Ra;
	Tue, 11 Aug 2026 01:23:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbDQ-0000000D74r-2Pzt
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 01:23:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3166376a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 18:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786411419; x=1787016219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0SfRFExvWmYM07cduErd83h7ERACR6gaKNB0OKMAXI=;
        b=X1a0uXGXLG7Z3KuxzCGzVDtImWVmIgDH2w7HfFMmeynS3WJ/2qscnTslxj9v8TUaqr
         feVLrivZa4JIOQrQejQO/wSqu72lvKFIsT+MajEJdMOEH98BOdb7YNMtLg/9KvvGpnfp
         1oJWNWYMFDUelPaGcAdE2CAkzXI1wjxYHLL6wqaW5DFJqrLxhnF/+Z23+tqbZR+FmwGa
         2vTO2L1nP5hueoZAlB+vKdEkhUk+6IojRJ7fnruRBGodKHJIENt1Pw7C+g6WYQjJKSjn
         SPcIazIbNcvrqA3dnCclgq9Kp85+JGUw0zn562p5YAIkWnjfiw9/Ggjbyp7uOgVCv1ZX
         +7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786411419; x=1787016219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0SfRFExvWmYM07cduErd83h7ERACR6gaKNB0OKMAXI=;
        b=ZMsyQO2hVE2UZRIfKJoWw5mfMUgJxP1NF4EzjSWjCEcIpm2Y85Tbt7cJAXa1SAIuOM
         uOZILL2Y2MmTxIElrU6D2MBDAzqyFujF59sPlwC9Yx3VmwoiC/8VT8jt0ty1ZLal/5Z+
         bTscQQqybnrlcf3+n+v3OWMoiAryS5IyLjN0OoCARu3aOUFvTN9Cf/13WlMZM03ryXTN
         YP1eoz5avHvfMoSMJPyjAGWhsJZADeQ89xA7NqxJQwMikNxpf7l0cAPer6znDQFiDJ5m
         nKTuQ62Nn6v1TER7qOhTzI6iKvd/QQ3wWVRN58GURD0R+1JXbsnFgL8GlhGH7hg5fd10
         0erg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb9ubUV0z0ZlFUoRE0RM9Ry+D5g32xUCPuh0GCgpR5bkXvwE/EFtIGDmA5D750rcvVEWBmqcI+8Ec=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1LN7uoc3/gU2rQYnQtrkTHz3HGoNNnQAWFYZJE/ics4T+A2rz
	aiRFMdHQb+gTYB5lTcCXPDCRoTjDjmUaYfHli4il8rnYqO4isg+4sXve
X-Gm-Gg: AR+sD10tCRU4REwI2y2kkyBeXMwQzVB0+dFRPE5cyZPgvq3QTaFV7VEjDCDh+FeLb/5
	NY43ZIGYotKfJCeGqVgshGBL/2rPuddsdbVSigNVba2XEtJKPiWyDvLlT/DX05XWhBmL6p1PjST
	Haprql6pKLPYzeEKFT9HTziti6+mxdD52idg/qpZcrloLu7UKUln8nH8moyqY/6YoEzdIV0qOO1
	YMWbraeLHlLV3O2DX8Fd2p90BHqyqJKdI2aExlISOr54R/8K64bbQCbOYiwqP2kCGOHOgm5AqHd
	mNhG+iDQELFZtjTL0kaBG3+pOQxLMF/XF5v7/dViqnn+euMO0r2N8FG0OKMePtUX2BN+aw29LlP
	X08+8MmHmXjQyqe27PCWsn+JvFwu8BjsZmOdOK6vN8nqgaSJyYyITbftsDPUJHIiyvIhtIN4WHq
	FmB94Cdj3mSw39DidzCCIMnPku5Hfdb4DTtPx5xKAO3mOYXtQCMY0RH35xUYufWsOPytKxxGEPB
	92uGalXeFU=
X-Received: by 2002:a17:90b:2788:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-39262309a8bmr29438560a91.20.1786411419242;
        Mon, 10 Aug 2026 18:23:39 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392cfc6fd39sm1458458a91.0.2026.08.10.18.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:23:38 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id D24194163B66;
	Tue, 11 Aug 2026 09:23:35 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for MX25L12833F and MX25L12845G
Date: Tue, 11 Aug 2026 09:22:38 +0800
Message-Id: <20260811012238.961754-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_182340_642795_F12BD197 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi Michael,

Gentle ping on this series, which has been on the list since June 5
without review feedback.

v3 addresses the comments from v1 and v2: the fixup now uses
->post_sfdp() with a comment explaining the ID collision, and the build
error in v2 is fixed. Patch 2/2 is an independent regression fix
(Fixes: 947c86e481a0, Cc: stable) for the legacy MX25L12805D, which
currently fails to probe. The series still applies cleanly on master.

Could you take a look when you get a chance?

Thanks,
Cheng Ming Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
