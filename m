Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB5DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6iUXoBUxiez/UHFSVi7tXr8pMEZPH+mQW4SUQDd5Vc=; b=2/siEfXcn/eVP7GHrPAsPIpJHp
	yQ2gW+f3jz5VEMsbnzjTSburW7G1jI1w/nsxyDlbv3wdzDjbz11H95J8s2WSJh3hYYEF9VzhIdEHA
	pDU6CPBKAixKuqSQoPzurAzJvhPgL8H2oXTmMVWdxAhkpVE2OyWUyXshRIjIFb9CAYLT3z5V4oF3g
	Bjkx2WIEzNnNukv/HYXoXG/6gk3yiYpMhvd+pTavYdGKTOp/Xm03A10LGizxtEDV8tHgVtRj+/MZB
	LY9QEROiwO6FXSE4hunOD3mrsswHlwEQypyDINsMj2/tV5E4sd67JTClk59WU0q8whX01z5x86omw
	pvf3PoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npGcV-00DfQa-Jn; Thu, 12 May 2022 21:45:15 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npGcS-00DfQG-HW
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 21:45:14 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 980B42223A;
 Thu, 12 May 2022 23:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652391910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lxCYRBDjR9HguaFmo1lZ1d/fxjZ5QmzauoY+2h0gFY=;
 b=UE7FKtljJuDhmGAmI+AywAShluJkRhHV/n2vhW+tFhnObtzYOYGskKqMeLtBeSiHxnIH4C
 Ptk8TGgvElBfcAa9LMKkXUNzmoWvrJN60MbfzdwkiWxa1Qz48PKhrIqnavavk3Tn4cT0tN
 TwRw5UwgmqKEUitTcjYGGBJfZzbSW4M=
MIME-Version: 1.0
Date: Thu, 12 May 2022 23:45:10 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
In-Reply-To: <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1b7b735d6cce5da628afad87426d6f81@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_144512_785829_CBFA8BAA 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> At the SFDP parsing time we should not change members of struct 
> spi_nor,
> but instead fill members of struct spi_nor_flash_parameters which could
> leter on be used by callers. The caller will then decide if SFDP params
> should be used and more importantly when they should be used. Clean the
> code flow and don't initialize nor->addr_nbytes at SFDP parsing time.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Nice!

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
