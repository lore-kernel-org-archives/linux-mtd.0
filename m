Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F4606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EvUnXhE2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cR2buUGw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mPB5ChmV1k7nDuP29VTYtWxaN+TmutStm92DWobk7Qs=; b=EvUnXhE2kcqPVIFIFUogGfGe1z
	1EUv8EwPdv246BymuhMETacxo4LzavB1rX1pi95J+92etLrCw48P0sead/LDYYrSqYB6mYv2UmnCL
	i8Cv0rOlM/SU8JO8jvkAoPbaP3B2qW1tn2Q4jLY8wjAFYLUsDOpt2kw4xfnji1+IVZIAFjLbTw19A
	GqGvWAOmQzlXSUi/9oK0SXdv+jT5Yx3slIkdZlNVeV+rFpu4M0QuRjFlmA1gbnpxYnQ8CtbZ/YT1l
	NQNTnOxjFr/1WIvZ4sEGC6JjgXYl5dQIIQbGweoGeYaWsX0lk4D/5yDilr6AXQMGoUvA7QJaEJuZV
	RXT8kE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKmz-00000002DEh-1m5J;
	Mon, 23 Nov 2026 03:32:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKmx-00000002DEH-10G8
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 03:32:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f066274caeso7345425ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 19:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795404738; x=1796009538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+depwuXaBkUxjEuF4EIS2PV9zfmiucR6rW8+6VuXgU=;
        b=cR2buUGwbnZL5WiLvWuL9eDawsRTXsoft079Pcii2F/HSyHfocFUegyqxX1AD7w4+K
         Ebalfi4um3rkeeFUqLZvAsvSXDWtQrsbhtWbIiaJJQAqK1dQm5h5WJBRyunlmIlXVRyH
         RRvTnLN8O/2cvavGcuzQ1uWNUjoLv0Umt8WdKTmuVSssBrj3Dm504hi9cVh0rWVZA1ei
         a4VCpNQIVblRM/CqaA7xwOv8pRRWIOMf9mR0L4V9avQkGouuIlE44gAL2aKaDpU0qVbC
         JYk0h+FkjUUFzR0R41l2zv4ErOOeKMcEQveUQJ97tomHoDZqZYlD0hRoesnD+gn+ZwIB
         ulkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404738; x=1796009538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+depwuXaBkUxjEuF4EIS2PV9zfmiucR6rW8+6VuXgU=;
        b=a2VkhqXNYABZkaHp7uDrY5ph/mGT1CWreOvgDJj/YOgW/dh2/2FN2+O/OXMQ+uWwOR
         MD8QKPJnPuArEuppHgCN/ArLqxdam0Pu07HSydYXZBaVoQuTlZ730sejU4+ucd9bqaE6
         1YvrjxfL2t1hJlGumAGAnUQlHXBRZYIlI4XfVbdte+/4jq21LapLaZEw9CTW3KzX7MBB
         J8R+fyREL51mD6SD8Nao+kpqw8que6Q8iS22zzSvlI8gk1FKw83OhNhmltTBLMeutgEB
         9Gdi/890bZ3EkvmlETsw5qmtL1ykAo9CL1q+hfDmbztVGKAqhvj+8A9EReKnQIt6eqew
         EBLQ==
X-Gm-Message-State: APuU4Z9hkPLp3bEsCSh7eHwuhX2BKzbKCLg/ocvFhiXxUeSC42POL7Z2
	xqY9Wj/hKy8OJ5wShlXqEMmBcNHqo/AXiiREZ+bvr5AAk5RaBetxJvWc
