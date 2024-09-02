Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C20CD13CF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wV6dcQCBNdfWTwCAIUPMK0D0L30Er3DHB25OGriQXH0=; b=LyUTTDrsmM6PvW
	amgIi3T/ZWqu+nNqeeOV7YRXwKChX2/fvYsK7GkD2IrKZi5u3oKMxbK2jH3WfPVo/bVi65nG1KFK9
	azAgWO8jAwxwWRfMU7AeaWK/BEG7qhwxByEjFTK16yL30KjCq9tCLO/ZRHVOdP8htfdJqtJbNYDY4
	HTWi+BN7PCeYWqgZkxZViNtwSzGqS3zea0uNLkYHUJ7xvZKbxI9lwxeUVpPt04zKpkkSUH9Gv59n1
	dgjQD9rGjf0I5e3EgC6xxmCtRo5GiWLv3HRqlmdhW8A+eM8p6xyI0luErIoVGbuoq26rcuGMYYPz4
	vArDc8u2warMeLyRpU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl983-0000000EsaJ-49Vr;
	Mon, 02 Sep 2024 15:38:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl96U-0000000EsMn-2DnB
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 15:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DE24A42702;
	Mon,  2 Sep 2024 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99207C4CEC4;
	Mon,  2 Sep 2024 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725291389;
	bh=GZqXHJSIVY/Cmbl+90EHpXa4Y0lY8rtYcvWKlmZAarY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DxiNhhx34wa/+64N/UXjp5lJgK2+SBMP40mwun1egncWIXOycVUD5wJUtXGeYroRF
	 LuUF+36ymXEcRVDkh99d3ZoLYWU2DgF3Ziuuh5tK9r45Xy2LTvgDv8OG8QGsqBal+N
	 ahQFgq12GLfWmtSFCui5e/8VA5ZknQlpSisiA/P1OqYxO0kvkEvW2M7m6lOj9DzFgp
	 Ym7p1FHI4GNObt3Ms8EJZcuKVTm56iS4wgLARKgOxEgZVZaOLoId5KN9LmCQcrap/d
	 O3WvUY7USF1rbN5ryWd6iBFMCzhNuqfxY4kwvXsTMhfmLyf1dTAANZIbyIMmnvQZg6
	 hiGXJFlTLaMnA==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: spansion: Add support for S28HS256T
In-Reply-To: <20240830080428.6994-1-Takahiro.Kuwano@infineon.com> (tkuw's
	message of "Fri, 30 Aug 2024 17:04:28 +0900")
References: <20240830080428.6994-1-Takahiro.Kuwano@infineon.com>
Date: Mon, 02 Sep 2024 17:36:26 +0200
Message-ID: <mafs0frqixe2t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_083630_658821_DD911417 
X-CRM114-Status: UNSURE (   7.34  )
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

On Fri, Aug 30 2024, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Infineon S28HS256T is 256Mb Octal SPI device which has same
> functionalities with 512Mb and 1Gb parts.
>
> Link: https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_Flash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c8fc2dd9c018fc66787aa0657
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
