Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC83C433E6
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 06:17:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D8D2071B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 06:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3r5WWHw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBafoFBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D8D2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z5v7/ksgP8lkHevviSkFj8L0lm3606g/7fHe//J+p9A=; b=R3r5WWHwlRpSj+B2HM0nG/Lh/
	hXcxhSZ9phqQVqDE4WEcGm4Z5Y9Aba20Jzn6PWZKumbWBY2fzZfzB2j27t3UMR+iWZg8k4D5nFEM6
	j+S25vFwi1jRO0CVJDAmLfsdNIoDxQuFg0Xt+1V1bJ5f1wijUF0u0FDPvC0jA4sfuCehb/yR7jAHO
	MejLbT4Mebsp4bqzDv+JB5R5crP+gmoOzAlg2XYxooT7moOthngiv9zk3bWyql/1IqxfWOWtU5bA3
	E84mriLdc/yYyLIuZ+kZxRg24Pf8WOQr/83NClNX2f7kX9pu4xO/qqScL6Zvn9WeE/xI3efJFv0FJ
	XZSvzk97Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCzbQ-0002Zc-Pe; Tue, 01 Sep 2020 06:17:08 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCzbP-0002ZB-1h
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 06:17:07 +0000
Received: by mail-il1-x144.google.com with SMTP id p13so216675ils.3
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2020 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5zFTXY5S566BBTExrgOEGwwfkjUFIuzGrriApLkemQ=;
 b=TBafoFBplHB8uAE4TlUcx+pkxjnRUTeOUs9uPayCO1/O6uGTe7axRWgDV+llaxtY8j
 1HNyadQ5eJ/1cZTKIDKIA/v1NRLFyV3RQ6gWz17nAeUBGwMmtItfiZ1OG7Z0E30lBeal
 cv4VKSKye5HG8ghPq55K09GzVf+65U5C7LAs3dYAIw6LWHqAD2TRMT5RtIKKch7PsyKa
 s98aTTXd3LRY5c5LPU9E8+SGaTZVVqLvbTI0YPcLMl3ZAh2lz9eZ0CLlS0GsP6cZa/xK
 TuMggpCU2OI51D4bdct23+/KseOoe0du1cBE+LJrBzWqE64hwqUyYjdSSGwnK8Dn7gg4
 X8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5zFTXY5S566BBTExrgOEGwwfkjUFIuzGrriApLkemQ=;
 b=Yvo66iyteEOuNDFfQLSp9Fb6Um2R9QoB0mOTHqZPfbATiZ32UsDhczkJ12oL69qVlc
 cmZxMTYVXCFFG5lOYspplRY9ouOzoFPjqzfw5QE/9x3fdtPxINqIYu/EUmOIWfcDYvdh
 UupzoqfyfqKiST4EuPW+PDUcSzreOCKjtQHe+PunkBxUmiJeqXRL8PXwyMdhODYB+rGj
 puZSgy3PgEbRi8PTNq5Xb/DQzKBl+r5d4XhuqaYCBxSvH8lZzOkQ/ae2IBuPvnWyHRlW
 OLDAJYEZzSmZqclB3EJrsK7gkEUS0Cin2pqsbpDuZU98SjxRG63TklfXOsr2FZzNOTcM
 SdmA==
X-Gm-Message-State: AOAM5316G91mVhrpaMoEBLjD3+Rr32+nLOkAbzauNYCk76LwBlz+y9DB
 Wb0SGtML6mBEfkjQVuZp7JzzSjLTLsrmQ15MUA==
X-Google-Smtp-Source: ABdhPJzaDZQqaCTvggVmo+iovD7uPPauKzi/hdp+qdBQ6iqkk2Ppt0hE+b/uZknQhmDSFgTsS/bUmGPM0suils+VNXQ=
X-Received: by 2002:a92:9a92:: with SMTP id c18mr43408ill.265.1598941023231;
 Mon, 31 Aug 2020 23:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Tue, 1 Sep 2020 08:16:51 +0200
Message-ID: <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Yicong Yang <yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_021707_105644_88C0367A 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Di., 16. Juni 2020 um 15:03 Uhr schrieb Yicong Yang
<yangyicong@hisilicon.com>:
> If the flash's quad mode is enabled, it'll remain in the quad mode when
> it's removed. If we drive the flash next time in SPI/Dual mode, then
> problem occurs as the flash's quad enable bit is not cleared.

On flash devices with a non-volatile quad enable bit (we use S25FL512S)
this will wear out the quad enable bit as on every boot the bit is
set and reset on shutdown. Or do I miss something here?

> Disable the quad mode in spi_nor_restore(), the flash will leave
> quad mode when remove. This will make sure the flash always enter the
> correct mode when loaded.

We have a system which relies on an enabled quad mode on boot
(bootloader uses quad mode without enabling it) so using this patch
will prevent our device from booting.

Regards,
Matthias

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
