Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02970C83F03
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKTeogr1P7Ljg0cwgd7Pf69XDFD+r8Hwr9/oxrgwRvk=; b=Xldp8hbgs4WtCc
	cCCDmQ2OOSRR+8VNuLAZxieNgDrug2GsbPMo/rnXqVOOoR1cNWtZY+4n1/mMzlYcKxehI3YzSlxwZ
	nemVCkbeRboonZKEV2XIrJtXaWCY1VoSIOm1gz5xK98U3zLMPwyWG2taDhUsTBa8ZbD2cMEbxioRg
	hUznGFbNLMHb6BuKP4uD5TwceD65e4Ua31LXZqCS4NzRfnmOlFi/zIKB6ZhCnP0d4NaxusS0MVfzr
	Thyvqq9FRR8jzENin11PAe0qrIeRV6bCqktrhweb30nwZJ/pV0Mzm+L6IZSEQlP3BG/5UW8C8Pse/
	zI/VqN4B6iZqDS4cGY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNhS-0000000C8Q5-2WML;
	Thu, 03 Jul 2025 17:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLLQ-0000000BjvX-0amW
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 14:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B240E613A9;
	Thu,  3 Jul 2025 14:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8645C4CEEE;
	Thu,  3 Jul 2025 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751554521;
	bh=yVxzr3PNGth5JEoi2Plh9yJruRMND7JhqUpImBzkY24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RB2NXqSbQ1EK/5tn9seLOZVKmjb5s5dYcNKHNmGLCXifJRsjnUvRMr9vx4v4gtW7B
	 l4g1g0W3KCg4b4HWk7/SIGcSvl8genmL8Fqc3SIQ/I1xmeyJMlMixJ3fv5biQ0OZ+h
	 kpAatRdw66ZV/2PxD9JT9PZXytbAroima0w66HZ1aYSt2OT1O1RvdSdFuc7T7cXiWa
	 0wJnC80kOZNVUkice6QX+R+woBLdeeHeLNXoQmgRzX5SVcilzhp2HnSnOxXPi0m35f
	 SQLZ0A21dQ5m4lgowwGcTYG54rIWbYpEhKTuEeAJO4CY3ogvM5H81AlE6wDcZrfMaJ
	 Xp0FI1BgVBz+Q==
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
Date: Thu, 03 Jul 2025 16:55:18 +0200
Message-ID: <mafs0o6u11fzd.fsf@kernel.org>
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

Applied to spi-nor/next. Thanks!
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
