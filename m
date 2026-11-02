Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F70606A324
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hK6SIahV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MklKQ+ZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qbKk1/rsj4ny5mpih9JQf4XJuSaD1RVwXmmwkIDbvbo=; b=hK6SIahVJKfHy+e0PaHiVNtcur
	sHvqIPg26lt8vp9pcVvmXbMYq2G8vATfsSM9+151JSjwQEwAzyp96CT3AlEwvvIOLXSnVeSngF/qz
	RdQ/yEVudvrrReDB1dNk33z12pYnRHkBrlNk0EiZwqig6GswxnPnsAStnyiiR+iRiqltdadW2bQ3z
	s0qVoCCN5rjXTt+GOEvY9T25FyHidR2eBbItT0IjuMa5kDD73bo1cvuikfYzbPRZkRxvFZYfbf8J3
	eCPKH2n6huL/3FMSYzNht4JdaAWb+97BUMvPnJjj0t6Oh2kSxIdJ0TJegCvwJ3euhY7CCDx8Iig+K
	DMjLXp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoYy-0000000G39Q-0gOb;
	Mon, 02 Nov 2026 09:42:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoYv-0000000G38s-1e9V
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 09:42:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2eb5251724bso4786765ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2026 01:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612564; x=1794217364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=MklKQ+ZF+VvTPDbf0wmv2uPObb1p9n0XDzLwAveyC3q/wCCLRgyIATqH5GK7co44bR
         2DyBIvjZcDIvZLDBADr3REmOSS2gdCUvIei4+3S/eiK8S6D3iEvQ4BLpuGUiNm//2pEH
         Xi7r/JpxxIMpPzqpez8AMCvhLJw5tHUWbPSw6Xn8ZinvntEyAP2cQdHr5DZxi3Mf1jOY
         /GyA8AnihOgzbr6Ithvl0oOTcBXdyimrcV0Vu7BBvVqJ7hr+N0U3oEPM+oTOFHnohAMw
         6ZNfL7yIzNmNKyWkucptt1LwjlIUiAnR8eWcF9lrkpx5GmyKy+zQTLv2HzBkgxWbnmh4
         aDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612564; x=1794217364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=fbTmzR5G53HOepdwe0VFKDE8BTL/XuRrOfernjZTO+2Mf+yL4RqluiZNmxhEwkwo/5
         fzMkCHbVK/GUst4bUtkUnKsXi1tVdCnXWi4qLGm6Ye17NxXd5suLv2/YpuCEQLUgqTm1
         xZyHPzJ2OY1+1ntpvgOfvr/ljRuBxmtQ0V4aw4wwrxt/iyq2UwFo+WGkot1+OSqRb/zq
         hCuhNmZn09JQrVsGG3FF2tTRv5hf30xgCn4yPVXmONdN60mCI5m1C7Q2sC4UQQF5UMAt
         7MxFagVHIBrGXoSoxvWpUNvlr9v1QiV7hyEx2DeuO3iR6Fvw1bB24LfPrap8D/PmQ9er
         /gAg==
X-Forwarded-Encrypted: i=1; AKwUvBwy/dlUvljBj2v68xRjtAwI2jKF2s5tiC30Eiqem9Gt0BX00+aM6cCVl7UMKiquupXoIEuA+UVB9Q4=@lists.infradead.org
X-Gm-Message-State: APuU4Z8HcdI6SreTL8J2tADeCx8exC94XB90Lo6150NSPFN7HbWQKBCQ
	EmaW9NNJpPcuT++VvSRIdJF1G1bbJbUOiax/myqaDFTtLCNsfQpDD3S3ygflL+sQST3UvA==
X-Gm-Gg: AYBFou1vXPOxQzn0fQttHI4fpKbqRBYEwIkQDRqMxu8ROkqQaJSaRl/smk7s8W9ouJ1
	qSkEBmH36tbRzkjsDvYYgTqOoUQgqPGSSyfQKCqsBdNQsV0XNlwsfZ7ad8YdS0rYw0x8K2ZvpZM
	Vu6wKwuAGs3Zv7M7AKqFzNa6VPiLA2V1LNFL+s6rI0jrPR5SVLScSlbCFMVOVLMELVuxPJ6vTyf
	0x/Iyhie9b7LYVz0EZGo03Qu3pHC2Int2tYYQlyDtLiTc4b4PonuHjxtjL7tfCUuC5Z3wcY01pP
	A/9EUlCIm6KvjSCaTiBqWz6rdSY9SG2Eh5sD+6p4wDH/DvA4iIa7jRdQ8pg2L6aH3z26TR0fDZw
	MKa07Qcyhp2MqfA3bzULZ8aM9J6aDNP4Sv36zi+wPnjaqmK4hdesMAxM6rIYHCaFZxrlE/xWTtk
	yfKk3SoDMQt/ZR4ACg+635o0Aqc2pbZCRCjLTLeTDwpXdazvdHNzbQnnNOFvB/F6mO8QEo4zMWI
	15fA7XNaCv4LMqeCYq6t10D2C9y2pBmLWqY7N+jOndwbdEoyCTLxMqFrxTEkzmIwYjBXRDQ/jkz
	up5SdSbIe5tVyWX+ZacdICA15ILYqmoZQkNbxzxMlueJyNP0RMdJT7c=
X-Received: by 2002:a17:903:13cf:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb36402562mr93347925ad.1.1793612564355;
        Mon, 02 Nov 2026 01:42:44 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb77df90casm70975ad.0.2026.11.02.01.42.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:42:43 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: amit.kumar-mahapatra@amd.com,
	luca.ceresoli@bootlin.com,
	harshit.m.mogalapalli@oracle.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: virt-concat: Tear the concat down when its master goes away
Date: Mon,  2 Nov 2026 17:42:35 +0800
Message-ID: <20261102094235.34511-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-193135@kernel.org>
References: <sashiko-outbox-193135@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014245_764370_36B069B2 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 08:45:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] mtd: virt-concat: partition order corrupted on rebind after partial teardown
> - [Critical] mtd: virt-concat: use-after-free when master unbinds with concat held open
> - [High] mtd: virt-concat: double free of eraseregions after add_mtd_device() failure

Thanks, all three are right. I reproduced the reordering with a concat
across two flash devices (it comes back as kbb-kba-concat after the
first one is bound again), and the held-open case.

v2 will keep each part in the slot of its DT node, register the device
that mtd_concat_create() returns instead of a copy in the item (which
also removes the double free of the erase regions after a failed
add_mtd_device()), and keep the concat, its name and the parts of the
master that went away until its last user puts it.

One note on the held-open case: a plain partition held open while its
flash driver is unbound also gives use-after-free reports in the MTD
core and the CFI driver, since the driver frees the master while the
open device is still around. So v2 makes a held-open concat no worse
than a partition there, but does not fix that part.

I will send v2 tomorrow, to leave time for comments on v1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
