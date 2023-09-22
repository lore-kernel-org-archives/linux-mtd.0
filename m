Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6240E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43reJq8P6R2rFgWLoblbxObpnOk5lt1+rssL8NTK5Sk=; b=sq94MC1z1+DVZs
	dfzRVzBIQYqWkMkiyhQI7RJrKwM1UHzEMU+PKcfDzIzm1ti/NsEpyGAXmm3Cuy/bBDY0+9kE/4BNR
	/4WwbWXF3KTGitrCuXim9DFU0AWTQ07g0v65eD7+G7shq23i7KLacKqNkyuIa9RxyGSAkBIqN8H+f
	T/xbR+vCXdc7tyArTeMZPRih/3tGWwS9QApCOHCxyWIIE+6BXNJUcwjnAgHiV7dWAsH6dppMroEkF
	Q8BPV/zMubz+4mvuIIM5MbSMe8emjjVIOfyX8X7tJ7mrEveoz+daCL6/LdsC2HFbYgW9bo5JM/38e
	KSIw++2dtoDRLN03NCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVY-009FUp-0j;
	Fri, 22 Sep 2023 14:51:52 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhVS-009FOE-2d
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D2FD1BF20A;
	Fri, 22 Sep 2023 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05vcLB/XaKrSRu46bMeEmatamQa0kPcGH3AO6FNq7XM=;
	b=XnveTOL/HoZgxP2lRI71EG81nobhmP24xEdoCa9p0YoIO0hvLUt5GZ/73vQIYICi2bnlgM
	uz+w5YoaBhhB9A12i1rExFOm9L9EdJpWRqdAKe6qtKTAXASWSEJaG0OB6efK7/mUlq3HxV
	hsggBI0gfqeU5vID14TXgKoBwLj376gx13yZ6BVLZZ+xdyHVTPreY7wCWjws1wyI5iMoi8
	/UufR+Jm7mmSFf47XzVcV6h6RmDss4vsSkZJOFk8Mro0u7GLvVBr8R5IQnWGOft3FprXyF
	BX/7sclFPi+r5Q8RNwNJcysEKcFJQXGFMaKbsbQF51r9Fq3j6XAIfO0Ix6k49A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: Annotate struct marvell_nand_chip with __counted_by
Date: Fri, 22 Sep 2023 16:51:39 +0200
Message-Id: <20230922145139.578446-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201243.never.235-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a8eaf3ef549980719c5fcca257d5b220ac0f3f1b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075147_002348_D303AD3C 
X-CRM114-Status: UNSURE (   7.73  )
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

On Fri, 2023-09-15 at 20:12:43 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct marvell_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
