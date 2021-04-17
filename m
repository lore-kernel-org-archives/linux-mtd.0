Return-Path: <SRS0=Xxtu=JO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA34C433ED
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 16:01:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76757610C7
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 16:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76757610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qR2Q8QaxCEKGfiK6P40rqvU5puEDQUkEecAenieOyf0=; b=bD3mndzvscX6Vo
	HVEyJep22kEcid1iOkH0yG7GfHeU5e901VAayeqkGCfXUi9f1OY3joQSgAaMlJQHfSpR6bJzfejfN
	JFOmQijL7yktD8eqr+DA3eA2xRR8ApGt/V8n2AxvLNzxTEaN+Z4+nmC/21J1GB0bI9uFC/wOpr/nI
	Up5N1rLt6p4DqUkG0cb6Hi/b5C8U1skD7uPpkY2ndIFFRZbwwSyciOqxkX6VILCGTAMP4kwIHmrwX
	YZxsAR8yZlqxRaED4HJ1sMNA/Kb5tWnKWKmq2JK2XMuLhUm4c7QSX5NaDesnh8OpVSKljWBr4+J4d
	Jt/fOcHFR9sPkleEUFbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXnMF-005hhz-39; Sat, 17 Apr 2021 15:59:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXnMD-005hhG-7Z
 for linux-mtd@desiato.infradead.org; Sat, 17 Apr 2021 15:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zmG39T7u3LOz/c3TVGnCm9OWR4eQ+yWIpj7LUL0mTtY=; b=Y6i1/FImX0aY6caJeojx7KiiLk
 Ty9y6gNAlGA+GnFL1JxkqGRuyzptojUBPTEpn+smTRqYYsnp1MAprOfIBCEWvYF/nyj2YoxqUx+3n
 yo/KAUMnbdyR4HMYU2LX0EQSt8h3wKn2Jdqh3JX+2MtOTTaUG+ANOkHuVFhodRoO7aTk355LPT4BN
 qMvVnweh5ikjWq6ZR/BlUCMFNCyCT4aU5mv/VMOpj7VIWHrd1A5Bry9xBwVo+GQXMZ2SldGP375LP
 /aDcvgxmGg+co9tK6Lrs4YJ1xa+9vZpVvSy/K1MVD6211zWPLNc33FA6yu71Q+W4rHkzJBHiYoPGh
 A8/ri9Pg==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXnM8-00A67b-ED
 for linux-mtd@lists.infradead.org; Sat, 17 Apr 2021 15:59:39 +0000
Received: by mail-lj1-x22a.google.com with SMTP id a25so21102979ljm.11
 for <linux-mtd@lists.infradead.org>; Sat, 17 Apr 2021 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zmG39T7u3LOz/c3TVGnCm9OWR4eQ+yWIpj7LUL0mTtY=;
 b=PFXx6cFn97KrslrEAzw8FuLjsmfPvOyaM1iKKOh/DjepzZ+9+3VllocIqC+OgeDMve
 FDQJ5ksHVVYrYpWy488FqeyiGMGJ7nC7QkxLgoGKLXp9RagNvDxn+wvebE4RjyFOrW1v
 4vTI7uEK7g58+zWXQNVEMUrq/NDgJC3muExjypPkvkl+fhJExbUglEpXdC0UUrcgtOf8
 qFSKlblDDBM3nq76RTT4faDFk792otk355NyIW89W0U/TJ0x6z5IJQg+Z8j9HoTBOGoV
 K6iIv+NpyavNo8abPQKq3On6AppR/+B00G3n5FTTznSEsgm2KA5p6KbRQrA1/c7Xw1Td
 t05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zmG39T7u3LOz/c3TVGnCm9OWR4eQ+yWIpj7LUL0mTtY=;
 b=HzEqSPiMRQy0Rf8/M2oMYJpsgavxR0CeIuJ1jTcPl/BVuZQPDtbXHl4HvRbZgipc/c
 vKFbh1ZfejhRDaAHwP9GHUpNE5OfT7EVHwtVUN73zbYc1kyzjQRhqsx70IK7VR65ivvZ
 JMmBOvsgUPM4Jnl7fluK/9rypnPmSp1DBYEt07Cg81vJN6WzCgVb4yd7//MaIyjxgbmC
 oOSVMaec54yfpBTdQPiJVBId+BerZhTC8HYZ1YSPhg3+NVArXVcEO3GOUugY5iRUCSLN
 OBlbRMCaGPSw8i3D9B2hS0ug0Adqg0+kgWeL53XDEsp42H5VJH/rRI1nyRCZFkbxVRka
 INCg==
X-Gm-Message-State: AOAM533WErb46TlGAiwQMfEdCOyzB/i54GL4W1XK19NPILXNYZbvNatI
 d71T5GCXKD2UolyZpJ0lSW0duGMoe1dOMiwxhpPOwShia5o=
X-Google-Smtp-Source: ABdhPJxthKGKvr4MWj7Di6th+syBD/edLff2btuL6fV63L66SK9S7+emoxacF9rf/OJ37cPdmuJmLsonulpL4/YzJjA=
X-Received: by 2002:a2e:701:: with SMTP id 1mr5849991ljh.264.1618675174043;
 Sat, 17 Apr 2021 08:59:34 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 17 Apr 2021 12:59:22 -0300
Message-ID: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
Subject: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_085936_518378_447150BC 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi,

I noticed this error recently on a imx27-phytec-phycard-s-rdk reported
on kernelci:

nand: device found, Manufacturer ID: 0x20, Chip ID: 0xa1
nand: ST Micro NAND01GR3B2CZA6
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
random: fast init done
Bad eraseblock 329 at 0x000002920000
Bad eraseblock 330 at 0x000002940000
Bad eraseblock 331 at 0x000002960000
Bad eraseblock 332 at 0x000002980000
Bad eraseblock 333 at 0x0000029a0000
Bad eraseblock 334 at 0x0000029c0000
Bad eraseblock 335 at 0x0000029e0000
Bad eraseblock 336 at 0x000002a00000
Bad eraseblock 337 at 0x000002a20000
Bad eraseblock 338 at 0x000002a40000
Bad eraseblock 339 at 0x000002a60000
Bad eraseblock 340 at 0x000002a80000
Bad eraseblock 341 at 0x000002aa0000
Bad eraseblock 342 at 0x000002ac0000
Bad eraseblock 343 at 0x000002ae0000
Bad eraseblock 344 at 0x000002b00000
Bad eraseblock 345 at 0x000002b20000
Bad eraseblock 1020 at 0x000007f80000
Bad eraseblock 1021 at 0x000007fa0000
Bad eraseblock 1022 at 0x000007fc0000
Bad eraseblock 1023 at 0x000007fe0000
No space left to write bad block table
nand_bbt: error while writing bad block table -28
mxc_nand: probe of d8000000.nand-controller failed with error -28

Full log:
https://storage.kernelci.org/next/master/next-20210416/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

I don't have access to this board but just wanted to report it.

Regards,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
