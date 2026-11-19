Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86B606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8idb+JZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2lN/BWV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=csjXvYtNL9M1SAOHnCCu80SHOPJuQpvkKbHilAZr0x4=; b=W8idb+JZK5z2PPr/TBEo5M3nnR
	Il851LMuCfRKi0S+teXGV9vd45w2F9De8lBS4OMXnLL85bJpKg6hTM67kAEjl/Lc26EJlKQusebnD
	oH70utUngqQ9Qo+mxW8OAPqL+oElM/1FHOWXhal22FuzbF0pSEc7UOi5WH+sR+hd2sPcFEA34YyPR
	pSrwmgkWObhB05WUh5CxQ0SiZq0emFMbDuKp/utcbTX41KCNRLHZ1vcpDlY3xfmNbinaSFfbaZwcH
	5/aOxC4w8vNlRGg4iz8XSWUW1mcpTV7JIoTFXShHFQSb0Uzb/sa7ahN+u2uJ8hJwCdZaL8Eop6k3k
	0Co+Wdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1A-0000000BJBX-3Vd3;
	Thu, 19 Nov 2026 09:01:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy0z-0000000BIuX-0JeU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:01:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2eddafe648aso11617725ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078868; x=1795683668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c5j8p3DR3jN9QgPm6TOWhHps/dxpVjAw1oBYEQAEEY=;
        b=Y2lN/BWVBRIzRDVuxNs/9OF3FTX1Nmv2yAg3bOVeyW+Hvwjj5UBO2IJRwcVemoP9IH
         HB7cKxT8TaHla9ZuQN3e08URzwxomybPFTClfxL8/bZK/pqXlriHPjq9fAK4zxGfrO1h
         bKMX2v9OYNs4+n5ohX36YSte5apEZk5lN18+svQdSbcsvecJ7wWrJK0MaD5NOyS2Jh7B
         e1Lg6LJL7Ky0IkG0ds01IVvzQ6j4Bhjqnd27dQCTgNzfHO6HvyjP+ilAgShITFClT1WD
         DLdX5kqqN0sP3WbF7xRtRrAgRYbGU0E7+PVYZHd9cl9mQ0onYFrrrahxnLOdjipWkFVU
         bBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078868; x=1795683668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c5j8p3DR3jN9QgPm6TOWhHps/dxpVjAw1oBYEQAEEY=;
        b=FQBKx5bLP113/nTJ2UwCv/epWiuCssuizarlOIqA88xJob0wC5qd9oRNzCZUo6UtX5
         4uRncaw1176NqcBXDuFNfN6hjkYvC+QuXG0GeLNB/NbFHPVh4F2ey4TPsBx9s5mds7av
         jouJ+xxowgiqkBv4W+CmSQBQ+ptdLFrpaOhDwXuKykcAKRyjyuvnoveqvo2YTm6e0s9F
         ZAi/FgqYCJ2gjme3lNTOPX3t9N+9GVgex63VPFh8U1ZuX3bNECGW9IPzsE+Jszv6d5tX
         THfIhsARU5ZONF2Ps7JW+7oXlOf574dznbEQZtM3l4BWog/UvH4df6YF+aHU/NzK8v8u
         Tl5Q==
X-Gm-Message-State: APuU4Z/9MOA8HWqqitiW6bU7F3wNWZR5YEFBtk5qLXAOz6yYMlyH6m5h
	poRs4zuR7hgn3fzK27qiPOQqa0PHvbA4ggkn6CIODCG3WmsZJdlckTNq
X-Gm-Gg: AZFdTZe3aqGBmBvlyw6926IBHYuXpoNYSdvrq6H8SZuNwHKBeRMK5sOme6DJlz9ampN
	bRIn9fpybaJHd5GR6SPhgDl2b7ekmZ5wDK/EWrumgarJ6M7Z2YgAKgzyc44uGbWWfaIvmop0Asp
	A8OL89DU1KVhiKeEoRe4KwXGsOfzQHEOBXf/1oSxLPwtJ+37cwg9AglNMOWSHJ9gcVrWiJ+toij
	TWi4KA+ji0mie74QvJNCVND3rZ+hzF6Iu9/2CPVAfM1wQzBBTMjEB0ZSpdy/5f7QH814+kt7mFO
	X5XN9HHWQ2zEI7dMjEagoNABi3zgiHkMKw05sJQ5DKY63pscitofrSnOFkozG35u3ZPYQThhh18
	ZsfdHs7GDlOCyh6IcrqeaC4eeZvFa/eZ9S50Ree9sglbu0xFyebeMLwU9D1AXgWHBpIUTJnnz62
	sbW4tgeU0gRPNlVPGH6OU5U+FY1ZXVn0SAPCLkUOQ8ralGj038qyrdZ/1cTkGxJGeFTPqsDNsqY
	Ax9wRkC8J3DjBHY9aLa35a53oxmiMAoQuUmL6H1Ze0zEb4IFdsucTGsePYx2vdxR50yDCqPRkgx
	XOXVOTgthqMZ/g0WoWpffQO8grX01GY=
X-Received: by 2002:a17:903:41d1:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2eff73f226amr58656285ad.12.1795078868112;
        Thu, 19 Nov 2026 01:01:08 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6192086sm27386255ad.38.2026.11.19.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:07 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
Date: Thu, 19 Nov 2026 17:00:54 +0800
Message-Id: <20261119090055.1255028-1-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010109_155284_44426EAA 
X-CRM114-Status: GOOD (  12.01  )
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

From: Ping Li <leeonion.muyu@gmail.com>

While investigating a throughput regression on one of our platforms
(long uptime, fragmented memory, large read()/write() on /dev/mtdX)
I noticed an inconsistency inside mtdchar:

  - the ioctl paths (MEMREAD/MEMWRITE) allocate their bounce
    buffers with kvmalloc() (83208e106a8e8),
  - but the read()/write() paths still use mtd_kmalloc_up_to(),
    which halves the buffer size until kmalloc() succeeds.

The halving behavior is not a correctness problem: the loop in
mtdchar_read()/mtdchar_write() makes progress with whatever chunk
size it gets.  But under fragmentation a multi-megabyte transfer
silently degrades into many small mtd_read()/mtd_write() calls,
which is visible when the low-level driver cost scales with the
number of transactions (e.g. drivers that forward each call to a
remote controller over a bus).

This RFC proposes to align the read()/write() paths with the ioctl
paths by using kvmalloc(), keeping the KMALLOC_MAX_SIZE cap.

The open question I would like to sort out before submitting a
proper patch:

  How concerned should we be about low-level drivers receiving a
  vmalloc'd buffer?

Looking at the tree, most drivers only memcpy() the buffer, and
the controllers that DMA directly into it (brcmnand, gpmi,
cadence, atmel, ...) already check is_vmalloc_addr()/
virt_addr_valid() and fall back to a bounce path.  So vmalloc'd
buffers are supported everywhere today -- just slower on those
controllers.  With mtd_kmalloc_up_to() the same controllers get a
kmalloc'd (smaller) buffer instead, so either way there is a
slowdown; it is mostly a question of which one userspace prefers:
few large transactions through a bounce path, or many small
transactions without one.

If the direction is agreed, I will follow up with a proper patch
and numbers from our platform.

Ping Li (1):
  mtd: mtdchar: use kvmalloc() for large read/write buffers

 drivers/mtd/mtdchar.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
