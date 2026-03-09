Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851CFF41807
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5mT9X1xvZJX6Rl+bjTucyrrtsCofKoVxeGyqE514Jc=; b=R9RivnwkXJFkLt
	gGeZjHIT3mLEC1FDQ2p4LS471SctS7UZltjUprptAu7iiWkN8RaEoIZIKc4rgbFE9prq8dDGtFy7Y
	imZMIvRCRR0M13cn2BxAUm0oyObqdJDlJFiFpVpUrI9pCYVUyft2LLeG+tBqDt509UbU+nPXAdRLe
	i+zCQ9deI7hFDngEmcDP5cHAIrPP165g3PsRFJBr8gfeGmU3bZEBiLXZ8eD/yIpA8xQFBBqqvSXlo
	ymNKyItzO4/tnkDmS6YzbC80/KgXyZYvZ192z1uadoGRJZa234qJWJWrQdq6sNSXkrVFh0eUek6K1
	E9vFCjHTCvaotmaMxDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdoL-00000007lNR-0hua;
	Mon, 09 Mar 2026 16:50:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdoH-00000007lMZ-1ewY;
	Mon, 09 Mar 2026 16:50:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4479F1A2D62;
	Mon,  9 Mar 2026 16:50:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154C15FFB8;
	Mon,  9 Mar 2026 16:50:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86BDE10369C0E;
	Mon,  9 Mar 2026 17:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773075021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=uCa5E0cT/HxGsfvjRkAG8+WAJStVe5z2flz2Ygtj3Lo=;
	b=Xuzi6GbzaDiNcpso4+1/KP7UHSFNrQ81rvx3+kESkybunmDg+cFAM4wgTctbKObWH198RX
	TFoav7BOLChBSgCPOQg+IX3SWMOCELeqaHXkilooUXCU7bWaTXvVZp1/ht0PQjDV+YMBV3
	T6FFVZ3etgHD9qcR8Kp8gGJKk0fhkBFrhaw43MFkxX1K8isr8E2lKXnm89kZUc+CLGw+om
	h36glR8Z79u6Pc3CMw0T/rJYGFfokgsuuEx9eU/KB08++uKgCgnobrFLNjBoSF1k78ADmr
	53vdusBNgArh4+DOAxpAezoYygaSHQ5RmvQVdsXHno827P4WuJ+QRHI6065syw==
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
Subject: Re: [PATCH v2 5/6] mtd: rawnand: sunxi: make the code mode
 self-explanatory
In-Reply-To: <20260305100137.2558423-6-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:36 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-6-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 17:50:16 +0100
Message-ID: <874impne0n.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_095025_587762_B5767D5D 
X-CRM114-Status: UNSURE (   8.57  )
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

On 05/03/2026 at 11:01:36 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:

In the title: s/mode/more/?

> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,

forced!

> the reason is not trivial to get when reading the code.
>
> The explanation is that, from the NAND flash controller perspective, we
> are indeed at step 0 for user data length and ECC errors.
>
> Just add a const value with an explanation to clarify things.
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
