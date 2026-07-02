Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76239C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp0GZk1Vx4WDIW3jbWgFTA/JCxIIYosG7hnquxe1u7w=; b=HuXxjNw5GJbyYU
	OD89uPLoBLvi8YcfNGV0jDVySmn2nT4vjLnZcFgLb7pCav9wOdXONiMWDAQYhh35l/IZ2H9J1bs4t
	3R5PVcfl+nKXFmgQ2ldyHSeR2TpHsb47YeHVKdtcNjYtJw9/5s9hNKJ8Dwn9Pw3Z3tnd89t4CR6oi
	u+RIZDdOxQXe4IcFYZ8U2lTyk9D5qStg5Q5mVEwmrQSxlD8D2aL09KumkJ1ITzrUF+cC9UXln3NOc
	QKWIrOtOpVQNVPLFXFZqGriUwogJtVAo4N0NOhIMbd1CTvk/+3VmmG7L8YPT/7Z8biBwYVuJjU4NU
	GLVuCMlphcbxmUzcIVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHWw-00000004Wf8-3GxA;
	Thu, 02 Jul 2026 13:32:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHWs-00000004Wdk-464A
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 13:32:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A060C4FEDD;
	Thu,  2 Jul 2026 13:32:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA1185FF03;
	Thu,  2 Jul 2026 13:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FB50104C9560;
	Thu,  2 Jul 2026 15:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782999151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/PdHVz5nHkTJ6aPo2Gdk4XwgvzD3Qv3Vyxnp60wgE44=;
	b=gZY3IbiyZpfwqeOAiVt1d24yIKnddX6h7B09fgkiquSTNUc76JxJxDS93hNr4Tt4WR4T9L
	mFi0XKzJTlw7SjoswfLDN8xQl3lzCApSnq9S9SJFNPNol9i6CaqoTC9F6QWn07/jLMsgH+
	oMNoMX++Ao+/lW6STMAgOz1yCm98Z9i8fYKO14IvC4rqhQguYCrP6tNpbaHiZV92iHhdhS
	T05t8kEu6hX1gGy+/GbuD5TvZokKTOHo30W8znDGOblOc1fx58h3GYuXM4kJeT4SzehaYy
	8USoPr+2/6jV+TGu346mvaR96ZyiOoVDwSieAdvw/9BIj3Kdy1e7qFpliCQqcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v4 04/16] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
In-Reply-To: <20260618073725.84733-5-s-k6@ti.com> (Santhosh Kumar K.'s message
	of "Thu, 18 Jun 2026 13:07:13 +0530")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-5-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 02 Jul 2026 15:32:27 +0200
Message-ID: <87a4s9qzys.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063235_187357_71EE342C 
X-CRM114-Status: UNSURE (   6.46  )
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

Hi Santhosh,

On 18/06/2026 at 13:07:13 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> When a device exposes both a conservative base speed (spi-max-frequency)
> and a maximum post-configuration speed (spi-max-post-config-frequency),
> operations validated after controller configuration must run at the
> higher rate while all others are capped at the base rate.
>
> Extend spi_mem_adjust_op_freq() with a bypass: if op->max_freq equals
> post_config_max_speed_hz (the value written by execute_tuning on
> success), return immediately leaving op->max_freq unchanged. All other
> ops are capped to max_speed_hz, the always-reachable base rate. This
> integrates the policy into the single existing frequency-adjustment
> point so exec_op(), supports_op(), and calc_op_duration() all behave
> consistently.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
