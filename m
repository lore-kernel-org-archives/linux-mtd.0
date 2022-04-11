Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA99C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5X5x2jWJOSUsKDodM56fi+kDzWfy5NRsxJD5Abahhw=; b=Mj4RAzNjZpbvCd
	synid6arpm+o5Bt172JJe0d5R694x1lK+rb5EcXM3aclIo6Gnv3Fi0yBBg8dvZ3St0WqlfzawRB1s
	ipn/YGzinlCtkUcr9vDv3OLLv6r6BrblUjt4NeCWgr9Xq532dfN0VNTrWixnfoCySm2u0v9BExfDH
	Jqb4t3bORkIxcBiIdWjb1h83eSqX202dUOJCMMaaKZAICwcOkSPBitsD0vyqH2sjTeb3Mvx25J9Um
	UMs2RLkVdNPmOSQ1zkUiWYrNLEIrz8RZOLmgBUl7FtZfBZQUG6jpg2I8zuQDnGMarECc/kR+eYg7/
	nOTurKbTLFRdxyYexXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpxL-007jQd-Gh; Mon, 11 Apr 2022 09:03:31 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpun-007hnA-6o
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:00:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 539B3240008;
 Mon, 11 Apr 2022 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oi6k+KcXa5PJ23vSkn8qwSpiqFiJay12+EIti3f6WGo=;
 b=ov7SaNgGyVSPe9sLq38ofbcATM/M5UPDeWlYTyYPFweG9PRe3yLIeqCsHD0bKKD6BzJJoZ
 s5EOZ7HIEykce3r7uIIEm7g5zBLl4zvfqDb4ZCwIRYH47SNyMVGtnd2EvE4//2yiYvZqe6
 aCOdJz6a1okTne8Bz9pFyqhEvMtQFussw/ZExdqaQstY7it396XGmVHF7TP8nLJdcK/P4C
 8Iz4UCY2v9rY/UaOyjLAyv5S1OFpXCm1e5KBS1Aga5UeK+5QbI00XymX7HCTn4O0TqrvfI
 dfdDoyNcD7/HwnK4oDD40ICWRJMWG0KIhRSDpROz6AFXjcfFpY5BFyKfgkjO6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: ti, elm: Add support for AM64 ELM
Date: Mon, 11 Apr 2022 11:00:44 +0200
Message-Id: <20220411090044.11135-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220326080726.30372-3-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'05691c0287886806616a1bb0ecbce6ec5e8f43cc'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020053_513085_888546EA 
X-CRM114-Status: UNSURE (   5.23  )
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

On Sat, 2022-03-26 at 08:07:25 UTC, Roger Quadros wrote:
> TI's AM64 SoC has the Error Locator Module. Add compatible and
> related properties to support ELM on AM64 SoC.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
