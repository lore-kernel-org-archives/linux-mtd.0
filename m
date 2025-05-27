Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC83BC54F30
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOAZ1gcwwtm/ueDsd9AXOIHlnqk2IkmpxnnW2vz3+28=; b=XK7cTP5d0iCV9i
	VN+skoTDtn1YIE68G1jCiwJ7kl17dT/k6n/T9Kg80AThqS5TqFZCtdHJhOGY+BKqsPmryQ3vK8U/x
	DcmQLoWkhaDJ9u/46O+E1GS55TCxZp974ems2gXgwyZ6RctNKrLp7MpG8FCGRtiZyYqNpR/n/VVAL
	Usy+6vy3+69/O75QsIp5NcHRKf5hFRY+wDEobpT/GGRzpb7sIykbc8GrMqN19ycMdaYkE702+0GvN
	RrlJL9OhsE0TdiAZoAuwStyDGlIYP615gk3EqI9aOSWTedX9RjbI75RmGFShQXGieFQZVV6IJ9+vO
	OxB6/+2cKpvuKrt6fI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxF2-0000000BAXW-3j5l;
	Tue, 27 May 2025 16:33:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxEz-0000000BAWT-452R
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 16:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C8505C55DB;
	Tue, 27 May 2025 16:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775B8C4CEEB;
	Tue, 27 May 2025 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363605;
	bh=HyTgDh5cAO8OPW/g7S/tq4DLh5jwNnJ4nud2y1OhePo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AU9Aj7SADaSoc+uZXgHtW/H9MASQFJVMRJSss02BgBXgDMf9veat6k//j50RnUg1v
	 IYfUIhvR+Mhihs0EtAoAts4TTj2/D5QrWsqVB/5s8o+AW3UFNZhvuISisUB/Z9MxWr
	 ely09CCkHQk+qA4SAo9BBJRlQHm+v+e1INxdSG0d1NNNZBTuqEVvxK6/bu4WwPRgnO
	 Jr+asmIt1W0G+f1+u/4/dI6q3g1fyc8IQtq2No4RUdV61XsCl3ECBCZnGUOfy1pPf0
	 nGsTiHAjVNwKVPKt2IO63e/1gBxWF5HfbKAsygvMBfwowR+JH2zbBjfb545XP9y9LD
	 iKl6UNwYaoPpg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Constify struct spi_nor_fixups
In-Reply-To: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
References: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
Date: Tue, 27 May 2025 18:33:22 +0200
Message-ID: <mafs0iklmrp2l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_093326_048925_D4B84EB0 
X-CRM114-Status: UNSURE (   8.85  )
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

On Sun, May 25 2025, Christophe JAILLET wrote:

> 'struct spi_nor_fixups' are not modified in this driver.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   23304	  13168	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   23560	  12912	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
