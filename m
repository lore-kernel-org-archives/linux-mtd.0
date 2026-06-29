Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DC3C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFMlOj1B2SMhe8kPCbnkabr20xskoTGUszN/W8Bshq8=; b=5A8RLsXZZz+cVR
	dRQFVBbHQ/Ck9qOvTBkwguLn4dxIHLO3fZnIKk1bTeqZF3oXe1pJwosmgvriLNGkeooQnnfnzlu8U
	HMqh5D+PbLefQSRKrFcjpDkKdbqWxvAUfa7h/ZPlZrtB1stun5FdIzyysnL3oZ0CYMpQ5yc3H4W76
	Kz9taGIJDvB+ac4Lj5yv8o7rGEsMF2Ua8hJJuPQW/chHzvFkd1vhkq3klw0wuAa2TMHzXAQaqaGI8
	htcqqtrfZ/BaaC51Z8zeTUvKQyupla+gk3WuNjgV+3WC+VwrWidsgv8Mtwxpm7BWFolfsPQpZVvfk
	uaPe0YslFRnMPg9asZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE9C-0000000F6dl-1w8S;
	Mon, 29 Jun 2026 15:43:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weE99-0000000F6cW-3fmm
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:43:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1ED58C6B3A9;
	Mon, 29 Jun 2026 15:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9DF35FF96;
	Mon, 29 Jun 2026 15:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90932106F190D;
	Mon, 29 Jun 2026 17:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782747819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ufUECX5xmH2+iBPhNbY/6S75VKUiQXYWWuVZ5F61r00=;
	b=B7NblWrxpwTHjtajkuPoFZfqR6FzekKleuqAVcNoqsHAIpJSYEoMWJFp6y7yw5vgcQUH0X
	BCWWKwIlCtn2JNl/fBU2FR7xMNQt5H+1rjjnyBB3o0GOoZM5DNmCp6XeMiREKO/XJ6mXwf
	+3yiBB+FnenAuyDSAzUJxqDr/lvHYum+4/zFdbwLK7NlvIIptqe93E3HiKGClm+iZrbRHR
	1FQnqcybEpgrCT6J7UVkiFIuHFBM5T17Tvhk/K9K3wYp2nZi9H0rplS5s33DuA95zn478M
	zd9GnDAVt9yFoqDpEyprw7XOJRP/LUPAgm4RvZiC80nRd0tijV6mg3POprzUNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v4 03/16] spi: parse spi-max-post-config-frequency into
 post_config_max_speed_hz
In-Reply-To: <20260618073725.84733-4-s-k6@ti.com> (Santhosh Kumar K.'s message
	of "Thu, 18 Jun 2026 13:07:12 +0530")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-4-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:43:36 +0200
Message-ID: <875x31s66v.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_084344_124155_BB730E4C 
X-CRM114-Status: UNSURE (   5.37  )
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

On 18/06/2026 at 13:07:12 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Add post_config_max_speed_hz to struct spi_device and parse it from
> the spi-max-post-config-frequency DT property in of_spi_parse_dt().
>
> This supports SPI devices that operate at two distinct clock rates: a
> conservative rate always reachable without controller configuration,
> and a higher rate achievable only after controller-side configuration
> such as PHY tuning. With both properties set, spi-max-frequency gives
> the conservative pre-configuration rate and post_config_max_speed_hz
> carries the post-configuration target for the SPI-MEM layer.
>
> Zero when not set, preserving existing behaviour.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
