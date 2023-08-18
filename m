Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60402C71159
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIqntDLQJiZEAk+HLFk2ZCV07XRDSwoNbtaSylwBfMs=; b=jHx+5cjY+tiH9i
	3Q7y/IbnDu+BGEK1ct0oxP7xeLOfImXEXQqMjXEriWp5r8xazcfpfO42VlpU/g7IwC+DnC4Z+k5ur
	E4oraFYUQMkZi3+nKYyB4hrJBiJfZYreNcRKiQaxpkeydIMl73Yy5PtAWuLKP7c3002uXO2XqG4v0
	p9n4mDrAKbfAqKF0xHsJmiK/dC014+YtJ6/zwm+DNZcr+vko/EXFZMyTixfL0gdbIAVgFazEN1rNA
	Kvd6jodQYEJVA6HSr5S8F4IseaN4WOvX+hymmt8M8P0vOyurmMXc1bMPrhQABnoxj3pnyCSsoPud+
	KsHqib+FQtHmiw6VXN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f5-009VeW-1k;
	Fri, 18 Aug 2023 14:41:15 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f1-009Vd4-2B
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74709C0006;
	Fri, 18 Aug 2023 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnWLZlTRklyIq0gsggN9dgk+3faULATNeMM2pNJ88wI=;
	b=X53g3EnPtfUJXK6TOLZketkkLshIxL6N+tjsmJPq7tuxg4aq40EyHPmoP5BVJMmV3nZxMa
	+0TN8cLFzCK/JmR7Nj2KlZhFCsGak9ezL9t0u7OgpCfulQtxidzB5k8lUVpJ7+Awkt7mWz
	t1qWKh0hJ69tJSd649DBuMeou8/YS27juKbC5K+v0Ua4cFIfVVQY6hKarWeP76cMX13bWO
	ySeSpa2B0L4haMysf/MZaU4j7q1AA/wTmtuQ7Eg0NUHTKzfehWd35H/X11ya3frSwpTXNX
	dKu2WOkyYGqClCORWDI3L80pQ/52YsY5X6kNUE4KwfBb6CuXiOiocZjJ8j5Z3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>,
	Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
Date: Fri, 18 Aug 2023 16:41:04 +0200
Message-Id: <20230818144104.145820-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817-void-drivers-mtd-nand-raw-vf610_nfc-v2-1-870a7c948c44@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b9e002a34420e5ba25d4283be870c48e0c9e005f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074111_850918_CDBFB391 
X-CRM114-Status: UNSURE (   8.40  )
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

On Thu, 2023-08-17 at 17:52:21 UTC, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller integer
> |               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         853 |         nfc->variant = (enum vf610_nfc_variant)of_id->data;
> 
> This is due to the fact that `of_id->data` is a void* while `enum vf610_nfc_variant`
> has the size of an int.
> 
> Cast `of_id->data` to a uintptr_t to silence the above warning for clang
> builds using W=1.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
