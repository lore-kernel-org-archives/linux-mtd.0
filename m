Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67252F33827
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjPYuU4uxbO+/LcZkVlPEsT2pwAbipdosC041GCK2p4=; b=h0BfvMfD1ylYn1
	+Uzu5auVJ2IY9T2NeRc19ke8A2hJavAKZPIb97ZRThkHBuuSSLP+9cEl6hVQINVThHl8G4xvol/2/
	ccLj0MigEUQ6aBRGQf5ziq51TCNigc5pLjZ/f3h/4yyKVED1PZPHVcRnSKuDV7v1fqcucjBqFOIVr
	2wiFvC+4yGrnjJw+M3EHTjOyA8yW6xcDhqaFKQM/LUZrIEPQPCrTOIlpn/h0K5AuimmUrk4yQ1CIZ
	IXLHT6SuSMEH0TzxJ73A1JE6iQyLPeHnRuBQtl4LDpAR4YhJY3xVxPZM2jclw/+SbxwGZk5mkjlS8
	3N22ePk/hUFNSBybmXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VVW-00000006cpk-43Uo;
	Tue, 17 Mar 2026 14:34:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VVU-00000006cox-1WBz
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 14:34:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB2D61A2D3F;
	Tue, 17 Mar 2026 14:34:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78B695FC9A;
	Tue, 17 Mar 2026 14:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2619D10450600;
	Tue, 17 Mar 2026 15:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773758089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AB27t9Hrh8v1l+efxd9rGwee8zT4bz2+Oer3gQQO2fI=;
	b=pPqPaEBe+JR022mSMm8YzTax1CYVXEJJstYBH/9n/RK+TN6NH+7xauD2sKhAgheF/2pkbD
	JP8aT2j4IAweob1w7uFC00DeSGhow/E1mPqf/aT/OoLpf1EaeEnA0h4d42De7TK/CpPNxk
	wGzx9C48G9SY1lD9J1UJLbXEG2MyeD9z+bWIV2YMO9UYY01bQ/Z2hYE/LcUs1G+ogu2V6E
	bDR4J9JmH8HLgc3Ew6q+cfnnw5T/z0ewQVN/NhbB/5Yh0o5EVunpUJzIoA4SnRR2XZGvHH
	u1MbCVvlNibinl4IsVzS0q/TW8zK9zcwgrRfAUmSLEddAMuw0wFknUmja6bjkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] mtd: rawnand: sunxi: remove dead code
In-Reply-To: <20260317142437.580204-7-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Tue, 17 Mar 2026 15:24:34 +0100")
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
	<20260317142437.580204-7-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 15:34:45 +0100
Message-ID: <875x6ued8a.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_073452_556142_C22DCA26 
X-CRM114-Status: UNSURE (   7.44  )
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

On 17/03/2026 at 15:24:34 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:

> sunxi_nand_ooblayout_free() is only used in a code path where
> engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST
>
> So the other cases can be removed.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---

Thanks! This looks much simpler and yet remains accurate.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
