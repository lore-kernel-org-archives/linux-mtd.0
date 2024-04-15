Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E78C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhYH03CXcFESn6nWsEaqPQIf6P0SZjov8kUIWTKtpds=; b=QMbOUXFBgnon9x
	jMNTncxjKro8kza+x7DORnQU/9CKHlWcDPHBFoyZ1bL365frq2z+zV50CcyjQlyaJ4A8UlY5wj8u7
	bBdHgHzlzYUsuJcZMQEEK6aipK0l0ibOJBK0zlepJed7L1KMOuUv47Gf0KCoQf2hsjmWD7LZe4H6G
	cVQCVuw47+6T7uR3vWSR8/W21zIjYVf9RByhPv2b3Ssql/cv4MnGxt2CdJuKUlLRAzxyfMJsv6A2q
	/DYDhVefcAFjmYduStNIZgGYP9QI9gIXHepFKkxhRXncK8TYLIxNdNFbO6P7L9P3TwxF5Q+kU4Vhr
	2Rd9ByZGmqY6vmDLYH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEv-00000007oQp-2aim;
	Mon, 15 Apr 2024 10:07:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEn-00000007oP9-2wvF
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 10:07:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AF5AC0002;
	Mon, 15 Apr 2024 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713175614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2SwlIPSgTwFnJsuIKzMY9+vt/yHtdwscdSZB6mQOW8=;
	b=iR6dQYvFkl5Svd/hCMCscoiZlfYcraDq8OBiHnTauIJ0XRAI2cupwPlWH5NMboUSWdK0/z
	saMdNmofXIcn28F3ee9IPQM4aXW6iQwE3HzGwNuYHkTfxtk/Q5cbElz6rZvsulclcQkQpo
	j9TlfTTM15Nz3dbfuHgxAjL2VQg3P1yC7Ww62QxHxoM4GEBfUFdtiqr12IBIhz9DrsHUFg
	z6vkWPQb1WYWQ2hAHGenPQDm2+95cmIYW94c50hqbLfgE/EgkK1nhwXseCRYF2gXuzdF8v
	RkEgyq2UzSppVxe+suPPqBP3zydrhPTL5PpWKBGMkQsbw/64QMVTYQx0F9z8Zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mchp23k256: drop unneeded MODULE_ALIAS
Date: Mon, 15 Apr 2024 12:06:53 +0200
Message-Id: <20240415100653.32058-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240414154943.127079-1-krzk@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6277967d872e229de53b0585ebc34c8172965492'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_030658_031724_B3E4B01B 
X-CRM114-Status: UNSURE (   6.93  )
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

On Sun, 2024-04-14 at 15:49:43 UTC, Krzysztof Kozlowski wrote:
> The ID table already has respective entry and MODULE_DEVICE_TABLE and
> creates proper alias for SPI driver.  Having another MODULE_ALIAS causes
> the alias to be duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
