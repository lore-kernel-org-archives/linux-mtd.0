Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB443C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YIi8k0N8owv+i7lnOLSdxiq7h3tizblTHxN0m2qyDU=; b=YggFrCVwRqq7dG
	C9VmF054/JjQ52juSprmBkTQEdFW/rn8LyY0jOiwlRNWtPKljAcdt4lP5xjqL6matiUUyHaBjZRmn
	kexk25FCf5iHAXjZQDKi1eAav4SstIuP5U3MpewVWAL/+gZG/xub9vsgP9gMl7nDTn7fNTyvx3kuQ
	+cTzV85xY7tZfIr5zO01Hh4U1KdD/ha/m7OQyY61GpZH64wzdhCbd7ZXT552cu43CjN81EuwHzLQ7
	cwEtG3rtmLesc8/9Tv4LlP9TlsZeMWYauTw1Ld6hrzDVGi67Fizlbz6fsh8iUaSFgHkH6gxzNF8cn
	0yL8nUCJM3/KrIB6jDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8ae-00C0ac-Lm; Thu, 12 May 2022 13:10:48 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np8ab-00C0We-FG
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 13:10:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CDAcRp044919;
 Thu, 12 May 2022 08:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652361038;
 bh=kpYjg/YJDu1USEjgBhUQOa9ZvfUzQA8K4X6I5hRa6UA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GuwX/IyUVRCIh4HRLZPctUBCIs/o/jUbeobExryJCfMbVzPiBBb4zwtHj/DBs4HwH
 xvwEztC91ipe27tZOoD+YYBD4R+TYCH/iBOLZ1YAhtoOjht+OnXAd5UWnHvSoFptZ7
 UN+FnhLmCakUKrMESAz92WtWdjQnpMjrjyZW1wx8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CDAcUT015850
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 May 2022 08:10:38 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 08:10:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 08:10:38 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CDAZ7I011087;
 Thu, 12 May 2022 08:10:35 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, kernel
 test robot <lkp@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix format specifier
Date: Thu, 12 May 2022 18:40:34 +0530
Message-ID: <165236096308.3070754.3267469990588119006.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512112027.3771734-1-michael@walle.cc>
References: <20220512112027.3771734-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_061045_594264_16038F67 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu, 12 May 2022 13:20:27 +0200, Michael Walle wrote:
> The intention was to print the JEDEC ID in the following format:
>   nn nn nn
> 
> In this case format specifier has to be "%*ph". Fix it.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: debugfs: fix format specifier
      https://git.kernel.org/mtd/c/c474521946

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