X-Gm-Gg: AZFdTZdsGnxgWJX6X3wp+Se0R/xkne9SVS799s/nHeDHdUgYxgvb6lzoev1BGC57fzB
	adAFRJjMAkXKn+FjO2//RMvsTeevZLPcCzZZs4An1ThIRcqn/BXmxa7n2OFEC7lBedvCem0YN0p
	EyulrhjNCXF/YXgjetZHNZV1Y6+RGP0U0e/qE7LULpd3BZ6XkjmrTu0Vtvc6WcJPv3UD9BGzdy6
	M1MHJ3RzoQaDfF8KS+doMEmipsmhufcSQuHEf/EIuyUc/KMGyijUxcPlgYyisxpM9uFESmKw7Rp
	czrHrRt+seI3l5ZCAX2k3D3C3uaX+klxI7U38NdMgSu54mv4tTRNKVaLxgb0bN4nGvrs5UZDdtq
	nPLQg1OzoaLVpfC5ulF77csiU7B2MWIKUvifCspkQ26AzJeXyOKPe9ZWWRl0xU6DYtCfS75Dp7+
	bGEVPasyXtrPneTF9IQ/tDutNCECcrLzOaXsTIZrkEHYKg9RIwVx2PXvIO7xhE575cHM7hxARMx
	yx0bbZ5g/H2dNxNwuXHmcgrdBGhQJybkNVjTuhg3YdhlML16I9EwBrQXViCFx4ZOJ5cEUsoJ2Lf
	TrH9q4q1pXaWkAy+ZPaRTg1qHevdah7cdQ==
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr11531193a91.27.1795404737681;
        Sun, 22 Nov 2026 19:32:17 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04ed9620esm35813525ad.26.2026.11.22.19.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:32:17 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
Date: Mon, 23 Nov 2026 11:32:12 +0800
Message-Id: <20261123033212.1660477-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <875wxtf8uy.fsf@bootlin.com>
References: <875wxtf8uy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_193219_281537_0F0407A0 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Miquel,

Thanks for the review!

> I would be curious to know how this gets faster and why?
> Because the preferred path is obviously via DMA ...

The motivation on our platform is not per-byte CPU cost but
per-transaction cost: the low-level driver forwards the whole
transfer to a controller over a bus, so the latency of each
mtd_read()/mtd_write() call dominates.  With the current
halving, a fragmented 2 MiB read silently turns into dozens
of small transactions, each paying a full round trip.

You are right that this argument does not hold for DMA-bound
drivers: for those a smaller kmalloc'd buffer given to the
DMA engine beats a vmalloc'd one bouncing through the CPU.
That is exactly why I like your suggestion: a per-device
policy avoids both failure modes -- DMA devices keep
contiguous buffers and their graceful halving degradation,
transaction-bound devices keep a large buffer regardless of
fragmentation.

While auditing I noticed that the fsmc/intel/r852 exposure
predates this RFC: since the MEMREAD/MEMWRITE conversion
(83208e106a8e8), a vmalloc'd ioctl buffer can already reach
their dma_map_single() under fragmentation, because none of
them declares NAND_USES_DMA, which is what activates
nand_base's virt_addr_valid() bounce.  I would like to send
these three one-line fixes as an independent series right
away, as they fix a pre-existing issue regardless of the
direction taken here.  Only powernv_flash (which implements
plain _read/_write and is unreachable from the ioctls) is
newly exposed by the proposed conversion, so it would come
as a prerequisite of the series.

The plan I would then follow:

1. Audit all mtd->_read/_write implementations for direct
   __pa()/dma_map_single() use of the data buffer.
2. Introduce mtd->expects_dma_bufs and the allocation
   helper, with powernv_flash declaring it.
3. Convert mtdchar_read()/mtdchar_write() to the helper.
4. Provide numbers from our platform, including the
   DMA-bound counter-example.

Three questions before I start:

- Shall I wait for Richard's opinion first, or does this
  plan already look reasonable enough to draft a series?
- For expects_dma_bufs=false devices, is plain kvmalloc()
  acceptable (single kmalloc attempt, then vmalloc), or
  should the halving stay for those too?  Sashiko's
  NOMMU/low-memory point suggests keeping it as a
  last-resort fallback.
- One more question on the flag polarity.  With a false
  default (DMA drivers declare true), a forgetful DMA
  driver would silently receive vmalloc'd buffers -- the
  exact fsmc class of bug at the MTD layer.  A true
  default (vmalloc-safe drivers declare false) keeps the
  failure mode benign at the cost of having no in-tree
  "false" users initially.  I slightly lean toward the
  safe default, but I can see the dead-code concern.
  Which polarity would you prefer?

Thanks,
Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
