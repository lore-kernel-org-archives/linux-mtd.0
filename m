Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740E4CD6E57
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCjN1z5fPHHzkO3WkSPUgIvaKs5WEQroj6LOfG+PCYQ=; b=qtu4Tf64vsSSMu
	nmoCk/XBw3dTXTq5Z55eTS2AbzUzG1C+5lTV16mMrDfVgXZqA+dxLCLrUfjv/O+hCrg6tUcgGUvGm
	Iyllmd+6qHb8AEC2/2PbeXa+NhO7FSjxWFxOMe2owWWMM2ASaYRgavcn3s3YzoPDCV+IT+BOT3ewR
	BKoMNbA+dFqPRaWezW4kpvk2qKohYW+qU9IxhaJTNosbJx4+DBOS4OKiFOC5Sz6/q3OAlGjN9IPQg
	AMOk+21WLB9jBytBAYnlGJy8pmN4Vs5FROI/e70HsJSufE3TcEXBB2TNWWPo54RoWqld7yzWtEbHr
	bYyoZYMgQJkBUdMDHC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULtB-0000000Cike-2CnR;
	Tue, 02 Jun 2026 09:58:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULt9-0000000CijX-1kts
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 09:58:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA951C6247F;
	Tue,  2 Jun 2026 09:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EE81603BC;
	Tue,  2 Jun 2026 09:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 688601088817C;
	Tue,  2 Jun 2026 11:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780394299; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9KrjWj23ltC/MWJTEE+BQAQd/5TIXPPOwrS3Ii7xAGo=;
	b=OlP05TaN7Wj0diVNom9buZyXGj2oDSOr5Vdr7eHzdx+TwFIqgu+5MmbayH2MgMIyIQDlXL
	xfrz9Gr3Z5prCRT7QJxn4FO2avv7J0Y3x7ISen9hpM5lex/AUK4Kt3OeNc0YPVZNlHZ7Xv
	O4EASZNevTkreCoAIHrpO1QAwP3LSMt7CxzeUrFraLBiFq2hW6/9DLBmhAKyZioXtwGSHW
	FXEMuIKRzWeKfdmbcJREdLjrPeILAtjsdJvSWwmLw6vIenJJzabCLf1XKbyrKNR5PDU75+
	7fJ1K/Y7cIC5ONSPgx5CBh0MPDIGhr42gRq5Nina5KCYLFTCXu4j8DfVaiRcUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES
 flag on failure
In-Reply-To: <20260601125438.3481722-3-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 1 Jun 2026 14:52:44 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
	<20260601125438.3481722-3-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 11:58:17 +0200
Message-ID: <87zf1dmfgm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025823_614682_7955E58C 
X-CRM114-Status: UNSURE (   7.27  )
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

On 01/06/2026 at 14:52:44 +02, Michael Walle <mwalle@kernel.org> wrote:

> This was introduced in commit 548ed6847f530 ("mtd: spi-nor: Add the
> SNOR_F_4B_OPCODES flag"). It looks like it was the rollback mechanism if
> parsing the SFDP failed, but was setting that flag first. Nowadays, that
> flag can only be set if spi_nor_parse_4bait() was successful. IOW, the
> flags won't be left in an undefined state if parsing SFDP fails.
>
> Remove the unneeded code to be able to rework spi_nor_init_params().
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
