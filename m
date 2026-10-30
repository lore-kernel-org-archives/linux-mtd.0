Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51762606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXuMizeF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ed5lzKdD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lK/BQsjHOCJwNrLtwNLUM0pCXsLuW0g3eFKXdfpY/yU=; b=dXuMizeF+YjRZE1vIsgr0FrP0S
	NDcsLric74VcYIeyTUApklbo2e6lKRSBrlUQdkKC36GLHWOlzbEcOmC9fndu4Zk45ol8EuyQg8g8H
	IXKjzyCusqLVLvduNjIkkK6qTigV4SNebBcDXCAWnCtt2FPuIh0FD2spT8PXVFvcwusWpQNJNtpMJ
	SY2A4RMMX+8HIsAILDfLAuBvtdliuhi9yC5Uh4/OYxWdY925e1JGk1sztPX3vkGb4+Wf7u11Xflhg
	8QP+LnUHfTnLEFASi/mKKGhEF3qUUTNwbKvLIvKynGXQjv1wTQo7oW1ocK2qWRV7jVJUNlAiEH0LZ
	sAWirLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLa-0000000C6bk-2Th2;
	Fri, 30 Oct 2026 16:20:54 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLX-0000000C6az-0h04
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:20:52 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-702dedeb70dso618405eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377249; x=1793982049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=Ed5lzKdDkPL4VbR4cujZdNKoSLiDYbYye9vr2krXsAen8+a4v9Oah9vLpUOjsuWydG
         u3i6u90XIkThQ05x+Q2kJmHm8quKLjwdRdcj10v8kGpEU146xUpnlpiKGDWPdcjftaPn
         ykqBTlbRMlFfuOhsfYVnJDsO7EXy3+cjitUPCw0urWjM99Gu/dzWssPLetBA5Es1x3us
         WvzV4ND9GAv/oLUvOj8ClDI8GriJiGAPXrPCSnlXmTlzNDL5SW1XG5Rq7yQLTDtNCqKz
         lyFrST6nt7srqCrLzobiauuGU8tLVSgiU+fg4ZQDWBXervBtKnfUmmwI7Se3qSVdwZMc
         h9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377249; x=1793982049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=GDpkb7eioxsf5uE8MJvVFErP+lQKEu9Z8C1/NN0DKo4afKW02ccLcqE/cg/9LVy3/V
         VYylQn181MwTP21gV62EslX6LuuP+9YPXGZI+lg6KNATWDFXE2ynHTNNfwJyRwwhcZhu
         NKQUrtGySXMiNKhahM5QR1QV/anPvpKwlC+m2N9O2wmve4Sv5NaFLs2wKV1mj7qwvzji
         b8MkVaa8PZzwcHTG9VSUeR65Pcugmfejb3KmXD0D3w/xmNAzcq7oissTw/MmsItkOXN6
         DQsille7XwOJW5w2LxKuC9KhsGdKs24OzUG2aR2TGgB5VeVl5FR06YQsKEe4vNLOQSjv
         dGYg==
X-Forwarded-Encrypted: i=1; AKwUvBxtYvZeVWJ8QD52a1uzCdpBUILwhFW9BnNmqt88utbXvvvItbUIfdyY1rNaQ/qXzZIr5R6ZwtWoL9w=@lists.infradead.org
X-Gm-Message-State: AFq9FYI8s8v8Kk+EamkooHNuOTnfMlFXppP+b+76WAFZbXNlR5BDvBqg
	kSsgp/dHUJNzPBjR/SV5+rI9XK0SI65/vldE5qi12CamLuJlpDFrS9yC
