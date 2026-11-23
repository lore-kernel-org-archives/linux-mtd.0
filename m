Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E3606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PZE6tDw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ciSKfZtA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q31Ysj/f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qCiqsOlysMt6mMdyjlsUgANVkm75VhRQxUaZMR0w4a8=; b=2PZE6tDwsgvmfuzTqkeMvMq1Ds
	xvPbiGAE87wI8SKJo6zOitp/CMiYpqfta9R+w0W10EFVEGLGq1DqjfKRVbqON/I3PVRX7BgPZ5fRo
	XsZ3R7pd7h6yt/VWLSdCfczrlX6KHs49eT6H7+XysujWGWy/LciKlMfNzgwfX4iu+HW+YmJpFFjHM
	8JPBIctlFbD1MisMR7Sa3l6paBGC23W7BzfO+zY7iLoF/Pb3hNA0imPOJElAHA0McXeIyZjwaVOTR
	jCV6sfVH50CXMFF6A4vSO6nK/RNg+GmehyjWqFBN2bZeYsDbxeMLC57FAGQe0dpquKb3T5zIgI0Cs
	FMw9HrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6H-00000002Qct-3UJM;
	Mon, 23 Nov 2026 07:04:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6F-00000002QbO-2dDq
	for linux-mtd@bombadil.infradead.org;
	Mon, 23 Nov 2026 07:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=; b=ciSKfZtAGV0dOhBJRwP/WZfqvu
	IuYKbOR9bmp6hSle9IhLjBj5C+1Sw61z1aclq+CiNPy/4GJTisQtLxMqmakU1tAxtpEfAKydvkL6b
	QsoMHSsHZmYYDdW55GH4exHPd1h4SLe/Nc01MWMZ9K/nbaPwLnDkLh1FcKPnb7kEelAksI5r9u+xe
	hfOLoRpG5KJnmbyd+FGEvVOwCpG5VlxxkQODVuoEL5M1ewlznWmWaDmlgRzMw4D6GR0SAtODkkG5I
	rDNFWx5O2GiTE9TCam7T0NqRtgDBsLTWqL8dCf/NQtbbPlp7i8TzL0s3fv2iqt1u15gQzHoikXkhx
	d7f2SATA==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6D-00000002oBr-08m1
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 07:04:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2338385a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 23:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417462; x=1796022262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=;
        b=Q31Ysj/fzh0qstNnJRHdvdnBsJ2pr7yuIFkfF1BbFDk3f3LqlFCqVDrEk21ZQAnOKh
         z1kRJ4o5yQ+eFyFatm8GY3wkWx93kEVeh77zlua/PUSPYrIAMuM/vo42kMFlkOD6Hddm
         u+Qp5uDRoGVHA3OkUeEi6m3bjgajIJ0DswvEuVOA/Sekkqysbt1eNwuFfdWLxsFvIBNS
         ZWnUnnps5sD0xM6CdkDKx652fjwQYx9U0HKANQgxeGIRwfZ6+E3Qb+ColqrwPfbF03p/
         sKEVC7rso6613iLQoJudDZVYcZ41WjqVN8kr9NCysueWdiAGxcKJslPTtPBmFNxPieS6
         FZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417462; x=1796022262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=;
        b=gcZeJlGI6AmzSYvs/3uYhO5FSqPvwfc4t45Z9aorXYhzRMmRc9VPP5E9JKm96h+ePa
         KG5XUktFK93d6kgr6VBt6nE3mAELUiolGSO+ae7alCqzi5XmPpflfwXuIGFoQk31QcJv
         GPLBX0/eaQ3PbYIg8rE6jKrRRQ7s/oNq6lo+WCH96WfFWUPKP62poS1xmPEsUeLGIj7K
         7myltsIYzBVUBG8NKVSAlsLkFlkiB95dRCoDq5usB4p37q8gyLttRetnBhz4l7F6mU/k
         97OyfAch4yKOSJ8m/nSVVnSFvWfLmV73ViDpSvchHrjXKbHmH7sOM8/VmgdpRwxvTfmh
         hfZw==
X-Gm-Message-State: APuU4Z+Nn3v93CqsRTJ2D54rX62U1z59tmoKsyIhIG1WRa1gby0X4gbu
	Of/b02N3kw9kC8tDLs/+LyHbSKPFPEzjbYqSXcezKPtWCSINctKDLfig
X-Gm-Gg: AZFdTZf6TthYp1/RLdY6nHFO4u8uBo3Yfj9jHr4fKs72CyWE0/gdCb2xK32/7wShmSG
	OqhBv95nCRn4xnYfQMDtOv9yNS6R9dE/VPHsm+jB/Ao+TnRkq0OvxSwo+528Dkyn2x/fSHPKjq4
	gx+M+nzsV66yho0+dHkW0eZRsVcb3NeV2TAxKlTV1m8cohYn7DXZ84c2lgf+Ah1qE9JtelrWQSi
	a3HFw+VVNqC7shEdpjbWrf0jCon8Yye7c+c7rRQ9LleWmMVuYWHjscK5gtPpIWwaMsTRhaAFrG0
	z7z1JSdLjuMeutS6tIS7p8CEml0n4Mmok8WjRLP299m6Bc03Noxr+NSiyoiI7kvofFAXnX56b3L
	T2xinVo8lZaVS7/jGStV4NvFe/DpvGC9Vll9xsFQ7vVM0x6NSXe4j/HJwJVUZF47vXCbQbwr4jx
	bi0bWBd5K4QCMsxaL59+ZkvCi9nW7aTRKU1n9eF1NI9o6TrhwxyYHNRFY+pV/KQMM+JK8medXbl
	wBsobsx3ITlIwo1a9SO5jUYGhdbSm2eOxEMBOJ4GZzun2Hsxkq4ArIzNCQ5GoTTag1mqPTGpC+o
	dm9mpcB2D7l9PZNNyD+V2sTAzHh+OKcfaQ==
X-Received: by 2002:a17:90b:278c:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b41c97ac3dmr9924577a91.52.1795417462165;
        Sun, 22 Nov 2026 23:04:22 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm6691018a91.3.2026.11.22.23.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:21 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH 1/3] mtd: rawnand: fsmc: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 15:04:15 +0800
Message-Id: <20261123070415.3060054-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-228750@kernel.org>
References: <sashiko-outbox-228750@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070424_973707_2964BA8E 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

Thanks for the review.  I verified the three findings and they
all check out:

- fsmc: indeed, nothing has set host->mode since the platform
  data removal (a1b1e1d5bdfe), so the DMA paths are dead code
  and fsmc_exec_op() always takes the PIO branch.  I am dropping
  this patch; declaring NAND_USES_DMA there would only add an
  unnecessary full-page bounce for every vmalloc'd buffer.

- intel: the unmap problems in ebu_dma_start() are real, thanks
  for catching them.  I will include a fix in v2: unmap on the
  success path as well, return directly when the mapping itself
  fails, and unmap with the device the buffer was mapped with.

- The Fixes: tags were indeed wrong: mtdblock's vmalloc'ed write
  cache and UBIFS LPT buffers reach mtd_write() long before the
  mtdchar ioctls did, so the exposure goes back to each driver's
  introduction.  v2 will point the tags at 0b1039f016e8a (intel)
  and 67e054e919248 (r852).

I will send a v2 with the fsmc patch dropped, the Fixes: tags
corrected and the ebu_dma_start() fix added.

Thanks,
Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
