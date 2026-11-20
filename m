Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E760A2601
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txGQsAzl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKcab7C1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ee91NBv/LvFSerTgZSLUSGiMACQJlr1Y1C2S1aMHCg=; b=txGQsAzliPud/fKBqf4LFYHU+U
	Rbs3KNYve8KkRT73YLXDuB/dLeKcXrm6M8Z/P98/iv0Mcy0ivsgUq/2X4czfMnX2GUjCFQmmXJKjt
	FPU9UpdgNbsGzAL8/PsFCVrGhst1ag3/DE/cz9csAWgEuV4Bv9TxxZKMLUF78jxVJqkHejlmJq3qg
	fxGKAjTkYqhZXFj7UeVDzO4qsUCtzq4/08VwK2/bpJZl11AZhy0LTaEzehyBlUf4/qGiJTPw9/Hcu
	CPCpH9qfG6mNoisipVHHV+9YEf5NQvjxh1F0lfptJ322Ae+MSpup4Qp2tn9lrtSwpa1h7ik2LrJVQ
	ym8cnxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNhP-0000000Ex07-2pTG;
	Fri, 20 Nov 2026 12:26:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNhO-0000000Ewzp-0LX8
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 12:26:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 338F461CDB;
	Fri, 20 Nov 2026 12:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB12E1F000C4;
	Fri, 20 Nov 2026 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177596;
	bh=I3G768SLhqBwcqMXJfbPX0ci4T8MgwSXdL6Wve6YoBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TKcab7C1R9cGiTnawXGCIuQ4YfvOE8xeZpbqHAh8PRhcxQDF/zSOOT9ntUkuCTOAZ
	 2anxMbpo3Ok8rAZmg2et4tx8PaHSkQ6LEb3DbFhjefmIVXdwRy1z7yCMyMzSESwNmr
	 E0vf+bjVfGT45e6Q+lBkkkeNA6uvtAZhfRjrx7LyGXSRFKvLrf+PwmKeIGeUQv3Iem
	 HaN660JjvcTr3hLRC+pTEW+Wvs9buXOa2LtpFEtjZZw/pyQZ0dT4/dd+mCTnvYku4o
	 7+zhkU+gdMgpR+QyR4SrAPBEGlypiLqSkrVhdTQns4i24mrtp2/uh8UebHq7l8uxgv
	 zrQn7c/fLhwMg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 haibo.chen@oss.nxp.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, michael@walle.cc, Haibo Chen <haibo.chen@nxp.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
Message-Id: <179517759444.1010165.14064662323338062426.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:26:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 23 Oct 2026 15:11:54 +0800, haibo.chen@oss.nxp.com wrote:
> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
> spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
> the flash has been switched to its runtime protocol. On an octal flash
> running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
> 0x3535), but RDCR is not a valid register read there: these parts access
> their status/configuration registers through a vendor-specific indirect
> space, if at all. The flash does not answer, the register read times out
> and probe (or resume) fails (on i.MX FlexSPI: -ETIMEDOUT and a controller
> WARN(), seen with a Micron MT35XU01G and a Macronix MX25UW51345G).
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: clear the default read_sr2 opcode for Octal DTR flashes
      commit: d4d6fbd84fe7cb60f8fce048dbb8362b69704078

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
