Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6358BC54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkBTm7vdGotxgmvdSfxb5aSf2cmvLQ3echdz+l+ZQ0k=; b=R/DIzb5tQtg8iU
	xBc/KWGqHEEA33qccsMw6NWmdyVeXZQJA/nLUOPsoJ973clZ7pxFVotSH93aGA5ItBWXD+287shrk
	1kSmJGE8TIcUXYdwouQoMf1N/WwcOzyREr12ks4S7G2MWhL/awbSp5shcq8bzGP/ex+mBGDPbO/14
	0MX0nDHbkBY5A6yXTf6iB/96lv/caBxvHLCAnxdu6eCblbzsUARfruxi4J2K/C/ylY+iG4hPdZaT0
	Inh8xVQKFEIY964hQUbiUyDvPab8suMeXC1XsSPG6if6Ko38/Kjl59vHfKvJrQdAyWKADkXU2n2Wa
	i9VS3ns8yR+nmOZvVAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXj-00000005gW6-1Rvq;
	Thu, 07 Mar 2024 17:28:31 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXf-00000005gVE-0QiQ;
	Thu, 07 Mar 2024 17:28:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54553240004;
	Thu,  7 Mar 2024 17:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709832503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aL50skXyFcF8c9mQLCQNSVaw1NtE9pv6wXX96Vazqgs=;
	b=UGH/x9HL7Pnp0cOFXHeaGdwhzDvkGJcU7e3yAN+ndUAL2U4plzN+x+txxcgJDK95E2Wwde
	0xuMsbzjIvzyQajESPm2Z8ODBDsrY+JxEEFBatQAjF4KXrCDfNgCtjO7ppyzPFwom+9o16
	J5cRJQyMR6NiA5nq5vFHetoj6eMVBw+SuO07GNo/p5VcYtOzpUJlmK9hWQW7hahGvKauFx
	/Qfhg+5AxNqnVcXo3JySTOD9UR5xdrqzb/Npx10xlSvvGt/1HKNCfXYO7kwzvQjlt42mTi
	fMnMFcqBqi1WqxDvQUy+K/PEwj+xzQcih+xQ07P4wThem36JCpOH0CpOGlwJaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v8] mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
Date: Thu,  7 Mar 2024 18:28:20 +0100
Message-Id: <20240307172820.3451477-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301173308.226004-1-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'42298b844fc49f09449c1a6e6809ba8b6d4dd952'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_092827_311597_B74DB1A8 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri, 2024-03-01 at 17:33:07 UTC, William Zhang wrote:
> BCMBCA broadband SoC based board design does not specify ecc setting in
> dts but rather use the SoC NAND strap info to obtain the ecc strength
> and spare area size setting. Add brcm,nand-ecc-use-strap dts propety for
> this purpose and update driver to support this option. However these two
> options can not be used at the same time.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
