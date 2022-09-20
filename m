Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3157EC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/i+Tnspab/pmyD0UaTOJGtOib7MaoumT+ifXj4DwpI=; b=vHAoHf3NANyxiQ
	EbwLlEaw495DTNW3H0geThl5Y7Ayze5ZUI1GmCxUibDRmKCB7LWHqqXw6MuvAVKPFb6wh5SSE1Q4K
	wEtAStMro4x29vMe1vxK7gljVn4Ze44nM+Ca3c3fFICtrmu9nH1zjbuUq0G6gCkgX7q+HfEmHUg/p
	RTqqznAXbFRfkYVJmKyldE7oU7SVmckPATh+cJOotO97MBwq5PryZasEzxfGwJt43ElSArV6AVzVK
	V8KhznP9EtQV6cl3cxX7PE/osisYPH8WaRR32XMIwUIcOok9LUsiG9HJRzgDNDWIFnckfJDfs8qwA
	tfqqcWIDBXTDBWD0SI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQS-001h0U-CP; Tue, 20 Sep 2022 08:16:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQH-001grx-O9
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E633240012;
	Tue, 20 Sep 2022 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x59lQnM++btS+U7eC+o4+uM7BPiQQBBNB2xYNgPm8ks=;
	b=LqhcUcLEhPTl6Txtyy91EEZFWoLS09MFfS8PKFJrAkS9fbHWysM5WuXVNlIy/9XS5dKXTO
	/IZr1LSkJkjEAZ8XO1mK+2UuRJXgZJi19VRpof/t1hy5t4o1Y9nOGyutujFZZTHCVUj1W9
	ehNRvRRoe6lXWda5uwL1R4h9ndmfZVEt3C4sikvES0sMBryzafrg2LHGNKQ+XveuuBlUPj
	Q6S9DRpSclbIe+L8lm0ki1YbZ23zkftDPgE0rMF93jygXBC9f1Neqs+DQ841j7P1NusGCB
	I0G286HrXvvEwHrITEqiY1RCCiGd0h5PBJCiTvmMLUNShiDcjtwdjeLnxFBdgA==
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
Subject: Re: [PATCH v3 6/8] mtd: rawnand: intel: Remove unused nand_pa member from ebu_nand_cs
Date: Tue, 20 Sep 2022 10:16:01 +0200
Message-Id: <20220920081601.598180-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-7-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dbe5f7880fb020f1984f72105189e877bd2c808c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011605_967383_C376884D 
X-CRM114-Status: UNSURE (   4.93  )
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

On Sat, 2022-07-02 at 23:12:25 UTC, Martin Blumenstingl wrote:
> The nand_pa member from struct ebu_nand_cs is only written but never
> read. Remove this unused and unneeded member.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
