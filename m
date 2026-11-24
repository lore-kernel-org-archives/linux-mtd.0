Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D857606A322
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4m2tiKP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVVOx9/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RWuGp2U0VtaM8wqcYI67wARMOwo1xM4eH1HEAg1ijHg=; b=N4m2tiKPWtM/Bj0J1xrw1sWAMD
	RY1CDlkrJjTmuXYjiH1EnF+bFwmhcRSj1vVbVeDQdW8v0ODXypGkEaN1Z08eyjEC/2t9uoCdBJMgr
	pQzKBY1eMEEwkM881P4XVJ/Ddu6nnO5yWVHjfzNpDuvk/0PcDT+ly3WhUgLQuh8r5af6reErrxrh0
	HMwuf/NxRMI09reF4aByLdX+WvB9eoe7cJvOvE+S4UzImOfEDk5hElp1cEKPHNcqoclpZonR9U822
	jtZ+oOqRBO1Z2b489yAWORB4LZ8JxMX5thVjm2q9M3vJjXrj8I3RqeJkEBd8yIzUJn5tLRGx4WDzo
	Cac+zJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgiu-00000005PHT-132O;
	Tue, 24 Nov 2026 02:57:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgim-00000005PGn-2I8Y
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 02:57:30 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso4072568a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2026 18:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489047; x=1796093847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW/y0V2pY9Y4Xur0V/dpfl+A1FMpAkofjo0sl92zmcc=;
        b=QVVOx9/rXUl8c/EYcq+sPCnaJ2oTjITMjQPkw4yRhNRJFh3WL3X49lYUWq/8zaPAm4
         CK5XxPgsXlSG6Y3ctbIzeOVFAo+yFt5U57V2J5Eu4s3FBdEA5O4mQzVGkyK5bCOWQ+do
         9jU2yv/yEDf6XxnlG9K0Az/zYZapr7OtRxBKeD4fzsOTSztsnBn7aczBwYc6rjYnilnn
         tsyTpWigG9oyentQ2AwJQiHg+NxOBC9jbynxFluRChJHSYGtsswjip3ZklVjyqfI6TDn
         0BVLMHzDDM4fxoJcafaU6prghyVoHFtVpGOR2rXU8hkmu0VcGaggNTXzqG+8Fz+dUOs1
         aBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489047; x=1796093847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DW/y0V2pY9Y4Xur0V/dpfl+A1FMpAkofjo0sl92zmcc=;
        b=j+vudsUt7pMTXNVqfufi+rgWsxLT24jdHbzVl+vGi8u0D+xY+MLaK8vLsaFgX4BP/O
         B0Nll2WaA1u55mVIBVJBdcjW30YYwfXjaQAicThzjqFNMwZJ6MoT6M6OUtZzOWFc6ax/
         EgMFEsuoJ0krciCQzxB2yLcVG5AGrYfJHG5RIbH0y/hvvGXSXtrEvEFJq4EDd/dBo0n1
         cIoDKtgSlMUzdl5qUAglYlmOPae+ly4NAuv/YGPFlqcI4epRBbR76IfnfF64defhQOdp
         8IdElDyWubGHVHIS9fdDX3cU2ZK0LokXl+GcItMc7G6ptXtLqLCBLhnftqlZA4lykMpz
         f8gA==
X-Gm-Message-State: APuU4Z+lxGFcrIvk0WtmaOidAJWoSDeOB9IbiCJ5Z+rUSxyyblxsBmIh
	mszFKfNrhE9JcdCzR2kd7NdeWeoM8D/7gc57XWfrWhQB4vsWeEcxv7W+
