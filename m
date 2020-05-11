Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EFCC38A2A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765CD2137B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V7cMomZo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="ILsFRmEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765CD2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJDkT4bHS6wQYyKmAnka7qX5zurnIvsAhpl/dgqrF3Y=; b=V7cMomZohkZ8u4
	JiyVMHWsrLOdpKBFMf+Mh56S0XP2v97eYX2iaTXpRApOnAGN/eSpSYDm8RyDXAjiIdp99J+jFazDY
	GV9WiC2/odocEIoD/xESpy7MF1wtcDVjROx+pZxBdNSHgWLSY3cfFtN/CLFdhaCSVAJBjFDrsOiNg
	5j7+hByjGHOR8sXsjD9WYITTHll48wvF7ja3BEALDo8BdLihzsJlEI+zn0c6a/sndT5lVv3X6fwvO
	4tsgrC3Kd4nSfageqhHonuLOdxlmltpdmVhjQFXaeROT3lc5FR/y9NBRTwThSLhCSQmUwFOvgwWES
	1jX3c+X0oYWTAfrFaEuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXyWp-0005ZO-U8; Mon, 11 May 2020 02:50:51 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXyWn-0005Z6-EC
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 02:50:50 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 04B2oULT026158
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 11:50:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04B2oULT026158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589165430;
 bh=R5sMKsPcIUJI3fmRsuE01a5Dh0sRPW6XuWOtRNEYAy0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ILsFRmExvIRT3HGSEHU6f3P5dTCD35YJ1s95kl5epitYkYx8rytARujq9gWhSr/l6
 zutJik+r7i81rCLLiY5BerXadTUIfU/7OpRQrF4m3XN+vXj0Qq7ER+NttN1/Z4WoA+
 XRmee/q3F9F0gUCY9l08pmR3xiGM2G+KogiO3vJwqFN7rLi9yslLg7saM7sF2WOAg3
 Y0ZPCAlVCYL6j/J7xwg7wpwxWWG9jeQ70VOatd9Ni7TN2Fgdgwwww+iy2Z2JRe762y
 kCnNBIHdqm+oorlj9ZYuJkMToNze/di+Z8jTzJoBwKLon8Ra3NQYSPriRUmpQdEfDF
 Aj1SGEWZzA6TA==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id x6so4682245vso.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 19:50:30 -0700 (PDT)
X-Gm-Message-State: AGi0Pub2FaPgIgswPFdQpojW3jtpX5CIAVfHxGcBUdFl2Jry7SfV/app
 S5yGo+N3Qer2PCI52Beznp6rHOVvglD9pPgruuw=
X-Google-Smtp-Source: APiQypKyoEFGIvRbgClbANcqHTrZ8huNzfo1oI6Gc5t5o1j9GMqfWnyECQKvdSZ+PpK3sVUr1U0z6o9Q2jHELjuGJxs=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr9481174vsc.181.1589165429655; 
 Sun, 10 May 2020 19:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
 <20200510121220.18042-12-miquel.raynal@bootlin.com>
In-Reply-To: <20200510121220.18042-12-miquel.raynal@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 May 2020 11:49:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvCDyFS=rC0oRdbxt2UM9Oogw5+0=6B9TMQMdRq=2Tkw@mail.gmail.com>
Message-ID: <CAK7LNARvCDyFS=rC0oRdbxt2UM9Oogw5+0=6B9TMQMdRq=2Tkw@mail.gmail.com>
Subject: Re: [PATCH 11/62] mtd: rawnand: denali: Stop using nand_release()
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_195049_707491_1CA9BE6C 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, May 10, 2020 at 9:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> This helper is not very useful and very often people get confused:
> they use nand_release() instead of nand_cleanup().
>
> Let's stop using nand_release() by calling mtd_device_unregister() and
> nand_cleanup() directly.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
