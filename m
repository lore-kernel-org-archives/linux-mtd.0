Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCD6C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tKjwkQtVMqdclpGK8yndZKEVqfiQeBessL91OvFW918=; b=C7E/M3JyTwySJr
	+Rx0P1cq+7/1+uGVcbox8/BOn/aY1oF+pPa4pg9GZhvxu8FwI6g1wYyGmGF4xqZI0mweoeZPlLX/o
	P/X+F3AWG5YjcqLSRlVZLp6TPQRbjWD0mdt1Vhjp5ALiKCbpurdOhXrfmWY4bRUuMDPwDVTPMbSAO
	RYYsRZcfu4+35NFp02z8ZUMPUkrR8iBrJ94l620Rb3VURgGwkpT/a0j17jmvxlV61F0FggXpcmNho
	6vPxF4WqNOE7BKPnnGw1FEk10pR1dCG7NUTEjzaYKgw2gRx81UZCQ6CUmlUf88kGWZtakY266t8l+
	qNt8IgdY9O+PBU8YZLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsMd-0050V1-Dc; Sun, 20 Mar 2022 10:00:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMZ-0050UZ-Oe
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:00:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id m22so10858832pja.0
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdvnP6677XQUxwCvb+l3NHWmDq4klejHLdViSs4u5xY=;
 b=mS1TSrJNdEiCOFtmoOF/KnIDhNET7eyG8ivZ1PFjeqh7OcrOVIIsp/RUFHunY1m716
 qfbw7QWuMYIO/XMAC4xqiCiMnnINehPKDHQkirPyw6BTAvDMA8uJ2pIKjiFJ8XAf5M8A
 XxP80x8By12aUzJkjzJkJfsuDDOdycyiQEIZa5UdHewXx9wlQ1l9s5N9B8qNOizKfFCL
 1alHdl5ogIgoKZMF6PZLIRgjq4Rc6d16PrqraTW8WhGRzrqG/olB+3rqEIQ1a7jv7+w3
 4CuJ9Eur0FS1VSl2wSUE8wMjmTTVpbKotGiNyitU3yvh9UOlppGCv/PMxybqy4BB4E9j
 aBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdvnP6677XQUxwCvb+l3NHWmDq4klejHLdViSs4u5xY=;
 b=ONk6c+xaHU/IDC4RqTNtRzl6rwGUfhbk+pG9FqSlhk7wMwcWN6t2jT4ab26Y789fLT
 Wf767FWR+T7epnCDIOJQerQbHojWP9TaxXG3q7k8LEDb+UmLf1yfdM8o5KEj1ouGdde6
 x6ZwsfZwMY0qDa0WNIAAzD+DkE91BWV7irVSpyVDTSLek7OWccITpmmuStt6jD5VM6ct
 nYFOZgtLvUEem/uKmsOP5apdqjpji4Wmx6viTODY3xXN2NGGm/m0Ydq9YAxDQdbO/sg+
 nzR5PUGE+nUj851PDTdg62JmvPUZDHFjXfcAoHadwAil3W4CkkX8PLVDUPdUogpqogbY
 2UBw==
X-Gm-Message-State: AOAM531fvgG5BIEZZzuVeKr+Tqa5DU7+UtfrXchDSzZIJxEA6VUWTJ5w
 h9fQVPYbY93JCp932pP5xQ6tRaykvntCXWXI
X-Google-Smtp-Source: ABdhPJzXqt/qIbR3gYmHaut+yR75NuNMnBq80tn8bXLXCw0a57qzjmw1CUMA4eS0cyLqvWDlDSA8YQ==
X-Received: by 2002:a17:902:8491:b0:14e:dad4:5ce5 with SMTP id
 c17-20020a170902849100b0014edad45ce5mr7525767plo.76.1647770438809; 
 Sun, 20 Mar 2022 03:00:38 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:38 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/5] mtd: spinand: add support for more GD SPI NANDs
Date: Sun, 20 Mar 2022 17:59:56 +0800
Message-Id: <20220320100001.247905-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030039_856079_9030A5A1 
X-CRM114-Status: UNSURE (   6.57  )
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

This patchset adds support for gigadevice SPI NANDs currently
in production.
Tested the following chip by reading and writing a large file on
UBIFS:
 GD5F1GQ5UEYIG
 GD5F2GQ5UEYIG
 GD5F4GQ6UEYIG
 GD5F2GM7UEYIG
 GD5F4GM8UEYIG

Other untested ones are variants of tested or currently
supported chips with different voltage and capacity.

Chuanhong Guo (5):
  mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
  mtd: spinand: gigadevice: add support for GD5FxGQ4xExxG
  mtd: spinand: gigadevice: add support for GD5F1GQ5RExxG
  mtd: spinand: gigadevice: add support for GD5F{2,4}GQ5xExxG
  mtd: spinand: gigadevice: add support for GD5FxGM7xExxG

 drivers/mtd/nand/spi/gigadevice.c | 158 +++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
