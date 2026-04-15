Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFDF41998
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ORJ73we3KdAYI7TDZVrSypYloB9rh8iZd6MjFJ+jJQ=; b=EROBBC8AfFYEj6
	wgNcGqly6lgCD8sLYzBAtjMFIVftqzi4KDMWX40p+BgmiU75GINiNMVPCh0cDq7fs+oae+MI590b5
	w6vGPegvuatsSeWfy9I5PN4uJ06rsbMNXBV/afyqET/Xa74baSLkdL/k2STYdBOd8INcN6+6/ZOuN
	zzhGSWZakR2VDh/rh/k/NMfUevBo+kmlpUo+8wmBhEdMzrrgpY3skqkCL2Ntf2oGjFNaLPx4TxZdA
	hi3kj3MTX8r4vJQBshaXJE8yul5pyXNkyflRhdGDWWeaiWeEhevzVqRNnY+UeTm9E/EghF0TbDenj
	t1BXbK9VWMjJh94MZtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfU-0000000194z-1Y7Z;
	Wed, 15 Apr 2026 12:48:32 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfS-0000000194A-3LTN
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 12:48:31 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8acb856a674so27908186d6.0
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257309; x=1776862109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LmrK3+P1rULpl1i+7wOpfSUhGy0lxg+p+4MR2uQ/+M=;
        b=ZD+qQtpaKCL4TpKV57Qj7/RyOC1jR0v0eCYGqultx6qUCgUNe/d1Ga4pW47UCrrFSf
         f4R7dcBGWVqfFR5zN5H2/k885NKAlq8NgESgc2DO6egoYQHe+DiRXWXXPvqyvV9SetM9
         7DUiT+OjI/1yVH6EtjQhz3qjKzSc/oMU/FGhZfTXdk0Yz7hYNzDPawDEbT0ghK62/tKj
         ini6mMO8SijvFLV7fdMiHlb4ZewBrDrKEmFZ4i+Do18vv0sDQknTgRZJRYQMPZDxabfA
         Rp4534bqq/M4ebEUbQLZ1PJm1dP2vpaVbegh9DQ73+zo6mNzpy4Fa+pxm2ySUKlEXjHE
         SLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257309; x=1776862109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LmrK3+P1rULpl1i+7wOpfSUhGy0lxg+p+4MR2uQ/+M=;
        b=mp5dAwSzLpSpCrbO0yToEkI+OvrKM+LLJ0M6e4vzUdJfbwrYb/o90jMqJIFRXj10rp
         Md2OmcfNoA23AcNlfOKrUeUJaB6qn4EfMeYc+QJiiamrvNImwxoWJp6yzVI0hc7zBiTz
         P8evreEr7gj2tiMHhKTGnISts60h3UbOlOp0q1Zae7NdFZF6B5zeOrA3RfYxNEKRfPxs
         GDBmsvX7l3NRLdisUtcY/L1yGmK9dLRJyzYXSQ9Dk88+bnbSRw9sv/ygXka5Ww3fAa4M
         cYNNBD344rg65O3IlrqRn0c+dC6fWFQsCsLVuNyjsYKshAJbgtgTjYDSRRFPpa00kGNl
         wqYQ==
X-Gm-Message-State: AOJu0Ywt6NImZfzaRkq4oPOOBzxVb1VOONS9lWVGsqtJEkrcBOp27dEW
	g0TufBuCSvQTYNa4hRuAZfbybJ5Zy49dtum+GfEoqlk3O7oP5BSPSfyyLHZtbg==
X-Gm-Gg: AeBDietxGM6OD/5CoSUIm14eyxNc2b6XU+U/EiyBTZhBUI0/VQJq8et68kCiZT/Ee5k
	KHl9Om1RUGoD7XOZrOoS4IVHNm+D7Cs0MSMqOF0rUWl9P6RRo0QSC/YeKCYIZC9K1SJpmt6vlGJ
	Ihwk80FFfjj/jOvXllG+e2n6ZNYGes1lFidtQZ+rG6TSJdcxWjYPrFaM3qV168Vzd9LWCBa+dmU
	GuN4UtgVFOok5Ai2CcXNzpmD+ZRpcEXPYiJkDD8xSPntIE3Ahh0/D0yOEvni1k6rFQB1aeGB/Pu
	z5rC7Jf51F8dLq/kUYL55CbGFqObOGzXeDaOw2/CwPWRWsr0myABJIiBVMNzNNyG6S/hzfHRWsF
	TED+zIXNsJfPpoDVr37BFX2V6WODeasGSxG7pEjnrDxW8s2bdTUQZIT/7QRdwCR4eBLUBQliV6k
	qwRSxKQ0+quPuk1YdEgzthSjQgXXJx/2R0244JvokKa9Z/8RvYut5Gq+vWlEdpx/ncYzu+lAnOe
	QXoZEpBMWPPoQmDjyJyTkJq+ZKNi/hB/wnX7p4qn/GVT4Bvpfr2fg==
