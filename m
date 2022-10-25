Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B58C67871
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQrLEnY9SsrPBzjYBCRFpCPUMQiNaIPED7NhipDiFTk=; b=NMpZMnc9knZJV/
	/5HSxPTcMTubKqCI2t0qupKEvIg9cEUy1SfpMI3I0kjJa9pblfTyoCPrsGQ6DWH+uo3NUsH71igGx
	7iOUnDmqU6eb9yCgFKe2TJYO7zs9qHy36DT8prVKutXi0RpDA9KCFqgKmbRzJlWyY0FQku/ZQLvi2
	wmLwiZcJ9Xbw4VcMzbLhvxLVpCp6lsxj0+SGpHWG0i7BGX9fTNgt9Xe9epDPg357KGm6CAxfnOOcp
	OraZwiwak87+swodhdXIPGC8r8H1xJ7T5/0i9KmPg7ev8abHacgIp6vkSp2D5oaas0Q3C43UnPDMf
	CS+xB/YzrlfJaZTfleEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kp-003cfN-KU; Tue, 25 Oct 2022 02:33:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kj-003cbD-Vt
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 02:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666665197; x=1698201197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K3HDBLJNGz6cQD12Md7gis6hSQ0SN9Hu8eK/7FEor58=;
  b=rq+kNnocYu1f0E3MirNU40R5OSqWHY9xFcqe3UXTo8WcBF+vALgPpZr1
   pv6jtCF7IwuUuovLXYXvtj8Z7JubIY9j42j3yEINr1ta6to4gr2tM6DX8
   L4eV6us3Y6+oprYqe4U8eAfBa9T/9Vy15QKqilnef/ZBkpH4916kDaKmt
   A9v/RYQZ9YTt9YPBL+XvUU2f2xGaSLYU/u8wsqM3agKqB4rgrgY7P4D5t
   e5NPLSF6wZb6ILQi3AKNBlhv+MUGFFzB5/3v8ujikSlJcG9YM7uc1nQI9
   N25oonPZeGgyWDAqcgMAlT8Vo0BpaSvEI+1lPiaPs9kyNyzaIiqDP9Utw
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="196873221"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 19:33:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 19:33:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 24 Oct 2022 19:33:13 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>,
	<tudor.ambarus@microchip.com>, <michael@walle.cc>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<Bacem.Daassi@infineon.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: manufacturers: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
Date: Tue, 25 Oct 2022 05:33:01 +0300
Message-ID: <166666517334.181018.11114689980548340488.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728041451.85559-1-tudor.ambarus@microchip.com>
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_193318_045059_654E2895 
X-CRM114-Status: UNSURE (   8.63  )
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

On Thu, 28 Jul 2022 07:14:49 +0300, Tudor Ambarus wrote:
> We track in the core the internal address mode of the flash. Stop using
> hardcoded values for the number of bytes of address and use
> nor->addr_nbytes and nor->params->addr_mode_nbytes instead.
> 
> I don't have those flashes to test the changes, so I'll need some
> Tested-by tags.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: spansion: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
      https://git.kernel.org/mtd/c/05ebc1ccb8af
[2/2] mtd: spi-nor: micron-st.c: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
      https://git.kernel.org/mtd/c/2fe99a867050

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
