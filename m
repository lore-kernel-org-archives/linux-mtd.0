Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B296DEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C76SUV3p2pTuSigZ1Ip9Yt2TpiTQ2qny4ZDG12VU49c=; b=eFtsC9VAvCUOAZ
	esmPrdO9BfvWegdFkwTOD7boSzugqaix10Knx8SVvHI8x9NpGz1+oPcKu3b8tNUECLNGa6ybgQ2Fq
	y9wSZ+oKNofDuXGLAzJFf4/CMEZcOrYafqndXb/5pfjFB0v0muhYIsdkiJYX2HKxZPdzVqks/e+Lx
	NJcE3oTtfGdV1Hn4sZXSlXcn9E1eV/cEXDgpf7m86szVWyJn1Skw4N1HCrT1WLkuM/pqojZQMme0i
	mq0OAKEMDiPCksVOQnQwm9Y8F+8F1mko1eKhyIX2tUIxJGPLMFX7iSYK7cGAHIxsRkAAynCmKYpqh
	xlxTbTbVMlQwvjUdcxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9XuL-00CjeS-1S;
	Wed, 14 Jun 2023 21:20:01 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9XuJ-00CjdA-07
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 21:20:00 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5700b15c12fso11269887b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google; t=1686777596; x=1689369596;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6PGTG5NarVHNJkbVPCoiC9HZROAYHCE5Aka0hABaH3w=;
        b=McuPtdkbeik9nMZctfZyBYWAofdjbzWyRt+qTqh4DZKt51yJF/W8VUMZ0LcU8axeqU
         LLOsljbJ5ofuQujlKzhIdS7rqaU6muIX6hRlhn2TA5AS4V9mpTN7n08dE6V7fNIXpaxX
         x4hY8Gc/5REkxYjgfAg72YaQPIDPK0xB7IR0Bpifgyeyoyegwc7k0PFEb4hCWFDv8riJ
         2bbA9w1ItHOXKFZaTNYdyneVOwIUn7hzwNkKK0zYrjczoQLLAroPApHRkq5Ha8gGkov3
         5EU/EEImpB9vnYkeR9OBdhz+NUS7C8nNT4/ikKgMUMVf+Z5Aw4Sx7tk7/3XjLST4Nzur
         i7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686777596; x=1689369596;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PGTG5NarVHNJkbVPCoiC9HZROAYHCE5Aka0hABaH3w=;
        b=OziZIyxTEJDHZiByhgkmtP+cLmNBjbCKUkmYe/QHSIZO6mKb/HPno4x0qr1OS23KZ5
         qTh4eVdm/bww3bG9PbhQ31DRT6ryjHqfRDmxOx6U+OVVFWBfbxODZI8W2ZTxT8pcUk0T
         iYPWgqcm5y9a7FmR8Vft31p4GuYYYzOInnfCcHeIdIr496PlJFuqfL1ZBRCvgi//bmKO
         Dp27oJFZvbHYL7cIv68bCLuvgM7yeGlqdMFdL89mY+vDvnChXYEZA4By4MmkWIQU6DpF
         oC66J0f2A32DTQUeumuXppFHs6kOftcPxjtQjdkxc6L8MrLRR65yGmYsL8vi5NYOLQNw
         klCg==
X-Gm-Message-State: AC+VfDy1aQFMVvaOK2pkSaZrdFE9GEZglWYo8aGysYR9/UZjme99Cy53
	H5KVoxzpaCqMuNNV8WLe12QePdkrDRDn491CNe5N1MxLAJYixhtUYH4=
X-Google-Smtp-Source: ACHHUZ4tWHxheE07R7cGq86YN9qzioOyUhopX+1UiNHLsjziqS5Fdc/mBGoCEnmoaczwDrk3tWlAmrlanZNwi6VQYUo=
X-Received: by 2002:a25:86c2:0:b0:bc4:515e:cb0f with SMTP id
 y2-20020a2586c2000000b00bc4515ecb0fmr3074090ybm.1.1686777596589; Wed, 14 Jun
 2023 14:19:56 -0700 (PDT)
MIME-Version: 1.0
From: Mauro Lima <mauro.lima@eclypsium.com>
Date: Wed, 14 Jun 2023 18:19:45 -0300
Message-ID: <CAArk9MNJnu7zbXLYOh8HX5RQZA47Sdfx3GjUo5HfbeXYdY8WJg@mail.gmail.com>
Subject: mtd: spi-nor: parsers questions
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_141959_132525_3BD9901D 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

Hey all!
Looking for some help with mtd.
I'm working on some changes for Intel's spi controller. We have a
"BIOS" partition, composed of many parts with different offsets and
could be spread within two chips in some cases (not necessarily of the
same size).
Right now the driver uses one partition that, in my system, is bigger
than the first chip's size, so I'm getting the "size truncated to
0x..." log.
All drivers using mtd_partitions know the partition information at
compile time. This is not my case, we need to read the first portion
of the chip to get the partition parts' offsets. So I found parsers,
and the drivers using parsers make partitions within the chip's size.
So my question is whether parsers could solve my truncation issue and
whether parsers support this kind of multiple chip case.
Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
