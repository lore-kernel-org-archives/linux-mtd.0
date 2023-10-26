Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0355AC25B67
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7OPeid60Rik5kbi2ml03i6Gpaghig/ju5rItN5klEso=; b=E8zFcNKJz78HDN
	Djh0WILI2Ky9IV+W1RK11zdEbI4IFsFpa8Ve+vaR0qichMP3uv5ZUfK6R2Qrq9hTiT57ivhP2n8/n
	Q7N2asGacMgCzf2wnWvxupaytlhV6DswBOIpecbJEmixrJYZX3pcbHYXmbWoaWx86/z8+NnnxhM/Z
	8jvkKAL4f8dc749hosbQQp+YZQDgvo3iJ6ybbGfTZjIyPJ5FZVDp0Dn3d8yqc3KXy/lhIq1YUtYmQ
	YnO2N7V/DxUpYmdO2Nv3RupXrh3ELGIzWb97SfBIgvOK96/ELfdEr3VPbrv/ih3w1aHrk5K5Uz4/j
	3R48mDv28PMMFyQ8p6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DX-00EnQp-2B;
	Thu, 26 Oct 2023 15:24:15 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DU-00EnOf-0S
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 15:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1698333819; x=1698938619; i=estl@gmx.net;
	bh=J/MP/ggMBeFOk1GH4VqYwPDUgDoYGPXDLvvW2d6zvWY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=EtiCsGtTj19bk/cnvYowLI0Bvyr4mSCFUVgyeom4i/Xw4VywLd910M4r6CuGginW
	 4fN4pF4v7M3FqYSxaOHmaEJ7VxTy2qFzbPoOOOnHadm+olq1fy8+bmOQOntKVPilg
	 K4QdzcyV+2R2egjU1JFvVuZXdgDEpVOocWJ/5P9GnwTUPR/JQGbV/RK7GgpeVnNUY
	 5sGVj4B2MeYOd7BUdztK/y/9qMVkocsDYTwIohkQQ55Hh036oGsFmr3rlxxlt7TLl
	 nRoMsl/gQiV/fF4PuyHQn8qP4e2NTgFZQJg1eoFAkdXHMPEK36Fu/UPtlxbl57owy
	 KQSdnEQ6qarqhd5/aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([77.246.119.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MSKyI-1r2kHT08sq-00SexA; Thu, 26 Oct 2023 17:23:39 +0200
From: Eberhard Stoll <estl@gmx.net>
To: Han Xu <han.xu@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Chuanhong Guo <gch981213@gmail.com>,
	Dhruva Gole <d-gole@ti.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>,
	Mario Kicherer <dev@kicherer.org>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Olivier Maignial <olivier.maignial@hotmail.fr>,
	Rob Herring <robh@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	William Zhang <william.zhang@broadcom.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 0/4] Add tCLQV parameter to tweak SPI timings
Date: Thu, 26 Oct 2023 17:23:01 +0200
Message-Id: <20231026152316.2729575-1-estl@gmx.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:O7+W+0kTktx9+dspKsYqJeT5/Cn+VqewNKP9rukwDbjeCopCyXI
 gcCAOXQe3ddnyLBHvqWbVm4dV+vLK0b7iO/wWLnX5bSs9o+lokV0OQkwBg+pgHV0NumcTh3
 x2lBsvjdKV7dxHyQnKyy9Tgy/3J9a/Pxrnpvbs/QJZaRfbDGShIqiU59i3GerZok15/JONv
 7aL7C5q+4dYax28d5qbyw==
UI-OutboundReport: notjunk:1;M01:P0:Cv2ssFvhnOM=;/r5PLEm2khhBqpGeCl9qm+cb4Kb
 7O5abRSiXpAdhXZf4l4qsfRMO1bXWFXHjul/9D773HImmIv1sSf9dybqZh0m7HEQop4AvSfhX
 q3JFKr1kzKLSCOdeLuuwWUHCiIYpiVDscX7qwv4lF0/N5iFt6Aj5oC7aIMOfBUyx/S6vI2RFA
 GvKG5J6KC3swhveY1RjTXf77Gvdn6GSa7E+6r5lVwBE7yaSjoicO0lbLnijOcILexSyOsSlzB
 Ht/5QZkuji6dhoo21cdNPSOnqm02E5r9PNIgybBdpFXzgn/ok4hjdQH3uc6dFQpGqCoUPlPaF
 ZQtiYPmKzWjcOxp+qbrNPX2KpAamMmsRxJs/0s0q+soBC7t+SsMnoHCvc2ntdw0mbT446eUBJ
 PSaG5PjEHJcNe+OeA4UBZW7PmYrNbrJzUpQTLru7eWeyny+bmpdbLqrPKKhEl4mYPLWvWCGXV
 pCTBsCQdMOwOgizhWTwQ3j1WSMN0Vz5RAaktlZcWv91mw8aNFUnniKNOlqz+PX6ZCFMSxzZA8
 4auLNuq+bwlwCCb9htUINzQ6vt17dJ8Lf5G4mWcNWsceSxWL0V+fbX8rngp8zfuug9t5xlyoF
 TCywDrxkzSbTFihzkoAWxqfVF6bAxH83ybgejN5OT304OaUy/DHC1bKgXkPeyOxD+OQ8Pj0GN
 xghiH6m3E/2SL41JZ1UMoxuhxxhX1sEMlFWF1Wyumbljdtl+nimrDYtxRE1FQNyTA8K8oeuXs
 +wFBN8mOps3KUj1OH15DfbVrvmUmzLNjuG7QWswigL/81obHPsiyWrvvnEIxsqKg1l0RsN0op
 o+isqk+HrTC8RlsSwcGAp1MhCUUBlRLFNs4LMA1pPDVjYNjkf9lxX4dpsfUXInmWrOpFc9ez7
 rsYsAsUJKUii7ODkOurjSur+CAYQaRbPpC4/2TNUkrCz+qy1dzv1ZdvZ6SiFm/N02uA/HyVV9
 ZJ3/i4MB4G02lRMCzXV1UdmpPmU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_082412_472574_F21BFA7B 
X-CRM114-Status: GOOD (  13.99  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Hi All,

this patch series adds parameters to tweak SPI timings for some
(Q)SPI devices. For example it optimizes the support for the operation
of a Winbond W25N02KV SPI NAND chip on NXP i.mx6 ul(l) devices.

The Winbond W25N02KV SPI NAND has the characteristic to introduce a
delay between spi clock and the masters spi receive data (called tCLQV
value in data sheet).

This chip can operate with a maximum SPI clock of 104MHz. Disregarding
the requred tCLQV value of 7ns for this chip reduces the possible spi
clock to approx. 70MHz. To support the full bandwith of this chip, the
tCLQV parameter has to be supported in SPI framework and SPI controller
and the SPI NAND chip needs this parameter in the device configuration
data.

Also other devices can improve their operating SPI clock performance
with this setting if they also has significant tCLQV values and the SPI
controller will support it.

This patch series adds support the tCLQV parameter in:

- SPI framework
- SPI NAND framework
- NXP i.mx6 QSPI controller
- Winbond W25N02KV SPI NAND device


Eberhard Stoll (4):
  spi: Add parameter for clock to rx delay
  mtd: spinand: Add support for clock to rx delay setting
  mtd: spinand: winbond: Add rx sample delay for W25N02KV
  spi: spi-fsl-qspi: Add support for rx data sample point adjustment

 drivers/mtd/nand/spi/core.c    |  2 +
 drivers/mtd/nand/spi/winbond.c |  3 +-
 drivers/spi/spi-fsl-qspi.c     | 80 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  5 +++
 include/linux/spi/spi.h        |  3 ++
 5 files changed, 92 insertions(+), 1 deletion(-)


base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
