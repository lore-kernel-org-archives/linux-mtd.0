Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA5DC982C1
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0C6m4yZg0cz4MSfXvhh44Si3UIk8agl7JfhwApDl6a4=; b=pZ89SBuQfJ++pR
	IL/uo3Eh5JsolBs0cKQLTUveChGs47nkjcjoqbkXxSf7LYjq4wRHUfhpnTtIvriLqbx7Ddik+3rgQ
	t8EJoMUAhRXT0Q37MjNWaGoJYVVHBY+o9fw/1Q7V33OerLMZExuxNkFvGCt10ZQ4kkP+2i5I0Db4K
	fRSbHw1vI+HOuAOZooA+dMRHpkvnPVoP/L8DoHJNY7oYuOv8w0ZR6zti4BKxgCJbD6KtkcCFJev6u
	Nl8h59sfcLjKANe5AGplGeKgFg0hNwInMxpjP94UtjJpwDgtssF1bbWDgq7epTvYgRre0VRFKgvTb
	SYA/oFhyK7o/QzHxYfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sTx-00000009jOL-3bXZ;
	Wed, 16 Sep 2026 16:27:37 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sTv-00000009jNg-13WW
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 16:27:36 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso8440615e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2026 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576053; x=1790180853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQJbelWBBQ8IcOB6iLsaKQN+w2bMgRzdfuJznAc9A94=;
        b=rd970ymPcMBpHvTrVq7HiX1/S+rzmBJILaUQ2kKugrzwE5Z4NhLaEw905aa9MLbZcR
         /8b62q6trUeGcJJ15+qCH48LTSb9sSnNRaFb8uOuOu8oCN+uDaKNvlIfz1YkgtqSbBE6
         U2WOBKQbJAj9Wrma2CRmgKmbR99njnbaNIlF2L3XWdBlW0LCWtdQSj+Xb9x6N6LcJiRJ
         h0DEdyuBTW0ttnLr6pAPT+R0IHbn/vOwg7KuOWAcr3IyFYF+NWnuavYykq2GCIjyseeN
         ae8nq85ovNrIW0c/LVFPxsgczRo0X1TRWOT4wo88wI+fAKcLBSNpVF6dH+YPZhwp6h0s
         bErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576053; x=1790180853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQJbelWBBQ8IcOB6iLsaKQN+w2bMgRzdfuJznAc9A94=;
        b=eO6hOaKuxPpnvxCFS4IY3WezcJEbRc3jFGkPlwn+RBIaTCTXRYc1x7Xgzr8wOuOx7V
         msK98zaLVPaVGU3RA7EWZdmB25KWzBbZMtyw52mRbUVTaxdK/4sjVInQUlRCUzpW9/qj
         PqB9uvvm7vDToRUz5ZAS+9BLIsSWzT/rBzTSrWeyYDX3aO8LmU2p0emQ6DDLEptHmWF4
         ho6QyjJNCkrZUAO8a6kAnSzgPr4Pv8IR1QrcMjMTXSL0l+iDGkAHoVibgRwXzNmjWnGW
         5YC5oJffFhYHAferZLdOlwgwXMfSbXiIEkqJcr6sCftUYXQGAb0y3CUfTG3T3bvhmpl1
         2WLA==
X-Gm-Message-State: AFuF++m91T63TdnjHz9q33FpYUxjJwMcrdVBgV4SQQg7SlIz8BUQ7ad7
	9vSM34Ue8n4D98pU3qH5paj74J1PpEl+NIVN9GA3vzXSYi95pINb3Ox3
X-Gm-Gg: AYBFou35gAm9oDENyivlDwMlllZsS1zh9oyXIGMOAehGyWNo5PVNfQIQ0ZamM/0cXI3
	4vPbrt+3CC6XIN9KRglfJQDRf/Ew6jaWmNjSXBYSM0yS64b0IDNO1+50cqpwJzKAMmmrA2iSBEF
	BobZfbw8RtU6JxnM9UHs/u3nIrVIYERYnTt4XZCqhIAL4IvvOr1oc66ONwvH1DFYsdLv9TaUsuG
	0BCSipQ6Bgll6Q9YsSRMx1BKiI0wH8i6CjbinTr5Rgle9dfq584Q/dH4KXC2BwV5/KYXiv1nUbu
	F6rmQQUaUEvKrIIz4f/V6E7wm21L4q/zWfNG9Ys852xh3xaq6uGwlPFx3lfbAqJM+4+Yd8r1ceo
	b+gwzHfVizSU0ihE+SBb35dU3Nino7hfgwT6VVzPYTWBrtdM3+y6AB1q/qgZ4ShH90wzXdy1Icq
	WR/a7UEeHzaV966yUq3g7gJGZXRbiKszvE3yo98MBSkSNHdf286NHyUJxVcg3+HtvGN4ryd/4SH
	OADqX0wiWgias2Dw2o/6HboMkET3JbfZU1ugdqoKd+pLwQ/QYdFSG02TA4fgQT1kug9e31HTUZs
	yjNLhTuEIU3Ry4WN
