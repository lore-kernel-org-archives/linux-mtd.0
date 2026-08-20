Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A902C5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUU9TDvJ7tMPAKG/zXLuhbAVtyV59yGErKgB/m0WA1Q=; b=1EHjjZOYXlerUE
	ZWG31SXFTe0jGz805SYRTo28lt5Qu4IipOWvb5NQJVd3o1bwLkoKYsQQuGy3OM01gIB4YvWOujyly
	3mkzQAO1SAuspfxdc8yfrAsFoh926JLCeOjEADBa18FGKniOCASbY/LOhWaQ1eX9Pfk9W1FM2YRj6
	LEQQZ40OU460/ZeSU2ojciI61cWPBhWARf9YKoWiH7yAFtIRYl/sn77mbGJWbO4UlXVipWqpYi/Eq
	GAoJgYAQJxK3r+qmOMEN4VrMI55zJJb3xJqeBoxhTd6ukrNP8EBLQs/DttXoCpBctceJAX7mGJa+B
	Hbb1Kkbs0h39shOZP3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwr6M-0000000Ai9h-0R7i;
	Thu, 20 Aug 2026 00:57:50 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwr6J-0000000Ai9J-38eS
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 00:57:49 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=Y9NMoEum;
	dkim-atps=neutral
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id EBBD773F
	for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2026 09:57:40 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so4282145ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2026 17:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1787187460; x=1787792260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZ6vy4VTfKURcQxXwGAZYevGuvbsABfheCK7MjM4YOw=;
        b=Y9NMoEumknSOgAtrmr464guruE8e4hs94fL480ekxoIckYH65iXU4xj4qB2LNdDWkp
         Y0M9dlXVATQbYMxifGl9jPLy6PcF93vRHQayAhKCLEQjiv4yoewWaJvrF/iUPlmTkx1h
         ZOqFCXq1PyzPSqrute277rDVvraxiXi5abOMRHcW7msoHFcYhvpUHWrBtG6wkhtjTyGC
         95PqbmKoN8Ia5XhuPuZoqerCAJaSuy31ArOixisa4Kvwxuh+nTfEsXboFLyZvkOegr7W
         tNImuyBSjGaHOWr9VZQdDrsz/YtJYBnkjF3EVeDI1pmpWDDZlkWkcoymfU9bJQeVFkXL
         wpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787187460; x=1787792260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZ6vy4VTfKURcQxXwGAZYevGuvbsABfheCK7MjM4YOw=;
        b=V6B30hw0l8W3VUP4WqEtl8k7dIKqU8mqeaintV9s2KDnDmAu9ojrQv2PPE2P0IitXu
         l2iZvyDYWfCOGUhJnTmo/rfUhtPxUYeOac1kmmmfrq1Hd+fKpokoRoyOGKvl+gjfwHNK
         JJ9QKOVkK5kDV+CvWgmIO4ngYGiQNZqoYdkGG5PLUwz7vXzqaKgICchj5KEDYnSDTfj8
         Bz38Mz2Yoy8GhTiA3bnXgbx8AugMJ1L4+Dpe38zKaHFGB9aTKOFHSomVDW6svkXe5+4m
         IWpyTpf3/6TLRd1c+04aJuW+nKeAvPwIVGc3z7OyOiOvaquAqr0jIgJKwlvtL3CT7T1x
         20oA==
X-Forwarded-Encrypted: i=1; AHgh+RqhLJj2wMDY9NZxOX0BtSvWZ88H8fjIUC7Q/mVe1EF6XaWBxUWIZVcKWgCr+6zEw08/qRxFGpxKmxQ=@lists.infradead.org
X-Gm-Message-State: AFuF++k+vElt8M5nvrejrr8R+Efml1tBClKUmKUbjrHbDR/sdf0rPP9u
	WtQeF9Droysw2RjjqmibHr+qkXcTRieVH0IFQRL2miKpBWvQpP86jph+R5t4eIPEleyeAMWYSCz
	tXj8pvanJYCDrGavzgmI8bLsUMD30dcK3d/GsKrXp7440DHPTkImE8UimBsNA6BaBhjC3
