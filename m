Return-Path: <SRS0=VhFc=JI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8307EC43460
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 07:46:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BDA610E9
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 07:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BDA610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTjjjCeh4INi565IyDHXmadMUR9lvEg8xoRywd804Ag=; b=XmO0pRCA8jhDIhTdPq87OfzWb
	WhNMYpWzJgFai5X0t7t0W0ZpmkjSWThiHiy0mrVpszVza8eATa7Gy4W4pQOh89LzeKrr6qn/+NlVZ
	RQGWJQlZGEfJOXx9G8+MPegh5fHzwXuoYeYdGK3ACp7Qj+w3zJrcwbqzsWFGBouZqcWYhZ0ZWfiak
	qcMHxgsX7PLbPXKVv6cDbOBKcMw0rYeOvuLAJsx9qFrO3nMBJIiMonkgLQEn4r8UQnTpyw7q/Fi2j
	Y5HXqcjxCzAtgO4WFm81MJwHQBVqG9Y7HPZtkSXPdXhONQ7yFoDYotlZ3ul5e7werfPrF8g1V8qEV
	ofoCPQrmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVUmX-0047gz-Ig; Sun, 11 Apr 2021 07:45:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVUmU-0047gk-Up
 for linux-mtd@desiato.infradead.org; Sun, 11 Apr 2021 07:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=DJgDp5emLHZjyfbRQz3qA59ld5mmN4MJrRbBzoUZeCI=; b=CNuqlu/coox/YDsjkEQgL2LY7Z
 OLSIEaIsub0q5jV+7tZmtL7YOrEV3fcNYiadqIuGuNUIzbwppGeNWeX0Kh03c6cHkEmIIto6VNZvq
 1hwxKe4f1oWqsDMiZvx/c7OlC21n+kw1IxtN3SCfusGYMaPcsrML6cpx4JcB8LzKEaaJ96fWdGKvL
 0N/qUMJqL1prSTMpVjilJUWT/+x4T1j3bfcJPEzJrXrSt6hNPlIygZxQKz7pUk1OGTZ/8olrvHEuQ
 XGfraxy56wcWefx3H3Sq4s9lXuP9gbUy3yB+RD3YLDl8torv0gFzsMrtp5H4Rb1DeOHUNyvIkdrA7
 +Hdw/MfA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVUmP-005Ovk-Ca
 for linux-mtd@lists.infradead.org; Sun, 11 Apr 2021 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618127113; x=1649663113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=deDvm+/gIW+AgC4Z2vogfCHV0tnsxgDJvqBREMBMDPk=;
 b=P4qefmLCxA/50ShBrE9CWmMNvRFHsimi6GqXXBRbE7ZGu+O4oEdsYxP5
 bonddprnbvLg5TekoDJYHfnBqLeTtXNVnkIooIPHweG8oTM+Ph8y/9pFJ
 4MY1qIyDPsYzQykmjMZ82iMyLwQTTAll2gioRVJ6r9AOeMv4wSErSIwat
 Zxb3EqA/Ts0zYz0ToACVtE/wtLRoNcX3Re6pq+XuphTeOOO/N2zu71oBM
 dFy6RKH0IV7Roj1bXbfCIhhObDzpqlan8cKtlQIqNH5MPUZA8NC/vXETd
 yBsus3c3C4xgka9B+yeTxlUelJLSUmrzS8+Hbdwe3k9Zn8s9VV4sa1MRM A==;
IronPort-SDR: P6B/ic+g+PpJaHWjRXpPNl1PW8oQP9RDnrqNGTGCUV7eEZqdq3nn9qvfIEy6XGrLrIyRf2GyI/
 3V1LuK1C0koZxIh6n+5Yt++XzzWnn5a0PANW4oMu3Qg9J5z6VyqKqOQ6EBL5fLIA/LJvDSEsFF
 WaF0qkfH9gahJXUCxIscheDlXZdtQL1seg8qDDTGAea0GP+41xNoiksiMn1SKR8d45yVirlrru
 RAARRhabcucmB8EYRIO3q1Zt7SXJ/lF8Q2dzrTxIuey6oeZuuadDrECaZcUj+FeUKHXvK3jMWC
 ZMY=
X-IronPort-AV: E=Sophos;i="5.82,213,1613458800"; d="scan'208";a="50712150"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2021 00:45:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 11 Apr 2021 00:45:10 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 11 Apr 2021 00:45:07 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <ycllin@mxic.com.tw>, <p.yadav@ti.com>, <vigneshr@ti.com>,
 <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>, <juliensu@mxic.com.tw>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset)[PATCH 0/2] mtd: spi-nor: macronix: mx25l51245g,
 mx66l51235l and mx66l51235f
Date: Sun, 11 Apr 2021 10:45:04 +0300
Message-ID: <161812694422.37194.1007833046830132290.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402082031.19055-1-tudor.ambarus@microchip.com>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_004513_527209_76C77B67 
X-CRM114-Status: UNSURE (   7.97  )
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

On Fri, 2 Apr 2021 11:20:29 +0300, Tudor Ambarus wrote:
> mx25l51245g and mx66l51235l have the same flash ID. The flash
> detection returns the first entry in the flash_info array that
> matches the flash ID that was read, thus for the 0xc2201a ID,
> mx25l51245g was always hit, introducing a regression for
> mx66l51235l. Revert mx25l51245g addition. A solution for these
> flashes to coexist was proposed.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] Revert "mtd: spi-nor: macronix: Add support for mx25l51245g"
      https://git.kernel.org/mtd/c/46094049a49b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