X-Received: by 2002:a05:600c:8b8a:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-49eb72fc61emr48484825e9.11.1789576052365;
        Wed, 16 Sep 2026 09:27:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm28816925e9.3.2026.09.16.09.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:27:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Wed, 16 Sep 2026 16:27:31 +0000
Message-ID: <20260916162731.307959-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915075028.21658-1-orgads@gmail.com>
References: <20260915075028.21658-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_092735_305486_9ED4745B 
X-CRM114-Status: GOOD (  20.09  )
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

The Write to Buffer command takes the number of words to program minus
one, and do_write_buffer() sends that count as a single bus word:

	map_write(map, CMD(words - 1), cmd_adr);

CMD() replicates the value into every device lane, so each device reads
the count off its own data lines - eight of them on an x8 part. A count
that does not fit in eight bits is truncated there, which limits one
Write to Buffer to 256 words on an x8 device, however large a buffer the
chip advertises in its CFI query.

The M29EW on a Cavium Octeon CN6335 board (an x16 part strapped to x8)
advertises MaxBufWriteSize = 512 bytes, so cfi_amdstd_write_buffers()
split the data into 512-byte chunks and do_write_buffer() sent a count of
511. The chip saw 511 & 0xff = 255, expected 256 bytes, and aborted the
program when the 257th arrived. Chunks below 256 bytes - the leading
partial chunk of a write - completed normally, so only the full-size ones
failed:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize for x8 devices in the write-buffer fixup, and
recompute mtd->writebufsize, which cfi_cmdset_0002_setup() derives from
MaxBufWriteSize before the fixups run.

The clamp deliberately keys off the device width rather than the part,
even though the driver already recognises this one in is_m29ew(): the
ceiling comes from the width of a device's data bus, not from the chip,
so any x8 device advertising a larger buffer is told a count it cannot
receive. The M29EW is only where it was found.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v3: rewrite the description - the v2 wording of the failure was not
    comprehensible (Miquel). Name the board it was found on: the failure
    is not theoretical, the log above is from that board and the clamp
    fixes it. Add the Fixes: tag - do_write_buffer() already sent
    CMD(words - 1) in 1da177e4c3f4, so the first git commit is where the
    backport has to reach.

v2: test the device width (cfi->device_type) instead of the aggregate bus
    width. map_bankwidth_is_1() is false for x8 devices interleaved on a
    wider bus, which have the same 256-byte ceiling: do_write_buffer()
    sends CMD(words - 1), and CMD() replicates that count into each
    device's lane, where it is truncated to 8 bits - so two x8 chips with
    a 512-byte buffer are told 255 words and are still sent 512 bytes
    each. device_type is also immune to map_bankwidth_is_1() compiling to
    a constant 0 when CONFIG_MTD_MAP_BANK_WIDTH_1 is off. Caught by the
    Sashiko review bot.

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -283,6 +283,21 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
+
+	/*
+	 * The word count of the Write to Buffer command is a single bus
+	 * word per device, so an x8 device can be told to program at most
+	 * 256 bytes however large a buffer it advertises - including when
+	 * several of them are interleaved on a wider bus, where CMD()
+	 * replicates the count into each device's lane and it is truncated
+	 * there.
+	 */
+	if (cfi->device_type == CFI_DEVICETYPE_X8 &&
+	    cfi->cfiq->MaxBufWriteSize > 8) {
+		cfi->cfiq->MaxBufWriteSize = 8;
+		mtd->writebufsize = cfi_interleave(cfi) <<
+				    cfi->cfiq->MaxBufWriteSize;
+	}
 }
 #endif /* !FORCE_WORD_WRITE */
 
-- 
2.47.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
