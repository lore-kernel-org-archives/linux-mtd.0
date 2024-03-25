Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDBC54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFcDSjS8H5ZSN9gmIMwnB/7s9klRUm+p6WyGif7Qtsk=; b=2+OlRn3ogv/Xnc
	P0JqyZtUBy1kU/E5iiBnJsqfEzO47X/m71rbXkWHXRsy5n/EcO+jhtj4RLNC++rvJJ0tdy6wZFfKy
	ot9nIfW6bUk84MLm+/VnHlGn3xehT3bsi6XiSaZsjP77b5OXgfkMBrBNd4kZLN+pLeTEE6bwnScOf
	P3+x9DMpIkTxaZ+xdPtYpKHr+mLQu/x/nUQldQlOhKT5fhpZFwN5BXPx/olksbFlF2Lf9dWPDbpIo
	vSpI9jb0rs2YxPIXMn5YlPNzKDqCRSw95UTFInq6V01KrZKWHzSeKe4oEGCyKDeU5W/A2dsFWuijl
	UcrBbi7GjES53nP9X2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQ1-0000000GhYR-3NTI;
	Mon, 25 Mar 2024 10:19:05 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohPr-0000000GhQJ-3hQb
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:18:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E868A60005;
	Mon, 25 Mar 2024 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8/p+IkZ8xufk6L6NhUiqrtkEMLBY43oIUbGcbGu9kE=;
	b=DAVvZbnraPWkLZCfpdDcshPLU7zKUz7lx52bdxP1irC2Sag9IKmU3m64k7DGYAPDQ4q75M
	H/l1TdqNrRNV9dJ9KwSlVfDY/cMCESi0Cqhfl1sghENEtCylqjPwWijiMZcw39XHcDXcT1
	2tnwKfK4owBzBB4w9t4K1Qm3rtk2TnifKDFS5Q7sOa0DznEAwcpMsdS0aDbDNV3PX/OvVg
	E6qoOR2CYLC52dnFBmDDcWSzkzDTrW241L3nOGRpzIyYWTiZS5ZNblPwvGvJxcoX9XC47K
	zHOXSXloiqskx4WvEH+QmYs7RLaQznF35Xpe6uHySchhMhsc/XYfaYhrAzMhJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: mika.westerberg@linux.intel.com
Subject: Re: [PATCH v2 2/2] mtd: core: Don't fail mtd_otp_nvmem_add() if OTP is unsupported
Date: Mon, 25 Mar 2024 11:18:52 +0100
Message-Id: <20240325101852.262497-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313173425.1325790-3-aapo.vienamo@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fe0b8213c0129ff2419458343d8d8e716b1495c0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031856_428555_4B2DF7BF 
X-CRM114-Status: GOOD (  10.74  )
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

On Wed, 2024-03-13 at 17:34:25 UTC, Aapo Vienamo wrote:
> Handle the case where -EOPNOTSUPP is returned from OTP driver.
> 
> This addresses an issue that occurs with the Intel SPI flash controller,
> which has a limited supported opcode set. Whilst the OTP functionality
> is not available due to this restriction, other parts of the MTD
> functionality of the device are intact. This change allows the driver
> to gracefully handle the restriction by allowing the supported
> functionality to remain available instead of failing the probe
> altogether.
> 
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
