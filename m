Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE4CD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK85aBs7msFxrWh/Kt+UBcmZMY9yAyDyHWiN/d7HWb4=; b=ZcMZdrtKY5lXn0
	AU/+WANsD83EQZXkTPUAVGQyYpS6ib0rEa1qVDzojcm7rE3dAER/cng+eIMPDM+YlqzGmJYTU2Kxi
	UIUNxlZaH4OsAKyp8EAxyvZ55N79+OBw+RwQOr/BecpX+U2OK3AkFlN+m4vZ6SMH9XL/0nLmtlZdV
	cZZ+qHGkD138pZjirmFCBgaX25MSlzVhzIG7t9VHlv+vdM3Ni450JvbhAhzs5Qcd4SoFpw81irHoW
	DbuYrYBRI5+pNPxoer0Ey6bElveJkt14M3sDmM/ZE7W1WBUZ6QFL9HFhKBdmmFptRK8gU0cCoa8Ck
	RX27DzsEL32wT5maTvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpTx-00000001i7A-0aTl;
	Tue, 26 May 2026 10:57:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpTv-00000001i6w-3UjP
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:57:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF67A600AB;
	Tue, 26 May 2026 10:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F111F000E9;
	Tue, 26 May 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779793074;
	bh=4JRV23SJcQu6vM8ph76eZ4Eqh9L84IGzW3jcIzEbXto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KeTXiuqI5Rb12d4R5a5YV20+zZ6x4/Fj9kExsyTadRn+Cw6qtNg1WNAZB0+dFVkWi
	 IVR1l/cPsumRRwvvWAP6hBnXyU3vu69n1ThSL5aqeXDqejIhep0ZZRjkvFM5Se015k
	 7etRyeVxVaxp5JrMcHh2Zwhem4R8NUxUyUUFp15ftqDAWBumyZfmudAFVY9M+2QWRz
	 iJ3moaMaeGEBs/R+YqMvv5MfdxIB5V4/ZsDfWjyJwuG6XdSVkQpUtx3JUknUrglZs6
	 K5fl6uJYcYmdCMTX6kOIDeUMB2kHefGmv3GsT5/LxL++Dc30SXy5uKU9Y65KbT9/fn
	 Zh8V1cObqz4HQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  stable@kernel.org
Subject: Re: [PATCH RESEND 0/2] mtd: spi-nor: spansion: fix die erase support
In-Reply-To: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com> (Takahiro
	Kuwano's message of "Fri, 22 May 2026 17:48:09 +0900")
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
Date: Tue, 26 May 2026 12:57:51 +0200
Message-ID: <2vxzv7ca4evk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

Hi Takahiro,

This series is good to go except I can't apply it because the From
header says "Takahiro Kuwano <tkuw584924@gmail.com>" and the signoff is
from "Takahiro Kuwano <takahiro.kuwano@infineon.com>". Please fixup the
commit author email or the signoff email and resend.

On Fri, May 22 2026, Takahiro Kuwano wrote:

> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> ---
> Takahiro Kuwano (2):
>       mtd: spi-nor: spansion: use die erase for multi-die devices only
>       mtd: spi-nor: spansion: add die erase support in s28hx-t
>
>  drivers/mtd/spi-nor/spansion.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> ---
> base-commit: a33dad83043ebcf18d0556ccc105b1620010f93d
> change-id: 20260417-die-erase-fix-49a237ba9df4
>
> Best regards,
> --
> Takahiro Kuwano <takahiro.kuwano@infineon.com>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
