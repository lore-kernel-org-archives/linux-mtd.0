Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A240C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJeOKPBcGUtKUTAhXO5rzlZI++JXsj6edISN6/7YxgI=; b=ifBWmZ1wAWYHuP
	hUT1Dp7Bj+uUaP93JQDciHzbLblpJcct2RQwzUUObkXXHFFEIcX4BcFig+hTDphaQz5nqr4Gii982
	+suKivASXhUnfq6d0SxPt7S66kcb4jesAG6MJtl+8eaFufcJzdGq5EXPD+N21IGELv79FqG6N5xqV
	uv4s1Xx6KxCW2AKUx22TuGRwzgLgcCDMp98EZNidkpSihrnKrKV+nXUEaBmzkkFUCRpQnFwL/hzfA
	HzUMU7SxZthL9VZwL/ePWFNTEMaIZvFq+o3cHnYwvIuZ5wU+n65EG+rPVIyZK5RIdmlXq+sYD2Fl7
	yVj8EtGhZuCmCYrOTaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkCI-007r3Y-Sh; Tue, 19 Jul 2022 10:11:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkCE-007r0C-8l
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 10:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658225478; x=1689761478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ygSEKwztA9bH5cRhjY/tRO4Cp668A82tN/0MFFZC9vE=;
  b=ZpWBNulOlc6Ph8Xhf+WIWwNU77WrbLNMgW3zKxTh+hPqo8sHL43IaP4M
   QEjcwO3tSytsPkAwLQTUcMwGg6o2hbU6j9T7IBfMLnjS8y9elrDxH1c84
   /zp2XixD2iDN5hPMj6a+NO0czYzd0325SoJOsBf5Bfn7Mu1DkSrWiY0sD
   pZXYcC2V05PJIaWdRdcVmHiw46769ng2eQeoIsD28fKzKE9TpzMmojVsr
   ci4+ncuPo+crZf9Xk/OBesEeWRvqSrdmzVPDI97SPEg48nT/621MDmKpw
   KrdWfU1m8SYhXDCfbxS1OIkj4W4p4S8uvnz3/PsiSvdZGwMg+LgSZl2y4
   g==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="172715351"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 03:11:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 03:11:13 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 03:11:11 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <mans0n@gorani.run>, <linux-mtd@lists.infradead.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>, <richard@nod.at>, <p.yadav@ti.com>, <michael@walle.cc>
Subject: Re: [PATCH v3] mtd: spi-nor: esmt: Use correct name of f25l32qa
Date: Tue, 19 Jul 2022 13:11:07 +0300
Message-ID: <165822542709.94389.4476645380679565543.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723141232.15659-1-mans0n@gorani.run>
References: <20210719152037.33317-1-mans0n@gorani.run> <20210723141232.15659-1-mans0n@gorani.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_031118_350718_8A501AE5 
X-CRM114-Status: UNSURE (   6.22  )
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

On Fri, 23 Jul 2021 23:12:32 +0900, Sungbo Eo wrote:
> The flash ID of F25L32QA is 0x8c4016, whereas that of F25L32QA(2S) is
> 0x8c4116. F25L32QA(2S) is the newer version of F25L32QA and its BPn bits
> are non-volatile, unlike its older version.
> 
> 

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: esmt: Use correct name of f25l32qa
      https://git.kernel.org/mtd/c/41e4f15f02af

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