X-Gm-Gg: AZFdTZdIpOcloOcfZ2eGx5L4qqdW7p+q1pTqqXbJszRQRTwQNLM6QkL/7WwUswWPxHF
	25Qe2viImF5wGO+p9pbQQw4SimdkQEFky7AMCUwVfACG+59N3Hn1gJc8AhCls4XsExXkIOjw64L
	qpsqjzTTtrEvPluoZUo7SacR744d81CVgKVY9sFX/92f5NXddMEbI7NXNrmAXjZItVAH7OvOr1Y
	RJ4x7Z7N3i66/jqALIGzvV+JdKvksl7VyQzVJWzv4oexNmiFD2K2CUORYX0qy7r9o0ORqAvJLLI
	ngYi2FMts0c6vj5uN95IKPRn7MDP0791VmL9T1YL+7OPiqGxqYHaP+GJrsuu1LlES4qvqPT3fyi
	jZcgEfMjZYHS/PBxcITDeZXlVaj8ybAcxrq0n6DqqJ6rHtf6hESe2r92lPIlXK5dwD27ylslka8
	m9Ebp+n7r0bQJUn216acj4OHr59jWZkw9I4MEe5Rz8XnAwp4i15wW8f7dRv4mfNeL0lfyYC/Dpw
	SyPjInGOFCg3nCFcT5ghiM8SZm9/PomdsM4z892x0CEEomdUgYpiv0G9ASGVYKgP/wXq/qxQP1G
	phv2MmoyNOsTxGwEgloRPQ392YQA15HOgg==
X-Received: by 2002:a17:90b:2ccb:b0:3ac:b6eb:e0cd with SMTP id 98e67ed59e1d1-3b40a62fe77mr11447094a91.48.1795489047353;
        Mon, 23 Nov 2026 18:57:27 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:27 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 0/2] mtdchar: per-device bounce buffer policy
Date: Tue, 24 Nov 2026 10:57:20 +0800
Message-Id: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_185729_103104_DEFEB8F4 
X-CRM114-Status: GOOD (  14.26  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the second revision of the RFC I sent earlier [1], following
the discussion with Miquel [2][3].  It implements the agreed
direction: low-level drivers decide whether they may receive
non-linear-map buffers, and a helper applies the allocation policy
accordingly.

  Patch 1 introduces mtd->allows_vmalloc_bufs (defaults to false,
  partitions inherit it from their master) and mtd_alloc_buf()/
  mtd_free_buf().  By default buffers come from
  mtd_kmalloc_up_to(), which gracefully shrinks the size under
  fragmentation, so a driver never unexpectedly receives a buffer
  which is not DMA-able.  Drivers that only memcpy() the buffer,
  or which bounce it internally, may set the flag to get
  kvmalloc()'s vmalloc fallback and keep the requested size, so a
  large read()/write() no longer silently degrades into many
  small mtd_read()/mtd_write() calls.  The size reduction is
  intentionally not kept as a last resort for those devices: an
  allocation failure is reported to userspace rather than
  silently shrinking the buffer.

  Patch 2 converts mtdchar_read()/mtdchar_write() to the helper
  and updates the stale comment above mtdchar_read().

Compared to v1, the flag is an explicit opt-in with a conservative
default rather than core-set, the halving fallback after
kvmalloc() is dropped, and the powernv_flash declaration patch is
no longer needed since the conservative default already covers it.

Converting the drivers which already bounce internally
(brcmnand, gpmi, atmel, am654-hbmc, ...) to the new flag is
planned as a follow-up series.

Numbers from our platform (an IPC-backed NOR flash device where each
mtd_read()/mtd_write() is forwarded to a remote controller):

  - one transaction costs t ~= 20ms + 0.3ms/KB, i.e. ~620ms for the
    2M+2K transfer this platform uses for OTA updates;

  - with the opt-in, every 2M+2K read() issued during the tests
    (~80 runs across clean, fragmented and severely fragmented
    memory states) produced exactly one transaction, in every
    single run;

  - without the opt-in, the same command was observed to produce
    both single full-size and halved (len=1049600, two transactions)
    transfers within the same session, depending on transient
    allocator state.  The split is not reproducible on demand;

  - wall-clock throughput is not the benefit: a halved transfer pays
    only one extra fixed cost (~3%).  The benefit is determinism:
    the opt-in makes the transaction count and buffer size
    independent of memory state, which is what transaction-bound
    backends need.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/linux-mtd/875wxtf8uy.fsf@bootlin.com/
[3] https://lore.kernel.org/linux-mtd/87y0akuer5.fsf@bootlin.com/

Ping Li (2):
  mtd: core: add per-device bounce buffer allocation helper
  mtd: mtdchar: use mtd_alloc_buf() for the read/write bounce buffers

 drivers/mtd/mtdchar.c   | 24 +++++++++++-----------
 drivers/mtd/mtdcore.c   | 44 +++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c   |  1 +
 include/linux/mtd/mtd.h | 16 +++++++++++++++
 4 files changed, 74 insertions(+), 11 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
