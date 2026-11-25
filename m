Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807E606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDlCIORQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TOy6dma9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gwOsbLH4TanAZdtgVNqqEtud7dr5i4Cc5jjO4TmVzBw=; b=nDlCIORQF0VmRCIXmGW/YWGqFT
	ghxj23R65BzOdxzTzffZUhe25Dz6yz2alucRuq2/B0/HLXKOtKaYT+zITjl2tVRNEoLf/WPJTZeJF
	LhQlhm09TeknkeHOEvnadp9aWHIJ8CRSSOBJ7SwI5KZdGsCEYfqBSi3DO/R23ZTBRpqMJJ531zep8
	G6hHNs1bFuYjdxxylB1l84WmpTcZEeRNWdekHLPejTN9NcnMBRXJESURfZ4tqVioMNUNDqjEaamDG
	4bB/82CezMyeqg757GoYnoy8A4DTlwVL904hrlLAWC6ngdcwevlprXf9B/WJjtS0jbS492DIMMtml
	jr1IO3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cY-00000009MaR-1aO1;
	Wed, 25 Nov 2026 09:48:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cT-00000009MYU-1lik
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:48:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0477F4E41778;
	Wed, 25 Nov 2026 09:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDBA860480;
	Wed, 25 Nov 2026 09:48:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0511711E68BFA;
	Wed, 25 Nov 2026 10:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795600128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hSrZ7TU1SA/f7pgNCA+lRSXARyll9PDrfkSwUDqb5bQ=;
	b=TOy6dma9VN72lEIA2mOsMYgGMAErfdIoRSZWSmuR3sNQ/r++AKHH05xX7wZHyXoTzYrP0d
	MJgyYXafYAVyeXfaszWG3DVaRCGADyJJ+4TLGN6ruQ85uytHsqBsKcwLYeTxGBG3VAOsZL
	LS6Xi9SMbtpuqisidOW7XHsETfWUbdIhgHf4bS9/y5e1+DgUY9TYE5o21jFdhrSfDT7M13
	Wvbupi7nG4/gHDEBgd8w1CIMPdIi/DNe1K8Wl6JVfEDweAcvti+VkCjnPPcOZm0b86y8WY
	mELRLcph9h+AgI5+T0RBPy5C2rL4s4x0GkJaRRRzNsMzevrdT+evzz8ty6xB3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261125092538.1938516-4-leeonion.muyu@gmail.com> (Ping Li's
	message of "Wed, 25 Nov 2026 17:25:38 +0800")
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
	<20261125092538.1938516-1-leeonion.muyu@gmail.com>
	<20261125092538.1938516-4-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 10:48:45 +0100
Message-ID: <87o6bdz1fm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_014853_605298_10F132F0 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> +	/*
> +	 * r852_do_dma() feeds the buffers provided by the NAND core
> +	 * straight to dma_map_single(), so ask nand_base to bounce
> +	 * non-linear-map buffers.  The local bounce in r852_do_dma()
> +	 * is still needed for the hardware's 512-byte alignment
> +	 * requirement, which the core condition (chip->buf_align,
> +	 * default 1) does not cover.

Can't we change the default for this chip then?

Please drop this comment after fixing that, it is not useful, this is
information that should belong in the commit log.

> +	 */
> +	dev->chip->options |= NAND_USES_DMA;
> +
>  	r852_engine_enable(dev);
>  
>  	if (sm_register_device(mtd, dev->sm))

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
