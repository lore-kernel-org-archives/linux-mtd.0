Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B15C02190
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypKvZWR4b9ilKRp20QGYzvcAEPT5upJlz4rKZthNjJI=; b=nDgsx0H2FH4mRO
	EEkyQ5jmCri+96aNVohBCyPVEswL8Al9IaBCuEs15c/O5eFmU7EttLM/jcJiUgiWi2+et8A8+RGdw
	qhCB6bw74J24A5f4tA9pt3hRaYUc4Y07266H5HwuvnRoUP9cXYjSkG7SyG/b/xacoE4+kcredkSIk
	W2RNbzoFxCBU37pp260C4+Cj0YZDr2MmTlIqV26bGzYO0XLVfFw3HZk6hKtqRng2I2xeeJD+5LPgK
	XGzr043F5PI0udN0S/HFll+VbHRSkLlltohZpvg5hdF2G7ixJRvsNCTHQMEsjPr0uFtRTyKlGDc2Z
	uOYxa9t8kRGLnkHvAUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsiL-0000000Ap87-14vM;
	Fri, 31 Jan 2025 15:13:49 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsiI-0000000Ap7Q-1QNa
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 15:13:47 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-844ee166150so55056239f.2
        for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 07:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738336425; x=1738941225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+9HC8EV1wWIoNgKbafn8wjlhkFnTml5y5fJi9ZNauA=;
        b=Ez+Ze5Q82GVzFprun6L4PDRXR5oQxpi48SLbR4L2EfwK+hfiuaikrLD+/fRsw2tB3h
         B9r1B1qNu1cxBKltmrE0CdZahwmOo0ov5BKoRadbkd5FkwTI8TwkRynEaKFp3BrSP1F4
         mydKUaUO+6yLw66pf/hzi3vhn1dq142nCbe+kqNvSjFteGFfj1mqVtjVKjVOY82YTtxW
         9+qGBMlbeKJkjQ6PfQWn0/gmWcYDRxH+G0ny/mriwJp0Vksp1jByYZGKrlsdsz6F9N3T
         1RFB9G2/rGqsrazBvOhl5QZ9jCkT+8Fq2l7+U/OYQmed1XMiud0zHVjAcfFUpLeIMeZn
         3LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336425; x=1738941225;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+9HC8EV1wWIoNgKbafn8wjlhkFnTml5y5fJi9ZNauA=;
        b=r2WNp2HPZ+ZecefbxA7HT08feVcmoporRdtEIIMjOsQeRzYb1k1PMq50kUUY2t0Oe/
         63tt4PFwK+U88t4Kh6Nrp0BQVCzrlGJoaCK+6CgLYLk9lG2iEg7TeiO3B0QiB0I2vf4I
         I6T2mYfdACv/8ihJ5HHEug4y5kL+svBgzFiIyqCSA4rxYDdszujSgL+P8UReJGsL9Wp5
         92ZqeYdr16oXT1hrfczw4DkuppfFsOWlWAz+fkprtYvWpoWeINYrb86oA9bTaFrvpI69
         4eD91fdGiuCUq41P9t4tmBJugiyq9z7nSkHwC7p6M2VEdRTirQlvuGT55DSSeq21IRJt
         kHhw==
X-Forwarded-Encrypted: i=1; AJvYcCUXLKVc9DERxioz/k+eYiq/EI4STrY4RfIpnCegYVAXQmwK/j5iCMG+lIx6Dn485z1/UtLF1Pn0dDo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydh+dEO7g5R3MXaul9IH/U4IVS/Kv3QGc8LYK5B6poSKQeZhjD
	G2PMZU8dgMJGnvlvKD86GKNnf3oBeiJf8MEQYb9yYhFEyWI7UtbNEoPJ00/1rmQ=
X-Gm-Gg: ASbGncsX3dblgX6SmoUXuqH78HbQmOJf6g8UlxUQG4kiV1W3+J/qgMvv2aLIZfT/FsB
	m68SeRRYXnII2iyxUPZjJSZjOGSSWyB8QuwxLehQ0+Gru8gRYWtYhgzVHHZ3ScvMVMNoI/x7gIH
	B9Z1Z8xwrWs7em4cNhYU2xNA5FpoTMIa2HabA12gh9/GqQlGde4irz4j4VBRotXqLMtW7Ep2Rn2
	w5LQqL1aVuxHGe51v+CNE+AGWAwUC/3A0p3ATlI1YwUZNgbqVXRzWWuadbqXFydsIM9+ORDzGwx
	QBhWKg==
X-Google-Smtp-Source: AGHT+IHdBYkV/Lcjpt9Dx2u2hBI2V53NbB2KTd/PWwFq4iCV5vqkwpfG1ZQm3S6I8vweH0IHJRW4Uw==
X-Received: by 2002:a05:6602:6406:b0:843:ea9a:acc4 with SMTP id ca18e2360f4ac-85427e24fa1mr1154985639f.8.1738336424835;
        Fri, 31 Jan 2025 07:13:44 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c920dsm856099173.125.2025.01.31.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:13:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 nbd@other.debian.org, ceph-devel@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250131120352.1315351-2-hch@lst.de>
References: <20250131120352.1315351-1-hch@lst.de>
 <20250131120352.1315351-2-hch@lst.de>
Subject: Re: [PATCH] block: force noio scope in blk_mq_freeze_queue
Message-Id: <173833642386.354079.3672902422068183900.b4-ty@kernel.dk>
Date: Fri, 31 Jan 2025 08:13:43 -0700
MIME-Version: 1.0
X-Mailer: b4 0.14.3-dev-14bd6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_071346_386151_B03F6243 
X-CRM114-Status: GOOD (  11.15  )
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


On Fri, 31 Jan 2025 13:03:47 +0100, Christoph Hellwig wrote:
> When block drivers or the core block code perform allocations with a
> frozen queue, this could try to recurse into the block device to
> reclaim memory and deadlock.  Thus all allocations done by a process
> that froze a queue need to be done without __GFP_IO and __GFP_FS.
> Instead of tying to track all of them down, force a noio scope as
> part of freezing the queue.
> 
> [...]

Applied, thanks!

[1/1] block: force noio scope in blk_mq_freeze_queue
      commit: 1e1a9cecfab3f22ebef0a976f849c87be8d03c1c

Best regards,
-- 
Jens Axboe




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
