Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C700C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX/HAFEq0lH8WXOmFBaTmv+T3lONoT1/Ix4CiRxRj0U=; b=SPNqQmzk/U0Krv
	TLXpfk9v43o8i4q72Imcadr4Qn0cdVtHTBYAoWt4V1sigACGVjtylsfRHCHd51yYHGi6brOXgrZJg
	GBFRNktjPoXmJFj0gs9Sn1pxVlZmKB9ISMrrE3L7Kf0o3dD4t0W6nzLvsftGToTeAOO5orROO0RV2
	smWNzEMgLizVLARJTUV210SBMnb6LCmmtTNYCck04GH5ekS3URLeJLPaVag+Wzil570Jng4T2IaHe
	hP/2V8DuAyOXrMzLJ0qlh6983CsdEsiXq48gwAvqsnqMUVertuPk2BkrZf9ZKBVDPw3+po7fc/fqZ
	aT4NM7HWbh4gV9zbujbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3Rh-007UEv-Vi; Wed, 20 Apr 2022 06:04:10 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3Rf-007UEB-1P
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 06:04:08 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K640BX077067;
 Wed, 20 Apr 2022 01:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650434640;
 bh=SrkSU7FXBcaxXOw0MM1aLTYzdeFwkmq0UNZpEBbBBDk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Zeabq8O/vTiqA1IvNErl/93sYcpnQZxvy5svCIE5jcOJKpc1On3/PCODkMhYL2X2J
 o8UXIz94fTNvonlW2MA6jpgQIhcMHPupvhHQXEon5hQ50OFJSWu2H5l9quk/KVGV4O
 k4D8hwxdiGcJSiiM7EV+Tc33LHCevNvjwylVGfu8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K640VJ109171
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Apr 2022 01:04:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Apr 2022 01:04:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Apr 2022 01:04:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K63xtJ052008;
 Wed, 20 Apr 2022 01:03:59 -0500
Date: Wed, 20 Apr 2022 11:33:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: amend the rdsr dummy cycles documentation
Message-ID: <20220420060358.f5xtfnvejvyzhx5k@ti.com>
References: <20220418112837.2792242-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418112837.2792242-1-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_230407_263501_EF2AB118 
X-CRM114-Status: UNSURE (   8.71  )
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

On 18/04/22 01:28PM, Michael Walle wrote:
> The rdsr dummy cycles are only used by the 8d-8d-8d mode. Mention that
> in the documentation.
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
