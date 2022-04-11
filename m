Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A19C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+Xk9fzTxtH1cUXdapG9au0RF47ujysyPmFXSQUP+zg=; b=fjzE3aIag4c7at
	bEigcqljSN5EkHiim7HyYCva/DNkxyRK2LR5cdbFqaHjeWgwytnKmFGpsoh06oYrePLxS+CZlK+u+
	ksP3+8PwTQXk8lDiQI4YWif4vNnXnhhBJJ0BTfomW2DkOtYLKKYJS6Ec2ElkH2FJ9f7PGJbRsoCXf
	MhISDCryql6vpWXj24gaC8W5FVwpgMp6hEAiSdPWCu2/1Rx1vuziFmxLFL+RgiT2A/W+bl+FmBFud
	V0EXKfupMHvtVEJYyAvzeB1h3HRq1dtbZ356BjeHLF24ylx2Sci4N6yNTPS8/YYYrTdKF3+PLjdGD
	zN9IOBWsg4PKighZnFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpxr-007jhM-Ad; Mon, 11 Apr 2022 09:04:03 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuq-007hqf-RD
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:00:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DCD260006;
 Mon, 11 Apr 2022 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAal80AxgzHfiJq/cToM0/q1B2DW2EQ/K6BrHuWb2m0=;
 b=H++49mYKob5uXrsVDsy8b2/SS2PlHX9K69f7O2nsW/FelegzIDrfl6uNL7A1/afkv+UYXk
 l28T6Ree+1t/R76+0cH7geDNm716FiqU03W62iHI69ztA4DaSkWe513FPLXDTvVMzEuvMK
 ZLEHNgU9g1PzVr/ehnQSE9fMdMXjITKTgWG7GA/xrNJ2Dh4PR/6fyo2EyCnwRMLiuxdlkF
 BBewTgS+KBPGAEuc5Ovo/9iSFoafSCpvk5VZTn6Iy8SmqZGc9FGyzIsQ38G5+vCoBtdZ+H
 9A0eL1LKWmGAcmwwMWkMgvWlxvpmwsZCoR3XRnU2b+f5luJknZLX/izzqifYnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Date: Mon, 11 Apr 2022 11:00:50 +0200
Message-Id: <20220411090050.11199-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220326080726.30372-2-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6863c612024f92dfba656cc4f74b19d348cfce8f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020057_170680_9AEA0C35 
X-CRM114-Status: UNSURE (   5.84  )
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

On Sat, 2022-03-26 at 08:07:24 UTC, Roger Quadros wrote:
> Convert elm.txt to ti,elm.yaml.
> 
> hwmod framework use is deprecated for new platforms
> so mark it so.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
