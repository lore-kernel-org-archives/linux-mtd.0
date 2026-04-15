Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A054F419A5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xzKMAb1A0zvvHzsQEY2PpMEOQRKonAVh6e85D8eBna8=; b=3IW7qMxtQKHBTx
	hhhOy8dBev6T8xboNWH49b+544i2UUlZUM0UQ2cPlU8rtOUjqmzDrfkDs/nWtyFwR2YGj/96w9WjB
	469h8Gju5F/vmyx9IDNZWHvrUfsjRiki3xVCyeEghzfoBqNh9jywL9RIHmR+3J0de8liSYYf5mouW
	5bIC5fkpdsonIj8JgTBT+0/UEPBPW79pzhj2HG/4mfSKF0oFir9ivzpq1d36gEc+tqapg/bT1PGxD
	9fFRudqDygYXAxiQ/oowts6aaehpQ56zZvswdcsP/O+HZsu4mjj3KX38f5u9qW/dTiOwTab8k/JYd
	2V+G4rl3neHMmRnDEHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfU-0000000194a-0F9V;
	Wed, 15 Apr 2026 12:48:32 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfR-0000000193y-3slt
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 12:48:31 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50b3488fb31so83295381cf.1
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257308; x=1776862108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfWIOLjASEqsTxbYRvhI/OUYGKeRm/Dc+ijgJBGHXBM=;
        b=Te6uvSYo/QW248X7ImIdz7mmrcVN7nFKJOZnOIOsx27qx37cEmyf4l2H0mJMVcj1vl
         +4bfIDKIKdmQzsfZ0VMbJ4GmsAPcfQB5rSVdUR6jUEZE4N93DeFz9ntmmae3ikNA77Lr
         meHpk7Fn67o0NouHaW1ZtoYUGg+Q5U7pcjTiysNUTpDDqOlmHA9iMtZrROgXI2Ttcsu6
         Wx5DlrUZwphAn+VOXuV1pGkLQBurZh8UBqDiUkqwNw01mosoXHdH6qOVekYAA9T7yxJR
         1z4FWYJjz1FaKzPFotPLcbMEuTo9e6ayY/epCj6ofIMHd86sZaf+Pgwx4X1aL+CgvVg+
         5i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257308; x=1776862108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfWIOLjASEqsTxbYRvhI/OUYGKeRm/Dc+ijgJBGHXBM=;
        b=A2wpq/3YmgDJ57ptFayA5qObnBu3qR7tkLKAIMs2heuHIjcGka7AW/h43aV5L1kI4f
         MiNpTg5OKSi3smBbbqkVMTb2a+xRWqy01eSBznniqjClCgolJhgjr692HHmHz7aWXqAm
         NM/+Itr1D8q1eQQ+JlhMN3Q+whDDfwKvOC+LB5dLpkbvLud2HVVm0IG+m7of1W0Tlkh9
         EcHdpivAUOXxTSSKXQA3OWBAEp8q24Kyq4Qsxk7/lyA2hGivDzLfklzo84cQwOud50SO
         3Krmc1V5inOBBt7y/LwauO1rdrTQx9EJ/ihyYrbTiGHMJ9/GPpQM0AEgIOgeLHQB0/pg
         KbTA==
X-Gm-Message-State: AOJu0YwfTXwFdSE8s/stUhIE2r0FASyT3mB53lUTYyKmiV9QNpQOhvcn
	CQu6ltvFqW5XfdRJ0CAi3V36nH/dWb0LUe1pRqRbOeEdCNTomAaqwWEIyoImjg==
X-Gm-Gg: AeBDieu4SCc86Yzm8CHzQK9yuvAKsN/FydcasZKlfqgFaz6bVV2XBXjTYNKyicJu3Uy
	JhI1+1rvuS/dUNNBPRJgVZUpXAQzwjFAsc9GmeYJalowAhAmo1WccD9SteLoC3kJwijnjxbajvd
	9wiMMXHJ+ZwIsIqiVi1v+LDjh00KozhtKPg1JMBMyiSF2Keb4RhzKVyqfFJ2xDIwrmgUYxg7MeX
	aXOR8a4yuL1Oui9Xu+G6H+FzclMZzRWA8rFFbtYFq2HjFQUoq4HkZJRjhg0BN3zS56Dn3lRD/Gd
	8q3LX+/tPtLpVB5g9PfW/aFymqy5Fu/J0ZNyR2vCpowbMAJy0SS/5dqi/oIsyYa4/igzRQU4tmc
	DkCEhw0Qp0sVpnQ/V8H5Eag8qDTKMFjYyzOoAopig8p54U7eTZaLO3dMEb3FWQKr5CGxDRJo/mg
	eGSeOJjZhgcEwi/AJxHKznD7Mh3A77kRM80gkW6I21U2/rxSGTxuaUAwjTrjLhirx/6dqZYffVG
	JMYZhjWtsQgakiHv3FjTDDddHnDVnzB5bm1rt35sPZG2zlYOfHDxw==
