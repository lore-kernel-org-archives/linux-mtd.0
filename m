Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BC606A336
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KEDbjpno;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGblYsT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sk4+XYakiOrCS3n2C4DiZK7x72s4HEvqICYdEKndMfc=; b=KEDbjpnofWU6zw5TXkR99FeFnW
	8tAKwMNdHHKZA7BR6wfZMDux3xdpY4FS3eL+MNq5vfYnCcrBQW1qmE2U0tQwT/KvVSzQ+XWtDPbYU
	GGjHZOx/+t+66W7SdroWi4W1WyUxmNI1jr5gLxXMYggt84r2xFkdIo6ivtDms8unRtGUhdy7fm44D
	2gQ4gGjplYz3syzHS04S30ez9JBc9OYxyCRbHSnBHSsOCf8vofHdZ9Z5T+duMTOxCJlnFctfgK0ry
	VPmmYUoccB6hYHEtuptFvWZ3SXksHOix426miEAqvh1//oLlJaz3uWr2q+l0VPUNOdeogwywzcWaQ
	nnjjzmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyao-0000000BQDH-06sz;
	Thu, 19 Nov 2026 09:38:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyak-0000000BQBy-38ga
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:38:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1619469b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081086; x=1795685886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=iGblYsT1X/WzigGTUe+OYzKW8ed/vpqbxQJYyZ/uCrEskkcBwqaohnANLxJf52FUdD
         8V+UnEMeao9VAtCiS3SkB3oOVObFqE3Y55DRoS+2FrRtHeFAdx0asvoPoPAPrlvr4AHo
         prxUnzUZPZUrBQds1KPNWBhL+bfUf9aITvA4+u2FG/ibhi3nNC5iyNysCX0qhAluYVql
         tFRAX6GV2Yj5UE/BfZMmImMn0kOZ7tfNGFzcIhjJGs9sQPXaFzCC5uJtqlWrmd9T4EKK
         snzgPfFsWd7EdKQj/grPaVgb8m/mMKtrqcPjPo1gmhqI3t3lzM+mVj3FuFxhyjstw/IZ
         +/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081086; x=1795685886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=PQnFiHeW03TEtsTKolejmtEvtVe6APFd+SWle3Xfsx6yW3crc5h/XDDiyBIRjJ2xqQ
         henbEwg03scH6zSdEyFMsd1wTfExtNcMnMx1snl97p29G92+J1LYjCAgt6vY7OSltxN5
         efpsXN1EMHHQsMH7wbhkT+y15bOkCFnkKsA93IT7HR+bwvjBY4nP6Ehjmc1OJfsEgQAn
         07KUaWV9hpyPetlPWGwVWNdEkDTGKC6OZlA2Xvf4yDhriYALnKfynB8t2i/dS6ooLb4X
         yO46HGtwTApcuUuhV6aEfYwPqqYww1WD7FNDPs4JA4NOFl31MLbzqjTbLmbdu4QkAvhG
         DeTQ==
X-Gm-Message-State: APuU4Z8kCcClHOd+7ZQZ2FOikl2a+Lv3U/Azjha+Nog8fPsAxS1i4ldS
	ZEuzn66lFIIEjmmV6FrvCNomvVwZSTz8uFgqQqZWfhpm0HI3aY4CB+F5
X-Gm-Gg: AYBFou0tKBgAXLETMMYJeiuzuIl/giSaaEOAwGFQ1hQTzTwbhJGC+5lQDeW1PWYPOe9
	ueIQSjHGRWaKuM7i3Kyu9+FiR2L4qVRZOJG7meFWbb7RYOnvxhUtZJE9u4/f9Q96k1hboxUDScW
	eUeA5OhBuqkxOG5vXUym3T9cme7Rkc6aSO2DguvtA9Ro9SPu0GTmmJtvdBF9ays7Vf+t/bA0sl+
	aBIOSjRGFUyabQTJV0/CUW9XPhM1tmK86Uu4k7SKzId6+gB4QsEmAgQ31cNG9t1ENpbqixMqFhT
	ZAmNKpLt+D2QXW3TBxMAfNY+zcKwFAlnWgd7MIiMsxxdDMThMShqztuOK77alumigcwaSl9SBd2
	nx7k2A4wGHCLuNjKLeY0qzC36hhIFivvNbvczj9w97qFA542v7cl+De8mGme1hhJCzI+juIjEaU
	Zkewu0BVW+AYPjyF+c4b5IL6xWtu5i2lBFxJCsUMPqUeMfH9p4YK1Zz68j9no2oi7HDoDLk4JS5
	8p3aOt/fWDZw3/kKjSRBZYdElBofajsKLW/Var80aWf8HpYbMRgDRaWap6sHQFE88jpnMXm6M4t
	Qmx+c+mvuU5cYz7+8aGR2KqztWrfQGzVKg==
X-Received: by 2002:a05:6a00:4b14:b0:898:22b4:c8b8 with SMTP id d2e1a72fcca58-8c5d0f24a2amr5021870b3a.3.1795081085930;
        Thu, 19 Nov 2026 01:38:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm2523077b3a.19.2026.11.19.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:38:05 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:38:01 +0800
Message-Id: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-222838@kernel.org>
References: <sashiko-outbox-222838@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013806_782544_425674BA 
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