X-Received: by 2002:a05:6214:765:b0:89c:637a:6bb with SMTP id 6a1803df08f44-8ac860e6200mr326656306d6.4.1776257309176;
        Wed, 15 Apr 2026 05:48:29 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6ceb891csm10614016d6.48.2026.04.15.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:48:28 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] jffs2: reject truncated summary node before header validation
Date: Wed, 15 Apr 2026 08:48:12 -0400
Message-ID: <20260415124813.246588-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415124813.246588-1-michael.bommarito@gmail.com>
References: <20260415124813.246588-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_054830_841583_FB145623 
X-CRM114-Status: GOOD (  13.61  )
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

jffs2_sum_scan_sumnode() is called from jffs2_scan_eraseblock() with
sumsize derived from the on-flash jffs2_sum_marker::offset:

    sumlen = c->sector_size - je32_to_cpu(sm->offset);

A crafted flash image can set sm->offset so that
sumsize < JFFS2_SUMMARY_FRAME_SIZE
(= sizeof(struct jffs2_raw_summary) + sizeof(struct jffs2_sum_marker)
= 40, the minimum frame the writer at jffs2_sum_write_sumnode() emits
and the minimum sumlen that corresponds to a legitimate on-flash
layout).  The function then reads the summary header unchecked:

    crcnode.totlen = summary->totlen;            /* offset +4 */
    crc = crc32(0, &crcnode, sizeof(crcnode)-4);
    if (je32_to_cpu(summary->hdr_crc) != crc)    /* offset +8 */
        goto crc_err;
    if (je32_to_cpu(summary->totlen) != sumsize)
        goto crc_err;
    crc = crc32(0, summary, sizeof(struct jffs2_raw_summary)-8);
    if (je32_to_cpu(summary->node_crc) != crc)   /* offset +28 */
        goto crc_err;
    crc = crc32(0, summary->sum,
                sumsize - sizeof(struct jffs2_raw_summary));

Each header read at offset +4, +8 and +28 of a too-small buffer is a
slab out-of-bounds read.  Worse, sumsize - sizeof(struct
jffs2_raw_summary) underflows in size_t and the final crc32() walks
~16 EiB of memory, which translates to a kernel oops on mount once the
walk hits unmapped memory.

Reachable whenever a crafted JFFS2 flash image is mounted: typical in
embedded systems where flash can be rewritten out-of-band (JTAG, SPI
flasher, hostile firmware update) and the device auto-mounts JFFS2 on
boot, or any CAP_SYS_ADMIN context that supplies the MTD backing.

Bounding on JFFS2_SUMMARY_FRAME_SIZE matches the actual on-flash frame
layout the writer emits and does not reject any legitimate image.

Reproduced on v7.0-rc7 under UML + CONFIG_KASAN=y with a 16 MiB
block2mtd-backed image whose first erase block's jffs2_sum_marker
points at sector_size; pre-fix:

  BUG: KASAN: slab-out-of-bounds in jffs2_sum_scan_sumnode+0x131/0x1611
  Read of size 4 at addr 00000000621fb004 by task mount/31
  Allocated by mtd_kmalloc_up_to via jffs2_scan_medium+0x246
  Located 4 bytes to the right of allocated 4096-byte region

Post-fix the same image is rejected cleanly with a warning and mount
falls back to the full scan path.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 fs/jffs2/summary.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..150a9c83cb05 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -577,6 +577,15 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 	int ret, ofs;
 	uint32_t crc;
 
+	/* Reject frames that can't hold the header + marker the writer
+	 * always emits (also blocks the sumsize - sizeof(*summary)
+	 * size_t underflow at the sum_crc check below). */
+	if (sumsize < JFFS2_SUMMARY_FRAME_SIZE) {
+		JFFS2_WARNING("Summary node too small (%u bytes), skipping.\n",
+			      sumsize);
+		return 0;
+	}
+
 	ofs = c->sector_size - sumsize;
 
 	dbg_summary("summary found for 0x%08x at 0x%08x (0x%x bytes)\n",
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
