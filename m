Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB2BC52D7C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyASD/lXYs2Kz2ULCQ+FNJvkcBGB6IrtZruLaNtFU8g=; b=dd6kooQ1IwLIeF
	7qTHLr0BrODyRw3xMvxvD5Tz3f/sr2GE24WS54XuX9lQWvdShjdqOylEo4o5en0LqQ+zPSytgIEzM
	haghAgLJh+NWhsRd8SnpuwIHR+h/wo2RETuLoMlf1cr0S19rpL5kxkhyJfnboU1GFYnJFQGfh1otp
	HsQ59Wr7jKamMYxSql3R75dyTMo4XMSlJsBjqUuauBfBG1NR5t1+c0aZrgvnfBAYG7kg2wrFVHG0d
	JR1vXnKGSvel+aXrECo5/NcR/bzYsrUSp9c8lBxS6zKxQS4oprWK0z9Euks5wZucNMTMVsImPDNEl
	ebhj/ijl27KWX/0sodyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY8b-000000008o7-2qco;
	Fri, 23 Aug 2024 17:31:49 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY8Z-000000008mV-0IcP
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:31:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A06AF1BF203;
	Fri, 23 Aug 2024 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nCb2apGA05N1blMpoknuj5Rjwtf/UFr9cA0iNBoI0ag=;
	b=N1gFtg6zCDqg97MqefECu8OYiYpjPFcLLww0EONJAoJKSgkuJ3b6xmJX9qcylQwUi7XuzO
	jL0BLb34DTHBP70Z28ou1Mpou1sK5UEsdA+6Iiq3VovEWamy9ppmQlWx0TNY/0EMJ8uWxL
	ED8qpgKz+q3nsREZwwdco4IfFv5Pgp57BHYgCyfYMawTLsj23619GG/llEuW3g6SvDrsFy
	lhsO/6idw1/rOz3/IHTgAT8o+B4d2POegcEfsFLhVELdSs3is7fQQQJPXAC+wjLhl29enl
	8E7a/ZmMbK9xhdxsS46f+f4k5WMn2QjKCZY/JsuPvmgWpfRa4Olm+2lKvPXRSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Date: Fri, 23 Aug 2024 19:31:43 +0200
Message-ID: <20240823173143.366150-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bd92c1e07beb2f85cbe977a8cb9910adf237d649'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103147_292836_EF9294B3 
X-CRM114-Status: UNSURE (   6.30  )
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

On Wed, 2024-07-31 at 08:08:40 UTC, Biju Das wrote:
> The rpc-if-hyperflash driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
> 
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
