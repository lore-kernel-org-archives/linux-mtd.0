Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26620CD5BAC
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzwHwVQMx0JW7tWbYKj+5F38PFOLraX9fz2UP8R0fjI=; b=rx+CnSykVg3q9N
	0+SJnmw1fs+AbLls9h7ouwjbUyvm5tduplnK9oaIeJbzGpNVuRY12x/Ci9NJbcduO+vLOiqIhqXZZ
	dVTMnbams62tPl+hzexWONq9nHjorqadJDzWsnZeaZs66qz3EqphPCeBr3Qdgib7n1DwfMHgkPu6H
	sykTlhlyHVD9fe5TB+4s/YKVmvVkP8EEmRBZ4KSx5+0LzKAdtyud1c6iy44grgsfRRQcFTqlX7E6F
	Ehn3HGurBMq2yzqva8R2vd0UzJMh/O2wcLEr8C9XpCdovEU/D2Fs8Fd5hoaYWeeVQlxh0nAqpyFyy
	xvH7NuJixx2JHv/S13JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLmj-0000000AG6P-0zMt;
	Fri, 22 May 2026 09:03:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLmg-0000000AG5V-1zu9
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:03:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C97484E42D30;
	Fri, 22 May 2026 09:03:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CD966003C;
	Fri, 22 May 2026 09:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81A35107E8B80;
	Fri, 22 May 2026 11:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779440584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GEk2Or7oncWn4AQEj+NlbMh08rwxlw4kBkZE8Y1ciQU=;
	b=1yoSZELBHNYc1qtHNqEoM3HOjfMRfk36U8jhBTnqOadOLIyYrShUd9qBMbMNujfjYu9Gq6
	nMb1SXcrmFZaLJtC2ploUqJwtj4CS0zgc1Icoo01jcdrTaGREFQFM0m+0s6tBixYscliR2
	nPVgH1yp7fTf3nSAVTEsC1jmjDPYH4nXy/B7cCzUKEA/D3wXgy5ch4+fIBglDxrxB+OwCn
	C7aXSMfet2cMKaFHbtgiqdhxASxo7q6VOczCaClyZIWoU1HOsVtMH8ugYfbTOrG4AFxzrd
	+dHJ8UeUzIx8z0NxBS563ZzksgnC6oqw5Dc4T6TbVbJvQa6tnzLaJQiHtQ9b5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  stable@kernel.org
Subject: Re: [PATCH RESEND 0/2] mtd: spi-nor: spansion: fix die erase support
In-Reply-To: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com> (Takahiro
	Kuwano's message of "Fri, 22 May 2026 17:48:09 +0900")
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 11:02:57 +0200
Message-ID: <87y0hbq0ji.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020310_649295_E3A0E693 
X-CRM114-Status: UNSURE (   2.93  )
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

Hello,

On 22/05/2026 at 17:48:09 +09, Takahiro Kuwano <tkuw584924@gmail.com> wrote:

> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> ---
> Takahiro Kuwano (2):
>       mtd: spi-nor: spansion: use die erase for multi-die devices only
>       mtd: spi-nor: spansion: add die erase support in s28hx-t

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
