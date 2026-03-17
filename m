Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FE3F3381B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBY3VOZ4fylHRSPyXnZH2tyC5xo0a6WDsnuQm4Ymydw=; b=NFYqy9JV/+jN9t
	t3qRh+pOL8X5mwOYxMMymgIfV6VHS7YJR/tpPHgq4JNPMq8aFFP8TLbN60MsI7JWtvH20xxwifyTQ
	c0xoRqW1r5BY+M91ModjAtzsddqjvWAY6mlc9KYd8KcYQ0x3uMPZSNt8YbmZwxpkucD2aE8jcJFZN
	kupeyTm9ZaXDs+BRbEvSMzMekAUZbM4/9/cdiwSdimh9hSOTgUel7w08Q/J9J3sw0K3aJzL+HIkRE
	bn5XSXLZDjSpS9eMjV9DHNbn17ZjYcj3G7xXkN3Q7EvE5xOiQU2PuRuJD3ztLN1ltl9tYke+Z/YNl
	giiAL0XmwxFcvXv3hdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QcT-00000005rLH-15pB;
	Tue, 17 Mar 2026 09:21:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QcO-00000005rK5-2jtA
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 09:21:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AFCB51A2E84;
	Tue, 17 Mar 2026 09:21:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86F285FC9A;
	Tue, 17 Mar 2026 09:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBEE310450368;
	Tue, 17 Mar 2026 10:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773739297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=EHyZFH3BpIHg/LTFh3V47YuMC51NKE4IDiKgbO79WzI=;
	b=BLspCs0C4PfZ6+SaSY+ghgkAEs7EbzFTGJ0rMBy7bygPho1Tc46GXjn7YeWa+U77pub4vM
	4lGk7g6ANLDMpJsPENHth2jptt0oty46yRzPge/Z6gS+AGXcqUm4dYFZMMcnoF0lMAA+87
	ctNq3ut93zEn3qj4WLwZ4kR3sRXzusFJvdTgULeccPCgcEjb8bQ+kDhWgy90gSoJnlXfGR
	kpx2Za9C7f38EL1zExUwfnrDFTMd6VZYdF0dVznXLirW0KiN/7zECQD/fO3H++BOGw9JbY
	swAekaT076aMItC8yQ9oyra2/gz7kLMPovwuJO7h1DeC2GsmBGS8nsdTEy/Bvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Jakub Czapiga
 <czapiga@google.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <cd6afbbb-0df2-4f4b-a937-40313da518ac@linaro.org> (Tudor
	Ambarus's message of "Tue, 10 Mar 2026 11:38:47 +0200")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<873429oxwf.fsf@bootlin.com>
	<acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
	<cd6afbbb-0df2-4f4b-a937-40313da518ac@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 10:21:36 +0100
Message-ID: <87se9yerq7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_022140_819306_FECBB81C 
X-CRM114-Status: UNSURE (   7.26  )
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

On 10/03/2026 at 11:38:47 +02, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 3/10/26 11:24 AM, Tudor Ambarus wrote:
>> for page reads and page programs (despite its generic name).
> ah, and there's no such thing as page reads in SPI NORs, one can use
> a single read instruction to read the entire flash memory. We all
> understood what you meant, but please reword this so that's clear for
> newcomers.

True. I changed the commit log and mentioned "reads and writes" instead.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
