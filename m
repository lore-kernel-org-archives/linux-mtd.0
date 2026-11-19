Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D68606A33A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTTBAfxq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v1WiYtBB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sk4+XYakiOrCS3n2C4DiZK7x72s4HEvqICYdEKndMfc=; b=yTTBAfxqr3tD38zSJ+WiHKTQ/H
	mSYYctAeuqidyThs+wNhWbRZuDYzq93ns3m/F+1IYNHRl756NuL/++3K7OASKKhKR61nLmoxQM4hs
	lSuxUxGLciF1kYWdclte+OGid7Eo5G6qnYOi/1+VMBI+Cz7YQ2l2hCmVDlgZeTK9AvpQIFUIfVxxt
	4mgFKcU/pzQVSm35dZaE//sDunwlF2igF3d9imS9IjNlwzWNc6IB7LpRxJWRpAj5E/1GrxrlbskR4
	2BsvgeFJ4sbbz/gFpyWf647TWJ1JMC5A7/mT8W91beIgbtGXQ4xzo6G97q7PXhELitVTQ/Q7z6BFS
	AmALiRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTya1-0000000BQ2P-2coj;
	Thu, 19 Nov 2026 09:37:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyZy-0000000BQ1q-0pe2
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:37:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ee1b65fdbcso8619585ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081037; x=1795685837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=v1WiYtBB6Mlj8ScaT/Ga1rULUsO0iNbuh7tbzMnIWFY+jGl3IXa6rqZrbbjYkQVYl2
         ZTLnnSZ1OXr1y+/GoIO4MYHTcpuNcUp9yDvs06bwamFDE/5DxnzJDGJ4dwbZoT3380PN
         vX52yJkPoc4UYtOp/HRWJQM7QYV5gzcwiZSETglKUi4sfloYRHxj2cKPlL8mDved9iXc
         FFRRebtcZGxMR8yqM4h/7oB2RTc0iLi17ThKW5y2N2NfxmSug1G/RE+B0FfcDUtV5Co1
         MyjOmN5IwgMu0OkNJ+H0QRk6aAb+1QrXZ/4scXnIk83z5SfuD50qPs4q0fVhmWQ0407b
         Smqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081037; x=1795685837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=cPXiuhJ6f14eexjk5sdkYKZT5Ye+wPtiFUjnOfnU77ouLtizBugin9AoYJpmS56qsP
         QeTPQfftNOaY8HodewdU9PqBOC2NMT2Y1LdzTlfTMcto5tuTi3tU8qrV5xDxuNkWnga6
         2h5VvdajwSt2E2mYE9VoOGe+jGjSlICAg4C3wrIG56txRt0/EgRkHE2Azko5eL2KT+0Z
         zKEpPcZIbxIjjfgogGlNrrp3qN9cwHC4Wcn2AFRv8zlyiQACH5jwmFtLSSS363vyd8Og
         YBUV5DIw1RvKg+yc3CzipvXSxjKLtmWZfC2HcOMxQWcOdEzY4P2MP8YRrGL6+XJeEuXJ
         rCMw==
X-Gm-Message-State: APuU4Z/ybQRHyGeuIlFaotIY2QQYIU60g3KkThIJ1s6mDWebNxAHZCy+
	9uDtQGu8JJ1W4JfPTvImj2eHnbSAH6TE9hPB2Di6fuYN32ZOMeU3OWjo
X-Gm-Gg: AZFdTZdKvWK9kd+tZGNHISCWg7lk3qDNNeEGBRRkeQVSHvd061cn6cyswZMPI+/YPDq
	8Y4Fri2tvyiUMB9CNMaiZObtgFI1yyIZnAk3OOfVjW2s6nbXuQ+K9fQu1WpjHKLQdsTPoD0rDLZ
	lHMslgo5YjOowMm1KjSjeAJh+a5TiAb4PfNNmHbGcoOp7rcW7FVDS16N/OWevJfjoDQMzraOa/l
	MjTCpNt8FvQQ9LW8nKczjQFUEN9LM3qmToi1dcihwyRPjA8q8Hcx06nWcOK/fTo6NTlWaX9jX1/
	ZuMhBT10XmSzd+7Y1sbHao2Q1eG/n9j1JgIPwsWxvbuPYXLie0b4gsHBilPw2X6/xCVAxMLtJ69
	LQlD3YphREMRJz5QGahwX0ff29x/GPTzD9EiAYZzANjnbXMY8txKOmvNI/VEIMwkWyJ7sNiYdBN
	tGNqPC+ggYm5RboxgHaiYnhIdjnkKMkOsbRJ+t/9dwrvDRUtcqVNliYeH+PTfeuTMmE98q0Gbgl
	uP/onrqvre9YBvPIGSO9N5uWMyYF3gEebto764P/94cEFL1O8VH8fdWHDgE3l8Nn6nGCeMHbtGf
	EWFjJP8mEwInVgxCqXvbL1sjT+CxoRHZXw==
X-Received: by 2002:a17:903:1a4c:b0:2ef:e946:cdc with SMTP id d9443c01a7336-2eff769565amr60576625ad.56.1795081037315;
        Thu, 19 Nov 2026 01:37:17 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm27034795ad.63.2026.11.19.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:37:16 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:37:08 +0800
Message-Id: <20261119093708.1445788-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-222838@kernel.org>
References: <sashiko-outbox-222838@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013718_238402_C7CD1850 
X-CRM114-Status: GOOD (  11.18  )
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

From: leeonion.muyu@gmail.com

Hi,

Thanks for the review.  I verified the three findings in the tree and
all of them check out.

1. powernv_flash registers _read/_write directly and passes __pa(buf)
   down to OPAL (powernv_flash.c:69, :220), so a vmalloc'd buffer
   would hand firmware a bogus physical address.  fsmc_nand.c:505,
   intel-nand-controller.c:312 and r852.c:196 dma_map_single() the
   buffer without any virt_addr_valid() check.  This also explains
   why the 2022 ioctl conversion (83208e106a8e8) was safe: MEMREAD
   and MEMWRITE require _read_oob/_write_oob, which these drivers do
   not implement.

2. Agreed on the low-memory regression: kvmalloc() makes a single
   kmalloc() attempt and then goes straight to vmalloc(), so the
   size backoff that used to make progress under fragmentation is
   gone.  The stale comment above mtdchar_read() is my oversight.

3. Agreed that "shrink first, vmalloc last" is the right shape;
   jumping to vmalloc while intermediate contiguous sizes are still
   available trades a cheap shrink for an expensive bounce path.

So the answer to the cover letter's question is: quite concerned.
Plain kvmalloc() in the _read/_write path is a no-go as long as
drivers assume a linear-map buffer.

The options I see from here:

  a) a small pre-cleanup series making the affected drivers
     vmalloc-safe (bounce or reject), then converting
     mtdchar_read()/mtdchar_write() with the size backoff kept and
     vmalloc only as a last resort;
  b) keeping the current halving-only behavior and dropping this
     RFC.

I am happy to work on (a) if that direction is acceptable;
otherwise I will withdraw the RFC.

Thanks,
Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
