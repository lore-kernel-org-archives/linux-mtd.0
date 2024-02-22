Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A16AC48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsiBjGB8FcLD+nGTCWLrVbo6WsaVUnKyxg5xWEhBpbU=; b=PR9uFEJQW8DRrf
	FjFLag9vgSpvAg5WWT3s86qAudar1sZ8bgecTOWbLQZJfBygS0rGMNPztclGZr7En0r/OFt0lXuK4
	ejRbYoSyPMI7zNhArM2FWlkKKjqnnIMmQ41hHC2F3NsYhF+zROxmUBMQC6RubQSC0dmb40K2NhCOb
	EOI84uNe+JrVSJ6p5SUGVugaBuHfDQsbA/xk3uQeZ5Vjpaw9KAv6Qw+LYWGQVkuHDZDO2bRdWvwdk
	arF/kWms35nFEaKfPB56OnT/z8oeOGkHK4P3i1eDFwGeq8V67CRYcqtCR8hVaagGMcdmdHjpcFwXd
	rL20m9l9luuAGRsz+GHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx6B-0000000349F-2ugc;
	Thu, 22 Feb 2024 00:38:03 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx68-0000000348T-1AP8;
	Thu, 22 Feb 2024 00:38:01 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 00BB0C18E1A8;
	Wed, 21 Feb 2024 16:37:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 00BB0C18E1A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708562276;
	bh=/WaBnVmApAMNC9TJyt8WzAU6xorf2Zn0sOIoYNv1BUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSE8qy8bLzNBoj5sS3dbIWviWlGegkL2cnKpFvVdsjOWKsEYROESFs/6J8Q/EV21w
	 xnbcOkXcozq/YBb5j8H+Ey5Mj05BKGagnAJ85xgFXOfH/qzL/guy0jNKnLsqQr631e
	 d/s9Fb3OYifdznblLkcMRZkddNjcxmIvY9TFqBgo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4D75F18041CAC4;
	Wed, 21 Feb 2024 16:37:54 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH v5 06/12] arm64: dts: broadcom: bcmbca: Update router boards
Date: Wed, 21 Feb 2024 16:37:55 -0800
Message-Id: <20240222003755.670359-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207202257.271784-7-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com> <20240207202257.271784-7-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_163800_492734_F7F660BD 
X-CRM114-Status: GOOD (  10.72  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed,  7 Feb 2024 12:22:51 -0800, William Zhang <william.zhang@broadcom.com> wrote:
> Enable the nand controller and add WP pin connection property in actual
> board dts as they are board level properties now that they are disabled
> and moved out from SoC dtsi.
> 
> Also remove the unnecessary brcm,nand-has-wp property from AC5300 board.
> This property is only needed for some old controller that this board
> does not apply.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
