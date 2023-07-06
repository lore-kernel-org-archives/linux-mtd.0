Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70182EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eQJjgpccDk7El6Ps2NXoh/cdXDDz2DSeMpZI++c1Ro=; b=T3zyAvnM2eJmra58njLze58ayn
	/qhOTVLWv3CbDIkrXBy/E+/liDefCKe3TzCsxHavZgIqG3hOIAicx0/ZrOSZ5kSiBLG7ssB2LijyD
	OWsFtGUJlyi+FESaw+Xw+19s8CsZmYcfjZpdclEbVMIBr9nIB7I4+MQ3igMAx1e/dyfQZHjfipyz4
	v7ofkgmmnbp4szJNCyul7MVYG9m+amoxDedM0lBJw7E7EkwSoX5b7BwHL/NNU/beWPKtb1dx5skQz
	1bVgsbY4e23GCPpclJKbw3J3UNX64imYuAzDFFiZodGyjPM8bAX+M/3SaKM+VqBTHs+aAe6IS+Eh8
	1fcZZNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIh5-000fxm-2t;
	Thu, 06 Jul 2023 06:42:23 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIh3-000fw4-0Q
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jul 2023 06:42:22 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C8A01D7E;
	Thu,  6 Jul 2023 08:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1688625732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzYZ7s45Fs2Q+QMEeOTcP2cLhvl0eQ2Eswiy7C6Hb7c=;
	b=Kf3TK7QSB4GIYFHU+3xWlezbLwGRf+r/he2H4cPJhpOMbz9WHaK6JHR+TknzGGYhnmYmX2
	7xExojDPVFpfsMQcNGH2M+eevsVEqgASoh6E6jaHeNMxJnUMHTXFOGYs04C8MX+43VkqI8
	bEuypSAAhDxhMvnZmMaBWQt02FTY+fYiGHWaKF2tlY6wiHB8jbv8+L9Mw6zsoVKf33TQH0
	C3mR/50l3UIsPrmpCK4317yYkhuLEc+w3wrzU6nEMCoPk71D6EQtJOYym00oPNM0QafYdh
	h3SdqtT5jx/Ys4EXBSFjAz+OExHK45FUPlWbUxgoK0VGXnmcF2POJBgw71tbIQ==
MIME-Version: 1.0
Date: Thu, 06 Jul 2023 08:42:12 +0200
From: Michael Walle <michael@walle.cc>
To: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, Mamta Shukla
 <mamta.shukla@leica-geosystems.com>
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
In-Reply-To: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
Message-ID: <c1fe9a411e917778d70c7482568e8c63@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_234221_328442_ED6D653C 
X-CRM114-Status: UNSURE (   3.84  )
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

Am 2023-07-05 17:49, schrieb Mamta Shukla:
> mt25qu512a[1] supports locking/unlocking through BP bits in SR.
> 
> Tested using mtd-utils- flash_lock/flash_unlock for MT25QU512ABB8E12.
> 
> Link: 
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211
> Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
