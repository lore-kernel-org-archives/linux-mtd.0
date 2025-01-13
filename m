Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A177C02180
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2025 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX58MD5QvctxMvJEuCh9ytrG3L4/cf9P3DS5Pig9uis=; b=jX24T86ljWi+f9
	BQ9q6SMzyVPC5Pu5JMzQGwiQeDQMDjWhY1o9v91Bxm13taPdiAXrJPdlHzl2lypU3iBeloEAvMPuV
	7CEp0LSRnDJPFw546pgH3KnRN+6pfrcJ3B8hJLqW/DvQG8HGl53t0rEmUuPq1JJ2YV8D7qAmps+qw
	3L+Pneq0SOnz8Gm81i7f2OdGC6ViDBbY3rNltGNHs1ejKPvpkowMsxy7ffUBFkfolj7HPhMRiStGL
	f9Z02P/ZirN6lsYNs4//jQw7PdYmCIgQzY23hwizW/NCYCmkHM0AIkD+4fnVnkhatOSPlbLDT8XI8
	WQ5LZ55FNT9jW1RyQ+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOf4-000000067bQ-27gY;
	Mon, 13 Jan 2025 17:55:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOdr-000000067Hf-0rh2
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jan 2025 17:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD8695C5455;
	Mon, 13 Jan 2025 17:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE488C4CEE3;
	Mon, 13 Jan 2025 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736790862;
	bh=MvQNbMEDp4c1MhS9MAoY9fptc0+AKg1NB6tPtemNoaQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WMaTpQgxXA79N+0Au/ZQOFxrXtPWlB4jWZX/29J97FDcJvqCycpd6ZPTnRXLYMbmp
	 Vk+aK0ddBjaed33nGPgqvVpfHD75u4g6dd13UkTL7P8Nb3UjU1Z2QVmD0Ed/LypS22
	 LwEp8K0Iw9froktFM95tbYjXb2HCvOTWgQ52NRy4hWiilxAHEIYe6FGuZF6OO3+7sL
	 OBen/UfPjZSgfaLMHfw6YyzGLaBJ/RBmp3aRNrX+A0CtklCM09mttt1JEghk+If6bB
	 cmxlXhQxK3SZqsVXyTMP4/mOnQY6166KESJv0LXqUQrSmBryL9LOk4QCof9LIiMilX
	 TYtgnbYepC0DA==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 0/2] Add support for Infineon S28HL256T and S28HL02GT
In-Reply-To: <cover.1734588106.git.Takahiro.Kuwano@infineon.com> (tkuw's
	message of "Thu, 19 Dec 2024 16:06:14 +0900")
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
Date: Mon, 13 Jan 2025 17:54:19 +0000
Message-ID: <mafs08qre7g6s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_095423_302329_46A925B3 
X-CRM114-Status: UNSURE (   6.82  )
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

On Thu, Dec 19 2024, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Those are 3.0V, 256Mb/2Gb NOR Flash devices with Octal interface.
> Same fanctionalities with 1.8V version that are already supported.

Applied to spi-nor/next with the changes I mentioned. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
