Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C92EC9832A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 07:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnDixrRh02FULhJpYRkuJvxkDEGI6NE7yPNdNwGWmRs=; b=x0OhDeegCqURy+
	V2bkLR2O7l20CADDjgYuUfW9uDQhO/d1gSnAwaIlmD4ENanRUfD1IbYgkHzcwvJutgt0/5v5kHdnn
	+6dYLeLjtRax2eClUGY3da6PNPpxyf4h/K78Z1NV/+lLTnH+4HW33S/pmPGC5NgwlyJxIpfAAnmux
	YT7FKoJYyHWNUgXp2mcVHtijhw/wejvAQjEMeKhw/e7e+xse9gRvydyyji4eZl1h8IXFG8tfY5brv
	LXncAnTwaw2DcQnyHrdcoRPmU/tRE3ZKagN4BixHLdiY0mJ763ER4/W/+V6l6aKV6k+pRuJ2mxrAY
	uF1Ystn7xzf9M68yJmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSGE-00000002cB9-1q7a;
	Tue, 29 Sep 2026 07:28:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSGB-00000002c9R-1Zac
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 07:28:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D08314E410BA;
	Tue, 29 Sep 2026 07:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99493601BD;
	Tue, 29 Sep 2026 07:28:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E90A102F1E1D;
	Tue, 29 Sep 2026 09:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790666895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=98FUG08n/xYMH5ubg65KibGYCuzA8HYmIuEhpH2O6a8=;
	b=aU2t4FFQ5paB8PyJ3B9qyR967BcBUTGPkGzNnkvS8+FazZtTLT8ssNuo6v2e0a77xLaT+q
	iShrTaMZf/+xnKIe78GaRMY67vsLpL0ciiPgsL6Y1642E1lQz4nPu1iA2DGXIaguxfdrGW
	w3GOhCS5BQyDnJgz3Nov62KPfyDuOkHgPzuAl3R+b2WtptlQcIzhT4aWMZ73CX54lVIR54
	7shKP5fAH90AejKrkKniVgXVzHGE5PZ/x3KJmbJOICobfhOTpZKG0dh62e7YfSJorIdbgl
	6JF12MHWVhSuhep4S1ACkNnHk574+0FdmgpyqMNj9kosW9tmBCD2eYFGenh/oQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Michael Walle" <mwalle@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Richard Weinberger"
 <richard@nod.at>,  haibo.chen@oss.nxp.com,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org,
  michael@walle.cc,  linux-kernel@vger.kernel.org,  "Haibo Chen"
 <haibo.chen@nxp.com>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
In-Reply-To: <20260929065924.C12141F00898@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 29 Sep 2026 06:59:24
	+0000")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
	<20260929065924.C12141F00898@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 09:28:10 +0200
Message-ID: <87bj9g7bzp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002819_552519_0C37CE3C 
X-CRM114-Status: UNSURE (   5.36  )
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

On 29/09/2026 at 06:59:24 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] mtd: spi-nor: compilation error accessing non-existent opcodes.read_sr2
> - [High] mtd: spi-nor: modifying hallucinated opcode does not skip SR2 reads
> - [Medium] mtd: spi-nor: permanent breakage of SR2 reads due to
> missing state restore

Please ignore these. Sashiko did not apply the patch to the correct tree
(-rcX instead of -next).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