X-Received: by 2002:a05:6214:43c8:b0:8a1:2c95:5756 with SMTP id 6a1803df08f44-8ac7453ee8bmr355390306d6.6.1776257307849;
        Wed, 15 Apr 2026 05:48:27 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6ceb891csm10614016d6.48.2026.04.15.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:48:26 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] jffs2: bound summary reads on crafted flash
Date: Wed, 15 Apr 2026 08:48:11 -0400
Message-ID: <20260415124813.246588-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_054829_997936_43368554 
X-CRM114-Status: GOOD (  13.57  )
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

Hi,

Two mount-time out-of-bounds reads in fs/jffs2/summary.c that are
reachable when the kernel mounts a crafted JFFS2 flash image.  Both
reproduced on v7.0-rc7 under UML with CONFIG_KASAN=y and
CONFIG_MTD_BLOCK2MTD=y; pre-fix each oopses in
jffs2_sum_scan_sumnode, post-fix the same images are rejected with a
warning and the scanner falls back to the full scan path.

1/2 -- jffs2_sum_scan_sumnode() computes

         crc = crc32(0, summary->sum,
                     sumsize - sizeof(struct jffs2_raw_summary));

       If a crafted on-flash jffs2_sum_marker.offset drives sumsize
       below sizeof(struct jffs2_raw_summary) (= 32), the subtraction
       underflows in size_t and crc32() walks ~16 EiB.  The earlier
       header reads of summary->totlen / ->hdr_crc / ->node_crc are
       OOB for the same class of sumsize values.  Bound sumsize at
       JFFS2_SUMMARY_FRAME_SIZE (header + marker = 40) which is the
       minimum frame the writer at jffs2_sum_write_sumnode() emits.

       KASAN evidence:

         BUG: KASAN: slab-out-of-bounds in
              jffs2_sum_scan_sumnode+0x131/0x1611
         Read of size 4 at addr 00000000621fb004 by task mount/31
         Located 4 bytes to the right of 4096-byte region

2/2 -- jffs2_sum_process_sum_data() iterates summary->sum_num times
       with no bounds check on the remaining payload.  Crafted
       sum_num > (actual entries) walks sp off the summary buffer;
       nodetype is then read from adjacent slab memory, and if those
       bytes decode as one of the known case labels the handler
       calls sum_link_node_ref() with offset/totlen pulled from the
       OOB bytes.  Pass sumsize into the helper and bound sp before
       every nodetype read and every type-specific field access.

       KASAN evidence (patch 1 applied so the bug is reached):

         BUG: KASAN: slab-out-of-bounds in
              jffs2_sum_scan_sumnode+0x6bd/0x16bf
         Read of size 2 at addr 00000000621fb000 by task mount/31
         Located 0 bytes to the right of 4096-byte region

       A matching sum_num=1 image (same bytes, honest sum_num) does
       not splat.

Impact:

  Mount-time only, CAP_SYS_ADMIN required to attach the MTD and
  call mount(2).  Not reachable from unprivileged users, user
  namespaces, FUSE, or network.  Relevant practically on embedded
  devices that auto-mount JFFS2 on boot when the flash is writable
  out-of-band.

  1/2 is an OOB read / DoS on mount.

  2/2 is not just an OOB read: the type-specific handlers run past
  the buffer boundary before sp is bounded, so corrupted in-memory
  jeb state can persist past the faulting iteration rather than
  cleanly oopsing.  Closing the bound prevents that sequence.  No
  controlled kernel write, no RCE primitive in evidence.

Reproduction artefacts (craft scripts, UML init, pre/post KASAN
logs) are on the reporter side on request.

Thanks,
Mike

Michael Bommarito (2):
  jffs2: reject truncated summary node before header validation
  jffs2: bound summary entry walks against the payload

 fs/jffs2/summary.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
