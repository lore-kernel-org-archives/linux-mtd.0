Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E375410F3DCD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeGn8OmK+HInSeCYxjNoe3N2eQ1PpPFJSAek8z4N0OI=; b=TJcMUDg0s4aSuT
	+udp4yOlqYOKUWpcdkNA99V07nlCMgQ22OQM+uBZwKXa1w3sUnmv4WC03dfyX9i43jLHQVwjhNK0j
	tkueyP4yQxQmR9gS1v3jupY37Ga8rqVMTvCKdsS+yMjGyJFUIIH5md0pslGqeXdR8tww0KNISikFi
	eY9W5w7VSj8zV/MhE+TAZjaUXcdbYJeFRacoJFUjvv5obYnhpMu753lDnTt3eMLo0IRcKI8ZXcUF0
	E76NLRzFwTvOIgHTAjfJlqu+MlKcJhjMiAMbo0Wuh4RUmVcQ6ZB3kzLwFQ9KTkel3Gmld/EFfyLlN
	T+TcSpFV7uDdJ26KfOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DUX-0000000BPWt-1vfZ;
	Mon, 30 Mar 2026 14:21:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DUW-0000000BPWm-2Ygo
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 105046012B;
	Mon, 30 Mar 2026 14:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868D8C2BCB5;
	Mon, 30 Mar 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880479;
	bh=nvI8BBEfBKOZ+08IPyUsthS0y/8g/wghIaColpb3EAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ayRrazhR4MhrOKdR/tg1+6JxEVV3+pJrd6D6SvLje9rqz+Te862cdPJFN0GP7W5Gf
	 ptw+3XOl4uH1BmY0gbZRLwEzSIzgBlqbntPSkXJgFRE6GsjnbU8jNabmMSgyT4Tr0i
	 dVBxAtL+z6BmG7zA4FetL0ZY8VLt/IOyG+RIZiNZzaxaaicMMM9LzmtJPM0ijYexNJ
	 lDiLweS5pWcu+rAjvoF9HEF+2sk1v/yHqQosgFJchCrFVhsi8ypdoqZr1iJOSoaA8M
	 GX9wRnn/g3dc4t4Lr9SGtrT6gICnsZhsApdWkBEfi3F7BKxzYNG0oSJT0aNJ0FBqI5
	 WJVjuPePEeH/Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sanjaikumar V S <sanjaikumarvs@gmail.com>
Cc: mwalle@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  miquel.raynal@bootlin.com,
  pratyush@kernel.org,  richard@nod.at,  sanjaikumar.vs@dicortech.com,
  stable@vger.kernel.org,  tudor.ambarus@linaro.org,  vigneshr@ti.com
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: sst: Fix write enable before AAI
 sequence
In-Reply-To: <20260311103057.29-2-sanjaikumarvs@gmail.com> (Sanjaikumar V.
	S.'s message of "Wed, 11 Mar 2026 10:30:56 +0000")
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
	<20260311103057.29-2-sanjaikumarvs@gmail.com>
Date: Mon, 30 Mar 2026 14:21:15 +0000
Message-ID: <2vxz5x6d1jqc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Wed, Mar 11 2026, Sanjaikumar V S wrote:

> From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
>
> When writing to SST flash starting at an odd address, a single byte is
> first programmed using the byte program (BP) command. After this
> operation completes, the flash hardware automatically clears the Write
> Enable Latch (WEL) bit.
>
> If an AAI (Auto Address Increment) word program sequence follows, it
> requires WEL to be set. Without re-enabling writes, the AAI sequence
> fails.
>
> Add spi_nor_write_enable() after the odd-address byte program when more
> data needs to be written. Use a local boolean for clarity.
>
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