X-Gm-Gg: AR+sD10d1ESTAq6WfpXUU6JJ9+5MQNRM+z8/WFIlnmoL+2oHR0ABjdOlln2PahBHrxV
	p3ipuTkSM5kP2qi2il7Nq8dP6DhuyInfDWjyhQBCU1EG6cjs7KN1SzWa1HoRxW1qZhvm9oStWDn
	zdm/3kMRrBkPFsrRX6UO8yBYSjO/kPFxxRxAtHzDvym+1jC//S7vcSzFRYghG1XZUBg7VAd71kR
	xtcElUILVFx5rRt0diiGSEnhJhoFw/TB7RUWG8731IIv1ujpCvnlSo2y3naIXiAR6EEjw1vr7yu
	G7bnyTYBDVm8Z9ylkWkxVB0TJ+G/DUzV71rFnwdPXNDC5fX+V7MyOHznV2H6y/vy0/A5RWU3wqG
	ubFMjChQlVrEVzwD1cbUD7p5JJFIv3BevfZnd42JSpDDXS92P
X-Received: by 2002:a17:902:c944:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d61a1a54f5mr33599515ad.13.1787187459831;
        Wed, 19 Aug 2026 17:57:39 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d61a1a54f5mr33599065ad.13.1787187459368;
        Wed, 19 Aug 2026 17:57:39 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d62d588035sm499445ad.23.2026.08.19.17.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 17:57:38 -0700 (PDT)
Date: Thu, 20 Aug 2026 09:57:27 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Richard Weinberger <richard@nod.at>
Cc: stable <stable@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Liyuan Pang <pangliyuan1@huawei.com>
Subject: Re: [PATCH 0/2] Backport fixes for UBI
Message-ID: <aoZQ90HBGlM-SL8K@atmark-techno.com>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
 <1200997805.161072.1787136508436.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1200997805.161072.1787136508436.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_175748_040677_E925754E 
X-CRM114-Status: GOOD (  16.01  )
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

Richard Weinberger wrote on Wed, Aug 19, 2026 at 12:48:28PM +0200:
> While porting these back is not wrong, I have a hard time to see how the
> current stables rules apply here.

Thank you for looking into this!

I'm honestly fuzzy on stable backport "rules", but in practice I see all
sort of things get in (admitely sometimes new features/refactor just
because it makes an actual fix easier to backport, but also quite a few
leaks on failures like the second patch and other general improvements),
so after noticing someone else submitted 6.12 contiguous read
improvements recently[1] so I assumed such backports would be welcome...
But ultimately I think it's up to you, so happy to see the patches
dropped if you prefer.

[1] https://lore.kernel.org/r/20260811161342.533280-1-frieder@fris.de

> "mtd: ubi: skip programming unused bits in ubi headers" does not fix anything.
> It's a pure optimization for future flashes, UBI worked since ever without this
> change.

I might have misunderstood something about this patch, but while UBI
works fine I believe this would increase the longevity of more than just
"future flashes"

I've burned out 2 times 1MB (4 erase blocks) from the NAND I have on
hand (winbond W25N04LW) using either random data + erase (nandtest) or a
patched version writing zeroes + erase, and writing many zeroes failed
the erase blocks about 40-50% faster (85 thousands cycles vs 132
thousands until the first erase failure, 121/175 until erase stopped
working with many retries)

This obviously is a tiny sample size and not concrete proof, and this
patch won't have such a big impact because the area is small, but I
believe this patch will still improve the endurance a tiny bit for at
least our model, which was the motivation for me to pick this up.

Of course, there's also a chance that something breaks from it so I
can perfectly understand if you prefer not to backport it; you're in a
much better place than me to draw the line.


Thanks,
-- 
Dominique Martinet | Asmadeus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
