Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ABD606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RxjvBCeD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XY6YK8OU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3CAEBsNdlG4/vW0BIdVxKBM0EPCjDFbZ3RTggproLUE=; b=RxjvBCeDECDZjwMeC1FHzYSybL
	hQr1NlEPaFz5IRaksh6oIz5uf4QRWDZJnp5Td4CAFCMFu0z/7yRG+3ZSWfibPeU0Nf22yAfaGi+42
	5ca91PUpUvmWMjttMQ3LM1FOg/FCSrZ2EQXOnDYuUSDZZ0NMXHXZLvM9LfBrcpgKygPi0PASliXwS
	VEjgJ4wLWHMM95MxQPyeyJxuhf059wM6/mlizhvAYNBYaKRxds2yccat0tbKfekRZDcT7NReVDINF
	uUy7XykDoq1oqr8cYQY0EZ018dEienlR3A3ZPSjgWKuzl13x/jQ5+OoeqvBqpFIjqe+tGPSsYSe3x
	NbONQ3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzQf-00000003BTC-3hq6;
	Mon, 16 Nov 2026 16:19:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzQb-00000003BQb-3Rqu
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 16:19:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE83BC4EFDB;
	Mon, 16 Nov 2026 16:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9ED46023F;
	Mon, 16 Nov 2026 16:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81D5B11BC0D9C;
	Mon, 16 Nov 2026 17:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=khQi03PC83O/USlRy0JEKfkEZMesY1td5y63oRDAZO8=;
	b=XY6YK8OUrtm0QD5rlDbgP5CQCXjZeARw6N4BZORuYnurdNfrRAHo9wDT8iiE98luiKGuzg
	T2MHrw5bN2sLuBYr7fma3Okae37MqzTgKv+NEkElmbIRH4MrwV5Oi5qDWXS+GqGiplWrfx
	G/WbSban2iHELGIOI2kbj7T60KGb7f+d8KcZs1xVUynk4rUuNrlYd2GffXmn6cYlViKB5o
	Riov156ZP1ho2O5seZ/kpyNiCxZzkTj7Zb/0Pt9pZvKO0wA4z0yu8yELq7SgpMrhyQhTgE
	ncOxgY4VWdBdKWZoPrrTo02eFrnoOvJ0/yTq6XBzF4ihqq9DhmLwSMadxUAY8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Paul Cercueil" <paul.cercueil@bootlin.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] mtd: physmap: Remove #ifdef guards for PM related
 functions
In-Reply-To: <sashiko-outbox-199606@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 05 Nov 2026 17:24:23 +0000")
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
	<20261105171158.399247-5-paul.cercueil@bootlin.com>
	<sashiko-outbox-199606@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 17:19:23 +0100
Message-ID: <87mrr8px4k.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_081934_030465_C154C51B 
X-CRM114-Status: UNSURE (   3.93  )
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

On 05/11/2026 at 17:24:23 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mtd: physmap: misuse of pm_ptr() on shutdown hook
> physmap_flash_shutdown()

Low, yet relevant ;-)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
