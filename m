Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8DBC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vx8VmZOykTMTkPPtbbUcC7FzgL8EIrOet9MrWhsj+3I=; b=BspoiKDrIHaMDo
	0qDyqWFPCVmTCTr6cdN0xSCV8rLlt5RAq9/wko1i/MsAPcOha+Zmu7goipfBQpBmwCbYMal+Z69Y5
	JTY2QIiRjhXW72ZYmoLH3dwc5U+7Isks+TsXR/ZPKeW0nNyJz8NfrehFRAQfKCr0GDQZPT388UuiM
	boBd7eWP445wPENNXuwX5wdyjq1vg/WLpDDwA7/S52sY788k2swX5Dx59f57fcLW4RI4yFac24LSd
	5gXsFrxHWdG32hnPC5cR4e11LB4QP/cPhRXuuPjwtptTqOI1kNi0TqQmjSu3sbkBzev6qSapXiHb4
	m/K0YfAuY7zTPSTA7/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2d4-00466o-8H; Tue, 15 Feb 2022 18:32:46 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2d1-00465X-BX
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 18:32:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FIWfFn042797;
 Tue, 15 Feb 2022 12:32:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644949961;
 bh=kFteAajFcLVpaHH20rO9g3ri1wOFjJtwwLb0/qJuCg0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Gyn+iQrZdJnqDByYU0+hq9Bd/pVo0Q3KVzB4OfqNDYHwyxVHO0h+JtmpWoLvHZ1kr
 wA1s9h1Y+Z/H0t+RozxbNfeJ5l+fUuISIKuOyxguga3+HDhc1YQkKsmZi7YWx+VbQk
 Ys/v5K9nEizBGh4GdObgp32P2g46mW9vFEI9Pk40=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FIWfBq119261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 12:32:41 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 12:32:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 12:32:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FIWeVU088799;
 Tue, 15 Feb 2022 12:32:40 -0600
Date: Wed, 16 Feb 2022 00:02:39 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 02/14] mtd: spi-nor: slightly refactor the
 spi_nor_setup()
Message-ID: <20220215183239.7p7avldxrpkovqln@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-3-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_103243_498374_2D8291B8 
X-CRM114-Status: UNSURE (   7.63  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> Instead of always using a function pointer (and initializing it to our
> default), just call the default function if the flash didn't set its own
> one. That will make the call flow easier to follow.
> 
> Also mark the parameter as optional now.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
