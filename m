Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3DEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 06:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cERqcD8C8msSw6rMD6tPk5Jh3hlLL//rGjCGjtQ91wY=; b=TB+6HZpljntnPb
	kWz/PT9ia90XznHAxFqjzeKuVM71ivg4Zie4qQtBAxyRVeyeyxTkSiAqUFvkMiB51UCmschtBszeE
	ywSVX+pSZ8gHAL6RFl0CNR3zyC6EMhnnROGIqHeIV6zoMxdrpH5lpfdIBVgZObLaIehU8X4xWPLnt
	vRHJnQL21rh9aNgUURPyS+s8YQevk1IpgXQhAkMcIa9atmLLeux8jbURyeIq+B+b39pM5Dec8GaNu
	qiuwhSF/weF5dxuBmprn1EFdn3wpesE57cjPuE4h+ofaZkHj6honCv1QfWQhEAWPECyX40SPuT5pE
	lxznafsRdH1qRSexg0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlPqZ-00051l-Sk; Mon, 02 May 2022 06:47:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlPqN-00050o-Pq
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 06:47:42 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2426lWuj003976;
 Mon, 2 May 2022 01:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651474052;
 bh=BMwyBIrCpx1NVvCu7jx9btLCfEMzfzGmiANsWcO+i7k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=B2xdoCFwTZM04517mQrrVnkkG/oDUy/uF0vfUlJ7fuo7dg3FjnoYAKa0M9V7cOgxZ
 DohDaB42gApcsAe0+VeqhdUlsy0oR2+IHWx53NZKa1V//D0GYnTSOyKP98ChapQS2l
 94dHwDDH5ZZLlvA/w8+lL2nGc89Tzl7UIm0Ctt+c=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2426lW9E127902
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 May 2022 01:47:32 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 01:47:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 01:47:31 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2426lT3l079694;
 Mon, 2 May 2022 01:47:30 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: amend the rdsr dummy cycles documentation
Date: Mon, 2 May 2022 12:17:28 +0530
Message-ID: <165147401580.173344.4988030779710373320.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220418112837.2792242-1-michael@walle.cc>
References: <20220418112837.2792242-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_234740_035037_D606ABE7 
X-CRM114-Status: UNSURE (   7.74  )
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

On Mon, 18 Apr 2022 13:28:37 +0200, Michael Walle wrote:
> The rdsr dummy cycles are only used by the 8d-8d-8d mode. Mention that
> in the documentation.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: amend the rdsr dummy cycles documentation
      https://git.kernel.org/mtd/c/5ad784d990

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
