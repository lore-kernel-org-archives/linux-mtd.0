Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B39C52D6F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2024 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lcM8FSERv4BGiasPu/NohfL8k/rE7X44NBWg/wBSv8=; b=s+u0KKHntK+CGo
	xksHY+CBLwndSMFm8XSiWb/I5pIPIe4mgAo2zNcRukH++jdgfgi7NiCE3SJl17F2HDzj4QR7N0oZI
	hNjXl8Jf34GCt2go3MDz+iY235I1Eoz8n7uijIQNnqCKachCMmOx8//c1xmlUoS0knMlrXTtFKtro
	KdNaWQv9Y6r4OuApa0lpRyw5dkrlS7OhAVeciy3HfsY1le1UzwiyDe/gusNBVaJ8TSY6q9erQOpuS
	uwV6ncIv2CX6gyxOg0XlXondms4X6mJjINN0qUpd/X2yNAl353j5EngbnmO9Edd3Gsn6i7wXf9mlB
	+CxWTYpC2SniUbT0iD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbfp2-000000050U2-2Ooa;
	Wed, 07 Aug 2024 12:31:20 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbfoy-000000050T2-2dcT
	for linux-mtd@lists.infradead.org;
	Wed, 07 Aug 2024 12:31:19 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024080712310894ed158a0a5ed8e69a
        for <linux-mtd@lists.infradead.org>;
        Wed, 07 Aug 2024 14:31:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Lr4VbXyoUNBKHroUvYhnjaOEMg9ocSi19a2meE3NfKM=;
 b=AIXEZSOY77IMTAHjF7GMA0h6++JYqbW0HDQFyzwWkK9rxMQm2ZieO4DFLIvMshhgodz9gJ
 Pv2619gLfSXeMbgl2K66Xtyyv0xlBzGvbUDFpoyVmpUH2hQQW3/OxwjGhYgKfe9woGDeOxgd
 8KzDIpFBOGMgndDFTXDlx1vzXQ0XMC7SadG4vBYHVzHAh9Ejiy7PmO6TX4izc7CCHfliY79h
 L2fuNoXD51E75QYTaS6l7z73N/JgH+Edg+tx+rHKhclfjt+znyLHY51hHdRBkVU9KJytgaTy
 aqkBUw1YDVouqa2jRFn+k2Tif5/YGyyyMAqxB5jVVy4+nFE99y47IPJg==;
From: "A. Zini" <alessandro.zini@siemens.com>
To: mwalle@kernel.org,
	linux-mtd@lists.infradead.org
Cc: alessandro.zini@siemens.com,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH 0/3] Add support for Cypress/Infineon cy15b102q
Date: Wed,  7 Aug 2024 14:31:06 +0200
Message-ID: <20240807123106.22275-1-alessandro.zini@siemens.com>
In-Reply-To: <D37UZ77FNRUP.3K7M4O4K2WZF3@kernel.org>
References: <D37UZ77FNRUP.3K7M4O4K2WZF3@kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_053117_581596_9F539D32 
X-CRM114-Status: UNSURE (   5.26  )
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

> Have you had a look at drivers/misc/eeprom/at25.c? There is already
> support for the cypress,fm25.

This is a very good suggestion, thanks. I missed it. 

This patch series can be dropped, although I'd continue the first
patch's discussion on how to handle the manufacturer bank.

--
Alessandro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
