Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC24C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=io0WCml25JSKZhvW/YHAByJcCFLV1GnvUYXbSEgiJR8=; b=l5FIp49YBKX0A9
	/Me+tVacsbr22Wfo9LBhT/k9Cz813J7uYQD/SgwOMypsMGiDbUILJ7FlERGCC1Oz0v1fLTsAt/+iN
	TqM+xSNdU1GCXdGwbM63ICEfV9B62vrIIF5C11CXGcbh1iZi5y/1B4FCAEp4rmR9HrUHDvnXFeW/3
	fiYCi2PNMy1+SlR3LYja3Lwz9rPsLFuEJvHdA8PAxE75PWh6xxD6coU1oN/zQfd6TO4FN1j26b0zm
	WITBGGE9IW70+eHkxpp2ubYfpAH7/phEVgoH1EOe7NT1QwfgFrNTmz0+i6oQRCfAcCSjrGIY+iStJ
	3ZDUB9zI841b9wmXMfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JYn-00CHYr-Ag; Thu, 23 Dec 2021 08:34:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0JK7-00CBqw-N7
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 08:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640247579; x=1671783579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRoAnEY3r8cgHd59JP9JgzeC0rdQQn8RTC7yoR73nTo=;
 b=FtxLEB5RX5f9E9QcVVhmpHrsvkLpJrRFRkiaTLFpFYxaRXBQvHEm7lDB
 MQHgRApDYo4KIgG9PpCOFjFXYTb3AgSplXe5bY0eK5rZZV6srH9VRMp6W
 fx2oqz8vYiWmMKJEqs3IuOj2S+nDWS20LpSY6Em4Ixm2cB7wnybp5g6+e
 L5ZTzbzZRCnyY6oV3+2GU9nmE5aFucZoCLmuiGcGd/Ffnav+CcX71t5Vx
 IjoKzrNmkPmEfZ2TjaWGbpaudyMBzUYFVBYuDcqhqa76f+TtnMPLkH3vh
 jA/6gSKxssX0m13UrTrEnqSrH9C4+zWW3p6ooYeFc2Bbyt+slQlusjQGh Q==;
IronPort-SDR: WZDh+lJxetnRjEE4izqzl818toaMq8pJDzi/H12mKRCqXDTHWWKa6yGvwOHYZlEXl2wQCkKJQy
 vdDFSfT46mzz1suMCM6/LvrH46+sGKHDHM3F08SSlNsqXiVsYx3wqeOov2bjPQ6IH8u89QSLLp
 m3jcIZDN11fjrETYOl1N2B7pNRcXFdEXx5fcK7VZEOpH6Z7Rl53zD8EPAkhTkDZtzNlRa5hbtg
 70nUSfXVKXOyJpQkTm+oYhyE5nu7V/aLTW3BuHXzHLeiXLapKAc7cnClOtbsfWeRYVnFPqCnlU
 Q5/zFqbmskwKDAJWQwf6cWvY
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="140688299"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 01:19:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 01:19:38 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 23 Dec 2021 01:19:36 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Constify part specific fixup hooks
Date: Thu, 23 Dec 2021 10:19:34 +0200
Message-ID: <164024756845.186441.13039859160300606228.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106102915.153552-1-tudor.ambarus@microchip.com>
References: <20211106102915.153552-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_001939_910515_755807FB 
X-CRM114-Status: UNSURE (   4.09  )
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

On Sat, 6 Nov 2021 12:29:15 +0200, Tudor Ambarus wrote:
> Respect flash_info structure declaration.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Constify part specific fixup hooks
      https://git.kernel.org/mtd/c/65b54ff67afa

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
