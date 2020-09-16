Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C77C433E2
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 13:49:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454F522288
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 13:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yv866swt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8PKPwkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454F522288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1Atl2fEIQkPUc6HA1oUNQaYM3bwau8yWyZ+TlqiM8c=; b=yv866swtLkFdFZX5SzACipCo94
	US9YWsTj1mOCx6nS9mXhVrmKhu+EVatUV8wmo2GukFQayLF0PFHDoFSZMt+aes++akWJeGsGQJhsD
	hd1r+pV1jHGdJpJLMCYrvCKyyvx273ZhrBW2TTR5e94A2AirmeRRf8XbojlOOPbB0p0H7/a82Dk5r
	AH0lDesi7TX+sT8dwBLQaWBXlCfgt2BBZ/0tm5hJfde4t9ea1RsE5S1Jy297BVrOPX7dAFrURkXsZ
	H9SVyA9V5kxYLMLfmCUgCAA3ohUFYxFR4jXGaZ+W7/WdsWDez4e1sqCsTveD+CqAXEQWBpamkmlS8
	hmFN19Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIXoH-0007WR-KF; Wed, 16 Sep 2020 13:49:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIXoE-0007VF-8C
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 13:49:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d15so7032805lfq.11
 for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2020 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Z8ARxDK1f17ItafB+n3B6mLLNIHFBjmywknhGh58Rcc=;
 b=O8PKPwkWPU8sIhtbr4XeJH6XMlOmvITD5VhdKsxsAMCagrzoqWEv3JPKZRM/wL1aPB
 nj3skVuTeU8qvu7QnMvvC6gI/OK14i6Ep4PKN8AZLm5M2mHz/49YCor7kPyeD25Lohvd
 bsTMxWLFzmQ03DYJ6zM1M/B7xXchEShqfrT1fgpU6LIIYqKaj/kAKWNri2+KflXfShmS
 5tUYVK6OZhHkYJVyoyU9WlnGHFHNy0p5EM05+8FdVp8mDKsDWavIHPB688kRdOx+100J
 CjYxKGBb/ayjgsKlBh66BZ+OQ47rXI9eC80ycQY+5LR+8hy718InyIP9umnz8itCNnFE
 m6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Z8ARxDK1f17ItafB+n3B6mLLNIHFBjmywknhGh58Rcc=;
 b=Smjihc/Lug+im2be65cRkWTTm1f/nq1CXhZqWxildqFJsBdVGU1ZrJDX2uysEPAEv/
 x2Y2RHJimLAWzkKMoFkNU44ZqlWXwaYCw6QPcXPR5YUMaPaKixvJZYRsSsOvE9kXpQPf
 0l/wDbCCyz/WUypYQPy+ahYYFD8w+hl7XL91gh6rTCEdjSea9AXqTmQAzbSl/I/qLGl3
 KiP/ksaQ2zDUd07jFaxxQ40Qxf2cllZ/DSKQr0fJtulh7qfBRB+jAEWmrxQzn1iqYNSK
 iYQdNSqSfhHmvHy4bTzsv/j4iDV7Jx6Yzf/nO6G9YuCTcGe9E+dr50dZoAASp9vc3nUo
 94ZA==
X-Gm-Message-State: AOAM531MQvqPu2DKTJmceWbXATRWPX1ZNYScmwi7mH7Lgz+F5n5hHdCc
 UOMy8vbVM3NOI3umkY2b2RkSPxNcLgD2C7vON5Y=
X-Google-Smtp-Source: ABdhPJxVincJYwD0HRzpTPRp+eXmrLa4YdSdkPD3RkP52p/AjAJQ0yEIkzUDiEd6t6urYiS7eu+sXCigH+EPM4ux7tc=
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr7131665lff.348.1600264154944; 
 Wed, 16 Sep 2020 06:49:14 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Sep 2020 10:49:03 -0300
Message-ID: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
Subject: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_094918_337304_97482653 
X-CRM114-Status: UNSURE (   6.59  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On a imx27-phytec-phycard-s-rdk  board running linux-next, the
following warning is seen:

10:15:26.232069  ------------[ cut here ]------------
10:15:26.232880  WARNING: CPU: 0 PID: 1 at
drivers/mtd/nand/raw/nand_base.c:5242 nand_scan_with_ids+0x9bc/0x1008
10:15:26.241132  Unsupported ECC algorithm!

I believe it has been caused by 74a89d7f9ed7 ("mtd: rawnand: Use the
ECC framework user input parsing bits")

Its dts uses nand-ecc-mode = "hw" :

&nfc {
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_nfc>;
nand-bus-width = <8>;
nand-ecc-mode = "hw";
nand-on-flash-bbt;
status = "okay";
};

I don't have access to this hardware, but I saw the report by the
Pengutronix lab in kernelci:
https://storage.kernelci.org/next/master/next-20200916/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

Any ideas?

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
