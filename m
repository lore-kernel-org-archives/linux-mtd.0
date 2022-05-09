Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440DDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxkfKMUAzg7HETv7xsWTpvfbn5P9xBAOnzulfNEq7Kg=; b=tR45EBuR/6Qp/B
	C89o+UjWZYGsRE+pWyPx15lXsGf133eePGaa0BemXsMAtp6oOCpJUXL8OVLT8VRm7gu4BB/gM1hV2
	8p3ci3qzpK0OsOevClFebqtczOdQygwyDTNZwePeycD+/EEWvDMA76cejS6xubK8nObCuiGHUFSZj
	n5gi8fMqrNHof0Y44NAfdwpP3DLacaWGp5RKoF1Rw0AGnr37+QLfnavdAjfVEDIIq/PZzyo6+GLa+
	RV46DDi3E31t+Qigl+SagC43GR7qAIefjyo5r8jiFaxXp2h2Z8bLB9KYWkynOSYx0Y+ZMCI3ViolM
	jZW8IReb5UlY2UM3nkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1IN-00E0fi-Pn; Mon, 09 May 2022 11:11:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1IK-00E0dn-Gq
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 11:11:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 249BB9jj066312;
 Mon, 9 May 2022 06:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652094669;
 bh=vndduWuikymFtFGeCUAaA7OplM3JUKbgEoaQpyTwuks=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=psp1b+YQ1WB1VttDrtd1COkZtrj3a+2LUuZ6/N4eYky9zFfEWCNUPcVTCgmX20jaj
 /8Hp0dVCXRe63VNZHXbzcev1L9PtjPYtkqPpovD5hAdcZuG3CbWC+1Ee6PsX3p91cg
 2jJ7X76PjOFTmKY/7heJXYd9U8eo/siEF9OEbyWI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 249BB911020080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 May 2022 06:11:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 9
 May 2022 06:11:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 9 May 2022 06:11:08 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 249BB6Cj002174;
 Mon, 9 May 2022 06:11:07 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: move spi_nor_write_ear() to winbond
 module
Date: Mon, 9 May 2022 16:41:05 +0530
Message-ID: <165209461431.3971394.16610033211689877768.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429100153.2338501-1-michael@walle.cc>
References: <20220429100153.2338501-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_041116_661351_1474639E 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, 29 Apr 2022 12:01:53 +0200, Michael Walle wrote:
> The "Extended Address Register" is winbond specific. If the flash is
> larger than 16MiB and is used in 3 byte address mode, it is used to set
> the remaining address bits. Move the write_ear() function, the opcode
> macros and the spimem op template into the winbond module and rename
> them accordingly.
> 
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: move spi_nor_write_ear() to winbond module
      (no commit info)

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
