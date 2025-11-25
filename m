Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C07D0EE0D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlPLwkeVD6jsGe5Vtf2UkFRzRhEafkxnrJJcjXx1+3c=; b=pYeDBzlOPjicVX
	I6rrRMCNHXpppp+QnM2nqcIS4odSOJYgg7La4FM52Jm/TasDBHzFfxGMS0lPFyafkPa2d/Lcu7vgX
	ObKuzIC7bF/qFoigdt0TYdYOCY8z8qTKRHwNn/rn9eT6YL1aKafSivWA/qybZnXZ0yihRajkuNgdH
	v9/E31ruRXToqvjzm1UeN9IJOj0MlGR9/mJEPdSXQmzDnx7w4oP+agOf240iVdj9ASgYXeSwPJ8Hs
	CfXBEQZZeMUJDODhgbRzuCNVi6b+E42OG9Ch4iVDXwOK2wNfMyzq8389ycmpNGmz/JEFOG7i3JP79
	kKTe5Llms2T5CcF/FEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx3e-0000000DgMg-0Z4b;
	Tue, 25 Nov 2025 17:42:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx3a-0000000DgMJ-14mT
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 17:42:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0307BC15D5A;
	Tue, 25 Nov 2025 17:41:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98E5B606A1;
	Tue, 25 Nov 2025 17:42:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25DE4102F0891;
	Tue, 25 Nov 2025 18:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764092541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ysGRqycURmr/iQdWYzfFaT6MnWtMI8XUPzwUEMUZQjI=;
	b=wF4QPV5dCMiOJwq2UP5afRPlO3tL3q9ojLBJ6Q0dmEIj/h6QZ4mB4ixZOJmdZkmEDs0JQI
	dNAQPmWbBmh99dsa8Pd4HHaQmn4pb6JbbF2Dxdqz53CqJdtgIsr91yLbliSNAM6S7YgQvH
	w2Mkk1HQK2EZGRQtNPD4hWF9XPHNNpCmPmTZaljjobGadKbol8FAD0ECDV7KyFgViFCskL
	FDVr8qRQvJWBXoq7YkVMGrlUz7RaRB7Ds0nDBben5NLtGhIMWC4OD/UY6UBoX6W/WgaViT
	pI5fF3eAz6cuuwnNcaXJCe4SRJXD0i2TVYuT4VOEQa8OIqpYUTJYrtZemtO7nQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-mtd@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap: update Pratyush Yadav's email address
In-Reply-To: <20251125173151.29430-1-pratyush@kernel.org> (Pratyush Yadav's
	message of "Tue, 25 Nov 2025 18:31:49 +0100")
References: <20251125173151.29430-1-pratyush@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 25 Nov 2025 18:42:19 +0100
Message-ID: <877bveuhz8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094226_445569_E0CAD12E 
X-CRM114-Status: UNSURE (   8.37  )
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

Hello Pratyush,

On 25/11/2025 at 18:31:49 +01, Pratyush Yadav <pratyush@kernel.org> wrote:

> I will stop having access to my Amazon email soon. Map it to my kernel
> email.
>
> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>
> Notes:
>     Sending this patch to linux-mtd@ and linux-mm@ since those two are the
>     lists I am most active on.
>     
>     I plan to take this patch through my SPI NOR tree [0]. Miquel, let me
>     know if you have any concerns with that.

No problem. Let it be part of the next MR.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
