Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D778C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rHoh7hDfL2cDe6ElLgDI82vxyjVrAetegWt4djqekE=; b=foebihUa6Tse5d
	+E38+gVSJ8u72yzmD24lDhXyDd4/SRlDKU6k68o5tNnzvlhIlCNXYqqjh2u+6/I5IhELCAI4/1qfv
	B+kqi21jIsJr3YYdJb1yZ5OSoj7gHUUVbbnySSc5aFGD8VfW0HhM6vagZ6D/2e0Pud/fhQ0qocBd/
	DlgUIigXyBQrqM8588XGaIZYsBC+QHPGdBU2XDn5GXWVvrUu9BiRAljpUYhfGZ+MOAlDLKHazbRYt
	346c9BW5CtR2qoMpTF4V/f4+BU/TVsQE9rCBCPj45aT0HwDxNbcx6Mz/umfsBsSJxsfNX9JnBaQMF
	CrKoDLKzZm+BqGbhChlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrq-00Ajd5-LK; Mon, 02 Jan 2023 11:20:34 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIp8-00AinZ-Gr
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 11:17:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A25CB40004;
	Mon,  2 Jan 2023 11:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ4q1En/5KoBfWdjsEhlx3uY36hLwac59A78Yg4Sh7w=;
	b=gMMs1X7QT/dJfZXE1d7TicDP2UK52byA0wm+9oA2aTzbkAiwsZcX3G4JDL407kSLxayxZ4
	t4gx1WTQY3VsLJU4wdDgiR9Vzf/TBgSSkif0ru24yLZAX6PpdrBI2nDj3OlNcYpDTALwxT
	HPqfmsGJFudjNDa6+2cz3vwD9uXADXo3mGlbWN4Mw0pCSd9F4y46sKj9B471uVJCi9tM4n
	VBX43iHumsq0tE4CnEbIKH0nEP5QjUyfKSogJLpUDKDP4zmJ55IVP+oopiznyskZ4lmvbK
	8AAUZcjcJUUa+MRtVS0ASvORX6htaIw3pMxaQnLjti+62Wc4l5mBOmzm3AbSSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	NOGUCHI Hiroshi <drvlabo@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Date: Mon,  2 Jan 2023 12:17:37 +0100
Message-Id: <20230102111737.85778-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <805fe58e-690f-6a3f-5ebf-2f6f6e6e4599@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'105c14b84d93168431abba5d55e6c26fa4b65abb'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_031746_753455_E0A3AF05 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, 2022-12-08 at 20:28:29 UTC, Mikhail Zhilkin wrote:
> This fixes the following compile error on mips architecture with clang
> version 16.0.0 reported by the 0-DAY CI Kernel Test Service:
>    ld.lld: error: undefined symbol: __udivdi3
>    referenced by scpart.c
>    mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a
> 
> As a workaround this makes 'offs' a 32-bit type. This is enough, because
> the mtd containing partition table practically does not exceed 1 MB. We
> can revert this when the [Link] has been resolved.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1635
> Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
