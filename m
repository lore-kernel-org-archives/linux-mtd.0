Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D53ECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFnzgtc61bFxQcewIWRuTIkbhRIjfzUca2fO5xp/E2U=; b=mHea91QlxP19rg
	nygc2l9JRQLB/48DEOWzUo5RY/pBwROsob206rvPzcPuxDbqUKhLijmvCt78hRdDVqQwd+0LRXYda
	yYvJIg2JPGc0hHq1f1GySW0SBXShJ4T4m/T8SJDV2Z6PRMIovb+8H9sEVvvvfMB/v9ZrIoGNTrzWR
	BHDdlMGDBzLiFoeTRmN9JYo/Ta6Vprd/6p7ZGcxQLWcyIPEoeteBmuglfccJCXNCpe0LTNi1H+GCX
	6YXyfavR9hR+GuCCX4nJX7SaGN/8O8NArItkeNezqsjdd4u0WcHDuswXT2gCQ8w3OcvWy+Eb1aYGD
	A9iHch853LKOkiDJo41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQI-001gtC-DF; Tue, 20 Sep 2022 08:16:06 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQD-001gpz-W7
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 61783E001B;
	Tue, 20 Sep 2022 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhe0kx9mZdHekynlKwEdYBZo6jjFfeCj3Xo4r+vAAk0=;
	b=fjh+TfqcsoL0V2uunqIH9zoeATg8xYowmcbSq6+LOPxzGI6RwdD8kFqG0sB4+Lu4/OU7tv
	aUAbUYJpQiO2d1eXAf89f9TOWeMBrFnN9IzjA955g09JC2wBAcJEJg9pQsyXBIVANz1afE
	KWpOEChwIqxAN0UdbDv1CkxYdcLzhE3tOoINokIKkTboQsaCcA+rg+1drbksW4izphQLid
	Rw0i2rWO2AcddjvjA7Gyi1Oia02q4OU9c/P9DmDy2FPey7v8qqrU2N0mNN5ymM3QRRLxqB
	3h+YBK6cS56E+oJqpp3oseLit3rCoiXXLIOhMjzGsvyFtTRKOMj9kZO92x+BVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v3 7/8] mtd: rawnand: intel: Remove unused clk_rate member from struct ebu_nand
Date: Tue, 20 Sep 2022 10:15:58 +0200
Message-Id: <20220920081558.598152-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-8-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1b9bdc213cf8a917ad7eeedb39909dd928bd6678'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011602_882140_F9DC9AD8 
X-CRM114-Status: UNSURE (   4.94  )
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

On Sat, 2022-07-02 at 23:12:26 UTC, Martin Blumenstingl wrote:
> The clk_rate member from struct ebu_nand is only written but never read.
> Remove this unused and unneeded member.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
