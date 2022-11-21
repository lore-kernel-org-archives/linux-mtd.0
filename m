Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF2C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX7brhq72ERL96S2j1y3bbSFr3WI4YWrDqYHSYpq5B8=; b=wVqUX1oI8v/nM6
	y6DpZAqYookPXJP74PW2mRKfRyz6TzqvFXFj32rksetn37FNDxq+0vFR5fbg5/QiTpOTexxgDe8gz
	z5LYjIYnU9VnTo2nJnkqLb7Tk0PQbFWbs+Y0KlfFTLEUkFHTRLA/XHUt29HNPWU9NVpszu5ssD5Dx
	R7gmhLu8gXDLXxT5vF1NJey+7Ar2u3Uc5c2ppBilXnX9WcMozvkoXuu54YreGqJ7pJIbc7qKD+sX7
	3a1WDUCt60f0EJVpjFSeqO6gT+l+c2R0qZ6AaKasaacgkTQ3JWsLVpZ97S3aprO6XEHm1VKGZylx4
	byAi/1CAWISS6BBsrNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8m5-00FDn6-CB; Mon, 21 Nov 2022 15:31:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8ey-00F9An-NZ
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 15:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669044277; x=1700580277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6zAPc54Hyj7y1k86bWrWpPjCpi6QsBskBBHCuoWoeF4=;
  b=nzgFNT0jdz4vHbG3CUP9j7I1nUtNAuZppn91QAMUmeEdIZo6YC6oWQLv
   3rg85EccoXpSCXjATGOHpmCPma4PZliBjBmPA9Muxn5jEo2wJUO+Jw5nb
   A3FMiNBYD1VKWzz0KJn0OE0hEE58RAN1Mcyl8S+4ntCqHVYLxEyfstG3N
   5iZpXNImNhKbZ66cOz1OMyVumGbv4jLsI+twnyN0P223efgcBS9YJQbao
   SutnY2GOyHdoPyL2UPFly7+EIGIT2gQMgMTGo4ISKzjHZrvNWnRH81GQv
   3WncgWV+4CENt5ThH2+0Nh9Gjkq414UyXTq4IRhUg9JnCxTFuUTyF2zn2
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184497757"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 08:24:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 08:24:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 08:24:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <quic_jaehyoo@quicinc.com>, <p.yadav@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <clg@kaod.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>
Subject: (subset)Re: [PATCH v3 1/2] mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
Date: Mon, 21 Nov 2022 17:24:27 +0200
Message-ID: <166904400383.115983.13314465270022760559.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
References: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_072436_874316_E0637FB7 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, 15 Jul 2022 17:06:42 -0700, Jae Hyun Yoo wrote:
> From: Michael Walle <michael@walle.cc>
> 
> 4bait will set the erase size to 0 if there is no corresponding
> opcode for the 4byte erase. Fix spi_nor_select_uniform_erase to skip
> the 0 erase size to avoid mtd device registration failure cases.
> 
> 
> [...]

Applied [2/2] to spi-nor/next, thanks!
I haven't applied 1/2 as Michael sent a similar patch which
I had already taken at the time I got to your patch set, see:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=39eece67a3cf
Sorry!

[2/2] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
      https://git.kernel.org/mtd/c/ef434f08b056

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
