Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83144C5DF7D
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoct9LHYVBvunUthaaSR5cx5/nIS8aq+Pe54rO9lRho=; b=Pojj/KME6RYrdA
	vb9Zh5bQLYI07RagjdWSr2a6sQXzNp83byXgUrZbSqYMgTdSRDxE70zlkFbxCAcvYxGkp9JvpGceB
	5z1sChQuOhdV80c4r/N1GnPMUNoMZhEywjAOxRnmgrbNDvYYEd7eOeIcVOJovVOX1RhKkNih4Zfll
	C4KGn+b7nS6DeRrb/tN/cKWVgPHYK6ySbk0rbGU+l6qWoj7HE2L545/pH2qGYx4ne1M+SU7I4nJIz
	OPBbregs6d7R4EhFmss8krn+wFUi6eI1YjfEKMHmlLKq9nVLyGPp/BfHKLreLqFz+JD1qHbCDdAog
	Lv0MPmqPhoh9laJJxlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHNr-00000007mpW-0bq4;
	Tue, 18 Aug 2026 10:49:31 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHNn-00000007mp0-3Vu5
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 10:49:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso6455923a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=personaltelco-net.20251104.gappssmtp.com; s=20251104; t=1787050167; x=1787654967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KNbePICYaBlGAnqPiRhGNA1nIoFAhNae06i5DJPQgU=;
        b=A+DG4qL9DNUf31ivJWEbKjCEMV1fxCidmpyKKQmMe4oDPSwIOdG19dvZaVEWiC5IG9
         IzWdhLVpFryGsWob9zNCVgc6GJH7Q9D6Ug3n89+zJn8X7h7zeBvWRYMbMPYexi37hR7A
         MvVFfVQgAqn42JTWmUfPSh2IVMShnCuq0AD7BCzPxw/kH7wTUHGkGIWviVNdE42e7iqv
         oZ4VBMidITC2M2FHSQP/MnUrUpclMT+aWWGLZYZVMcv8tMrr3oFSR17KUfMxvdsJWa8t
         J1Yo/mxXorm54dLyBatRMZotfP4nDmxCcMs7UdLoduHa39922/Z5yIkt0z3F4yKyq7sy
         sXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050167; x=1787654967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KNbePICYaBlGAnqPiRhGNA1nIoFAhNae06i5DJPQgU=;
        b=sD4/45RH+nbWBoVTBnw3g1/ATxYIgAsiygTOFeC27XUSJaileDRLjCLRsGfhC0aSOI
         ArF59vBAwGJwrEsHo3M2L6hQY0yezC+rzM5RFJH3xLWfrqTbG8GyqzvpysLvZgmrJ64z
         Xlr8mHBc0qcBc0Gial6VTX20a/GSLhKBri1iIUr3R3EeEZ2bcIPHxqplh28Be1TO/rE9
         u4FnBHkKbByF0CtYJcPnYsP76Z+uwLLcof07qbDQXrIW8z8VoQNaJYTtaTZYTKNPNrru
         8l29FAZd2kZNOq8g/ZJAsC9chi4WqLz7MVJC9Ov4PqfQDnu+Y5LMMhMnlv7XvH4l6Zpq
         W8QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8+J2HZA8PBWca7VjTW6IS76UvLCgEbantPfQFVreSm52ymvf11oClYqFvy9U++keBg1X+RHzhxJM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn0Uzm6wzpbjGD7tTurrWTo/qkL6z0o/9Mgx/NLIDE3VRNonkw
	74yA7qTKrFONLHD6G+NXJLOdlQDyYnYqzOnBZwf/D8g33hyVvmoPzyn55YROoOoNkQ==
X-Gm-Gg: AR+sD10VBNh6YfisjRxw2xEDd/h1ZImetQoS2zRD5iZOpbanq36Mqccao24Ia+kzn0G
	zDAf52FekD4st/g/7nC7LZqnIdaN6B2D9tFj/F9f8eU8VCw15grJGFCXWCuzpDY9IRIfnqED+jd
	6e9jv2edFMuMyBTVD6dUvwnr5hz8yTLp43Z35+jlsaPXlh4VcrRWIN7PfHiBf4qb0Vdq6oKDMyl
	wYqHTZ9BYvDA9i0hSMgBDRtPd9SMJJ3zlcsj3+z2JPkD0pgB+Cu80GKtQnRYjqcHOHAzKFl21Ho
	2euYlz/SfvyW7raOue/Gz71tiIdwxZcaXwycnB5Jmf9TNAN9YHojyoStsY3pg7qkMsqU1LD5zq8
	VN0lNgkLJBN+Wq9Vom6qcG7pksbMd0GzvqekrY40UH7hcHTkyNR1R/9TppjeU1TNqpiO0wi4U0J
	OVQx9ZO6VTyc1mZR75DmgYgIz+g05wj6Nlhtg7v1zarcEZI+HYCncuRK9a0GqhIf9ogQFp/75jy
	PbV5Rx80ULXxVwbB3CD5/BliTwbxWSf6Y6l9cgU1zAS8VpWNpGzUmQ=
X-Received: by 2002:a17:90b:4405:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3933b8c4cf1mr29967767a91.17.1787050166522;
        Tue, 18 Aug 2026 03:49:26 -0700 (PDT)
Received: from hawg.ptp ([2602:3f:e4ac:bf01:3162:4332:e1bf:a4c2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e8418bsm8427768a91.7.2026.08.18.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:49:25 -0700 (PDT)
From: Russell Senior <russell@personaltelco.net>
To: linchengming884@gmail.com
Cc: alvinzhou@mxic.com.tw,
	chengminglin@mxic.com.tw,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	takahiro.kuwano@infineon.com,
	vigneshr@ti.com,
	Russell Senior <russell@personaltelco.net>
Subject: [PATCH v3 0/2] mtd: spi-nor: macronix: Add support for MX25L12833F and MX25L12845G
Date: Tue, 18 Aug 2026 03:48:27 -0700
Message-ID: <20260818104827.1869620-1-russell@personaltelco.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034928_123600_B7BF4BC3 
X-CRM114-Status: GOOD (  10.32  )
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

I noticed a few days ago that a Buffalo WZR600DHP running OpenWrt
started boot looping.

I traced the problem to the transition from a v6.12.x kernel to a
v6.18.x kernel, and from there, noticed the change in the mx25l128
support. After reporting the regression, I was directed to this patch
series and just tested it on top of the master branch of OpenWrt,
with linux kernel 6.18.44, and the boot looping problem is resolved.

Tested-by: Russell Senior <russell@personaltelco.net>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
