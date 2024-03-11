Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253BEC5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0Rz0Hy07n2e3kyM2hAylBYt2ot3uCmSO8uYqqUaCV8=; b=Mi/hbhZTLHtHq4
	6TR3ZE4foAEEYT1/KMhhGpC6cR2AudUDD/3O7d1r9mp+ViyuGv2/2h2VB8w2fR5QcM0X6SpJthrRe
	gkOo977H5PuQPrD3XXAKEV2GnZAiG6tgmdBYdqp+QqwKio985RxhloVE3htAyih2S9gh5+ghuUzL/
	zLete323FJXvLZn7VNa0isOBpkTeOcp+bRGieJO6R5ADD5ETjrNcFQAU3sLQtDXuhhkV0hh87aMtC
	ZQCTQqUTZTnzaojag6UcSIvPlUsYEHX3LZgwzjFih5K1xd4rNGVfzTLW3jCKzlBTD+eknage2fgg/
	GLpCsui8+OgOLEjUvFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjaxv-00000000cXe-0EdM;
	Mon, 11 Mar 2024 08:24:59 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjaxs-00000000cWI-0G56
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 08:24:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3789FF805;
	Mon, 11 Mar 2024 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710145491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4Kd3yAg8b9Moq0rhn1LhKj1y9a877yeY9Bz/VknCbc=;
	b=H6UAO+PWilfkHEnDlmY3HVF69pjbRkeRx2IPsYvczpvBuFEsPgtomvS5t5C9qnMtqfXHUu
	PEKVDgz8VGhrkk/ia4lrNHvvSetCuB9fHAhl5owy5Jk2a/2SpTmPSHwz3kL8UVrFuRsvAE
	RoF1a5JdxE3PwFM69DNoCD2Jr32lE9dmTFiEp0higj2F0dJ94CTvJvDaFWIo+vOTs1565i
	86d7Pvw3WZMISKNI+QfOOhs9VyhvGbSPtFG1xxP3mL7XQg2Xenu/7omYD0EyWX7Vbr8FkN
	EywROCmereWqiSn5TDEUcNNSJg0q8F0AxvPRVK7clCTUu76ilfTHcgAU6QNRFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Ensure continuous reads are well disabled
Date: Mon, 11 Mar 2024 09:24:44 +0100
Message-Id: <20240311082445.4191281-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240307115315.1942678-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aacc2b6a31f078e19b6e563d186b535ae2137f16'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_012456_275432_D907DB89 
X-CRM114-Status: UNSURE (   8.68  )
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

On Thu, 2024-03-07 at 11:53:15 UTC, Miquel Raynal wrote:
> The cont_read.ongoing flag should only be enabled at the beginning of a
> read operation, and also disabled at its end, so we never end up
> triggering nasty side effects outside of this scope. The mtd core being
> highly serialized, we should not be bothered by parallel accesses
> anyway.
> 
> In case we reach the end of a read operation and the boolean was not
> properly disabled, it's a bug, but it's totally manageable. So warn, and
> then fix the boolean state.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
