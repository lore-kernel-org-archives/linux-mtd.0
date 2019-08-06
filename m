Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0CAC433FF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 00:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2142147A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 00:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HrRM8qjH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1bfTG4i6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2142147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=psHkqwiKIqUnC5vBWwJICuWgSIRErf1ex8255MpRgYA=; b=HrRM8qjHlZoXkoen2pq8rfvqYX
	eYtApmxHCF0pU9n15ymW3ReY8E91GmGrHugE9nO+fdoDRsJKqjGd2uDViRbiYJIiXhKAvc0i84zuo
	SfOsneb/Cf516KLEPAfHf4qPMMh3ClVApGCVuq1SAp3jRsnlrkX/8Wuq/BvW8llfZx7QU+UZqRV9K
	kzJXjXhiLAQZcHjeSRo60EI+WuUKQqaMY8qGQJ8vDzVkArh/xJk19BE+vv4Rt52KFvjbvbo0+NrBf
	0FlnEEFS/XjB5yzSunmjbiBkoXt98j5FE3j08CtIeZ9piWTX0Qf5AaQj0qrq7rLbMVmwZFJM0bAL3
	6l8dn7pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hunZE-0003Bi-Le; Tue, 06 Aug 2019 00:43:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hunZB-0003B4-D8
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 00:43:06 +0000
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBEF82147A;
 Tue,  6 Aug 2019 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565052184;
 bh=SmCk9Jxx0eyOZMYeH+bhxGPUDYdk6K+0WiR24RN7Bec=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
 References:From;
 b=1bfTG4i6PGVgo+k4mc2OVDocFXEraNLusc8izOPNg7z6K2wqfBhq0+VU5qnv2taQX
 R341mrmxSlGmf7ETxW66AYjU0EojsHqV4iMqOXKECOAO7jcFVJ4eUA5QQ12KoL3e4d
 krjQ7RaU9CckTi1WIVRC11D4f9ouAXXE/EYuyM7c=
Date: Tue, 06 Aug 2019 00:43:03 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v8 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
In-Reply-To: <20190805190326.28772-2-ikegami.t@gmail.com>
References: <20190805190326.28772-2-ikegami.t@gmail.com>
Message-Id: <20190806004303.EBEF82147A@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_174305_481183_56146767 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: , Tokunori Ikegami <ikegami.t@gmail.com>, stable@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.2.6, v4.19.64, v4.14.136, v4.9.187, v4.4.187.

v5.2.6: Failed to apply! Possible dependencies:
    4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")

v4.19.64: Failed to apply! Possible dependencies:
    4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
    d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")

v4.14.136: Failed to apply! Possible dependencies:
    4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
    c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
    d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
    ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")

v4.9.187: Failed to apply! Possible dependencies:
    4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
    c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
    d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
    ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")

v4.4.187: Failed to apply! Possible dependencies:
    4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")
    c64d4419a17c ("mtd: cfi_cmdset_0002: Change erase one block to enable XIP once")
    d9b8a67b3b95 ("mtd: cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer")
    ea092fb3ce66 ("mtd: cfi_cmdset_0002: Fix coding style issues")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
