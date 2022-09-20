Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF7C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhVnEdysSeooqbeiL0mCB3hvXJ6OAwiyGLAh3IyxRSA=; b=TzMLnI96AHoPlK
	oxjAXo3zyRl7aYIlxn6prstojF7FFmTc6mQOYEM2srztr2CMzYfL6dE+otOKE05NbiX5ylVIITUo/
	vXURB/8AsXeW8ANV2/KLsW7WjSF3Gdz8PJonYwa8Hf1lS0XUIvDPBeGdROgsEHw0bQB6hUcOku/u5
	i69DgzH9d1TWBBTGYpNiDlxzmHB7bPbTpT3AmdxKzYm2x7BJ5VunvD8ja4I5BAxpNg48CSgH6ADK4
	3+r7bmX92+HlG7O3rtimLPkPfZyGirPGPHImANnwv+e11bZaKD1WpLoKLGlQvsfxjiMduiuSoxTDR
	vaFvC8jc/BOKlGCaaGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQj-001hHX-0W; Tue, 20 Sep 2022 08:16:33 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQS-001gyZ-GO
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E8AFA20004;
	Tue, 20 Sep 2022 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsZbTm1/7DUs/qVy8NO+VTkaCWHAYHj1Kuo41F9ranI=;
	b=o0aa9vaQZ52MvsaUJpz2tCumP2fvsG1h9/QU6p09l7ItSW9l6qZ6FFH/TIkwWOwtmVD4SS
	8YJpRVAnpgIehqGRJ/Ts7NRhiHClPKxw4nkIjIHWEIqbiDwID7EHmWVRUGpUuzdQZ9CaTi
	XNTI8BP7oNrxgFaB8Ji1INlWRYSyLTY0gOLqeQ8ap1Z/XcRong4BeePIaT8umtSSEJ9QTd
	lwQ+OdaedE2dDN8Ub8hlN9eVOxhs0LXGpKaehvuduVP3k9L1dAH2OP/9hzTBRumoa9Geec
	ua6Zgpf3l7oyQuoRRkXxhJfz84J5Fimiw4ne2EsVAMQuc5JaoKxkhUtsdxPA0w==
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
Subject: Re: [PATCH v3 3/8] mtd: rawnand: intel: Read the chip-select line from the correct OF node
Date: Tue, 20 Sep 2022 10:16:11 +0200
Message-Id: <20220920081611.598264-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-4-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bfc618fcc3f167ad082053e81e9d664e724c6288'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011616_756970_C4044002 
X-CRM114-Status: UNSURE (   6.40  )
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

On Sat, 2022-07-02 at 23:12:22 UTC, Martin Blumenstingl wrote:
> The chip select has to be read from the flash node which is a child node
> of the NAND controller.
> 
> Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
