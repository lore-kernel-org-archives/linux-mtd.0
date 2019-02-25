Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56C9C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 07:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9722F20842
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 07:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gz72h8pA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTcSThaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9722F20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lMjuGWMFznl927JWZGvvWf2yGXHx41j1Ad9yJRGim80=; b=Gz7
	2h8pATZWYBgBc61XKaNdYgJTPOBnTcTsV9aLFvNaoMQ4fRNut34eJ7MFjMnJHfjTHUEl+zYi0gtuK
	esz4bmSX+06px0JfEo8iKtU4yTzZtH8WCCAsacliE9/4XvBARSVgfUdvqG8pGdWoUX96sUHVCz6GP
	PLjvtOnvZBTiuLS1GTGk2fxcbGMbT/yomFWVM6bomFlJWLQ0YMylxvtcHMuP/tDQpmpNzgRr0ysGP
	UiPQVrlJOaF05QMbGa0j+ujaSsTr1D2tOpIoTY1UWQVdnKleq/y8hU2IsvWT6WuEZhS/SOaOCJ86p
	NFJFfVgViqNqUTNO6WN0vYBnwl8ELjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyB5L-0007RC-8g; Mon, 25 Feb 2019 07:53:59 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyB5I-0007Qp-50
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 07:53:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id z196so5418730lff.4
 for <linux-mtd@lists.infradead.org>; Sun, 24 Feb 2019 23:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=e0RVqcKZRdw2SAmY4o/u++TFnkOMClUQqViFZbAog7E=;
 b=JTcSThaFfi+Mt+JYYc+eWVxR+jthBBWERynxwQeX3J6lB28nPEHwkAqGATWAWi1/bp
 ooKbjXsjwXq4+fWQ96rWablvxF4VzDM2Wygzb4rkz2V0oyIuAxRjzP2/TfZI1odhV15U
 HuwKSusN/rRxfMWfrqa5t2oKdbvgXrCEhDq6DwiNnUge/KzOZBlCF+sstitP7QT/DhWi
 LYiZY6uxZ1miEfSW3gQOnMukf3UjaPs4j13+qV1ayssst3EVTNe+y/TuUVpi9OKj2+7f
 doKV8qfifJIuA+zRaIbXYjbJjsivCMXiZU4kg1KTzqR5EgAinzkw2Ip7u6HfBlTqpap/
 yYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=e0RVqcKZRdw2SAmY4o/u++TFnkOMClUQqViFZbAog7E=;
 b=pYhF5ZnfJL/eXoZozisGWM2jHDiONlUoH554ZRDhsXElBdK3PVeSprs71/+eaKeivf
 j3QcKn6rzXGZlsl2QZvZVNfe3lnYHOYfbE0xT57Jk5O7mcEV7EycRqQ+rVJdqlskDLYY
 GUkRI/lO7nLbk9r6aMED6nogpNi1LBflvImSMuiS2BWRdOZiYEsSNtkhs5RKI+Y8Nknf
 pHSLC97zuGZYHXHYjudp3Zv71jlO+CyMuMVqArgyFwFzbsGl4+8mZk2VM0AykFSG3lKS
 oHN5jUZwIv/Q4aA+RDfYxcCx4bHNYlEJlJ1hQ3FT2CfMLqmw3OVQ80DiGVaNf0vLrgHW
 t0+A==
X-Gm-Message-State: AHQUAuapNRMCveOIEsjzPZqJ8JxRFqFu09zkvY9T/g8swy2XUhIvOMKo
 ETv5zaEVuEbFhyO19+dcdsNNo+/05ztSMc9ZQRpTYI58
X-Google-Smtp-Source: AHgI3IZX0mRQe+tVeUvfay0CFUmA5ecZlh9P8rdIyMTmytsjKFO/xB2bvaKw0oqlSeIqIapamf5ZVLjPOKcUKCOzHXI=
X-Received: by 2002:ac2:5230:: with SMTP id i16mr9337128lfl.63.1551081232540; 
 Sun, 24 Feb 2019 23:53:52 -0800 (PST)
MIME-Version: 1.0
From: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Date: Mon, 25 Feb 2019 08:53:41 +0100
Message-ID: <CAPQseg0m+j+pc-AAZmQqJvnkALf3ayGC_hg8kgQ11Z0_R9DtkA@mail.gmail.com>
Subject: gpmi-nand: Probe failure on imx6qp linux 4.19
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_235356_218316_B9988C32 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi,

I need help regarding a gpmi-nand probe failure. I am trying to run
mainline linux 4.19.21 on an IMX6QP based board. I get a timeout error
during probe:

[    3.079948] gpmi_reset_block((ptrval)): module reset timeout
[    3.086728] gpmi-nand: probe of 112000.gpmi-nand failed with error -110

The timeout error is returned by the call at gpmi-lib.c line 152:

ret = gpmi_reset_block(r->gpmi_regs, false);

The relevant sections from the dts are:

&gpmi {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_gpmi_nand>;
    nand-on-flash-bbt;
    status = "okay";
    #address-cells = <1>;
    #size-cells = <1>;

    partition@0 {
        label = "barebox";
        reg = <0x0 0x400000>;
    };
...
};

        pinctrl_gpmi_nand: gpmigrp {
            fsl,pins = <
                MX6QDL_PAD_NANDF_CLE__NAND_CLE          0xb0b1
                MX6QDL_PAD_NANDF_ALE__NAND_ALE          0xb0b1
                MX6QDL_PAD_NANDF_WP_B__NAND_WP_B        0xb0b1
                MX6QDL_PAD_NANDF_RB0__NAND_READY_B      0xb000
                MX6QDL_PAD_NANDF_CS0__NAND_CE0_B        0xb0b1
                MX6QDL_PAD_NANDF_CS1__NAND_CE1_B        0xb0b1
                MX6QDL_PAD_NANDF_CS2__NAND_CE2_B    0xb0b1
                MX6QDL_PAD_NANDF_CS3__NAND_CE3_B    0xb0b1
                MX6QDL_PAD_SD4_CMD__NAND_RE_B           0xb0b1
                MX6QDL_PAD_SD4_CLK__NAND_WE_B           0xb0b1
                MX6QDL_PAD_NANDF_D0__NAND_DATA00        0xb0b1
                MX6QDL_PAD_NANDF_D1__NAND_DATA01        0xb0b1
                MX6QDL_PAD_NANDF_D2__NAND_DATA02        0xb0b1
                MX6QDL_PAD_NANDF_D3__NAND_DATA03        0xb0b1
                MX6QDL_PAD_NANDF_D4__NAND_DATA04        0xb0b1
                MX6QDL_PAD_NANDF_D5__NAND_DATA05        0xb0b1
                MX6QDL_PAD_NANDF_D6__NAND_DATA06        0xb0b1
                MX6QDL_PAD_NANDF_D7__NAND_DATA07        0xb0b1
                MX6QDL_PAD_SD4_DAT0__NAND_DQS           0x00b1
            >;
        };

The dts node "gpmi" is included from the imx6qdl.dtsi in mainline 4.19.21.
It would be great if someone could help debug the issue.

Thanks!
Ibtsam Haq

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
