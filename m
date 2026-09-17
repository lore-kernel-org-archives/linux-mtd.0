Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6F9C88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5pFPGqe9fkXae+NNN8OM8XjwAwml0dL60Ifv45g+Io=; b=M1xV7yjZXcivkk
	h7SVP6/TXrY4aDkhTsKUXtGAQVwpBC4w8YwXbk/qLWMLHaH2KnoJtyr1+aZKW0mHplCuerEBEWr44
	MAJ7n7Qn0ZW0l+vhtjeZxPOfiW/HAzrGSGRi9nfderJ5EiO52GkxVcQOrJOlEqRwH4sGZUovxCK1I
	zd/tO5p3RWaxtXJUlqZgz68zvZl8qphPIKGh7LeKfwQ7LRtEeGChFuk/U/f39+hA6uGn3DwyWz7UG
	fMAOxmmMZvfOVPZrcL/JtuoG6HJd4z6lk7FPPH3Q49uCzMhAzjfg3wOe3QlJwaJQaxZlf2XnoubWW
	JMdrwtzdB9JTjf2xLzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BRa-0000000BJXp-3XaJ;
	Thu, 17 Sep 2026 12:42:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BRX-0000000BJXG-0Tuf
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 12:42:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7CDC14E40796;
	Thu, 17 Sep 2026 12:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F8F25FAA3;
	Thu, 17 Sep 2026 12:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48A9711C7B02B;
	Thu, 17 Sep 2026 14:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789648934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PG9s/lQpyWWgyfajfquVuT6dwzIWQ6vycJmpjWt0HLY=;
	b=LqJ4BvtD8bIdtKDNwHMo0d/OrXqlDOs0fVG1ddICEofuOn1fsTso7l/fYR0gWiq+0Xq9v1
	9x9JRS9AibiILUK+iPiAkQxIzx6mgPYIz5asidtJfQJ5Noot658VFCazbUiwl9bbNVJ0Vs
	J/Bxp9Ky9nc0OPWmGE4hvk0GcjgVlmRCWWPfMiTxL5/aQxQrE+O8TfrdVe4D4iT2hXcphe
	Z5vEXWSSgSQGFlq10qo74xaO1W6ug0OYJUcxeRMu4HJ9zusmJ/0lF+Jdw/JbNc6yNCzJUv
	7hyJRnfvojKeAMvAivZVlCEkDqrgI7CWMMFFCL6LD73R4ZEO50BRnG7rrhohdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Takahiro Kuwano via B4 Relay
 <devnull+takahiro.kuwano.infineon.com@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  takahiro.kuwano@infineon.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16
 KiB
In-Reply-To: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com> (Takahiro
	Kuwano via's message of "Thu, 17 Sep 2026 14:02:15 +0900")
References: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 14:42:11 +0200
Message-ID: <87jyokjbh8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_054223_314621_A0B1EB9B 
X-CRM114-Status: UNSURE (   6.52  )
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

On 17/09/2026 at 14:02:15 +09, Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org> wrote:

> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> The size of SFDP data read and cached is limited to avoid allocating
> too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
> has parameter tables at offsets beyond 4 KiB.
>
> Increase the limit to 16 KiB to support such devices by introducing the
> SFDP_MAX_SIZE macro.
>
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
