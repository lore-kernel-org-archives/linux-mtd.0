Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE2ECE7B1D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw2MpPqYczZ90mMycJ9JyqK5VXjI3spvul7QP6d84Ng=; b=ZnNdzrHQCxmq8v
	QMPBHfFdG/TCFK7/P8v3BgXGEOhZOuFd7bf9OzXDFQ99t0UDVF9hpNGZZps1UIyVz3WAw0gi87SXS
	39mFcm/Y/T40hvym7sl++ER8+S8GogwXyJWZvAAirdXuJWfJugqoJJy/1Hoqt3OWPHTnfabSBRnIG
	nI4DF5l21RxfsttkJSxDZ+ArZ1BnW2ulWeAF89uSE9dzSQ/w5HwrQbM05iLPe3uGNsrfbxu/0W620
	bz/HH+moinldHiTKQC6gklWlEGTkjgHzZaKeyqJcBbqMW3vqATNnF+EJ2QKJfjHY4aNLifAeriPaG
	wlvqNp6H+uaR5zh3p6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY3-0000000Cg9R-0xVN;
	Fri, 06 Sep 2024 15:06:55 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaU0-0000000Cecn-2hzw
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:02:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA2FCE0002;
	Fri,  6 Sep 2024 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cg1Kb4SF9iKzYSb+r8gRbn/mAp8kUrQfy4Z4m/YadD4=;
	b=Rt+0FOW/bhq6lAEDV5JmG99VJCZ39hCabsXAnK0teBuUZh7fIK1fXTvoGdyPqHOCDXHrcC
	ayEw7Woq8LWy7fOAeMkcsWOP+4FHaUeOSZbVpVL0G0wvVNGiANmK6kWTZbtf/cTSWj2r6E
	CFTnsXIDjzS40gh3z2hcf/fo4lTle/GxwjtGnWwJt2iUHFjiklW+dI8rfKWVCyxqBInnTL
	SddJQAs8rek/BLEOlxvgMDqvVmETOrzTdtkjeuk9uC3FZQX+6KC/IXXhC/3uDXoQgTITza
	mhNjLx4Jc5lFA9kjr+XxrxMOPo+5bHm2sz/wTfAaQs8mEoVjWSSbQt88kCGEUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH] mtd: rawnand: meson: Fix typo in function name
Date: Fri,  6 Sep 2024 17:02:42 +0200
Message-ID: <20240906150242.734181-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826153158.67334-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9ab52d9800b0d71deafb0f9a3ed4d29b69089ad2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080244_839754_9C43C87D 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, 2024-08-26 at 15:31:58 UTC, Miquel Raynal wrote:
> There is a reason why sometime we write "NAND chip" with an 's'. It
> usually means several chips can be managed by the same controller. So
> when initializing a single chip at a time, the wording "chip" must be
> used, otherwise when talking about all the chips managed by the
> controller, we want to use "chips". Fix the function name to clarify the
> meson_nfc_nand_chip*s*_cleanup() helper intend.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
