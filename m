Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77009C11F64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 19:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4B361410
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 19:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4B361410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q33uQdIck7xewb7rWbhzgFOCXIU++Yop852ZIzowe3s=; b=gxT2H3MmtIkDMN
	aKu6tc7sw3o92p3RFnQ8smexsozjO+Nq9swh2qurPhSqn8mj7lt+wnrqdEYejmX/hi+QL/1Qcm5Tp
	5cyc3Ce8RadCtKbtxIRdKlcLY9Y1B8HlEbIYhmUSYuMIk5xb/NTB4OH2itWbXrbUMecGKnZUPbSQT
	lUI3ymsSoVR3DXFmiR88pCU51xexTb327B9aVbC6/PqLxvC7lIGoe4ADbu5PiFgBve8POOiYKe4bV
	3a2lQc6JzDI0u+EjDL+KJ8yq5SeY5U2Gx836F/ndZu6A61RnDkNqFlgH2mnr2jVzvGSObudMcP4vt
	nYj5wWg/Kp76uNzTx36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz259-000qaj-3W; Thu, 01 Jul 2021 19:10:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz256-000qaQ-4s
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 19:10:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id o18so6399199pgu.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jul 2021 12:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=GbM2fuSeHiTqL5U2bN8CK2UMUDfxUdvKer+uyLIitBA=;
 b=Ov1MmnykjCpNW4cy8VXr0YqFQMtHJ4fSQTIf94Nan40H37F8oZP7IxacMkIojNV7M0
 2f/y962ptIPCExmfwn/HAxPy35ckFh223QA+ImSDf7jypNJYb3X+6zUmUiRNxjDmJzu/
 zD8cSWh3dEbO4Hh44Jtd59GwUOmvAp38jQ8gYUQiBrk1uLjxAyUqhYUnx0OljHFZw+Ox
 uZ2M5KuRnLRApKgHyjr6Kzn58ay83tMu7nGygBmm8ezLFpqcMQJ3NRll1Ada2dFbM0oJ
 EP59Se0Hy4VpZbgPozd4LNrhcgIOPN45LJ0grhuVpHDMvUc5fMZ+gDwbSeFCaUaToL/G
 VJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=GbM2fuSeHiTqL5U2bN8CK2UMUDfxUdvKer+uyLIitBA=;
 b=FhWMFE6Y05i85CAcSn8iYKzaqZZ3P1Er0QIpmqmyf1EPSyP7ntRWVnx/ujhKUThZnw
 1uCYlmaS96ahNB46kVzeqIlHGhXknHZEh1u740++U155hhUJ+ha8Ln7NpJRxOvLFg0pe
 wly1p6iIJNuQROT5Mqv8OnE5qA8PbMGhi730bcGm6swOqqcEAB5VhHNcojpFMrXHLn6U
 IDaS4sXwqLPU2KLRTbhoxGBSALXMP3uFQb0nqeYy4uMlvcqD6eNYe77+UpN16zI5U5Us
 EkgZfncyxs05x3QCIZbQLXGdx9jH/G5swNUhvYQ5GmYV/Dmi6gcvv5W01JX/jycCj0hb
 dt5Q==
X-Gm-Message-State: AOAM533Zak76m64u/MNMc60soH2sTQ2ZFAssc9FCXvkPkv9Y5TEdxslW
 sDYNbkUIWmnYcYt4lRsTIMM=
X-Google-Smtp-Source: ABdhPJyj/fwtEtAaLezKj/BUUgwNuyyJCrvAtj6RSKpUkxrlztPkZmD/GxzvQknkJ3edf+hBzB6jvg==
X-Received: by 2002:a65:4903:: with SMTP id p3mr1061831pgs.402.1625166634599; 
 Thu, 01 Jul 2021 12:10:34 -0700 (PDT)
Received: from [192.168.137.17] ([71.212.135.115])
 by smtp.gmail.com with ESMTPSA id m18sm820091pff.88.2021.07.01.12.10.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:10:33 -0700 (PDT)
From: "Jonathan Lemon" <jonathan.lemon@gmail.com>
To: "Michael Walle" <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a13
Date: Thu, 01 Jul 2021 12:10:32 -0700
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <EE3EA973-E96D-4D0A-91B6-D5F509F76E80@gmail.com>
In-Reply-To: <87bfecf0836a81e3e6de558776e0b524@walle.cc>
References: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
 <87bfecf0836a81e3e6de558776e0b524@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_121036_231600_F9EC2FE9 
X-CRM114-Status: UNSURE (   8.75  )
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

On 1 Jul 2021, at 3:13, Michael Walle wrote:
> Jonathan, could you also apply my SFDP patch [1] (or use the latest
> linux-next) and send me the binary SFDP dump?
>
> -michael
>
> [1] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=241877

[root@timecard DRV]# cat /sys/bus/spi/devices/spi2048.0/spi-nor/jedec_id
20ba18
[root@timecard DRV]# cat /sys/bus/spi/devices/spi2048.0/spi-nor/manufacturer
st
[root@timecard DRV]# cat /sys/bus/spi/devices/spi2048.0/spi-nor/partname
n25q128a13
[root@timecard DRV]# hexdump  /sys/bus/spi/devices/spi2048.0/spi-nor/sfdp
0000000 4653 5044 0105 ff01 0500 1001 0030 ff00
0000010 0003 0201 0100 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb29 6b27 3b27 bb27
0000040 ffff ffff ffff bb27 ffff eb29 200c d810
0000050 0000 0000 8a35 0001 a382 cb03 c1ac 2e04
0000060 757a 757a 00fb 8000 0f08 ff82 3d81 0000
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000100 ffff ffff ffff ffff
0000108

-- 
Jonathan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
