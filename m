Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3443EC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VI1taHsJiBIfiwxi5SdvldFk5ZAF2CpIBCbxT6J0C3k=; b=KVtSctqM6fie7H
	+9rsmgnkTgseIZaPG4AxpS6QurHrxHZpgTQkJ+tIGOomIfTiWaRuLaqizalMnP+i588cFHOOkp369
	weAAMsBgXhUQ69iM0TnYILH5IUYePk1aQpIF1C1yATlB+VXYD+m2pWbD38m0wYja0yqJpDmCrz7Ja
	xGqeyl4itoF01oRFXCH0gTUok0W9IidYjhv3PN9IEJeEi47DEkHdXLZuLo+9XFphduzNcnLF3vKdR
	/vKqpcON0qqdxarUj6OEdZ4tNp6DTQfbSrktt46vvs53DKcecEl508Fu8JoNCWhKtHheEDrMgtqQ8
	AXcMKrz0vWDVcOh+Cf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OVk-009e1E-2T;
	Tue, 23 May 2023 09:40:56 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OVg-009dzH-3A;
	Tue, 23 May 2023 09:40:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1AA1C1C000E;
	Tue, 23 May 2023 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684834851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATylLbCJ67fDBCfvkABy03LGMsbdHiaiqACbv5gXDoc=;
	b=cfZWC4eGtEu6pwdMyXVKWcSahlMm+WZsJoiyjzlP3K+c+OulqNnNr7ZKjcl4QkTs7kGi5o
	4UZCQ3VKJ9DKHUayCq/FZUr9zohuUxFA99kdBvrGNrtSOFpdHuiBky3i+I7cqWpzoulPA9
	pINk3c5v+KpTqD89BiMPktg2lNu3U0Itj/TQUpk5gQOuxYfoo3xIBnA0nRrFmU0hG+GCK9
	nNznUgBoOGDJr02EWPx5oya/K9s0aj0XuGwYs4rsckZbiTxgGD7WMoEwHubh3a1BREXYHV
	Wc7irv0x3rsqZweD1C+PCWNSMpo3GfaB2/r+ZlEyZP6tXeDW8b5C/Uk1fcCJXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>,
	miquel.raynal@bootlin.com,
	linux-kernel@vger.kernel.org,
	monstr@monstr.eu,
	michal.simek@xilinx.com,
	git@xilinx.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] MAINTAINERS: Add myself as reviewer instead of Naga
Date: Tue, 23 May 2023 11:40:48 +0200
Message-Id: <20230523094048.304664-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <06df49c300c53a27423260e99acc217b06d4e588.1684827820.git.michal.simek@amd.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'faa5e6cbb559252da28976e7513c889545334696'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_024053_153209_2A757562 
X-CRM114-Status: UNSURE (   6.07  )
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

On Tue, 2023-05-23 at 07:43:42 UTC, Michal Simek wrote:
> Naga no longer works for AMD/Xilinx and there is no activity from him to
> continue to maintain Xilinx related drivers. Add myself instead to be kept
> in loop if there is any need for testing.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