X-Gm-Gg: AYBFou3SJI1LQ664JNrEgP+mymT8olplJ0o93XcIothDXmxid2BbawQUFIFjGvY/tFZ
	qHjDGJme4/tzLlHChoq8GBNzxFLaZoA3Y5tGBK2wd6rtDaaQDom3Ywvv6y61i05SqwaN6BQLwRf
	ZL2vYKNrAWNK+5wJ5h69y1NPfl0oqTwbiMr1Pn3YLShScLMF1wJtBqI3KICV8t7iK5amDPMUyvk
	QgCREIBy5UlMHaerf65n3vweAv+vAbLSK2V4whxc3I9dd/N2vmPfv1JT8m7RNjPJpzglD1DTKKO
	C1LLp8Cel6htLKtcZf7vQOp9U+dCLl7Oz3qG29X1SsB/L5KJTK8FrrCGxdMqBtJKb0VjyjYfq/5
	b/j7lSMBQ4JpiN4jva2oiPR4Bq1YogjaHqVIY+irjzXeAAsQw6Kl7zGZbRyoEyDJequmbsyvF9L
	2+Lp7hoWTFIhwyuXACoS0g5XqOqGQW7QLNYeCH3jB8shETrIGb5Bt+Ar//QJ8K7tcg6B/qeB/Br
	nEZ8ZboiCDYvp4z2+IoLF4xTAeb1jiX5ApSxSNDvPWhGEyK8kO142PyRS6sadd8j7/r5wSrgTbS
	4MjUSyP58Rqhuqqzrc3J0MFfMdtjhsuI76lZV4ldXsj6jexavU7prkYG3zNN6m1pib3w0e6Q77K
	DJJIrBmbthaDr0EUCPyclX6DU9uzvClvdyL64NTAUy1sUfbZ2HN+S/4eD1kR7+y3KUPaMKD4c6i
	ePJCx53ogW1UCUYj8=
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1142319eaf.90.1793377249547;
        Fri, 30 Oct 2026 09:20:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:48 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 0/6] mtd: nand: stop DMA before unmapping on error and timeout paths
Date: Fri, 30 Oct 2026 16:20:35 +0000
Message-Id: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092051_235719_175F1401 
X-CRM114-Status: GOOD (  13.65  )
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

This series addresses DMA lifecycle issues in six NAND drivers where
error or timeout paths may unmap buffers before the associated DMA
transfers have stopped. Some paths do not terminate the outstanding
transfers, while others use dmaengine_terminate_all(), which does not
guarantee that the channel has stopped before returning. The patches use
dmaengine_terminate_sync() to ensure that DMA has stopped before
releasing the mappings, and all affected functions already run in a
context where sleeping is permitted.

These issues were identified by a research static analyzer for DMA
lifecycle ordering and have not been validated on hardware. The patches
have only been compile-tested on arm64 with W=1.

Changes in v2:
- Combined the previously submitted patches into a single series, as
  requested by Miquel, and included three additional drivers with
  similar issues (omap2, marvell, and sh_flctl).
- Removed the code comment from the gpmi patch.
- Left qpic_common and stm32_fmc2 unchanged from their earlier
  submissions.

Two questions remain for the qpic_common patch. The BAM driver warns
that resetting a pipe while the attached engine is still active may
cause a fatal error, so it is unclear whether the NAND controller must
be stopped or reset before terminating the DMA channels. The success
path also assumes that completion of the final command descriptor
guarantees completion of the RX data descriptor, which may need
confirmation from the hardware maintainers.

v1:
https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150929.2944717-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150646.2942368-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030151843.2953269-1-samarth.colleges@gmail.com/

Samarth Narang (6):
  mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
  mtd: nand: qpic_common: terminate DMA channels on transfer timeout
  mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
  mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
  mtd: rawnand: marvell: stop DMA before unmapping on timeout
  mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout

 drivers/mtd/nand/qpic_common.c             | 11 +++++++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  1 +
 drivers/mtd/nand/raw/marvell_nand.c        |  9 +++++----
 drivers/mtd/nand/raw/omap2.c               |  4 +++-
 drivers/mtd/nand/raw/sh_flctl.c            |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c     | 13 ++++++++-----
 6 files changed, 27 insertions(+), 13 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
