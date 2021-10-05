Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2271AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 12:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E277661166
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 12:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E277661166
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFE+K+PSIUxa8YGdC4453sbgA0gnv/tlVbAwfVssbRU=; b=MOtSpiuBkwL2qL
	FH21Ni5Q+741zU7zfJ9CBspwGqtARoFmfuWYcaL8tJ7GnRZN+21b+sTE2uvVrL6daVmgzh2a7kglk
	qxZiSXtlXMPQnyLZlmepC9AbVXGcEbE0JeTFSJnV+C7sPpKhSVUTBIf+MCqyElbcfPN0wWjKJZQq/
	jEkUCB20+AAWuyiSSixupeFT9/ppCOdsU6nhpcwmLr+nmjMRP1TOmeejdsIbelgu0WJNmY8JO49w8
	j+NGsy/4KxWKrPjnz+cpf1NCpnybApDAQwyQGP8mJIdI17R6b2/tS2U/RsW1S3l1UkxiK/LnzUQTh
	x7eNSVAcKJb9b/UJAcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXjII-00AICh-2s; Tue, 05 Oct 2021 12:11:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXjIE-00AIAn-5q
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 12:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633435894; x=1664971894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zhTZMjqn4/TM2ZgS/jPX+R07LXff+qvZQ2Gih+sJXa0=;
 b=sPKf7MYwMgMjvy5Xg8z9zTiJcJ2UYJ27MsKglGOcxlgqwlhcCVVdNz/K
 +WR3h+FeJuWTbX7SSSGAn/C6/TZcEOQ2IsmrtysiF96tuP3Iy19eksZfD
 bHX75sJarkl4BS5qSEl6T/vOTHFUK9xyXvvk6AXheabVkvAIuPU1vrR1E
 lxxEjD6pE9KZW3xNooz+sfwWE9j9sMpJPJq1yd4q7IDKtbX/mv6Gup+Kx
 YoWj8iF0RRPishcNJ/jXwfB2uZgiyzg5mOfMMn3pEx4yqU59mY7OQDpG+
 cS33wbvUWKANzjYKrEWU6SkmRjFYucrXau/DRPyPIGi6epzmfn8pwTSwN g==;
IronPort-SDR: vt751ye8NfyblE+UFZp7sqf0SKExU4Nd3hPQ6jkw/PLkpWczOeEn1gvDpSz+P8pclI72yuVmHg
 lUEbpvQsuSeqHXGyDV5kehTnjsiMStPRoljZlpPqL4mfs5sYkjBDe8PqhL78cI1venVnOBci6P
 ryYLkSaHD6l4PRVggaAedeXel4KglJygCTCA3EQd49wf6jBB9rFHf8XSTuZeV3bMu6tNwMPqIR
 OJATpbyHQHt+e2buUOLZieah7tJahv+GMhsdbMbesbbjfwkuaXLdwndek85wsnJLSq901UIsKV
 e9wkfmzhPz6zeLG0b+IK0+Ij
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="138511597"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Oct 2021 05:11:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 05:11:31 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 05:11:29 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Pratyush Yadav <p.yadav@ti.com>, <linux-kernel@vger.kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Rob Herring
 <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Add spi-nor device tree binding under SPI
 NOR maintainers
Date: Tue, 5 Oct 2021 15:11:24 +0300
Message-ID: <163343574378.37829.16814957321321688865.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923191026.19184-1-p.yadav@ti.com>
References: <20210923191026.19184-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_051134_260165_818CEFD0 
X-CRM114-Status: UNSURE (   6.53  )
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

On Fri, 24 Sep 2021 00:40:26 +0530, Pratyush Yadav wrote:
> The binding is for the SPI NOR subsystem so the patches should be sent
> to its maintainers. Currently the patches get sent to Rob Herring and
> MTD maintainers who might not always have the full picture.

Applied to spi-nor/next, thanks!

[1/1] MAINTAINERS: Add spi-nor device tree binding under SPI NOR maintainers
      https://git.kernel.org/mtd/c/3f491d11d8cb

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
